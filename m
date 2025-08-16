Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 63A101AA1D9
	for <rust-for-linux@vger.kernel.org>; Sat, 16 Aug 2025 09:58:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755338328; cv=none; b=iUu1KrT9jBn4UL+HqJGeBozYWFO97rc/l4QKKV80QUWGI6N4YMyX1AvwhDcyIysqRLlBSK1gwye+0sTDuqeucznEHH/wtrGV7r4whfSElh/8cqvsA2kBkkIwqJnC6LCUFMeK05fnvB9bLXeQMwkeSu4WifeuE+vbZFDiJYbEQXI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755338328; c=relaxed/simple;
	bh=IMVC0/DVWH0+WB+6LdGxkN2XxZHJcZDF9GMrM3SKoq8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OxMUO8vxNMclKkIJLNrWDxsrDHHaEBTh4QfPpk0xXOzLTuerd4JMPLgD6PP2yTEIP86NcMsN1H/dIQnwG0PhYbtisLUT2jPhWjXrOAXTwxHbLXYn3obdZ/nr+TT7A3FmVhcwu6mpMPCScstrldM8FzyO6+9M9e3eYfPEnUdsdHA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=UAjGoPy0; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="UAjGoPy0"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 61462C4CEEF;
	Sat, 16 Aug 2025 09:58:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755338327;
	bh=IMVC0/DVWH0+WB+6LdGxkN2XxZHJcZDF9GMrM3SKoq8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UAjGoPy0XBH9UOPM63uh1ij4QlMh3ZpkUy/sqpvxqOArWhfT9VE1tVt1WTuR2SMn+
	 sZCRcqrzb3lIgWSLUk2QkMr/lXRr64bny3FjFWAMW9POKJFJNQEbKu830biagZ5wjC
	 KN15TsZdcS2lsrpesG88hxQM0I17wWru1ZYsddA8=
Date: Sat, 16 Aug 2025 11:58:44 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: =?utf-8?B?5YeM56aP5LmJ?= <lingfuyi@kylinos.cn>
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH] rust: xarray: optimize lock functions with inline
 attribute
Message-ID: <2025081626-tackling-boxy-7e6c@gregkh>
References: <wy9yvo6alf-wycirb0e90@nsmail7.0.0--kylin--1>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <wy9yvo6alf-wycirb0e90@nsmail7.0.0--kylin--1>

On Sat, Aug 16, 2025 at 05:45:01PM +0800, 凌福义 wrote:
> The XArray lock and try_lock functions are simple wrappers around
> the C functions xa_lock and xa_trylock. These Rust functions don't
> add significant logic beyond the unsafe FFI calls and safety guarantees.
> 
> Mark them as inline to avoid unnecessary function call overhead in
> hot paths where XArray locking is frequent, such as in page cache
> operations and other kernel data structure management.
> 
> This follows the same optimization pattern as other Rust kernel
> modules where simple C function wrappers are marked inline to
> improve performance.
> 
> Signed-off-by: lingfuyi <lingfuyi@kylinos.cn>
> ---
> rust/kernel/xarray.rs | 2 ++
> 1 file changed, 2 insertions(+)
> 
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index a49d6db28845..c96589f92927 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -119,6 +119,7 @@ fn iter(&self) -> impl Iterator<Item = NonNull<c_void>> +
> '_ {
> }
> 
> /// Attempts to lock the [`XArray`] for exclusive access.
> + #[inline]
> pub fn try_lock(&self) -> Option<Guard<'_, T>> {
> // SAFETY: `self.xa` is always valid by the type invariant.
> if (unsafe { bindings::xa_trylock(self.xa.get()) } != 0) {
> @@ -132,6 +133,7 @@ pub fn try_lock(&self) -> Option<Guard<'_, T>> {
> }
> 
> /// Locks the [`XArray`] for exclusive access.
> + #[inline]
> pub fn lock(&self) -> Guard<'_, T> {
> // SAFETY: `self.xa` is always valid by the type invariant.
> unsafe { bindings::xa_lock(self.xa.get()) };
> --
> 2.34.1
> 
> 
> 
> 
> 
> 
> ----
> 
>  
> 


Hi,

This is the friendly patch-bot of Greg Kroah-Hartman.  You have sent him
a patch that has triggered this response.  He used to manually respond
to these common problems, but in order to save his sanity (he kept
writing the same thing over and over, yet to different people), I was
created.  Hopefully you will not take offence and will fix the problem
in your patch and resubmit it so that it can be accepted into the Linux
kernel tree.

You are receiving this message because of the following common error(s)
as indicated below:

- Your patch is malformed (tabs converted to spaces, linewrapped, etc.)
  and can not be applied.  Please read the file,
  Documentation/process/email-clients.rst in order to fix this.


If you wish to discuss this problem further, or you have questions about
how to resolve this issue, please feel free to respond to this email and
Greg will reply once he has dug out from the pending patches received
from other developers.

thanks,

greg k-h's patch email bot
