Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F1573016E5
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 07:52:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769154723; cv=none; b=giXApg2VJ0DBikmudXL4F0CdY0FA2MTQZ/wdoY74w/QdF6yp6LKZRUK68FVLVhKMWuanbeidq54sHb40dmHSbq+qL61Tv0oHersO+TEuxNcJ0RZkboeEvq3xDLyRiW1IiQalJU5BEKwAxQnR50H3ED4zCb2QInDAPUyLecdREvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769154723; c=relaxed/simple;
	bh=0+XcF/DKpKJlNk6gvVQ80r03ERq08zSyXtZRvvv3D2Y=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ULRpzNeK9TGA358YTEJ2OEJuDt6XBd2bUVhMFCWnJc1aGyRtX8ueRfaq62+GxLKA55sA8khG9pzOBGmf1NYKusO4F+e8gRZ0CkC9nswzcAJjoQ/Iv8OJsBDho5hlg50wKniYjsO5+I1Rk7+swPrEi8bl7z1U1jkf73pPMRd+8rs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJUuSxIc; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJUuSxIc"
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-566390e7db3so1865123e0c.1
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 23:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769154721; x=1769759521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cpNcbqq3QKYz3lgJbaD3XSigUERyy/+zoCPLiX3NuWs=;
        b=IJUuSxIcZqW2zFQA/iyDmnLeHr5SvYRtvRyPNCDbWO2F/QtlXShAJHTXikgc8hPEd/
         GWau4bjRLFhfnSSc6v7i1KAe5xCE0PLRdPT6+sWjWPC6sSR+v3olqQ6KxqZAr18YXN9X
         HbzFwOzUJkQXe8n0T4TykgltN0ux46T616j3xNrerFYFr5b4NqIV9WJWOpgU51zTzGiX
         yZhAl0hQc9Ry9b13EB5ovd5EYOzIsrO6CiCy98606iAl68vSkO585yTK9yhLx3z+NXGR
         weV2JNrZbnTrAnPkaVdKHndW8rMEHdTMOXjbkO9u6QUUGNj38cQmUXbPEsEn+az70DjP
         V9Hw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769154721; x=1769759521;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=cpNcbqq3QKYz3lgJbaD3XSigUERyy/+zoCPLiX3NuWs=;
        b=UoOr8IG01Lh5dj5da373MQtDaqfXsUKuef/Ijn1OtGtzchA8E9ZCSbJJxOyIQGq/60
         yPky7VbDJXLve5+Bvgtqh8Jc5wh4ToNDrAkCOU3tn21J9SZ7dAuwhnUhnmyCKIpF3HlI
         +4kPSaRnz9gFyK+tspVXO5nAX+vjNGumcIk/0N86UJPN9sFvzAyV2zb4ifym21n9G1vx
         E7BjsJDvHOqRsv3UDzj4Xv7eAXNk+NyZcUGhBZXIRqWnE2dZGzXGVYF3+vTEZFUcpxd0
         nsgwHMkypg1MHEw02elds9+niJIRILLolxTo9gRTL43Tj/ziSCBnhnbss2eJ7SOyzY9C
         K+Ug==
X-Gm-Message-State: AOJu0Ywj8xchzdAT8w9PA1KYdDZAq62xq5TukZoxA9iDqeKQlWvZWxYG
	jfoNzoUQ+gkdVbTylsNKeHqMRRbyc/PvvKaUOAzWQntzv56MUNCVYvzF
X-Gm-Gg: AZuq6aLLJX5677KrqkFh9RYYSUXTlLJQl0hmG1GjwlejQZ/hUDQNUrsTlRCQ9qHmf3O
	bBh0ZdivqV9Qrt0RmZrdRv294+pLFjs+oxsaAk98VjQdJF2BobG9pMruVxVExVMFwCmCkAoVtwT
	gUBwRigEA2fP5t/fwqVJ2GOBHPp6GFvHWYH5rMgbi189qtEBQou/U+TMiQysUVK2qmzh+CRgzLk
	QJ3TeNc5BjzQyuyYWZ//WpIAXTq/DtPOB8IJckTdXlVGbGJJZ9/MzeG5D1vCzYdmp5Hn4Fu0kQ8
	wGvQUIO9fK0PXGdq50hio0/x0yHC1RHlt5hInXsOLNn7gkvKHGhzadW85vnioN1yEndlAs7eQ4H
	cWQc41Oe7Jrczu1AR/Z2uvowL7HX+CV+L73dz9xcIrayA10/WdZ7W4tWi/K0DBsFjG5MoBOZ9bX
	CZDdnAlwZnZ72VEgqJULU9+Ib+caewRWHh9hUzAMCNu0tukp3zScik6Y7apYCrjwJhqIgHa/5Y/
	FNnX447ddmWl5Y=
X-Received: by 2002:ac8:5a8a:0:b0:4f1:ab28:d9f6 with SMTP id d75a77b69052e-502f7725200mr27683781cf.26.1769147688575;
        Thu, 22 Jan 2026 21:54:48 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-502f7f8702fsm9798031cf.28.2026.01.22.21.54.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Jan 2026 21:54:48 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6D9CDF40068;
	Fri, 23 Jan 2026 00:54:47 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Fri, 23 Jan 2026 00:54:47 -0500
X-ME-Sender: <xms:Jw1zacNSv72845-XjhCUDb8XV4_xqsR2qDrAqR8lviRFlk3rhJLTxg>
    <xme:Jw1zabUH2n7wnD9HJMJi-sVbpZ1wUOXlR5UmflwV8DbcwOIRF1lWt1qofGE764FW7
    UZE-C8uffzMeohQTrqQANlVVQenNf4_3g3zMAhOz0x8jI0vpGUU7kA>
X-ME-Received: <xmr:Jw1zaVc-YiHrgUiSUFQ3yxt_KkWPQqyd8WIdtUhEnpj_mgcmmtwtlur1uIkPkIn_p1xjIzdujJw-ioxixHI_rc2i0PjV8pew>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeekvdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedvvdeh
    tdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedvjedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhushhtqdhfohhrqdhlih
    hnuhigsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqkhgv
    rhhnvghlsehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprhgtuhesvhhgvg
    hrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjh
    horhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopehlohhsshhi
    nheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomh
X-ME-Proxy: <xmx:Jw1zacjmaFYKlPW7RL2Oa2zEZHphkSwkL15DTycEfst7U3kjSGpM-g>
    <xmx:Jw1zaWhcM4TsUj_WSAW3mRGJ_o-Z08crbA3Yv5b30xgZZ7x2qsVcDg>
    <xmx:Jw1zaYon0xKAeeaPvuGl3EYpsb5W-d-GTc3_1-I5FTxBXrDpYBMm5A>
    <xmx:Jw1zacx7l3wGN-ztfuAGbiSZji7LtbLDayvno7oRVhdR98BctZdDaw>
    <xmx:Jw1zaXxVwOXUOrAh_HWeI5BLNv59v6fKGC_yclLw11OMOf3Vb5J1BFEL>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jan 2026 00:54:46 -0500 (EST)
Date: Thu, 22 Jan 2026 21:54:45 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	rcu@vger.kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	Neeraj Upadhyay <neeraj.upadhyay@kernel.org>,
	Joel Fernandes <joelagnelf@nvidia.com>,
	Josh Triplett <josh@joshtriplett.org>,
	Uladzislau Rezki <urezki@gmail.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Lai Jiangshan <jiangshanlai@gmail.com>,
	Zqiang <qiang.zhang@linux.dev>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Dirk Behme <dirk.behme@de.bosch.com>
Subject: Re: [PATCH v2 0/2] rust: sync: Atomic pointer
Message-ID: <aXMNJZv8H2OQl37t@tardis.local>
References: <20260120140503.62804-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260120140503.62804-1-boqun.feng@gmail.com>

On Tue, Jan 20, 2026 at 10:05:01PM +0800, Boqun Feng wrote:
> I've already queued the first 3 patches in v1, but comments on them are
> welcome as well. The RCU pointer patch is not included in this v2 since
> there is not much update and I'm still hoping to get some reviews on
> that for another respin.
> 
> Changes since v1:
> 
> * Add a clarification patch of CONFIG_ARCH_SUPPORTS_ATOMIC_RMW as
>   suggested by Dirk and Benno.
> 
> * Add support for Atomic<*const T>.
> 
> v1: https://lore.kernel.org/rust-for-linux/20260117122243.24404-1-boqun.feng@gmail.com/
> 

Queued for v7.1, thanks you all!

Regards,
Boqun

> Regards,
> Boqun
> 
> 
> Boqun Feng (2):
>   rust: sync: atomic: Clarify the need of
>     CONFIG_ARCH_SUPPORTS_ATOMIC_RMW
>   rust: sync: atomic: Add Atomic<*{mut,const} T> support
> 
>  rust/helpers/atomic_ext.c            |  3 ++
>  rust/kernel/sync/atomic.rs           | 12 +++++++-
>  rust/kernel/sync/atomic/internal.rs  | 37 ++++++++++++++--------
>  rust/kernel/sync/atomic/predefine.rs | 46 ++++++++++++++++++++++++++++
>  4 files changed, 85 insertions(+), 13 deletions(-)
> 
> -- 
> 2.51.0
> 
