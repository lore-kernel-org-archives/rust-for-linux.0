Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6255D54723;
	Wed, 15 Jul 2026 05:43:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784094235; cv=none; b=CW1Dn6SLxJZA9a4iQ5nNhnw880/O50iXZljis2coMwuXmDHb35BmdD8U/8GncrcqMXAPoY9LBGWfBUjDEWnVwQc3Yqdy4PNGqx0sCTQcnuyIcuEMNTMDqtgiWp0XQR8Yai3y+Y7pTuuyBKzF5w5Az7imfuNkkTlfy6V+7EHnJbI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784094235; c=relaxed/simple;
	bh=Xcl2RO52QsGN8BUIEhCb2Rz/KjOfrtzza4rNlSpQ2cA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W4nDiKl1vSnFeSxvs7MkjnCWywX/Q66e10606Me7gCKzTuwb0Todytj//11F/wOHBIzGXTYbcXxNENEcwm3fn/0VSfTbUf7Xki/DqBkF7mdZp3luSmzHyQU9r5NfV+1pX6djBFenSCpLWylZFQ6ruivmTziFqlKa7xmuiL9frQs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=hW0AwSSy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="hW0AwSSy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E9291F000E9;
	Wed, 15 Jul 2026 05:43:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1784094233;
	bh=NArU9rrJNKZKXRas++KsAkX5YowV+qmdlYb/97R0+h0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=hW0AwSSy8JZjY2xRdvxxs1zWVEwFQ4YqSEsiruqUvs9MJLmUtas0t6kSAdw2UIYwa
	 nvOPiZyjkTqpxaIsujEM7DaeTKAIMuLFl/w9v7qJoUDIoCTlmOPTZL4WHAG1N5fY70
	 qFi9I/4k5xNSa5sWzG9I/R6XBqXEBvdozQUIXIaM=
Date: Wed, 15 Jul 2026 07:43:47 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Colin Braun <colinbrauncl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>,
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Alan Stern <stern@rowland.harvard.edu>,
	Mathias Nyman <mathias.nyman@intel.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org,
	Colin Braun <colin.braun.cl@gmail.com>,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [RFC PATCH 0/4] rust: usb: add usb request block abstractions
 and a user
Message-ID: <2026071501-silly-concerned-ae20@gregkh>
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <1E924102-5CC7-427A-9FD0-3B15BA1BEAEB@collabora.com>
 <alVGanOux7SJ5dpM@pendragon>
 <0CCB6F69-1336-4254-AE1A-5DDC63BCA7B1@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0CCB6F69-1336-4254-AE1A-5DDC63BCA7B1@collabora.com>

On Tue, Jul 14, 2026 at 11:35:50PM -0300, Daniel Almeida wrote:
> This doesn't have to discourage you from this work, though. Last I spoke to
> Greg, I think he was OK with having enough infrastructure to build a Rust
> version of usb-skeleton.c. You could perhaps work on that? I never really found
> the time to, but I can chime in with reviews. It's always nice to onboard new people :)

Yes, if we have a rust version of usb-skeleton, that would go a long way
toward actually being able to write a "real" USB driver in rust.  I have
no objection to taking the bindings to make that happen.

thanks,

greg k-h
