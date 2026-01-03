Received: from mail-qv1-f47.google.com (mail-qv1-f47.google.com [209.85.219.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 637FE2D9EE3
	for <rust-for-linux@vger.kernel.org>; Sat,  3 Jan 2026 07:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767426757; cv=none; b=TjjT2qbGeH+ljDzt2XiY/tOD11P27oLF23D6FexaSKzFJ23wWZgRpsa2fmPZW0Gloaox7WLSx2afqMwD/0nIaAuC/JcjyUMedXVqfJRzXp0AVElCduXf8cjmjFNzrG8nC9tT2Xq4WhEr/6JDHhCOszU3lI+JFtw4fJiTrCFpOAE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767426757; c=relaxed/simple;
	bh=OepI/2038pytnntbQ7eE+t9COIVaBah8qJlJ0ntVqJ0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MFSRC19PU2EV2rqU4PZuD2RsZqltWJgC81S95sueWX1+Lfoo3eKpMdaefStAdJEV5/OL2R5eVRgkUwN3HoVJky7X1Mbgjo7Ixwz8d+w2eSNKd7M3emJjCY6Ohk/NUQxiNjj0sIDlaVF8VZHBQbU1eP5fNgsP2jDrAqqW5PZ8SIc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OOKf0f3A; arc=none smtp.client-ip=209.85.219.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OOKf0f3A"
Received: by mail-qv1-f47.google.com with SMTP id 6a1803df08f44-88ffcb14e11so94246376d6.0
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Jan 2026 23:52:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767426755; x=1768031555; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hUiqiRrm6Mi1XumTouM00ZTDy0NSIsiEbxISr8TIwlk=;
        b=OOKf0f3Ab/MDHqpX8lvlvZQT+T1D5v5//7gN2uCvCU5fYddZX5BsIdsI9bcGTMEQOQ
         5JlWTYAVkIPw7n593HjkE7YSo2MdPhASrud8U3CZzxfbsdZBWfROPiy1Sgs+9ZcIhQ6J
         PHaZvL+OHYYcgoqbvhUEQgZpSl0XmGR/y9RgKn8vP0G7C2nuCTAbuilOLgJBne2fTdaQ
         2naU+zsapG35sU778RFGf2mCbhHrVdxZSytNVxDCol0g5F9cnpfyJH8/59Z7MjWudgeT
         ppSTYalxlj5u0ycKCjV1B7AMIIgkoh+jJUm1R1mbOxqXb0SXZNuIxcC2bIY2qvujDh+F
         ZE+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767426755; x=1768031555;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=hUiqiRrm6Mi1XumTouM00ZTDy0NSIsiEbxISr8TIwlk=;
        b=f8wQRD/prNCqgaPDueqNhdkuZoGv7/q7NEtGVO1soBFHEeEVYHH4AZq3/xMu4aEmLh
         wZJNO668aIjZ4gwKvfsND5xHFgUFVIgs5cawPoQpryZNlziorKCdbj6isfhhImPHJ8Zt
         4y+6kdZnMFbYz84oXsifVe3U1F8TWVTZqXs4xbuqVoEIZZyThZM/XvQStp2Be6z+bg1u
         i2tRHMF9Ae6Ws/xP1baBAhhkrvVmB4LVLPbsqZZ9mR5uQ3LIu4l2eYDMjZ8LpypuyQ5y
         cyL3NiheAkku0B10GFCf7zZn26YK3fP56ahxK66nwzoKAPyGCN5CwYFTbPnkHfTubDwy
         eJ+Q==
X-Forwarded-Encrypted: i=1; AJvYcCVMFkD4gJb+3W4a1s8xrhXVgN96jwdL4MWJO6gs6TL7O15LqBkAPqFe/3LIqhlS90ycuBVgoFeausl7J463bQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzsFXrG4oCTtV7yXSg1v+W/oR4lBR2d8/AlWrxdZPiit05713P0
	JrFhXNc0K5bG7pWU3HoHFAQ6tVbJgKv5n0WIt+RTe1DZypKzLdWWb9GR
X-Gm-Gg: AY/fxX42SeIxaUs8ZpdCIeG+ZfL5klzLcvBSCJ0hGXusvQcfEGnLZVdUsWMDDQQTogy
	vFipD8S3LiRb9Yn526dSMGsAsUM+sl0RIlgZc60+ZCGyTy6Re6m+YQ6o7NL3bSmO3cqyoZ9/ktt
	2T5t9wxOQ4iFzWz9NT8qeQPEKI1zErrXkfK6m1Oorq6myRCM324xxJrLjOPb9Eg4pAz3QLhi0Cx
	X/SFk9faX9Y7UfPRwE19WSoZj0a58qNV/tCeiNaKYzYqlJve6aQWTJmQJb1jAOT7ravy95D0Rn8
	ybmpORyNzymVPo+IAnuBcfsJpIErcgu9YzUE6AzBVdID9ZZUJFGETdaOF0QD+FbIQpo88FxF0WZ
	vUxVn/ONSXaD9ZBmSx1VDmFM7ienlFRn1vcga2beHS19oRNDVoakagL0SBAG6sEsHwc8Mdg/vLk
	AG0XpmG/7eqFbN2HGAN+CeykI3PQ+zgmaxcNPRBQJSg2ttSCygtgezAgPmjYIChaEvUReggag00
	DHOTb0Rwrjk29Mhtg7SNCFgpQ==
X-Google-Smtp-Source: AGHT+IEOq/wwkTzOd1NhRjZygxY+EDrhCjN6YqGTDQzerar9HxKd5WEYHfrUIAjR1WtVKfqVdejxuw==
X-Received: by 2002:a0c:e991:0:b0:888:853c:4f55 with SMTP id 6a1803df08f44-88d844308f5mr576862066d6.70.1767426755336;
        Fri, 02 Jan 2026 23:52:35 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88d997aeff4sm338510706d6.29.2026.01.02.23.52.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 02 Jan 2026 23:52:34 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8DB69F40068;
	Sat,  3 Jan 2026 02:52:34 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Sat, 03 Jan 2026 02:52:34 -0500
X-ME-Sender: <xms:wspYaUEa5qjDTjbXIRiFxW-wWRO3Ub3vthbdSDb7H-LuMtgBtGWVew>
    <xme:wspYaT0z6ZxP1WP4De_eSMfg46Zp3lCy7DptaNzQrsrA8SQVIxo9gcWD-lrn_7CY6
    nbD3P5TyvDEaJcGxSM_f37qB9YViMhWe9KU7yY5TcjR3mwOD__6>
X-ME-Received: <xmr:wspYacKpeQ4r-Qcs8973mScAuMemBxXiiRV6Z-aZFtiBpkRMM3xnlbYsUFE5>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeltdellecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdortddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhepvdejleeukeekudfhieegjeduteffkeevleeuieevffefieduuddtveettdeugfdv
    necuffhomhgrihhnpehruhhsthdqlhgrnhhgrdhorhhgpdhkvghrnhgvlhdrohhrghenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhn
    odhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejje
    ekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhn
    rghmvgdpnhgspghrtghpthhtohepudefpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopehfuhhjihhtrgdrthho
    mhhonhhorhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhope
    gsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegurghk
    rheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdroh
    hrghdprhgtphhtthhopehtmhhgrhhoshhssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:wspYaY3f00ByQumClIFZAn7JkhhL4frdto6WQYRqgIOIZwmcLt6b8A>
    <xmx:wspYaQnA-Mpz421Ufo_WzljlmhNGlzLLfy1yV6pK8Cyfr6PefO-wLg>
    <xmx:wspYaTjNg1x80qt6qJ9vkJ60dMZxjR8SiI9LixBbnnNkvtqESLBQfw>
    <xmx:wspYaXT-lVXSbTEE7MP-_UMy9yd226C1bELaK9UP5lXd2Io5WmM34w>
    <xmx:wspYad_W6Y7GJ6R7ooz-HpVctbH__34AjIAdmGAzmHye3xcEwSEbH6nn>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 3 Jan 2026 02:52:32 -0500 (EST)
Date: Sat, 3 Jan 2026 15:52:30 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: FUJITA Tomonori <fujita.tomonori@gmail.com>, ojeda@kernel.org,
	a.hindborg@kernel.org, aliceryhl@google.com,
	bjorn3_gh@protonmail.com, dakr@kernel.org, lossin@kernel.org,
	tmgross@umich.edu, acourbot@nvidia.com,
	rust-for-linux@vger.kernel.org, linux-arch@vger.kernel.org
Subject: Re: [PATCH v2 0/2] Add atomic bool support
Message-ID: <aVjKvpzWbAXxzBlO@tardis-2.local>
References: <20260101034922.2020334-1-fujita.tomonori@gmail.com>
 <20260102112000.714ac16d.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260102112000.714ac16d.gary@garyguo.net>

On Fri, Jan 02, 2026 at 11:20:00AM +0000, Gary Guo wrote:
> On Thu,  1 Jan 2026 12:49:20 +0900
> FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
> 
> > This adds `bool` support to the Rust LKMM atomics.
> > 
> > Rust specifies that `bool` has size 1 and alignment 1 [1], so it can
> > be represented using an `i8` backing type.
> > 
> > [1] https://doc.rust-lang.org/reference/types/boolean.html
> > 
> > v2:
> > - remove AtomicImpl
> > - remove Safety comment about the bit patterns
> > - remove from_ptr() comment in cover letter
> > v1: https://lore.kernel.org/rust-for-linux/20251230045028.1773445-1-fujita.tomonori@gmail.com/
> > 
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>
> 

Queued with the unnecessary impl AtomicIpml removed, thank you both!

Regards,
Boqun

> Thanks!
> 
> - Gary
> 
> > 
> > FUJITA Tomonori (2):
> >   rust: sync: atomic: Add atomic bool support via i8 representation
> >   rust: sync: atomic: Add atomic bool tests
> > 
> >  rust/kernel/sync/atomic/internal.rs  |  1 +
> >  rust/kernel/sync/atomic/predefine.rs | 27 +++++++++++++++++++++++++++
> >  2 files changed, 28 insertions(+)
> > 
> > 
> > base-commit: dafb6d4cabd044ccd7e49cea29363e8526edc071
> 
