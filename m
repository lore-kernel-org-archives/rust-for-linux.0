Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 201694052AF;
	Tue, 13 Oct 2026 13:59:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791899975; cv=none; b=qcR+WQZvU8mWjdKeYKKbFqHdUIbG9c0luk2qouP5gg6MANItt9yNBnolEmLJ5l0U341SisnUQrqgFT87L/E3S3ri+8mjSrH5Kp+4ZXF+tot0wgRxvtiinGo+Mtb9XLDgAE0vedlWcW3t36jXfs/KDO18ixsxWaeg1y3BML78X94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791899975; c=relaxed/simple;
	bh=YsEM5ptR2zDLz7P/1y5R0CUO9PDTnOIOi2WsPxfseno=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=b4068p5jbW+xeAYyyI8d+tFd0sQxZNmy7osmQYcbRmBYRAVt1hfAUbKldGNV79YuDZEzIDi7f1Q+lD0Dgc26Ty5NPI7TiVK7r9qFLDE6/2Ckyi4HeT47sSTK5azqfN629lCZ8vE7qjhqo3+Q2GPAdoe7Os0wIBf8dlGes/OLXp8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=ZD801tsk; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="ZD801tsk"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FC641F000FF;
	Tue, 13 Oct 2026 13:59:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1791899973;
	bh=HrqSHRUY5pc0XihbVOdEmwX7zKTFjr3hwW1XGhp5rUk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZD801tskHnh8CFbS1JvP631f+H1JmaDYv0X7QS8c/GkXiAgtDhlZ1ugORCou9WGwY
	 rqScfiAb5m3BQOZzfCsPI963wlujW4BmpKcWm8QYv79meZjHt1EIW7dhKd6CpARqMK
	 8nkjhb4LmsxE6tDhKAbvTk2PRE6uoUNIjJSbUBPk=
Date: Tue, 13 Oct 2026 15:59:39 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Carlos Llamas <cmllamas@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	kernel-team@android.com, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust_binder: add state_hashed and transactions_hashed
 files
Message-ID: <2026101318-stingy-crescent-b47e@gregkh>
References: <20261009170627.3075594-1-cmllamas@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261009170627.3075594-1-cmllamas@google.com>

On Fri, Oct 09, 2026 at 05:06:27PM +0000, Carlos Llamas wrote:
> The 'state' and 'transactions' binderfs files print the userspace ptr
> and cookie of each node as raw values, which leaks the userspace memory
> layout and forces access to these files to be heavily restricted. Add
> hashed versions of these files, as done for the C driver in commit
> 57483a362741 ("binder: Create safe versions of binder log files"), so
> that access to them can be granted more broadly.
> 
> Pass a 'hashed' flag down the debug_print() chain and print the ptr and
> cookie through a new MaybeHashed helper, which either prints the raw
> value or hashes it like {:p} does. Everything else in the files remains
> unchanged:
> 
>   $ grep "node 2:" /dev/binderfs/binder_logs/state*
>   state:        node 2: u000000003cf2c740 c0000000000000000 hs true ...
>   state_hashed: node 2: u00000000abab9b6d c0000000000000000 hs true ...
> 
> Assisted-by: LLM
> Signed-off-by: Carlos Llamas <cmllamas@google.com>
> ---
> 
> Notes:
>   The output of the hashed values depends on this {:p} fix:
>   https://lore.kernel.org/all/20261006183857.396710-1-cmllamas@google.com/  
>   Without it, the patch still builds and works, but an odd "0x" prefix
>   is added to the hashed values, e.g. "u0x00000000abab9b6d".

As that's not merged yet, I'll drop this for now and wait for you to
resubmit this when that is merged properly?

thanks,

greg k-h
