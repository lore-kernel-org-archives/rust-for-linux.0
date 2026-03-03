Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D50A4A2E0A
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Mar 2026 16:10:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772554251; cv=none; b=IiQMEqwIZId7zYZZHJPls/QpyvJShXX15EUwdmyZE+VTHfURsi4TdIi2LbsYvsRkfGbUsSG01Jb9/EE0v38A9hZ2cSbeAOsfjbGeusBP5aQEP+7LsasV1v36+3s1l1B5zy9wDDIhjF2qrOKclbCXwSCP3hEYznKA7rEVBXYQmgg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772554251; c=relaxed/simple;
	bh=4GSrzicB14vZ5Ir0D8/CZeXtKGRW4de6m37Lf9060G0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=o+q1Q2dfFDrSTZa0uVZhNmZVabPlt5m6xRN0dkRCG/TehGWyaCUbTJLbg7yz7QfW5WfxCfaCAvA7Hqq5YSR/4SIFIJEiTmHUkcszAsR0VXP6D81PhMqFNgMN6oDR/wAyLaDSMR1vcncpRw7BJv6o5jVRwGq2UeRkys6ZMZyYf5U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=b+kDkoN+; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="b+kDkoN+"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EB4ECC116C6
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Mar 2026 16:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772554251;
	bh=4GSrzicB14vZ5Ir0D8/CZeXtKGRW4de6m37Lf9060G0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=b+kDkoN+mwc4alESwT5PBbRS6J5J3lRuaLDN8fNRUSbc2m5OiR2/0fpy8aRF9VaOW
	 W+do35e+LwQBQOsbFgJWSqpUqetokzhQxS7Bp+deL/XDqOtr4iRSLxUucrHK217NT9
	 D9DyqCsb02+VT7OdvmYvXGFlVJZgmaDl7ngbaDloYOVRmVMiZ7AiPsMJWeiIPd0CEh
	 HV8XnWhHZH8XHkwy/dfjpgXVW/6eQpxYDNnYqSXAONpO/TZCLl2Rd60u23sStmFsWt
	 b8ZhUGNdrETD049ktJa9T5DvgRt54dDwR1Wx5mq4HW1dsE+UvGyiv0nVf/v0APtrJM
	 HhuzaM+6eT08A==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 134A7F40068;
	Tue,  3 Mar 2026 11:10:50 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Tue, 03 Mar 2026 11:10:50 -0500
X-ME-Sender: <xms:CginaZVY2-av2Bx39P0cjytpMGNMjlNKJlGf01O452ydr60kwGdFAQ>
    <xme:CginaRCNKO61ZX_Fcn2yk8ZCA77AI_m1Y0gVpszgaItvtftK3QJaBp4Euyp2oR19e
    LTlmR5_xJjWKHdQaucvtIxridJt95-opqpg-aI-WnstF3phKeqdvg>
X-ME-Received: <xmr:CginaSx4PvUlqtdYlhTrzz9j7W2Uid7VNbUWZMJREbIFdqE21tlOshN0ytOeidzQISl9amPyjXn2pxJR8IFIKLU7GI-f_vRI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddviedutddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucenucfjughrpeffhffvvefukfhfgggtuggjsehttdertd
    dttddvnecuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnsehkvghrnhgvlhdr
    ohhrgheqnecuggftrfgrthhtvghrnhepveffledvudehudehvdehiefhtdehfffhgfeuge
    fhvddtgeeujeehveekgeekudeunecuffhomhgrihhnpehgohhoghhlvgdrtghomhenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnod
    hmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieejtdelkeegjeduqddujeej
    keehheehvddqsghoqhhunheppehkvghrnhgvlhdrohhrghesfhhigihmvgdrnhgrmhgvpd
    hnsggprhgtphhtthhopeefpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopegsohhq
    uhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopehruhhsthdqfhhorhdqlh
    hinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopegsohhquhhnsehf
    ihigmhgvrdhnrghmvg
X-ME-Proxy: <xmx:CginaWA262ReszC9e6sk28OFjQsh6rvMMF79npgXEOd-6_24yxllpw>
    <xmx:CginaXbi4RX3Zy19qVWgnJgcllhmafRlPp39Lzq9dJ76DYsmkMEXsQ>
    <xmx:CginaWjx_GU6lE1KYSmrQn8HvOJGAtPrEYfzz84sYlkAtkkgQmxb-Q>
    <xmx:CginaR5DSdfN7_KSqN9-qyxgBgyC0ZrX0nxP6PF3x47YMFBCRdUYrg>
    <xmx:CginaV5IVcPEvi9wD0rf4hj5bVxIPh7djkSiAHGB9aVzQnoqGoWxmHYC>
Feedback-ID: i8dbe485b:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 3 Mar 2026 11:10:49 -0500 (EST)
Date: Tue, 3 Mar 2026 08:10:48 -0800
From: Boqun Feng <boqun@kernel.org>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux <rust-for-linux@vger.kernel.org>
Subject: Re: Open Meeting at Oct 15
Message-ID: <aacICOmj9E6XzYAS@tardis-2.local>
References: <Za_9bJxeyW0pddKL@boqun-archlinux>
 <ZgHBE8yRuZ5_8Bwi@boqun-archlinux>
 <ZlX_KOjdd65k9Jkw@boqun-archlinux>
 <ZqpWRo2M2SaTWU76@Boquns-Mac-mini.home>
 <Z1ClkseCwaEXS6GE@boqun-archlinux>
 <Z6IvhjRFU9R32jHV@Mac.home>
 <67f43ca0.0c0a0220.a75ba.35cb@mx.google.com>
 <aEXLAPOV_FrH7Q5C@tardis.local>
 <aJtkNLp1pETbl9UI@Mac.home>
 <aO0uLL8dZF6MuRib@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aO0uLL8dZF6MuRib@tardis.local>

Hi all,

A little last-minute confirmation, but as usual, our Open Meeting will
be at Wednesday (Mar 4, 2026) 19:00 UTC and feel free to join via:

 	https://meet.google.com/cik-xrih-wij

Regards,
Boqun
