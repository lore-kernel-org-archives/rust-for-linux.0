Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E294D20FA84;
	Wed, 22 Jan 2025 09:28:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737538124; cv=none; b=YIsfxSUm9w2PgXaQrkB03D/0uSvzT3nL6ON3AQjUOCX+F9UlIC0a74m08kzj9uLM//Mcsp+/8UgBH9gURdjDPvio34Fn00FG1ZrMSNDAgkHdI4r1C85EzGjYfJx/tvGW3h67WddZD6iokVcg1G+5LkIJUQxcXkqvGL6b5yexWx4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737538124; c=relaxed/simple;
	bh=lt6N8dgVDca/nFt1n9/jg+fuL/v9nIrY0csrfCq38p8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AD5Vbz5gPxuV/p+UGjzXJfrTgGs8pHGs/MHk2OYz4Pjf5qNl+AqgLzOtvCeOWZe+FsCqUVlvMPS8tdM9IlFMPIxif/9L+uF8Z6pSo2wHePtRQ2ojHeTJorQU+TedHHEgj0ZxVpD08leNhtkJgsWkb15P3c7mWjoGtEgOj3LpspU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=LXljxsHt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="LXljxsHt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0AABC4CED6;
	Wed, 22 Jan 2025 09:28:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737538123;
	bh=lt6N8dgVDca/nFt1n9/jg+fuL/v9nIrY0csrfCq38p8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LXljxsHt2YxnuMaRShrwBfcQFANp4BbPWpQj9GMTha5Vo1R6d5ESXvKbvEE2BCsKy
	 FEN+7A5lkWsXBWeUHkpDR1H/ZC+vb0vnH+Cd+gwpY6IhWEpewSDYXnlMRV+5OkA7Ab
	 X2blin2pWb+59/YfEfTLydZeHeZk6bm/kb53WjIs=
Date: Wed, 22 Jan 2025 10:28:40 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Arnd Bergmann <arnd@arndb.de>, Lee Jones <lee@kernel.org>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/3] rust: miscdevice: Add additional data to
 MiscDeviceRegistration
Message-ID: <2025012243-myspace-woof-1d1e@gregkh>
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-2-edbf18dde5fc@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250119-b4-rust_miscdevice_registrationdata-v1-2-edbf18dde5fc@gmail.com>

On Sun, Jan 19, 2025 at 11:11:14PM +0100, Christian Schrefl wrote:
> When using the Rust miscdevice bindings, you generally embed the
> MiscDeviceRegistration within another struct:
> 
> struct MyDriverData {
>     data: SomeOtherData,
>     misc: MiscDeviceRegistration<MyMiscFile>
> }
> 
> In the `fops->open` callback of the miscdevice, you are given a
> reference to the registration, which allows you to access its fields.
> For example, as of commit 284ae0be4dca ("rust: miscdevice: Provide
> accessor to pull out miscdevice::this_device") you can access the
> internal `struct device`. However, there is still no way to access the
> `data` field in the above example, because you only have a reference to
> the registration.

What's wrong with the driver_data pointer in the misc device structure?
Shouldn't you be in control of that as you are a misc driver owner?  Or
does the misc core handle this I can't recall at the moment, sorry.

> Using container_of is also not possible to do safely. For example, if
> the destructor of `MyDriverData` runs, then the destructor of `data`
> would run before the miscdevice is deregistered, so using container_of
> to access `data` from `fops->open` could result in a UAF. A similar
> problem can happen on initialization if `misc` is not the last field to
> be initialized.
> 
> To provide a safe way to access user-defined data stored next to the
> `struct miscdevice`, make `MiscDeviceRegistration` into a container that
> can store a user-provided piece of data. This way, `fops->open` can
> access that data via the registration, since the data is stored inside
> the registration.

"next to" feels odd, that's what a container_of is for, but be careful
as to who owns the lifecycle of the object you are trying to get to.
You can't have multiple objects with different lifecycles in the same
structure (i.e. don't mix a misc device and a platform device together).

So a real example here would be good to see, can you post your driver at
the same time so that we can see what you are doing and perhaps provide
a better way to do it?

thanks,

greg k-h
