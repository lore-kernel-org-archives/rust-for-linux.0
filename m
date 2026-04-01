Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4244F3CCFD8
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 16:07:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775059649; cv=none; b=G8b5rr7mc2EiMLyZ6hvO3dJoAD6avbQ181oon5RqIQruuv3GfFKen1Wh3AQpTIyH71wcZHCc8Q4nmuWzdk+tXQzC88u5e/4nvK1gKLd51zpNIV3SLJYW2q8YNDs+SX47eBS/pYmXAWy5kJ/y5NdAEm3tzoQDKYHGf/ThnMX5+Ag=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775059649; c=relaxed/simple;
	bh=XkcvqK6lCnwDztDnzCvi2OvSt7NVSZm/EWmF4da4D1A=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=CT+kQd7v6+Pme8F/ehH1CyMC/FfYttXkgs763hRxB0NtG9TeRSN5GScv81NTk8Q8WbOv/ZMmDQUnyUJ5n7ruVfMuGcHSTC1Z07bFhJe6ZZiWtOmO/6F70hLsX5LjtW7ak2bWKwpqUH7pZMHOCkl1Oim3tHOtJp9EK2q38GxqTxU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d9DwOb7g; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d9DwOb7g"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4E70C19423;
	Wed,  1 Apr 2026 16:07:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775059647;
	bh=XkcvqK6lCnwDztDnzCvi2OvSt7NVSZm/EWmF4da4D1A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=d9DwOb7gWt0siS1Tykdde/KBzjY+BAhMLo/LbT+ojc9f+FG12r7IluVJ9Tl5AQPa0
	 mn3U1O7QJQGX05pLDjAdtrm94t2jAN2sBHfHdv/J8Q8mtDmfhK9cKBXsgKK6BktMRP
	 t7aMRtCaeYJU27figs8mL9BcaYLRvohHgQGYWbyoarN97/xf1viteJxqm+gfYku3oR
	 V/AAWYS372hAcEjuNR1cvcddNwcLBBIcFPo/XpcwPQj7POpi/ria9GXQn9iTAVXi0a
	 I51qBD5yTGDjIzxv9RiZFCCnU6X3ouP792QIo0uE+kAm8u8WtIM2oy2w44lh7Bx764
	 r9dfGKyp4t/OQ==
From: SeongJae Park <sj@kernel.org>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: SeongJae Park <sj@kernel.org>,
	Jihed Chaibi <jihed.chaibi.dev@gmail.com>,
	rust-for-linux@vger.kernel.org,
	Roman Gushchin <roman.gushchin@linux.dev>
Subject: Re: Interest in contributing - Rust abstractions for the sound subsystem
Date: Wed,  1 Apr 2026 09:07:24 -0700
Message-ID: <20260401160726.68231-1-sj@kernel.org>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <CANiq72nsemAEakyVsVxxp5qa7WcxGJQLehqsnfU8xkNqD9=abA@mail.gmail.com>
References: 
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Thank you for Cc-ing me, Miguel!

On Wed, 1 Apr 2026 11:01:30 +0200 Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> wrote:

> On Tue, Mar 31, 2026 at 11:47 PM Jihed Chaibi
> <jihed.chaibi.dev@gmail.com> wrote:
> >
> > - Is there any existing work or RFC around Rust bindings for ASoC or
> > the broader sound subsystem?
> > - Are there specific areas where help would be most useful right now?
> > - Any recommended starting points for someone familiar with kernel C
> > (obviously) but still building Rust proficiency?
> >
> > Happy to start small, even reviews or testing would be a useful way to
> > get oriented.
> 
> Welcome!
> 
> If you are asking for starting points in general (i.e. not just for
> ASoC etc.) and/or if you haven't seen it, then please take a look at:
> 
>   https://rust-for-linux.com/contributing
> 
> I have there a bunch of suggestions and links, e.g. in the "Finding
> tasks and issues to work on" subsection.
> 
> In particular, I usually highlight that reviewing or testing other
> patches in the list is indeed a great way to get started, since you
> get to know other people, what work is going on, etc.; so it was great
> to see you mentioned it in your message. :) Please do review and test
> if you have the time, you would be welcome to do so!
> 
> (Actually, I should perhaps add one more way of helping to the website
> that applies nowadays, at least until the mailing list functionality
> is implemented: looking at Sashiko reviews at
> https://sashiko.dev/#/?list=org.kernel.vger.rust-for-linux and
> forwarding any to the list that look correct -- I have seen e.g. SJ do
> that.)

I agree doing that can be very helpful.  Many maintainers are happy about
sashiko, but also struggling at increased amount of arguments that they need to
review.  If someone can participate in reviewing the AI reviews, that would be
very helpful.

One of the purposes of me forwarding sashiko reviews for DAMON patches was to
make such participation easy to do on the mailing list based workflow that we
are familiar with.

Specifically, I was simply forwarding the entire sashiko review as a mail to
all recipients first using a tool, and then replied my review of the AI review
to the forwarded mail.

Nonetheless, there were also concerns [2] about increased traffic from  such
blind-reply-all behavior.  I'm trying to make some changes to my workflow, and
adding guides to the sashiko review forwarding tool.  E.g.,

- Consider reducing recipients.
- Add your review of AI review together with the original AI review.
- Add short summary of your review at the top.

Just wanted to let you know that, so that you don't get the concern again ;)

[1] https://lore.kernel.org/20260328093603.10052-1-aethernet65535@gmail.com
[2] https://lore.kernel.org/2026032915-library-embolism-b48c@gregkh


Thanks,
SJ

[...]
