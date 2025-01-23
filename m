Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A37B21885BF;
	Thu, 23 Jan 2025 06:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737613391; cv=none; b=OR/5aya4x6ZxxEZ4STT8rT6lq/GajC7FDPIEheGFTQasPMdvvWkeYBQ9d8nsAgq37sYoj8FG4TBuwMT6mcrQm8U59Rwba/FAYLRss77nlG7eAGD3cNSvnl4V9mEbDH8mSC63BMlFS28ykL+TtllQ3WMP6z1wJ43ep6/F2a1UmM8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737613391; c=relaxed/simple;
	bh=ZgndG7zd3Kwx4jWM+dp34zMpAibXZksrS1Yz+0DGzkg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W73x1F9vDUnN5JQygjtgIV6KMYxQ7cR/QK+8B6o1qzHCXwJDopOnmMrlFkEfL1KXL7d661QZBdwzlL89rESa3mUpsl1gEFucxF4rxRLJxX3iPDyrrdHXAkGzOGGIruD4aoY8ZFOMn4Wr3eJpeOaoF6h65rKOnRzc8ljXkTkIx7E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=B7TZFDyN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="B7TZFDyN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 767B2C4CED3;
	Thu, 23 Jan 2025 06:23:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1737613391;
	bh=ZgndG7zd3Kwx4jWM+dp34zMpAibXZksrS1Yz+0DGzkg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B7TZFDyNw00Wi/CSziRYYMJ8xyq6MIkpEG4abMBdA90TYHObE4GqZwf3u7arm6gmw
	 5yF0a8AB7G6w3/3brwe1tkjZakVTYcZkI1c/6iyTIcpwbT4GQGFGUOnwgkkYE2Uv9N
	 cG8pm57+2Sa8+ayWesmiylZpNqWeWzU5e56PhKVc=
Date: Thu, 23 Jan 2025 07:23:08 +0100
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?Ma=EDra?= Canal <mairacanal@riseup.net>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Subject: Re: [PATCH 2/2] rust/kernel: Add platform::ModuleDevice
Message-ID: <2025012329-candied-walk-f57d@gregkh>
References: <20250122235340.2145383-1-lyude@redhat.com>
 <20250122235340.2145383-3-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250122235340.2145383-3-lyude@redhat.com>

On Wed, Jan 22, 2025 at 06:49:22PM -0500, Lyude Paul wrote:
> A number of kernel modules work with virtual devices, where being virtual
> implies that there's no physical device to actually be plugged into the
> system. Because of that, such modules need to be able to manually
> instantiate a kernel device themselves - which can then be probed in the
> same manner as any other kernel device.
> 
> This adds support for such a usecase by introducing another platform device
> type, ModuleDevice. This type is interchangeable with normal platform
> devices, with the one exception being that it controls the lifetime of the
> registration of the device.

Sorry, but a "virtual" device is NOT a platform device at all.  Platform
devices are things that are not on a real bus and are described by
firmware somehow.

The kernel has "virtual" devices today just fine, look at
/sys/devices/virtual/ so why not just use that api instead of making up
something new?

And modules are code, not data.  Let's not start to even attempt to tie
lifetimes of device structures to module code, that way lies madness and
rolls back the work we did decades ago to split the two apart :)
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Co-authored-by: Maíra Canal <mairacanal@riseup.net>
> ---
>  rust/kernel/platform.rs | 96 ++++++++++++++++++++++++++++++++++++++++-
>  1 file changed, 94 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/platform.rs b/rust/kernel/platform.rs
> index 75dc7824eccf4..b5d38bb182e93 100644
> --- a/rust/kernel/platform.rs
> +++ b/rust/kernel/platform.rs
> @@ -13,8 +13,11 @@
>      types::{ARef, ForeignOwnable, Opaque},
>      ThisModule,
>  };
> -
> -use core::ptr::{NonNull, addr_of_mut};
> +use core::{
> +    mem::ManuallyDrop,
> +    ops::*,
> +    ptr::{addr_of_mut, NonNull},
> +};
>  
>  /// An adapter for the registration of platform drivers.
>  pub struct Adapter<T: Driver>(T);
> @@ -213,3 +216,92 @@ fn as_ref(&self) -> &device::Device {
>          &self.0
>      }
>  }
> +
> +/// A platform device ID specifier.
> +///
> +/// This type is used for selecting the kind of device ID to use when constructing a new
> +/// [`ModuleDevice`].
> +#[derive(Copy, Clone)]
> +pub enum ModuleDeviceId {
> +    /// Do not use a device ID with a device.
> +    None,
> +    /// Automatically allocate a device ID for a device.
> +    Auto,
> +    /// Explicitly specify a device ID for a device.
> +    Explicit(i32),
> +}
> +
> +impl ModuleDeviceId {
> +    fn as_raw(self) -> Result<i32> {
> +        match self {
> +            ModuleDeviceId::Explicit(id) => {
> +                if matches!(
> +                    id,
> +                    bindings::PLATFORM_DEVID_NONE | bindings::PLATFORM_DEVID_AUTO
> +                ) {
> +                    Err(EINVAL)
> +                } else {
> +                    Ok(id)
> +                }
> +            }
> +            ModuleDeviceId::None => Ok(bindings::PLATFORM_DEVID_NONE),
> +            ModuleDeviceId::Auto => Ok(bindings::PLATFORM_DEVID_AUTO),
> +        }
> +    }
> +}
> +
> +/// A platform device that was created by a module.

Again, no, sorry.

If you want a virtual device, make a virtual device.  Ideally using the
auxbus api, but if you REALLY want a "raw" struct device, wonderful,
create that and register it with the driver core which will throw it
under /sys/devices/virtual/ which is where it belongs.

But I don't think you want that, what you want is all the power of a
real bus, but none of the hassle, which is why people abuse the platform
device code so much.  And why I complain about it so much.

So, sorry, I am not going to allow the abuse of the platform device code
to carry over into rust drivers if I can possibly help it.  Make a real
bus.  Or a raw device.  Or use the busses you have today (again,
auxbus), but do NOT abuse platform devices for things they are not.

thanks,

greg k-h
