Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98C373FDBE2;
	Mon,  6 Jul 2026 11:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783337464; cv=none; b=Jxa/Q2+RiDWAXs5rsWz0M/7Rz//fQKuFMeomwImUvwGRSEv3JldO+PJRdFZBqMu3shwVmkdA6CI8i8fzMAF246G1mwqeXG9UYSGCZ6XwE+43uX/9svU9bak29Mcr5zG7PxOQ0ZEiy73hLuY0CZLnMte5kAFO53UPsVFv0+PL9VE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783337464; c=relaxed/simple;
	bh=BEJSsljLz7WqGeFuMxG1dz0EBEkp/cDo7crGru5AqYI=;
	h=Mime-Version:Content-Type:Date:Message-Id:To:From:Subject:Cc:
	 References:In-Reply-To; b=UN9nL+1yhIUrtEkiXfZiZzs3V6pmHOl3GiW/bCPLNE5Xg+8gPlT+xnVkrMdjeMPSPI+Dgsq9DCnYVZK1qsZGCTRaY0VoldAgDFHLlWlBoHPLU9qIjYkrREt2yZ5Y8VQC9Vbsg5CqeOGFp9mv3txNlNG9u+bMenUPp4xjQ0WnoNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+Xw5B4X; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+Xw5B4X"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 92EA31F000E9;
	Mon,  6 Jul 2026 11:30:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783337463;
	bh=F94dH8Su5lG+mhUpZiD6LkKjxF2NwBvnONHKF0cP9ZI=;
	h=Date:To:From:Subject:Cc:References:In-Reply-To;
	b=b+Xw5B4XTVBgIPDFBeoZNhAnlsgKR6JjRwSlsZWAK7MSDfFArPaZdwnKUjGJ/0lvS
	 6v3pUQLiM5yAN3GkFl529gQRyNwho7oGHijrLDPnHk4bjyqqhQqnL/rXlByOfllbXo
	 G+2QRvky/mzeGw1V2rYwh5Lk6l4MRggbU0WsACBPROc7AwB2vUm7mcFXmikH3ldh3v
	 1OOtgZVg+SVrQSmuOF4YzPdWr5zDrouzWCRrtJJH7xuvvaUH6/w9KLlzAtTNxIsJmi
	 o8L8oxaUFnbk3H81gff6yzq7QtpBHC7yb2HCxbYjpdhA9HYnY0CI6n5bNseIa50AjQ
	 iTjMdaeJsr+tw==
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 06 Jul 2026 13:30:55 +0200
Message-Id: <DJRGD98J154Y.2MSNQJSXANX08@kernel.org>
To: "Alexandre Courbot" <acourbot@nvidia.com>
From: "Danilo Krummrich" <dakr@kernel.org>
Subject: Re: [PATCH v6 1/1] rust: introduce abstractions for fwctl
Cc: "Zhi Wang" <zhiw@nvidia.com>, <rust-for-linux@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <jgg@nvidia.com>, <dave.jiang@intel.com>,
 <saeedm@nvidia.com>, <jic23@kernel.org>, <gary@garyguo.net>,
 <joelagnelf@nvidia.com>, <aliceryhl@google.com>, <kwilczynski@kernel.org>,
 <ojeda@kernel.org>, <alex.gaynor@gmail.com>, <boqun.feng@gmail.com>,
 <bjorn3_gh@protonmail.com>, <lossin@kernel.org>, <a.hindborg@kernel.org>,
 <tmgross@umich.edu>, <cjia@nvidia.com>, <smitra@nvidia.com>,
 <ankita@nvidia.com>, <aniketa@nvidia.com>, <kwankhede@nvidia.com>,
 <targupta@nvidia.com>, <kjaju@nvidia.com>, <alkumar@nvidia.com>,
 <jhubbard@nvidia.com>, <zhiwang@kernel.org>, <daniel.almeida@collabora.com>
References: <20260629150156.3169384-1-zhiw@nvidia.com>
 <20260629150156.3169384-2-zhiw@nvidia.com>
 <DJR76RV8NEKN.2MP5M9Z66U4TY@nvidia.com>
In-Reply-To: <DJR76RV8NEKN.2MP5M9Z66U4TY@nvidia.com>

On Mon Jul 6, 2026 at 6:19 AM CEST, Alexandre Courbot wrote:
>> +impl<'a, T: Operations> Registration<'a, T> {
>> +    /// Register a previously allocated fwctl device with the given reg=
istration data.
>> +    ///
>> +    /// The `reg_data` is owned by the registration and accessible duri=
ng callbacks via
>> +    /// `Device::registration_data_unchecked()`.
>> +    ///
>> +    /// # Safety
>> +    ///
>> +    /// Callers must not `mem::forget()` the returned [`Registration`] =
or otherwise prevent its
>> +    /// [`Drop`] implementation from running, since `fwctl_unregister` =
must be called before the
>> +    /// parent device is unbound.
>> +    ///
>> +    /// `dev` must be an unregistered [`Device`] that is not associated=
 with any live
>> +    /// [`Registration`], and no other thread may attempt to register t=
he same device concurrently.
>> +    pub unsafe fn new(
>> +        _parent: &'a device::Device<device::Bound>,
>
> Why do we need `_parent`? Is it to provide a proof that the parent
> device is bound by the time of registration? If so, there is an obvious
> loophole: this method will accept any bound device, not necessarily the
> actual parent that was passed to `Device::new`.
>
> We should either store an `ARef<device::Device>` in `fwctl::Device` to
> perform the check at runtime, or add a requirement in the `Safety`
> paragraph that `_parent` must be the actual parent, since the method is
> already `unsafe` anyway.

Neither is needed, the fwctl::Device already carries a parent device pointe=
r
(available through AsRef in Rust).

This function should just compare dev.as_ref() with parent (which I thought=
 was
already the case in a previous version).
