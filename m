Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E75F61FAA
	for <rust-for-linux@vger.kernel.org>; Mon, 17 Mar 2025 20:02:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742241743; cv=none; b=malUhm/tnEYXPg9LtBwjV0Rjy1bVLZn4mLqCusEd8xZSxvYs7AkzA4fbHGyaMvgaMyY+hfe4ld0qpn3uYY48EgskOKBMpZni2gnADOL/Ofjc8bjpvUZO8z+leK+pLgtmoSpN9tvVspYebHWYceFomoEKEz4w8btpKLgnU/XSAQI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742241743; c=relaxed/simple;
	bh=jC6LYnnYSbUuBiy7UMoJ8q9KiFQt/NVSpxumVdF+wkM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=chG+39ZLT5gdJgD4IxU9PRxpRlSYKwkUc5fGa76dtv+OJQ8XTqcy9rP5q0I1PqEj9bhzrUQrjswq6DwQ+ZmByo/XYcun7aq1lEekGCWERbFrNrmcVZSPEHPL+EVRFEf/+cOcXM1AraygoBv1ZFyn2He0vRXMLQYpoDerHoFEHfY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=GcyKcjb6; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="GcyKcjb6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27BB8C4CEED;
	Mon, 17 Mar 2025 20:02:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742241742;
	bh=jC6LYnnYSbUuBiy7UMoJ8q9KiFQt/NVSpxumVdF+wkM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GcyKcjb6U+IpO9TnOJD2eraD5snC/snaLlWCxx2BuYu5Tbtg/59mim2EqoQJ0s09h
	 xhzU2TDEc4yk1Ql9sfIzJ5cq1a0VL8fi1uHpoPGEGyT2hO/7p6whlWpe3s2btygi7O
	 Bcbfde/iD6JZIo47QN1ezfAUSAG/voc+Zr1vFIbE=
Date: Mon, 17 Mar 2025 16:02:19 -0400
From: Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To: contact@antoniohickey.com
Cc: miguel.ojeda.sandonis@gmail.com, a.hindborg@kernel.org, 
	alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, dakr@kernel.org, gary@garyguo.net, 
	ojeda@kernel.org, rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v3 0/3] rust: use &raw [mut] place instead of
 addr_of[_mut]!(place)
Message-ID: <20250317-cherubic-crafty-gibbon-8c8511@lemur>
References: <CANiq72=X9DTfs-ZTPoAVju3=rKogVhjYXRcE405Hi8Z+v2nq_w@mail.gmail.com>
 <010001959c275e3a-a79b0b1b-97e3-4c1a-a298-f16f4573b96f-000000@email.amazonses.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <010001959c275e3a-a79b0b1b-97e3-4c1a-a298-f16f4573b96f-000000@email.amazonses.com>

On Sat, Mar 15, 2025 at 11:33:00PM +0000, contact@antoniohickey.com wrote:
> Here's the command I ran to send my most recent patch set:
> ```
> git send-email --cover-letter --thread \
>   v3-0000-cover-letter.patch \
>   v3-0001-rust-enable-raw_ref_op-feature.patch \
>   v3-0002-rust-replace-addr_of-_mut-with-raw-mut.patch \
>   v3-0003-rust-clippy-disable-addr_of-and-addr_of_mut-macro.patch
> ```
> 
> After some research, it turns out AWS SES overwrites the message ID with it's own.

Yes, AWS SES is awful and should not be used for sending anything you care
about.

> One idea I'm thinking of is sending the cover letter first as one command
> and then sending the rest of my patch set manually fixing the `--in-reply-to`
> so it matches the one it was overwrote with.

You can also use the web submission endpoint if you don't have access to a
non-broken SMTP server. See:
https://b4.docs.kernel.org/en/latest/contributor/overview.html

-K
