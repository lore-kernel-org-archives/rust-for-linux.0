Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF6D2D7D4D
	for <rust-for-linux@vger.kernel.org>; Fri, 15 Aug 2025 17:04:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755277495; cv=none; b=jsyMUaGAAQ8mLypPjzL555B8xdfN6mzEcJsjb7b/GFFWySw8lGTmCLEAb6aHq6DbsEfZWuwRCIzUFig1C/wlcHG+jpR2rlsmEgDpnHe6z42zzkytGolcb36r/wucYTsYlGTa6Njilr5rbUSIyPlS9OsFtiE0qL1QrZBkP76zUwQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755277495; c=relaxed/simple;
	bh=pC5bLcdkEKEzk7/azGTu2LaNzgZom/vRH9DYIodWmmw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AyDiPYEDF8FY1A8Tn3gtPZ+s+32Y7QGv3v0x8nx0RYOFcsWRhyQ4KO1Q/enAyyc3C+be1UNhGSyY/uiDRdiDs1r0VhIVpvIPa0v7u9Ibjic2MlhMY6IR1rqCjpbh+G7/+r6uSLZyXz1QGIqEOqPQhTePozjiZS6VNi7zJ4/gRTM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=fiFBFTPY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="fiFBFTPY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B551C4CEEB;
	Fri, 15 Aug 2025 17:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1755277494;
	bh=pC5bLcdkEKEzk7/azGTu2LaNzgZom/vRH9DYIodWmmw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=fiFBFTPYfSmh3tnLkpQ3kyt+PCgpaitkZNHulfJDIdLPAFis9QHnpidcfdvNjncm+
	 Vnqto/Z27umPQM5pj6CeLQgCtZLbBdX7sjGDI7PrLMGbw9Mkcsx69j+TScUWwm4l5A
	 hMoE6Dh2SAg6tW8D4Lfftf/d7t3IG3m0dw3qIwkI=
Date: Fri, 15 Aug 2025 19:04:40 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Igor Korotin <igor.korotin.linux@gmail.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org,
	Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: Re: [PATCH v3 1/3] rust: i2c: add basic I2C device and driver
 abstractions
Message-ID: <2025081514-filter-unfunded-e312@gregkh>
References: <20250801153742.13472-1-igor.korotin.linux@gmail.com>
 <20250801154042.14327-1-igor.korotin.linux@gmail.com>
 <DBRI0B7BXRS4.3RUOC5ARVETE1@kernel.org>
 <CAG7QV93KGmoJ6+if-ZuwBF91x0BVDUKbOegspk2MC8r9OjvA9g@mail.gmail.com>
 <909d0a86-16df-4469-aa13-1f248f0ce46c@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <909d0a86-16df-4469-aa13-1f248f0ce46c@kernel.org>

On Fri, Aug 15, 2025 at 06:03:32PM +0200, Danilo Krummrich wrote:
> On 8/15/25 5:40 PM, Igor Korotin wrote:
> > Hello Guys
> > 
> > Preparing v4, I keep thinking if for I2C I should rename `i2c::Device`
> > to `i2c::I2cClient` or `i2c::Client`. The reason why I made it `Device`
> > for the first iterations is so it would be the same code as for
> > PCI/Platform code for example.
> > But the original I2C C code has other terminology. Do you think it worth
> > keeping it in the Rust code?
> 
> I think the reason I2C names this i2c_client and i2c_adapter is that technically
> both are I2C devices, hence just i2c_device would have been ambiguous.

Yes, when I did that code 20+ years ago, it was hard to pick out good
names.  Also we were converting over from the existing non-driver-model
i2c code, which had those names at the time, so we kept them as much as
possible.

> What about i2c::ClientDevice and i2c::AdapterDevice?

I would try to keep them matching the same as the C side, as
i2c_client_device and i2c_adapter_device wouldn't make much sense there
either.

thanks,

greg k-h
