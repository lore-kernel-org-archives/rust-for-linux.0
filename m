Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE14B39FCE
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Aug 2026 11:46:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787658363; cv=none; b=KZ4PPmo9T6PYLaDI0A723xvhXbXncAvO4LmbhkaQTCq8yNHPXddBZ5YqotPR9y81bNikTXvLMt1adKznJE3aJSNr+LKc/DRCM0MzhsfMe7+pjq6oI9s3otTdJEM7H0psliyz3XvAozwIXCUQJkq5/l3jefjTFWd8DQyoNQGSX0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787658363; c=relaxed/simple;
	bh=ZPORMx5SwHH2zafuJE8ObG/YconU0ZyBWwbsg9qaLsM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cb5wtOc4tfRR92OZXMBsi/x+aK2qgwArP9f4WRn2IfG6euqvnT3MHiuVoAWFgin1px/lQa8zh7opMKM+1jGv7vUXZyLQ6MDHhq2Yby2kDbn/xQkvrgS0SDXVFqBotQKgL78KaAERaFPRIro5MYC3tNJnaIeJ+iHgFOQi+5c+uvA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b=H+90iESB; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="H+90iESB"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 456C21F000E9;
	Tue, 25 Aug 2026 11:46:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linuxfoundation.org;
	s=korg; t=1787658362;
	bh=xIA2rBjVLRIU7o1y4R/svrMYj7oMUO0QzuFjWJPXpAs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=H+90iESB9AwD0KHNAg/eI7bYFc9f8jKd/jvKw5l/25tTd2gtsudLkewpI/8BjJHgk
	 kSt0DVXbPi+Ln3Gj2EIr8J1xU9ocTPqkMWVG/AIBbVRFxDmyEfWL1wjQeSjTtXclVA
	 PaukNVI8C8Vy3NTGAunCPLtOuD9cY16oQQYe+FGA=
Date: Tue, 25 Aug 2026 13:45:56 +0200
From: Greg KH <gregkh@linuxfoundation.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: rust-for-linux@vger.kernel.org, Alice Ryhl <aliceryhl@google.com>,
	Gary Guo <gary@garyguo.net>, Alvin Sun <alvin.sun@linux.dev>
Subject: Re: merge problems with char-misc-next and Linus's branch right now
Message-ID: <2026082545-borrowing-grading-fc82@gregkh>
References: <2026082516-slapstick-nearly-8986@gregkh>
 <1d80b800-8216-4731-830b-bbf055ab6e6f@linux.dev>
 <CANiq72krVngy9cC1X9q55THEC=5Od_Bbo5=V5ax8jZovW6ENtg@mail.gmail.com>
 <2026082514-such-version-4236@gregkh>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <2026082514-such-version-4236@gregkh>

On Tue, Aug 25, 2026 at 01:08:55PM +0200, Greg KH wrote:
> On Tue, Aug 25, 2026 at 12:49:54PM +0200, Miguel Ojeda wrote:
> > On Tue, Aug 25, 2026 at 12:05 PM Alvin Sun <alvin.sun@linux.dev> wrote:
> > >
> > > Gary has already posted a fix:
> > > https://lore.kernel.org/rust-for-linux/20260813163951.1102583-1-gary@kernel.org/
> > 
> > Yeah, please see as well the other conflicts related to char-misc this cycle:
> > 
> >   https://lore.kernel.org/linux-next/20260805-slab-rust-fix-v1-1-c4d4c1b69de2@kernel.org/
> > 
> >   https://lore.kernel.org/linux-next/ans8lsGbkro4pO6N@sirena.org.uk/
> >     (the diff in that thread is from another conflict somehow, but the
> >     actual conflict is very simple anyway)
> > 
> > The resolutions in linux-next should be fine.
> > 
> > My overall list of conflicts for Linus is at:
> > 
> >   https://lore.kernel.org/rust-for-linux/20260816191926.230123-1-ojeda@kernel.org/
> 
> Yeah, it's messy.
> 
> Below is my resolution, seems to work here for me and I'll send it along
> to Linus as well.

Now sent here:
	https://lore.kernel.org/r/2026082525-spoils-gutless-f1ff@gregkh
