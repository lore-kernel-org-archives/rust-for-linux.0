Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6359826ED5D
	for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 13:19:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761139199; cv=none; b=ckx4Xd63hNqGSlYvQ7R6fJMTpEU5vhUJOr+d9KscKzHKseCwwIWPA5H38OR6BS1HFCo/B4u4FqGOM165/XHcPENW7Fm3AsvB4wlCWEimUdTkVmY5u+PGt+ArhBUIqE66dcllNNsUHc47BqStBaZlo2l7bkh8+fAqkBGGfd8CLTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761139199; c=relaxed/simple;
	bh=ejf1bYPnUQMokUT1g7RKeqZOKPzbttb73m8pCpDXOgY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=W9bmeQ5oTb82uC/m97m0KFhBHvAn6CfknFmGFgwo6pct/bov94+eXWM1y/K0Y/WRL0uTqYBpLS5fTM0nhD9h5jSxIpYHMdApkvH6XxiYqfavQxHxZ0Z5BeBk3i+gLB6Jj59H8tdtiv2eh+y4Gph2cb/dtKHNQABbfyiQBRCsYD4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aK1zoXLA; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aK1zoXLA"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-891667bcd82so141898085a.1
        for <rust-for-linux@vger.kernel.org>; Wed, 22 Oct 2025 06:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761139197; x=1761743997; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kl7tw7oO+okb5Kv2O+S27IhofeeA3ILxUV7GihlCiso=;
        b=aK1zoXLAgBhO6s+b3Yeyoo4UjC5vVJjdYZBRpXT8qRsgLOmhIZzDJ5FTPe4CQRVZip
         XozpHrL17Kx0QglGWS2ZoyNia7QsStNT1XqTPtSsmKJfuoZ8aN9Rk/TTtOwhdTVofxlJ
         ndAUIerPNl4ks1dfkcr1MKSiJHwW83WE0GbPYX956YH7+0gIVvFPbS8AxoUgHR9muf2n
         TBdYCnASJ7FoOWnkbGfMo266/+pqCztqQZU2UmSZ8waBO2Z8qbhQUYG9Q9WWTKMkNk9E
         f2jXcNsFT6St22UdKSyKmrf2CcijPlpL1LG4hc6ZBeqGl1r73IHRjLbW61giLGdYoMc5
         Mzkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761139197; x=1761743997;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kl7tw7oO+okb5Kv2O+S27IhofeeA3ILxUV7GihlCiso=;
        b=T2V2/fHaPye3oB+wPfwD0qdvzCClzOjRd8yznlXeDHHWisqHtcA4Fc4xQARoYBQ+zG
         CxXk32RgQnbaeqBOCX0jbenARw2/LjNy2q20BzTduMl/yQqK4/iyAep8YnhOOMafx48Z
         mL0Y+0hCj9eZdfx8x7VcdVaDqBxKRleQdkclY4+liw+vMkfvSUr7WjKH3gg55jnk/trl
         7nMvFYqZWkaIgQm9nh9iJlpI9gXliayCovDH5DAtxnfR4D10p074M1zbD4Pr+Uk8XO7r
         GplQkPo9m5RV3fQ/uhPqlHpetuKwv3OPiEYuEUqNPo/88ECMiNB7hQ5oIFP1nCuNk47N
         rWuw==
X-Gm-Message-State: AOJu0Yychvhp7iRC3OAJcDMUr35sPMGpFab/2DNKxef23IcypiWJ+S1I
	G0kdEt+wkyVSR7ypZRgaRZU9wRqHzLsf3WaclF8E/t8KLKUo50Npl4fo
X-Gm-Gg: ASbGnctc0+DAFjBWXcfpnP6LXaW3bipzQSlp01VB1jR4WQi7oPkxryUU1ex1pdbI2TI
	Z4hlVSFl2TkVtCV8oo6SrQq0A5xrGG6lI65lfph+q17MLFC+yKJKXuYQvYiKY6+tblpDn405MUB
	tA/nmQ6YL0zawNWEbEie9iCTNNbuq1iRBiyghp9pJavppRycYzJw32yuZv7+QW2E+5F+9ITqFQP
	J1oJMU38gLy2CxPPQpO4hggdonmWHDnvuxjCDPt52V0EclP4NoRpqlSNvFb1GaRNG25qiM3R1sI
	0xxih4YDdCk2bT5yzkDwZNq+0Mx04xwozvzelLq7YYISHbuktTsReGjuMIifIdfHShY1b4pqADO
	VlnSWpJJH6io8egIXW0rPD+KTutm6ofcitQp1CDkjN7WZQLbSM/Dbb/Qxj4wOZ8pFXOftBhUbPJ
	cecncRsnZUaGnQ1Pr9dRaJF1Mq6X5jIKIqemeZgftxmeHbVcQqRBu2Ni7/36DpoVdX9fT3jo4c1
	oaV
X-Google-Smtp-Source: AGHT+IGMBMUvzu8Mtecf/AUCYSKo7attYFh57E8uVG+HBJHjtAvjIcTWo0/ZUKtNMW1uLZToAFAWWg==
X-Received: by 2002:a05:620a:258e:b0:850:f6a0:931d with SMTP id af79cd13be357-89ae191591amr135171585a.21.1761139197062;
        Wed, 22 Oct 2025 06:19:57 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-891cefba740sm967124685a.29.2025.10.22.06.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Oct 2025 06:19:56 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 182CBF40066;
	Wed, 22 Oct 2025 09:19:56 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Wed, 22 Oct 2025 09:19:56 -0400
X-ME-Sender: <xms:-9n4aJ5YypRrwwMcCaXYLg71V2U_wRXqQFvZJcO46TfBBVyOFM92Qg>
    <xme:-9n4aC1usiS3Hm-GO0kNLT00eCyHWW7jAKgbdecBGGp30vA02RVxpAeEoycUc7epH
    ySJYOGnZsC_pjd21xVg_aljr35d69sP6gl5o34Jo4_pkVjmuZfhjw>
X-ME-Received: <xmr:-9n4aGnzUkmJOYjHOox4SjFp2zik0O6ykf_OobeAns9h44iJScRof2GENQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddugeefieekucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepudekpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopehruh
    hsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthho
    pehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtth
    hopehgrhgvghhkhheslhhinhhugihfohhunhgurghtihhonhdrohhrghdprhgtphhtthho
    pehrrghfrggvlheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepuggrkhhrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphht
    thhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrh
    ihsehgrghrhihguhhordhnvght
X-ME-Proxy: <xmx:-9n4aIjSc1REZE_y6-t03PRLTiqe4NiEN7z_m71tAztU1nqhH3kqWw>
    <xmx:-9n4aLSGlhYcjX2jRdSRTuM94AHHOfIBNS9_Nia4zfDrqajx61PXZg>
    <xmx:-9n4aFiuNb5V3VTCdzB6qWQzO12PWQH8IyvWLtIA1KpNqjsJum5uYQ>
    <xmx:-9n4aPhqPYtg8uULjMPinXlyUHqFpYiIqOKmdKiMgdImYBCUsRoy8Q>
    <xmx:_Nn4aNby-4UbpP7P0BL6Bzg1z9N3i4QlyB8JB1W9tDnc4uzGolkRlqcL>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 22 Oct 2025 09:19:55 -0400 (EDT)
Date: Wed, 22 Oct 2025 09:19:55 -0400
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	"Rafael J. Wysocki" <rafael@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Matthew Maurer <mmaurer@google.com>
Subject: Re: [PATCH 0/3] Remove the usage of Rust native atomics in debugfs
Message-ID: <aPjZ-yA4ihZqlNwb@tardis-2.local>
References: <20251022035324.70785-1-boqun.feng@gmail.com>
 <20251022080717.GI4067720@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022080717.GI4067720@noisy.programming.kicks-ass.net>

On Wed, Oct 22, 2025 at 10:07:17AM +0200, Peter Zijlstra wrote:
> On Tue, Oct 21, 2025 at 11:53:21PM -0400, Boqun Feng wrote:
> > Rust native atomics are not supposed to be used in kernel due to the
> > mismatch of memory model, since we now have the LKMM atomics in Rust,
> > remove the usage of Rust native atomics in debugfs.
> 
> Doesn't rust have a language feature that allows you to blacklist them;
> ensuring they are not used?
> 

Although I don't know whether it's available today, but I believe that
can be done (in the future probably?).

However, this patchset is about cleaning up the existing usage, which
was introduced before we have LKMM atomics on the Rust side.

Regards,
Boqun

> 
