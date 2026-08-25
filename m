Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A08DC3F44CE
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 10:53:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787655221; cv=none; b=EWJZASAO6cvlMBmUbkOUjW8Z/432Dt0ZwpuY6hJJ1dFDUxDImiCKFEGjIs74wDCgiFyeTFjUIM8vzOPzA4/ZMst/+zc2Fc4JkQ41wsTE81FXQcINdGI6dQfF3LfUzghyivOvGzdKhERuR0hmq6erVLxjlyXmcWaCVQLug7F4zHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787655221; c=relaxed/simple;
	bh=XdkFWZNOB6tWzuixdhMaRZpbyaC+wTwnuPhPazEXHcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=er1gbIE8uJ5gA5SgRzPAbVtf9PQMAY5qaXAIANDtThpTIbIpkZTgJakzEaM1PnpndKTmqCruUxeTu1O2wuWYvavzlvbbL8r0EhqtNLxZqueHGsDC2E+v1FhZjT9M2SWoFqy3E9hiWKckpq41U8El8SmBJmvJTn3PaXmPBa97+co=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=a2FK9AI/; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="a2FK9AI/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 35D141F00A3A;
	Tue, 25 Aug 2026 10:53:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787655220;
	bh=Ab83ywp9bHJCoCKvn2YiIVNM2WQX25aq5bcNcJ63eAI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=a2FK9AI/XwHHs8vLqcSMvOnOjcMya1ciTqHhKuhr/MpG1t4t+QJVT0WdF5lLA2h/l
	 1K1CMN35ftauHIfGZgZ8/9aMJZZKtZalpqfpLtMQBSYK6FV1i+xkf+XMUYzY1uwigY
	 OUIoMJV9PfXulragRtflP25x0MTLFIG4h+p9202I=
Date: Tue, 25 Aug 2026 12:53:27 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Alvin Sun <alvin.sun@linux.dev>
Cc: rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>,
	Gary Guo <gary@garyguo.net>
Subject: Re: merge problems with char-misc-next and Linus's branch right now
Message-ID: <2026082520-neatly-twenty-7e03@gregkh>
References: <2026082516-slapstick-nearly-8986@gregkh>
 <1d80b800-8216-4731-830b-bbf055ab6e6f@linux.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d80b800-8216-4731-830b-bbf055ab6e6f@linux.dev>

On Tue, Aug 25, 2026 at 06:00:37PM +0800, Alvin Sun wrote:
> 
> On 8/25/26 17:05, Greg KH wrote:
> > Hi,
> > 
> > I'm trying to push out a pull request for char-misc-next right now, and
> > am having merge issues that I need/want to fix up (or at least provide a
> > hint as to fix up.)
> > 
> > I'm currently stuck at the following build error:
> > 
> >    RUSTC     drivers/android/binder/rust_binder_main.o
> > error[E0425]: cannot find value `THIS_MODULE` in the crate root
> >    --> drivers/android/binder/netlink.rs:16:13
> >     |
> > 16 |     &crate::THIS_MODULE,
> >     |             ^^^^^^^^^^^
> >     |
> >    ::: rust/kernel/module.rs:52:1
> >     |
> > 52 | pub const fn this_module<M: ModuleMetadata>() -> &'static ThisModule {
> >     | -------------------------------------------------------------------- similarly named function `this_module` defined here
> >     |
> > help: a function with a similar name exists
> >     |
> > 16 -     &crate::THIS_MODULE,
> > 16 +     &crate::this_module,
> >     |
> > 
> > error: aborting due to 1 previous error
> > 
> > 
> > I wasn't paying attention to the recent THIS_MODULE changes, and can't
> > seem to figure out how to fix up the netlink.rs file to build with the
> > recent changes.
> > 
> > Any hints?
> 
> Hi Greg,
> 
> Gary has already posted a fix:
> https://lore.kernel.org/rust-for-linux/20260813163951.1102583-1-gary@kernel.org/

Thank you, I had missed that.

greg k-h
