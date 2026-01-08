Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5E0B3FB54F;
	Thu,  8 Jan 2026 09:09:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767863389; cv=none; b=Sm3xi88LkrbQHQzoExKMcKbL5zlcrmhjpHl7IBOOZGN9iqEpulHxf46uKn7kR5toOPFE+drxIuiftMQZ834v4srlPoatqUGzKZH/k0eR6OuGdFg3YN9Gybp8xZz4wFEldQzCjXlw+QuJk+C6tpaK7qRLrHoUw1UxkIP6TezH52U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767863389; c=relaxed/simple;
	bh=bR1okxG9nsE1WlOyGvTSQYaEdbmHppBNGJaHhTweo4c=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gmzTu28fxuyEL39sYaiKi312z5gSeZN0Q9hM6vRgH2NEcdmfRot3XJKdZEsjxX7/TCFFUNN4q7QuWCYaPU07XltlsMhYBcimbwZWA65QhaoyMzVPYh+kFz0sQuh/T/KdZMpeQ9IHP9VlfKSJE6S1j4XMLtH7L6T0X8zcTcKrRQo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=Eu8RYdeI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="Eu8RYdeI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DFA65C116C6;
	Thu,  8 Jan 2026 09:09:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1767863387;
	bh=bR1okxG9nsE1WlOyGvTSQYaEdbmHppBNGJaHhTweo4c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Eu8RYdeIw7Beg05SyAwGpRFZH3qsEPj+SKPixP7LhTDAOa5m+O5DrN9jlbBX+LA19
	 M09tqh8isZuXSJKrxtJLhzShxpH/9okTCudyEDA9k1NmWm4klTvnAe1pGFpQUE+4VK
	 v6St91OXViJXY65PIuSP9Qwuif4BAa8e0CbOEu5U=
Date: Thu, 8 Jan 2026 10:09:44 +0100
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
Subject: Re: [PATCH] rust: device: add platdata accessors
Message-ID: <2026010828-mouth-domelike-71cd@gregkh>
References: <20260108085545.333676-1-pengfuyuan@kylinos.cn>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260108085545.333676-1-pengfuyuan@kylinos.cn>

On Thu, Jan 08, 2026 at 04:55:45PM +0800, pengfuyuan wrote:
> Implement generic accessors for the platform data of a device.
> 
> Platform data is typically set by platform code when creating the device
> and points to platform-specific data structures. The accessor provides
> type-safe access to this data without requiring unsafe code at the call
> site.
> 
> The accessor is implemented for Device<Bound>, allowing drivers to access
> platform data during probe() and other device lifecycle callbacks. Unlike
> drvdata, platform data is managed by platform code and has a lifetime
> tied to the device itself.
> 
> Signed-off-by: pengfuyuan <pengfuyuan@kylinos.cn>

Again, use your name, not your email alias, to sign off on something.

thanks,

greg k-h
