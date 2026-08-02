Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 898EC242D9B;
	Sun,  2 Aug 2026 08:33:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785659629; cv=none; b=GU/UC8xwIhCnkRpfbtOievpJ4GCPoP5f66KjLGBsvtjbB6azmgNtElyaM1OYF/MywS9eLbKzO3QWrF0k/mSdj5aKnK0+US4wUmgnq7Zm/gneM8/8VmDMCk9f6Gg32ZZsyH5U6JRTnnO2SqEQi/iJxvWQNWYyrAC/MHzhBAbNkPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785659629; c=relaxed/simple;
	bh=ef+dKuHUe6T4imWuTr1EBeWQl9LuEExFvPItiuZRRjU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mw5tUEdrGVgECBPcjpXnEotazBj4wmsddp/KXqbYluZR8Km5QWLzAJa27hEBufRKFZZe7tACki4F+roFazwtsQpD7Qx39rLqJX3w3NULJymMOvCuXZx0Q2GjOuXjCy/ejvopgVCwYi1GSrnFVECfD0LYgtbyMX1Lc7plY/OENcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=TSA09KxE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="TSA09KxE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5ED741F00AC4;
	Sun,  2 Aug 2026 08:33:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1785659628;
	bh=+fS0r2CE62hWQfVHyzfO8AijyrZi4/KL/QiWiYOW9cQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TSA09KxE9LQ9hfM5loGtnu8l0SLLKjKSdfek5gI0n5XVHHzex8IQGjtbaLE0JTva+
	 dPHKeDS6JM2D0i7HIx8zU19GVV89HZ0cZ5q423i+qXXOfErtir1tyZGqUv/TCF5MZ8
	 2wJmdcMLe8+rkjWL+Vr0zuHnN5oqbM97GMZBxOcE=
Date: Sun, 2 Aug 2026 10:32:19 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Alexandru Radovici <alexandru.radovici@wyliodrin.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH RFC 2/2] rust: usb: add control message send and receive
Message-ID: <2026080244-ability-education-535f@gregkh>
References: <20260801-rust-usb_control_msg-v1-0-655bb444b52c@wyliodrin.com>
 <20260801-rust-usb_control_msg-v1-2-655bb444b52c@wyliodrin.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260801-rust-usb_control_msg-v1-2-655bb444b52c@wyliodrin.com>

On Sat, Aug 01, 2026 at 03:01:08AM +0300, Alexandru Radovici wrote:
> Add `Device::send_control_message()` and
> `Device::receive_control_message()`, wrapping usb_control_msg_send()
> and usb_control_msg_recv(), plus a `Request` type describing the
> bmRequestType, bRequest, wValue and wIndex fields of a setup packet.

Why not keep the names as close as possible to the C calls?  You have
switched around the noun/verb use here.

thanks,

greg k-h
