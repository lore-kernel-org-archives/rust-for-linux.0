Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 331955C613
	for <rust-for-linux@vger.kernel.org>; Mon, 25 Mar 2024 18:14:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1711390461; cv=none; b=BV3jox+WIRAjWzIRS36e8MxRIIx5XAmyUMUsSO+WnKkzr/bqvWTNPcTgdmDI72VNwYxqtQ0UdGr+kT7jOL3qCx4AhrGo8Dg2kzby6F1uqjczmvbTTYaThCSyRgpE9vKyBEN5rqXd7snwudG8Qiv11FFE+Ez5wtWP1+uV5AvIi2E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1711390461; c=relaxed/simple;
	bh=VQvXkAFl4QBAidzKbMxjc0Q/adahv5oel1zj2yx14oQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KrfcP0G6H1/h4ogRtoo5GyzJYO13vjOalmIvY7foGBhg+eb9WI29Sn62M5MntL3E0PJHBX1nRgfIs2k6pCXLxDlkh/QDutkXdpBXBZCJkpNDP2tFKitapnwsRY76BQPAuZjjue7mmQCWN1aGv66rZl/fj0UwldkQVu1cyzjtI/w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=D74klgDi; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="D74klgDi"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28013C433C7;
	Mon, 25 Mar 2024 18:14:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1711390460;
	bh=VQvXkAFl4QBAidzKbMxjc0Q/adahv5oel1zj2yx14oQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D74klgDiroMXycsiN4PvlDkpk1IkGGawFsrFjYvUmVY31oe06t/U3rHdo1r7tzG/f
	 8Olqv/BQHzinu7riEbC3y8XWXittGbkNSY3wgcg7e+AQjwu3ia+TFNYKRXBoEnG7HU
	 xr0lQX1FjobtZQaM+m0Koi9BItUIZ8lyM29qz6Ts=
Date: Mon, 25 Mar 2024 19:14:17 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@redhat.com>
Cc: rafael@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com,
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@samsung.com, aliceryhl@google.com, tglx@linutronix.de,
	mingo@redhat.com, bp@alien8.de, dave.hansen@linux.intel.com,
	rust-for-linux@vger.kernel.org, x86@kernel.org, lyude@redhat.com,
	pstanner@redhat.com, ajanulgu@redhat.com, airlied@redhat.com
Subject: Re: [PATCH 2/8] rust: device: Add a minimal RawDevice trait
Message-ID: <2024032501-unplanned-detergent-4357@gregkh>
References: <20240325174924.95899-1-dakr@redhat.com>
 <20240325174924.95899-3-dakr@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240325174924.95899-3-dakr@redhat.com>

On Mon, Mar 25, 2024 at 06:49:06PM +0100, Danilo Krummrich wrote:
> From: Wedson Almeida Filho <wedsonaf@gmail.com>
> 
> Add a RawDevice trait which can be implemented by any type representing
> a device class (such as a PlatformDevice). This is the minimum amount of
> Device support code required to unblock abstractions that need to take
> device pointers.
> 
> Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Wedson Almeida Filho <wedsonaf@gmail.com>
> Signed-off-by: Danilo Krummrich <dakr@redhat.com>
> ---
>  rust/bindings/bindings_helper.h |  1 +
>  rust/kernel/device.rs           | 23 +++++++++++++++++++++++

As fun as it is to bury .rs files down in rust/ where no one notices
them, I'm going to ask for this to live in drivers/base/ please so that
we notice it and it shows up as a first-class interface here.  Otherwise
it's going to be impossible to keep in sync over time.

Also, who is going to maintain this?  Didn't checkpatch warn you when
you ran it against this patch?  You did use checkpatch, right?  :)

thanks,

greg k-h
