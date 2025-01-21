Received: from mail-qt1-f182.google.com (mail-qt1-f182.google.com [209.85.160.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D0AC1F63EF;
	Tue, 21 Jan 2025 19:56:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737489408; cv=none; b=k28VOYt/XWBamaucVyrnPCfkwRa6Cl8TSxNesukHLryomeaS+fnZxxSDRQ1XyxKUQzeu8515/1QutEgK8gqVOJP9GSyzpp1BiIxo1r1fzk9bGz4+jSfsgT+ECD6fTW+HqxegmtWfeUsM8yhguayamvdbOIG6IWq4offHX7KIhqE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737489408; c=relaxed/simple;
	bh=HE5GZFWAh8cBbte05bJdIqErfQYmN4kQeSHaDiHSt4s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=eYhv5FJ+ZIYPLzFu6PwBpCkvIBfHr5NX3CRFj2oT6oa0e/v2g7hSUrAd1nAdLGvbz1Jw4vf2ZNppb6nzSGdJBU3IxzcTMvJ1zXKWJf9zy92znkzdb++zfRPl3vSrBoc2RnGqNT0TEQgjMjRbFHc8XvGEeYjd15Ui9EFKmH6ubX4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=A8m6jekY; arc=none smtp.client-ip=209.85.160.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="A8m6jekY"
Received: by mail-qt1-f182.google.com with SMTP id d75a77b69052e-467725245a2so9730261cf.3;
        Tue, 21 Jan 2025 11:56:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737489405; x=1738094205; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hHXc7x5Qnev7cW/XtHyE5mGADjYo4gLWKBj84AEoH3A=;
        b=A8m6jekYzhJ0im8dS6UuohlUZK656RPrLR/CtpeyWkWJAzFL8esK10LMqjFPppG3p0
         5CRNQ6TP0eXNZEwVR4u98vYTYv5txmTVL5dfEUg27TdqRvDnllECXEnVYRTuPcLxuAaq
         YmLD5ZikO4JWyzWeSxwgTcqHhey66GWrOTJMfyFu0sjRlQqnBr4Wr8mehEMckgHw1FLy
         jRVqHZjqWQswfXfEHw9k8aWJMIPAalEHRRXpTT+JUUfb82P4oUOoXjg6tm4QRSg0RFiq
         zBHfq9VtUa8Y7Cnd4rnRXmoWDRy5V/j7qXXzMFlecsdbpkYS3uQnBc5ighOlU8Auv3Xu
         yBNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737489405; x=1738094205;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hHXc7x5Qnev7cW/XtHyE5mGADjYo4gLWKBj84AEoH3A=;
        b=sEQtyn1Y2+Ysx4t4WLuMvKfquB1rrYzzHK52uTedC7H91ti1Ji9tMd9KXZWXsh9+Jn
         64e8Kt0TUO52OQgcTUZo1sj1QCUrH2lxqV2n+KDja5ChvHy4/8df9BHsoPtW6LWWRiKL
         r67qEtT/Uz9wqgEC74XJprak2mTdh1Io2bZBiAqIYr0zBDSnqLRrfL6hTVm6cn7xaQ8U
         usODaCKvMCM/FVjo2kA48mZ4MUwTVMoQKhg+l9ZIFrmjtZ92J+BWgrleWl+myDD+U/3z
         OVTaZ93uLP+G4i93dqXLkp3QrI1hO4Xip1LaKhQ+J8iNFYNAQyGZlvZD4XVouyTEzGZx
         Qp0A==
X-Forwarded-Encrypted: i=1; AJvYcCXjQxMGPLzzWNgMt4jogQ2NSOWac56GRRsUFMbiY32KUzdlcLKidvRCP7zzP/kimiRMYf6ojFElvZH76+g=@vger.kernel.org
X-Gm-Message-State: AOJu0YyZDKx0Z9D/WpgdmZ7h7rmmWptSFDRuYSRCJ7DUKVEZ8qbESszg
	dCtqek1V3JhfD6/F4MMBybNq/f2kFiVSv0r3pY7arrPO2v5mdZ56
X-Gm-Gg: ASbGncvOZgQYFGu2zR9BXZcM1TNOGHwXIXlvgj+1t3LVXqZPOkoQ//8BsYTIgJ4a4RK
	6luwHPbF+nyTIUtBHIfrxUN1LThquRTuOhDz+WesnwXmWoz5LIpR4lJpjV1wSh2zHiLp0iaUVx5
	K0FKMGH4tNZ3LSiZ+MPyKl09vEFugFxzcIrY7PiRkX9PivuvIUy1CfXZXki2cOoA6IowUXfWSqg
	Fe/H7sjHnwmaSXXvUBQ25dDOTaozZy22/hZDidHihiuOzkGvaC7pztODKZZ9ILDcuXbvRAMgSe/
	6Zcu+oaMX0I+ytL7AoubRNlq7SVmyNJ5VmNI8d6O0u4F2Zx3aQGMh81/OPrm
X-Google-Smtp-Source: AGHT+IGiH8hH8s0QfVMYD7DHcM9qLLgYf541Y+P8IyRqEb/nls0UgBbT3c1BMuyAhTk7qgqg8uxM+g==
X-Received: by 2002:a05:622a:1a83:b0:467:7cda:936d with SMTP id d75a77b69052e-46e12a56ad8mr314511411cf.14.1737489405213;
        Tue, 21 Jan 2025 11:56:45 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-46e1030e4ddsm57519261cf.40.2025.01.21.11.56.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 11:56:44 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.phl.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 31BAF1200076;
	Tue, 21 Jan 2025 14:56:44 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Tue, 21 Jan 2025 14:56:44 -0500
X-ME-Sender: <xms:_PuPZzGMfSszrUo0JUcHdHdNxRkhm4-OPeiYzS23QyE5aDWJTkzSPg>
    <xme:_PuPZwXTilOsEtH9sFBhuEJ33ClIoeqR7ujRysGQRFpu46jbdXC2nQdkPLqu-Xoo4
    ooP7DTTuzDoCJUoDQ>
X-ME-Received: <xmr:_PuPZ1KvriF7XqnGb0qAaVKsDPG5ObIO2ylPDJ4Z0NVz1NvM8bu90shAu0U-WA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejvddguddtudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhephedugfduffffteeutddvheeuveelvdfhleel
    ieevtdeguefhgeeuveeiudffiedvnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedvuddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtoheprggsughivghlrdhjrghnuhhlghhuvgesgh
    hmrghilhdrtghomhdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghr
    rdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegurghnihgvlhdrrghlmhgvihgurgestg
    holhhlrggsohhrrgdrtghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtoheprhhosghinhdrmhhurhhphhihsegrrhhmrdgtohhmpdhrtghpthhtoh
    epuggrnhhivghlsehsvggulhgrkhdruggvvhdprhgtphhtthhopehojhgvuggrsehkvghr
    nhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtoh
    hmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvght
X-ME-Proxy: <xmx:_PuPZxG-X0m5afokf4MKtHM1SvYn6hlBcCU8hp1IOhrdHxxCHFUCqQ>
    <xmx:_PuPZ5X3dnTnLas8hmvqhyFCIZtm2czz16dPuNdw2KzFLrZYrMMDwA>
    <xmx:_PuPZ8PkWW0e3pfVgN-Z77wojNOdNavmbL6j03UTkwVAL_MJjRzO_w>
    <xmx:_PuPZ40qL8N33DICX1nl7Mq83syy4dNqvDc-5MZ9AkN_WkV45VrpDA>
    <xmx:_PuPZ-WY_ANBSxibrMOjUOOBljWK5zCtKZThwzd83srKbWE2f3FyrLYF>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jan 2025 14:56:43 -0500 (EST)
Date: Tue, 21 Jan 2025 11:56:42 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Abdiel Janulgue <abdiel.janulgue@gmail.com>
Cc: rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com,
	dakr@kernel.org, robin.murphy@arm.com, daniel@sedlak.dev,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Valentin Obst <kernel@valentinobst.de>,
	open list <linux-kernel@vger.kernel.org>,
	Christoph Hellwig <hch@lst.de>,
	Marek Szyprowski <m.szyprowski@samsung.com>, airlied@redhat.com,
	"open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>
Subject: Re: [PATCH v9 2/3] rust: add dma coherent allocator abstraction.
Message-ID: <Z4_7-jbmeQ62hMb0@tardis.local>
References: <20250121084756.1051758-1-abdiel.janulgue@gmail.com>
 <20250121084756.1051758-3-abdiel.janulgue@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121084756.1051758-3-abdiel.janulgue@gmail.com>

On Tue, Jan 21, 2025 at 10:47:46AM +0200, Abdiel Janulgue wrote:
[...]
> +
> +    /// Reads data from the region starting from `offset` as a slice.
> +    /// `offset` and `count` are in units of `T`, not the number of bytes.
> +    ///
> +    /// Due to the safety requirements of slice, the data returned should be regarded by the
> +    /// caller as a snapshot of the region when this function is called, as the region could
> +    /// be modified by the device at anytime. For ringbuffer type of r/w access or use-cases
> +    /// where the pointer to the live data is needed, `start_ptr()` or `start_ptr_mut()`
> +    /// could be used instead.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that no hardware operations that involve the buffer are currently
> +    /// taking place while the returned slice is live.
> +    pub unsafe fn read(&self, offset: usize, count: usize) -> Result<&[T]> {

I don't think `read()` is a proper name here since this function only
provides a slice for the caller to read. How about `as_slice()`? Or you
can change the function signature to:

	read(&self, offset, usize, count: usize, dst: &mut [T]) -> Result

Regards,
Boqun

> +        if offset + count >= self.count {
> +            return Err(EINVAL);
> +        }
> +        // SAFETY: The pointer is valid due to type invariant on `CoherentAllocation`,
> +        // we've just checked that the range and index is within bounds. The immutability of the
> +        // of data is also guaranteed by the safety requirements of the function.
> +        Ok(unsafe { core::slice::from_raw_parts(self.cpu_addr.wrapping_add(offset), count) })
> +    }
> +
[...]
