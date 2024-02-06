Received: from out4-smtp.messagingengine.com (out4-smtp.messagingengine.com [66.111.4.28])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1FC937CF18
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 10:58:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=66.111.4.28
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707217107; cv=none; b=Dyxuo/S0j0d1Hg+5w4jbfZXV2c1R8QRJ07hVXrUaMTuXr8I7aKJGvrQWOalBZePezdZYr8USZtZ8c96vZWePmIc4Z2dnsKnIvvrhn+vGmM3Ofl1UWNvD/HRul3oNxxb3dCYoxsKJDohPKvZ0/e/85kssZJwMutqoUh1I6AdnKeg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707217107; c=relaxed/simple;
	bh=aKBwlcD+H3Mc2l87v/igwXQuc5xFdrCYbkFZPjszNpw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UsOQy2lVd+h1NPhSkBdHYeKB61nRppQSdz77O5PbmbtzWabiiE1Kc2ORAmJONc2P9I6sOlQp3FFTBJoJ8sBm4zuZp/N0N39PiMWiitrlX0j2l4gcjfqe9XRRhmEo83ldNChuCIz4Pjlmn2NHmp/1zskmhDCIrYg/6grBzcYEE5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=Q1bxTSkd; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Y2pazIWY; arc=none smtp.client-ip=66.111.4.28
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="Q1bxTSkd";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Y2pazIWY"
Received: from compute6.internal (compute6.nyi.internal [10.202.2.47])
	by mailout.nyi.internal (Postfix) with ESMTP id 0E3CE5C019D;
	Tue,  6 Feb 2024 05:58:25 -0500 (EST)
Received: from mailfrontend1 ([10.202.2.162])
  by compute6.internal (MEProxy); Tue, 06 Feb 2024 05:58:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm3; t=1707217105;
	 x=1707303505; bh=j0j/aLfy/oJbkmWWbYxI1fi3UL2mD3VAldke556g4Ks=; b=
	Q1bxTSkdMHwwTi94j2zGCwdPYBve6mjemKCRdOy5M2EHN7K2nL5y+uT44Cx+7ZS0
	UjbwReVfMhpxzMEGevcVghSpxVb1jkYNK7YvohM5xey2J4+0apb7MI2FeEv1qdPF
	jLO1/D7F/6svK0nqsXXLD20pxHGnbK89FxsOF9T3xRTEssE7e/Fnh0b8YilmIfwp
	yk4DKk4PhFbgqv3QFBQVwsIeopqJmV97JmjJL3OIoUMHVbQiW3kt7SwT0zu6VPPx
	a2uuqiHrqlFw1hSXrqXiauXwWy0klGePLj9dp1Uc3upkrH0zQLTZIEGbDFj6TtRk
	SfpX1iWnk3YyZghIEhdXhA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1707217105; x=
	1707303505; bh=j0j/aLfy/oJbkmWWbYxI1fi3UL2mD3VAldke556g4Ks=; b=Y
	2pazIWYGYZv+5lFUx5K996rRk5Hsb5/fj+1LV1Z0jewITIMjsweqwLdIQQm6n/u+
	qXjiK2aj+csoCmMyjN4NlUMOdews2/QJgFyDCqiNLt6jOgJ4i+dtYOR38HoMROl3
	RqKudmuaw65thAY0QD2NHR62vnsjq9vmBJSjEJyQSx4TA36c94rRbmnL4d5FXIBv
	fucLX/PcxjJod4JzI5VdJgen00OdADy6RprwlmQ4c1WMLzZkSQM4/HcRLTBaAeGH
	TPpp0FV8dLmAb8Zu4/zQwvMmCiYOQYVp0NeILzHwC3CUILi9E3uAwU6SBaDIrBcB
	mCNpOdTIR9J74UuzOpy+w==
X-ME-Sender: <xms:0BDCZU7yo2UXsDPr2xy8pDPFkcQsiXpMBw9u6G7CgmL5Hq-m7KiSTA>
    <xme:0BDCZV5bXt48PFCUHNB3vonbnpwVbgvEPXPsuUm5l0TRZsCFtUg8FI1u9pAV2euBF
    PKpqdjNTTb9NA>
X-ME-Received: <xmr:0BDCZTezSyrmnO2OsffVMCmhhLHrq_Y6zcEtL0hKVQlDOHxA82kI20VZuTYoDg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvkedrfedvfedgvddvucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfqfgfvpdfurfetoffkrfgpnffqhgen
    uceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmne
    cujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefirhgv
    ghcumffjuceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpefgke
    ffieefieevkeelteejvdetvddtledugfdvhfetjeejieduledtfefffedvieenucevlhhu
    shhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhroh
    grhhdrtghomh
X-ME-Proxy: <xmx:0BDCZZIk1jKTNtEvZ9AfGFXOU8EkwQ-6Sx9fG0vNmzhsWyYJ1pxSfw>
    <xmx:0BDCZYKC5JhPvdXS6xM75gR4VioKN5i4OWQD6KlAJ4Tj7OyeeHPp6Q>
    <xmx:0BDCZaz5SvOp3FKvc6lS3Rs9ZkXvXaw3Xjo6I34QMV93JUi-MEsnHg>
    <xmx:0RDCZV7OM67DlH79vNHdU_Y7xSrVQnlHcaTFTwYsshbkSazlYorO3g>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 6 Feb 2024 05:58:24 -0500 (EST)
Date: Tue, 6 Feb 2024 10:58:23 +0000
From: Greg KH <greg@kroah.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Thomas Bertschinger <tahbertschinger@gmail.com>, ojeda@kernel.org,
	alex.gaynor@gmail.com, wedsonaf@gmail.com,
	rust-for-linux@vger.kernel.org,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH v2] rust: place generated init_module() function in
 .init.text
Message-ID: <2024020617-robin-countdown-d572@gregkh>
References: <20240206012535.480193-1-tahbertschinger@gmail.com>
 <2024020646-browbeat-cozily-0bf2@gregkh>
 <CANiq72m8V2nycL=P8yT3M=e6Nek0w45zBK48Aqbt39Kpt+bwTA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72m8V2nycL=P8yT3M=e6Nek0w45zBK48Aqbt39Kpt+bwTA@mail.gmail.com>

On Tue, Feb 06, 2024 at 11:51:35AM +0100, Miguel Ojeda wrote:
> On Tue, Feb 6, 2024 at 11:01 AM Greg KH <greg@kroah.com> wrote:
> >
> > "once" is not right, it can be called zillions of times, it's just that
> > it can't be called _AFTER_ module_init() is over for the file, as it
> > will no longer be present in memory.
> >
> > So technically, the wording you added here isn't correct, sorry.
> 
> The safety preconditions may be stronger than needed. For instance, if
> we do not expect anybody to manually call this, then we can say so. In
> fact, we could even say Rust code cannot call this function.

But why not?  Rust code can call these functions, and you should be
writing functions in rust code in the init section.  There's nothing
"special" about this other than it is a memory size savings, and if you
get it wrong, the linker will tell you at build time.

thanks,

greg k-h
