Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B768819A
	for <rust-for-linux@vger.kernel.org>; Sun, 22 Jun 2025 20:32:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1750624340; cv=none; b=aLL/UfiKGwN+9rFgrEj+EXegbuXwdBTL+fFDTNArguKICN7rV8uvuwkmfjn7VndIWADMeFvzXoy3rpRwBANw7/rqsrFjJi/ZTaTiMSSD+Y7i4xE8I1hr0W5iSe+sOwksm/Hzcnl+TUuSIk1dqjRL6B3yeFZRT1McMX7TIynxfwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1750624340; c=relaxed/simple;
	bh=73oUMhqaBmUuHMhz+auknrfYENj80wGHZ8/b+b8NGIk=;
	h=Message-ID:Date:MIME-Version:From:Subject:To:Cc:References:
	 In-Reply-To:Content-Type; b=dEwkx4bo0Q1YCiu8+ZRbqYvZI/S7whHQn+v1AavEOrwtPwisax9/gh1En24mjY40nGIEjfqCG3EQLujcWmXF7h+8G/1CsfzOKd6hYmB5mk6Cyo5+gvHJ3iLZUSurimIXdUEKRbMbuFtdldhivOP+ymLPUWG4/dCUC3VsX4d1De4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=beS0+kef; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="beS0+kef"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04C04C4CEE3;
	Sun, 22 Jun 2025 20:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750624336;
	bh=73oUMhqaBmUuHMhz+auknrfYENj80wGHZ8/b+b8NGIk=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=beS0+kefDcxK4rCST6YnUIQ8x1wftu5o5O6sgS+6V8P4axFVi4h/NlN7mn4S2mjsU
	 T+8yLgAcFUKzuMMm+etHbMbdba7xXRoiJiNpxQI3vM55l9dBv2cihVFX0PiVwF8B1V
	 J+Rj1yfRRS2qltqiFDrmU8EHoApPg2C3nJQBO6c23ZIkB07fsB3mZDgpisn5rip+ng
	 VKDEZI8SxqM8snwfM+GWk2HFHEna6VAMrbUI6O1+uQy3IWefMGk48JBQpuxt0Z4xtw
	 H1nTozqcYpQiHUuI9VjOMndwo5dO5ffMyZaWHHrn/TvVetIF1oxwj6MJ2zoTtKx/cT
	 HCf6ZrIyGi3Aw==
Message-ID: <b332e91c-7457-45f7-8402-3c5604f22ae4@kernel.org>
Date: Sun, 22 Jun 2025 22:32:12 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH] rust: miscdevice: clarify invariant for
 `MiscDeviceRegistration`
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Shankari Anand <shankari.ak0208@gmail.com>,
 rust-for-linux@vger.kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
 gary@garyguo.net, a.hindborg@kernel.org, bjorn3_gh@protonmail.com,
 Benno Lossin <lossin@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Alice Ryhl <aliceryhl@google.com>
References: <20250622110646.150701-1-shankari.ak0208@gmail.com>
 <CANiq72mWQPbUQKqCve+FF63aayeMEPgYVSezLjgGft+1weMh-g@mail.gmail.com>
Content-Language: en-US
In-Reply-To: <CANiq72mWQPbUQKqCve+FF63aayeMEPgYVSezLjgGft+1weMh-g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On Sun, Jun 22, 2025 at 10:26:49PM +0200, Miguel Ojeda wrote:
> On Sun, Jun 22, 2025 at 1:07 PM Shankari Anand
> <shankari.ak0208@gmail.com> wrote:
> >
> > Reword and expand the invariant documentation for `MiscDeviceRegistration`
> > to clarify what it means for the inner device to be "registered".
> > It expands to explain:
> > - `inner` points to a `miscdevice` registered via `misc_register`.
> > - This registration stays valid for the entire lifetime of the object.
> > - Deregistration is guaranteed on `Drop`, via `misc_deregister`.
> >
> > Reported-by: Benno Lossin <lossin@kernel.org>
> > Closes: https://github.com/Rust-for-Linux/linux/issues/1168
> > Fixes: f893691e7426 ("rust: miscdevice: add base miscdevice abstraction")
> > Signed-off-by: Shankari Anand <shankari.ak0208@gmail.com>
> 
> Cc'ing Danilo and Greg.

Thanks -- also Cc'ing Alice.

> > +/// The `inner` field contains a `struct miscdevice` that has been registered with
> > +/// the kernel using `misc_register()`.
> > +/// This registration remains valid for the entire lifetime of the `MiscDeviceRegistration`
> > +/// instance.
> > +/// Deregistration is guaranteed to occur exactly once, during the [`Drop`] implementation, via
> > +/// a call to `misc_deregister()`.
> > +/// The `inner` pointer is never null and always points to a valid, pinned `miscdevice` instance
> > +/// initialized via `MiscDeviceOptions::into_raw`.
> 
> These should be bullet points -- like this it will be rendered like a
> single long paragraph (but please wait for other feedback before
> fixing that).
> 
> The last one seems wrong -- `inner` is not a pointer. It should also
> probably be simplified/merged with the first one.
> 
> Also, please use intra-doc links wherever possible, e.g.
> [`MiscDeviceRegistration`] and for `into_raw` too.
> 
> Thanks for the patch!
> 
> Cheers,
> Miguel
