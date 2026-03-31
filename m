Received: from fhigh-a4-smtp.messagingengine.com (fhigh-a4-smtp.messagingengine.com [103.168.172.155])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5353E1217;
	Tue, 31 Mar 2026 11:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.155
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774958383; cv=none; b=cL9Jq4Avus9cEVO4ifJ9eo30Xnr9qASrW7NVvVR6PBcrEfJJHf9tisF/x0n1nQGvHA8jrajPu/e5l4+/ARHGjG4i6Zm8rw0rDbgAZFMpwHD/sUwHq0xRihOVB+xiK9k2Ph/iicodCU8JIb4tcF9biUkyDF+LYdIOyuhhq3R21rQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774958383; c=relaxed/simple;
	bh=wgI44SBNWL2YSjLnE9+u/hc3EOCjEeWeCH9TxhFJJIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TPwo0DDBbQGJEKHrXiN/DlMrooi4GBzVh53/jx2mNACpcJAlyTNMmcx5Xk/mhfxEEH6BGpxlTJKDX9fzZPanNpig1T0R1bo3lOexXSWydf7lSG9pl0UCvpD89pdRBdN0WJ5Pcl10XNtnj/IEiszvpK9/DCPy8hdjlX56Cs6hIFw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com; spf=pass smtp.mailfrom=kroah.com; dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b=IKyueeKs; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=LbZKG80F; arc=none smtp.client-ip=103.168.172.155
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kroah.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kroah.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kroah.com header.i=@kroah.com header.b="IKyueeKs";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="LbZKG80F"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 7BFD3140022A;
	Tue, 31 Mar 2026 07:59:40 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-03.internal (MEProxy); Tue, 31 Mar 2026 07:59:40 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1774958380; x=1775044780; bh=xGxbHs2KWo
	Ic62WixjnMSs3Ca1O6T90MgxDfTmypvn8=; b=IKyueeKsj9gFhajVmwvHFGwYD8
	g1J9Nd1TeOzOEU4kLHFWs4Ti7egghrSIi53OVnrCB4d4GFBQnZBQWNwzGQ5hxAU5
	e69UtNPyJ+6HlZPWLGerYWnj5gucTRnuiDYtf77r221Ny+XFZO3ZhQ1Fq/iOk198
	6BDtlVBaCarjghKpQdV/Ld3LveYUgkhnGvF1vsSUjSs0BpwDpZSdx9JpipiVV3Zn
	u5zsQUZqhTVcO+AYd5g1n0KG4dRj2xeFxEA8ydAR2QYGJQ8g9uJXrcbSCbw76WP+
	5RCD/33XvTqHcB0Z9/XA3/oixpV1NogjtG+MwGD6Ft0RFGx8urXxDxQfSHRw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1774958380; x=1775044780; bh=xGxbHs2KWoIc62WixjnMSs3Ca1O6T90MgxD
	fTmypvn8=; b=LbZKG80FAgPIze1qbps5Ka+AZxEmlYOTAUknlDyz2+OJUjTKQFr
	Ds0fydR0Fz3FNrJpYzKnyMKPeL2Rva6IjGd+RBqFPDPfRzvwCYukkHoyCnzgfim4
	ShIVmNnJINN9xSdvxh5giPhIta3VzDUE2PFTg6p//+Zn9W+24HY39Y1hq31O076k
	qiY/tZDts6xzGL/Tcl7ACHdV3Kpa9PXZGbiR4KDAmBXwWLkLlxu6viGTJBajh0Mq
	lw9CHUkfuUJe7nTQXrBfI3DnWH21QVq2YQtfWHioxHpK3vqTzpiI+NhGzH9096H/
	E74WbQI27DvbVJ+dsOni67oGR7bIV98W+kQ==
X-ME-Sender: <xms:K7fLab2nBAXeER2UOZ0A_GWBmiNcwtiqWQEGFW3EXzzZKh7jJwgBsA>
    <xme:K7fLaa1CXhtVVvASncfJfx2owaK7pffqVzKdAdvy1-xJdubE8EFqVX0GTp7AasjhI
    bWLA5lDhy_kS-0TSwzO7GP5FlPHj7T-TcdOs0krscFhsUW5>
X-ME-Received: <xmr:K7fLaUwBSwI2nRKq9ziWUO5uEZh720ua-Ca0vtxb66lPmXaGFbrXfWV4t3QWvcnOR5_PXMks5PzT6zkdllXihK6itsZMwQ17iTCbDlKktl8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgddugecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegrihhl
    ohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjughrpe
    ffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffjuceo
    ghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvleejue
    fgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghrufhi
    iigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtghomh
    dpnhgspghrtghpthhtohepfedtpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehl
    ohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdp
    rhgtphhtthhopeifvggushhonhgrfhesghhmrghilhdrtghomhdprhgtphhtthhopegsoh
    hquhhnrdhfvghnghesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhih
    ghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilh
    drtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdp
    rhgtphhtthhopegrrdhhihhnuggsohhrghesshgrmhhsuhhnghdrtghomh
X-ME-Proxy: <xmx:K7fLaYtryLxxY2uPaPHA64snh62GfzvVJWN-XQJZr6MB4HHgB4rQZw>
    <xmx:K7fLadPu6voyqoOTosnhg9ErKFTUo4GUX2cmIbcS9dInU3d1_OhSVA>
    <xmx:K7fLaYyxMGQficQUHbaqPI3nw1xz6YibCWTvsErPLUUYSGQzrJgK6g>
    <xmx:K7fLaTMbJH_OFyyAKPMJOL7Y73bNklFvVQJ2QIGION1CstEPV4LDtw>
    <xmx:LLfLabCmUv_rDcGV0BxLNtB1AvcGVswhUDwY0o6oxl59bMwEnu4uclMB>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 31 Mar 2026 07:59:39 -0400 (EDT)
Date: Tue, 31 Mar 2026 13:59:37 +0200
From: Greg KH <greg@kroah.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@samsung.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Tim Chirananthavat <theemathas@gmail.com>, stable@vger.kernel.org,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 6.6.y 3/3] rust: pin-init: replace shadowed return token
 by `unsafe`-to-create token
Message-ID: <2026033130-posh-aorta-9525@gregkh>
References: <20260325125944.947263-1-lossin@kernel.org>
 <20260325125944.947263-3-lossin@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260325125944.947263-3-lossin@kernel.org>

On Wed, Mar 25, 2026 at 01:59:43PM +0100, Benno Lossin wrote:
> [ Upstream commit fdbaa9d2b78e0da9e1aeb303bbdc3adfe6d8e749 ]
> 

Also dropped :(
