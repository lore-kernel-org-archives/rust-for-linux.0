Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF8C81D90AD
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Dec 2024 09:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733389583; cv=none; b=g97Sjfmjk3QVRPNKSKoaiCeOxUTEOzr23jkqlxycq/ksgE9itlsQwbQVxelj6B57ye+GHIF6H2Uf2ieneXrIqF5dyvPdSyTfUZWyWXNtoGAYGAqEcNNvE9+XOv9THjP96E5cuMMBQMmhKccrbFyJuwQffGH/7LzQ/HUvt/b/xGM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733389583; c=relaxed/simple;
	bh=gysxfzdo2qTTr51jOlsYRAghn74oB4lmBfbzlSBo740=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lk8hGNLdNPX/5u/0lanLsXn+j43cNuVC29LxYLuo/a6zJZ+9AwhXr1BRSdbLUxduMKoEVp/GsOCnTsMDJ3BrulUMCIqjNN1SMys1lFe7EyOfRuAPAhGZdOEB3WSIMlLf/NqVIvoSDgHIo8V65AOtqVJkDlzDQQMqyYWBxtN116g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=lVzSEUBz; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="lVzSEUBz"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEB34C4CEE1;
	Thu,  5 Dec 2024 09:06:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733389582;
	bh=gysxfzdo2qTTr51jOlsYRAghn74oB4lmBfbzlSBo740=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lVzSEUBzxcOy7WAn/oJZWsc9Las3X8f81PQFW66gOBM4vMVFhux4i61zT/sN3a62I
	 RPoZ2bW4fdwJ2GaZSHpi1uiNtLd4r89iWoY1teAoE9HB4ChRyNWQPyCeMnw75fN2wk
	 M6YxO0eq5sDy29GxmTy8YIiNs0ovVWroJDjMNQ7E=
Date: Thu, 5 Dec 2024 10:06:19 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Benno Lossin <benno.lossin@proton.me>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Simona Vetter <simona.vetter@ffwll.ch>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Untrusted Data Abstraction
Message-ID: <2024120512-tuition-overcome-0939@gregkh>
References: <20240925205244.873020-1-benno.lossin@proton.me>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240925205244.873020-1-benno.lossin@proton.me>

On Wed, Sep 25, 2024 at 08:52:57PM +0000, Benno Lossin wrote:
> Enable marking certain data as untrusted. For example data coming from
> userspace, hardware or any other external data source.
> 
> This idea originates from a discussion with Greg at Kangrejos. As far as I
> understand the rationale, it is to prevent accidentally reading untrusted data
> and using it for *logic* within the kernel. For example reading the length from
> the hardware and not validating that it isn't too big. This is a big source for
> logic bugs that later turn into vulnerabilities.
> 
> The API introduced in this series is not a silver bullet, users are still able
> to access the untrusted value (otherwise how would they be able to validate
> it?). But it provides additional guardrails to remind users that they ought to
> validate the value before using it.
> 
> There are still some things to iron out on the Rust side:
> - allow better handling of `Untrusted<T>`, for example allow comparing
>   `Untrusted<[u8]>` for equality (we should do this via a trait extending
>   `PartialEq`)
> - rebase this on Gary's patch to enable arbitrary self types.
> - get more feedback as to what `Untrusted` should make available
> 
> In this version I removed the API showcase using tarfs. I did this,
> because I have added the API to `uaccess.rs`. Also, this version
> requires [1] to compile the doctests.
> 
> [1]: https://lore.kernel.org/rust-for-linux/DM4PR14MB7276E6948E67B3B23D8EA847E9652@DM4PR14MB7276.namprd14.prod.outlook.com/

This patch series just came up again (well, to be fair I mentioned it),
so I was curious as to what the status of it was?

Also, I think we need to add this to the userslice stuff to mark all
data coming from userspace as untrusted, so tieing that in soon would be
good so we don't have to churn a lot of existing code that ends up being
merged soon (i.e. misc drivers).

thanks,

greg k-h
