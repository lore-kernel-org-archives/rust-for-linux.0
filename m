Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3A6480948;
	Wed, 17 Jun 2026 15:40:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781710841; cv=none; b=AtMsH/sbEWe5Nl8xhPT/WV/ozACuRnQpcJo9hP+gPq4pLnWlE+F2VzOyBWbCyDcdSrfcdnGTQV8IaOxcr4inBqI9dT0OvT4wLqfh8L6gI80qCN4oCoWXe7+rf3pPbS++opajqKuVbIUFk9EPAbw92jtfUixuWkeRx+Ns/05Smz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781710841; c=relaxed/simple;
	bh=bI1qVdnIIrvHzXpvYg4JMoa4KIAn5Y19jV1QT9Ydqks=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dNIYbstmcN4lqUatURgnT0b0JXGje1gDQryvn3GSMqwcr654qayLsuRztQL6mIqNWYNJR8qs9maq7BvEXEU9DXlH3B5sj6D2rT23DXG+Pl88giZi1LwAVUj5R5cmZuuf7SRDDtNG896FLw+S5rOOmwIXtneYBBsZFf3VrIbOvQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=t/SPpCZ8; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="t/SPpCZ8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C7D51F000E9;
	Wed, 17 Jun 2026 15:40:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1781710829;
	bh=8MRwYNp8ffBYH1Tnx0DBHiRW9ejYMKv7cFte5Osf/Oc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=t/SPpCZ8Tz/74lElHQNDZLpbd7I95gxUrnloZ1eyTD1slWS3f1/qaM7zjTfApahoT
	 72tY9Ut/l7n7baq6qH+HXWHBLH9Y32cXBg8hZlbM5BMk2EWGLACZgDl3s1LTfbgMp6
	 ubNXfIiMg+JYstnkaXLHMeCyM8z33Mnja7zBYo9g=
Date: Wed, 17 Jun 2026 21:09:21 +0530
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Danilo Krummrich <dakr@kernel.org>
Cc: =?iso-8859-1?Q?Nicol=E1s?= Antinori <nico.antinori.7@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alexandre Courbot <acourbot@nvidia.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Boqun Feng <boqun@kernel.org>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Gary Guo <gary@garyguo.net>,
	Onur =?iso-8859-1?Q?=D6zkan?= <work@onurozkan.dev>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Tamir Duberstein <tamird@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev, linux-usb@vger.kernel.org
Subject: Re: [PATCH] usb: rust: mark Device and Interface methods as inline
Message-ID: <2026061753-exterior-stamp-0f19@gregkh>
References: <20260616223614.16444-1-nico.antinori.7@gmail.com>
 <DJBFN1GFXE75.32363U9Q83CSL@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <DJBFN1GFXE75.32363U9Q83CSL@kernel.org>

On Wed, Jun 17, 2026 at 05:34:02PM +0200, Danilo Krummrich wrote:
> (Cc: Greg, linux-usb)
> 
> Looks like the Rust USB code wasn't added to the USB MAINTAINERS entry.

Yeah, we should fix that.  As it didn't actually work I wasn't too
worried about it yet :)

I'll knock up a patch later this week.

thanks,

greg k-h
