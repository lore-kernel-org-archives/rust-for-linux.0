Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9368F22C6C5
	for <rust-for-linux@vger.kernel.org>; Sun,  8 Dec 2024 13:35:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733664907; cv=none; b=F+Go8B4yRuWnGwzwFRsDzzTClVVuKzV+vu1ww6U3RBzQWO4DhkEys3Slb1lX2ex/gHgJCBXt4Ad4IpsdJY0slbaNYrvLb1dpw/0xyF6cQl/2MieUvm8lwrQIfTzsSgOJKFaZP1x4aQ8iYdOXCkzRHrnDkSIUaH5TbpsV8XSRwFM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733664907; c=relaxed/simple;
	bh=jb5tA8E3MlaG3J0nYNGWett6SCHEiwv0diBCSNaaVPQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pEAb5k9ZqIWKt9WyTrJ9KLvd3x7akOYRqtPvDR/TC5RT+Eutl3WVobF/n/PAjdIan55Iq7FU6UnHD30hbt+L7zNFs9gR3CweFszGm4zcIKJ3ZFfjvKgcsfYNdJWXIY/TfwsgzIwkhGTmGROsVz18btlRnxEMDHppnbYMuSOwZOg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=xa47KK7t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="xa47KK7t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7D11FC4CEDF;
	Sun,  8 Dec 2024 13:35:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1733664906;
	bh=jb5tA8E3MlaG3J0nYNGWett6SCHEiwv0diBCSNaaVPQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=xa47KK7tv+xPjlf/bkv1MP/Y043A97GoPhq9X0SpO0Wqm3K7bwp9wswPRehFdMXNu
	 YU2lFoBhP4MZK5/0dsgKUFHsvN+CKM/9TnA/KcLV4n0wSBdBlynoUMqpnn+FSKk5y3
	 qoecGCMpcXAf4j6CCGi3tndKUTxH31s9LDP0RAA0=
Date: Sun, 8 Dec 2024 14:34:30 +0100
From: Greg KH <gregkh@linuxfoundation.org>
To: Daniel Sedlak <daniel@sedlak.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org
Subject: Re: [RFC PATCH 0/3] rust abstractions for interacting with sysfs
Message-ID: <2024120851-drowsily-anymore-52f7@gregkh>
References: <20241208131545.386897-1-daniel@sedlak.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241208131545.386897-1-daniel@sedlak.dev>

On Sun, Dec 08, 2024 at 02:15:42PM +0100, Daniel Sedlak wrote:
> Hello,
> For now, there are no facilities for the Rust side to tune modules written
> in Rust in runtime or for just simple debug output/statistics from
> the module. For exactly this purpose, the C has the sysfs. In this
> patch series, I implemented a minimal sysfs wrapper utilizing kobject API.
> 
> I would like to collect your thoughts on whether:
>   - Do we want something like this in the rust part of the kernel?

No.  Module parameters are from the 1990's, please let's not perpetuate
that madness into the next century if possible.

>   - Do we want to support all sysfs capabilities?

For many things, yes.  But let's add that when needed.  I'd like to see
a real user before accepting these types of things, don't just add
bindings when you don't have them as it's impossible to determine if
they are correct or not (see the recent miscdev sample driver for proof
of that, turns out that the bindings we took weren't really right, which
is fine, but it's sometimes easier to figure that out when you have a
user.)

> I implemented a sample to present the API I have chosen for the Rust part.
> It is a straightforward example that does not represent all capabilities
> of the sysfs. The documentation will be potentially improved, but I would
> like to first settle the abstractions.

What exactly do you want to represent in sysfs here?  Start with that
and we can work backwards to say what types of bindings are needed.

Almost NO kernel code should ever call "raw" kobject or sysfs calls,
with some exceptions.  Is your use case one of those exceptions?

thanks,

greg k-h
