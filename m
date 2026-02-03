Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46A191E51EE
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 00:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770078972; cv=none; b=r85iPrvkUdTz7oxcbElwnCY9b92R7j0781kadOBlE9jcKaTRDakYb4TYtirh3m1DPWi0OE3VNmYjtKsV9iqVZctJHtw5gyUCP5XRZZabIasMqU8scaYVChje1BVYNMY5wpGNvRVEj4xq9b4MTrHPFV++DVUN6GgtcsPP9sYofwg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770078972; c=relaxed/simple;
	bh=r8kZeIUrkmePQHV8nMwKPEmQzPPpMePIgGMfz8D9xXM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NiKeGE1djmBS5zSXhbZWDQWhmWgh6F/cpyoMKmB/8mPdvtvypZs+kzVBUQ7V4ytaxiXpgidUst0qoEazxZNRu0HUCjRPhC/4H8cCA9zXBmDUz+oj+av//HNFndQeCJ1Ogx+ynMoYiD4XyNw3nYOD/VkFYsxCNH2aoNJOGjusd/4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b60t6gDC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b60t6gDC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64C39C19421;
	Tue,  3 Feb 2026 00:36:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770078971;
	bh=r8kZeIUrkmePQHV8nMwKPEmQzPPpMePIgGMfz8D9xXM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b60t6gDC9DEV0NLckhSF1QALOnSmvUiPqPb41/nMsVR4bLdyAMt52YCcdsl6WP4NM
	 TyPEq+jeciwILWe43zLAO9xMhRCfKbQN4fHNoCmWty4+R3ea4zC0MbLTi3H14LttSD
	 BUiSSA61z8RZu3lUQSsl4bNxvrqhaR+iMwnvHOPMja04L4+9QbY7/u24hBopZkvRa5
	 18H7PI/iERj5PShvE9WTv0FWLJ9+5bpKqTTRrLXb9QoZzQ76F/cytbpSdoQ+ZdMges
	 Uqo3jWa/WydV5ypl47qv+0JcP6UI8wyKPE4oqkR4yvsSzn808AiJV5hbaQ5kAqt/Lt
	 /wOiW7jafJIQg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6A27FF4006C;
	Mon,  2 Feb 2026 19:36:10 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 02 Feb 2026 19:36:10 -0500
X-ME-Sender: <xms:-kKBaRi195qDXx_MZJOl9QJxcXcsvRfkIkHW3gdxk53XjEzl4rzuRA>
    <xme:-kKBaUaVvp0iowVeRTphqV4YXYOVVBCWTExaFHf7vEYh-jdcrRYxxVnm9AK_a-8Ik
    f343IQYCdvUCI-0ENTsAI14qAkaBlPedSTw-VPH2hc14276XtHSIA>
X-ME-Received: <xmr:-kKBadErNjDBuWzTW2YUAyxX7O6p5raQqXhFMorPeRXVqGc3YXNdoESmaIxqQEyGvG8Q3tdBPKJgAy6EaLWvgG2UKWYIwhjx>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddujeeltdelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    elueehtefhtddtgfejvdejueehhfekteevueeuueekgeetieeggeehvdffhefhhfenucff
    ohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptdenucfrrg
    hrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhn
    rghlihhthidqudeijedtleekgeejuddqudejjeekheehhedvqdgsohhquhhnpeepkhgvrh
    hnvghlrdhorhhgsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvddupdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegsohhquhhnrdhfvghnghesghhmrghilhdrtg
    homhdprhgtphhtthhopehlhihuuggvsehrvgguhhgrthdrtghomhdprhgtphhtthhopehr
    uhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphht
    thhopehtghhlgieslhhinhhuthhrohhnihigrdguvgdprhgtphhtthhopegurghnihgvlh
    drrghlmhgvihgurgestgholhhlrggsohhrrgdrtghomhdprhgtphhtthhopehojhgvuggr
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrih
    hlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvght
X-ME-Proxy: <xmx:-kKBaZYEdpVxV6EP0DMboqrtwAnH8vjYs93camhtsp0gLifo14ljwg>
    <xmx:-kKBaW3ZcAP4XsDPjBLo6zj4ZFH9e6DgE3lq_VeMQMWdkDoCvwMRKQ>
    <xmx:-kKBaZc175qGEw7p78XhaYoyvf-g6Sf4Ggjypzt20H_E5wd-BRP__g>
    <xmx:-kKBaQCJ7blfqlig3vtHIa51OE7dGCqpcQArYwslz1WDB1TXqXl4vA>
    <xmx:-kKBaT0GC3207t5qxQfztNU3kD_zcobpN8svMKWhssSQVQ_0Ito3psIy>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 2 Feb 2026 19:36:09 -0500 (EST)
Date: Mon, 2 Feb 2026 16:36:08 -0800
From: Boqun Feng <boqun@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Lyude Paul <lyude@redhat.com>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>
Subject: Re: [PATCH v17 00/16] Refcounted interrupts, SpinLockIrq for rust
Message-ID: <aYFC-DmbuHt9IF7k@tardis.local>
References: <20260121223933.1568682-1-lyude@redhat.com>
 <aXeTl7fihxD57STk@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aXeTl7fihxD57STk@tardis.local>

On Mon, Jan 26, 2026 at 08:17:27AM -0800, Boqun Feng wrote:
> On Wed, Jan 21, 2026 at 05:39:03PM -0500, Lyude Paul wrote:
> > This is the latest patch series for adding rust bindings for controlling
> > local processor interrupts, adding support for spinlocks in rust that
> > are acquired with local processor interrupts disabled, and implementing
> > local interrupt controls through refcounting in the kernel.
> > 
> 
> If there is no objection, I plan to queue patch #1 to #6 and patch #16

Hearing none, I just queued them into rust-sync:

	https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/ rust-sync

For more tests and reviews. Thanks!

@Lyude, for the rest of them, please resolve comments and rebase on
rust-sync. Thank you for the great work!

Regards,
Boqun

> first, hence kindly ping for any review on these.
> 
> Regards,
> Boqun
