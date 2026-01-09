Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8929333AD9D;
	Fri,  9 Jan 2026 11:08:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767956888; cv=none; b=Zb3KhlWlHHNgVulyL45GMH8/reki6QsB0EDfbrwZqpL6SWIMhaKzHA2TTOfHvTRc4nYgl0Th7aB/oHxqw+NxDfnHiBf4fl7LVQWyLQlTkKkQc2/JO6QDPB7EkComS94cfA6Td3LUwKUhqfkBASiMzMMf3kbjX6PICRk5OjMdikk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767956888; c=relaxed/simple;
	bh=knge/EuHAbJu3q76L96YCOWN/hwlYu+ewbLHVeVnCEo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o5dBXNy2mySnYo+UlBLtWrotFpH0UlrBW7eDTWpKtpclK79kjqW+20J3eAR5wNDVBrV0OB8BxHT+WbYjxZaQ512sx3qH7BGSmKK+aW3gFYB4MJewo4AdjWXpzmfHBvrs4KgHRRY2omGR76zMGYCAfKWUSAdQsdSruptX/muhIGg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Am778XmW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Am778XmW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D396C19422;
	Fri,  9 Jan 2026 11:08:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767956888;
	bh=knge/EuHAbJu3q76L96YCOWN/hwlYu+ewbLHVeVnCEo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Am778XmWrXN+odZvq3T+03uhsg7EcB5UePXonzTgHPJc5GeqpdKZ3nfRl0lU356Bc
	 1k1XIIb5k+dn6u2oPb7s7QUmOkhinCy3/b0LU2LwB1kk/QWfgS8UtLaXsuXVh5ius/
	 2AviOQNyFfo6SVxX4oPbWfN1ItJlxhbRjo0Haxfs=
Date: Fri, 9 Jan 2026 12:08:05 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: pengfuyuan <pengfuyuan@kylinos.cn>
Cc: "Rafael J . Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 v2 1/1] rust: device: add platdata accessors
Message-ID: <2026010941-giddy-economic-d786@gregkh>
References: <DFJ5ICRD3YFF.XCSV3CJCDORA@kernel.org>
 <20260109080528.478731-1-pengfuyuan@kylinos.cn>
 <20260109080528.478731-2-pengfuyuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109080528.478731-2-pengfuyuan@kylinos.cn>

On Fri, Jan 09, 2026 at 04:05:28PM +0800, pengfuyuan wrote:
> Implement generic accessors for the platform data of a device.

There is only one "accessor" being added here.

> Platform data is typically set by platform code when creating the device (e.g.
> via `platform_device_add_data()`). Drivers may use it to obtain per-device,
> platform-provided configuration.

No rust binding to set this?  Who would be setting this data but not
reading it?  Or can you already call platform_device_add_data() from a
rust driver?

> The accessor is `unsafe` because the caller must ensure that the chosen `T`
> matches the actual object referenced by `platform_data`.
> 
> Platform data is generally a C type, so the method returns `&Opaque<T>` to
> avoid creating a Rust reference to potentially uninitialised or otherwise
> invalid C data. Drivers can then perform the FFI dereference behind an explicit
> `unsafe` block.
> 
> The method is implemented for `Device<Ctx>` so it is available in all device
> states. If no platform data is present, `-ENOENT` is returned.
> 
> Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>
> ---
>  rust/kernel/device.rs | 31 +++++++++++++++++++++++++++++++
>  1 file changed, 31 insertions(+)
> 
> diff --git a/rust/kernel/device.rs b/rust/kernel/device.rs
> index c79be2e2bfe3..90ccc433dfe7 100644
> --- a/rust/kernel/device.rs
> +++ b/rust/kernel/device.rs
> @@ -483,6 +483,37 @@ pub fn fwnode(&self) -> Option<&property::FwNode> {
>          // defined as a `#[repr(transparent)]` wrapper around `fwnode_handle`.
>          Some(unsafe { &*fwnode_handle.cast() })
>      }
> +
> +    /// Access the platform data for this device.
> +    ///
> +    /// Platform data is typically set by platform code when creating the device and is expected
> +    /// to remain valid while the device is alive.
> +    ///
> +    /// Returns a reference to the opaque platform data, or [`ENOENT`] if no platform data
> +    /// is set.
> +    ///
> +    /// # Safety
> +    ///
> +    /// Callers must ensure that:
> +    /// - If platform data is set (i.e., `platform_data` is not null), the pointer points to valid,
> +    ///   properly aligned storage for `T` and remains valid for the lifetime of the returned
> +    ///   reference.
> +    /// - The type `T` matches the type of the platform data structure set by platform code.
> +    pub unsafe fn platdata<T>(&self) -> Result<&Opaque<T>> {
> +        // SAFETY: By the type invariants, `self.as_raw()` is a valid pointer to a `struct device`.
> +        let ptr = unsafe { (*self.as_raw()).platform_data };

Why isn't dev_get_platdata() being used here?

Also, we still need to see a user of this before we can properly review
it.

thanks,

greg k-h
