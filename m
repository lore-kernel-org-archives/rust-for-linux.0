Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17FA2481AA2
	for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 12:51:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768999916; cv=none; b=FHPNGLXu1SncC+CPuvXSoYd1756k+sHQhGQvohx6BrkmIzoOG+LnO9RjTFDstC84wviC3YBKYRf8KkbPlR1eO6AUenovazCA02qiNwW7eskbcmuQTDuYjSyGs0xS3aT16ccI1LqAn+3vS9WGOmTctexMYUxcSwB/UYA3m1RJ4a8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768999916; c=relaxed/simple;
	bh=rCJVN3mlY/He+ltCptalObxFFliAQg62cnToC5h9nm4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YR6VFNizdPc4GdFgkCkiU75gAfWMoBJ2qE8ihozHcAy8fi3mPduV8USTbI/tG31BZVmoDJxA7737M9Cm9bP9pRTb4ylJlrXb1o/Moz8zIMzETN8joyf/dFPe/6c4yBA5iarmWwLHQF+15blsFYhYzqz2uDl9KK3EoAKy6qLdHZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dzohWtPN; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dzohWtPN"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-8c6d76b9145so41356385a.2
        for <rust-for-linux@vger.kernel.org>; Wed, 21 Jan 2026 04:51:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768999914; x=1769604714; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ff1eounqvwFWz5fvkxu9F0ExQjANboKm57xpRsw3Ti0=;
        b=dzohWtPNJPGs5Ql2vW5x94bHwtVSlSweONpyQYd3FJ7/4fe0I35ixpp865jqSEyifK
         SzNQvpR6XUcub7W2cUZeeqyCyjh0QUJfpymMlJesOLSYsfZQIEjm9GcMTIIrBXhwWz33
         zYIzLpFmk9Pumk99ALC4//Z1oYQVhs5QyzcmAl0oUXA+j3dgH8tTy9HFk3pAjaaYMqqz
         L7JIJucXuZVvwBYpGON3wxHF/zB3qbO//MUxwqyRhJY23cLe9G8GggiH2elqiTnL7VPd
         noAhyTtaQ6OietXTdS4kiY2sEI07zbZpMCGg388BnkJIXnf3K29m7B+7RVd5RuJXlDdy
         O8eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768999914; x=1769604714;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ff1eounqvwFWz5fvkxu9F0ExQjANboKm57xpRsw3Ti0=;
        b=UsVkZ9RYFi8S+vZ2ogx5Hk/nFx3OPh6QRNMB9JkdzfLKF/ewApsMD902VmvYWs+5sl
         QsdUcbP5wmtROi7u0Oertp+6CZPXfwfY6hxluqImAY5CRymTXVAzAqlvsNyzNxep8KMR
         vabkqJv7JDJBPO/Yo71J6EIYUgrCOzhQ4Nv3uFhuGK6jqz1vM0RdTCFAYx+grFOoLKT8
         6ByBkRZHJHs7ytUhppZZtq+jcQJsRgbYmLBvemGT0w7Dc7fzS087dO/4vcUuSXJbG64p
         zmOhHhgNV+1GI1+lpU3JnlXyr9njfQ55lXpLiCHQ+fWfG5NZ4CfQqVQFjveUm9zpPJF5
         57cg==
X-Forwarded-Encrypted: i=1; AJvYcCVOrjHbM5SImCLaFV5BgfdNxlHnTx4hQPw8mR24qu1P8csjfuvKVZA6vwVU/Ql4vrLJOsNZt9BsZqPCf7zM+g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyus3xT60MwLI6M25DiBv0yfxO6cRsXPTxl+UWJ5GGz6c/JSi2E
	n1zDU2yHhbEIbavSIbCAXOvtkXRBXanUKmj8A67g42WNTwvBTmqdZACq
X-Gm-Gg: AZuq6aIN/ZRUAnJ+OAdRh8DB3GHKsdHc9pYusqP4sVkS+G78UOzJy+EmyaGLR059OeQ
	twPNFy+VxfWokfDQ2kkZAAIpSTXKRnLmUnHUtovN+G/R1OGedtFhcOo6DJgHR2KtN4qDrn9NBo9
	XDJ6sLofAV67sOZQKSE1sfifxwqH1dVXTjziQnvl1vyJMJj1D5K8vQ0Vb92X5GY9QQfO6uSEKfK
	Sjn6dybGuOU0h/zoSzNiINHze6yqcgfBLFWJju79ATpRCZBHKT93uZo4Dh0qZYtiDgepsGGDMtf
	v2E+1jj/ch8iRNs9Lwa69LJa8HtOBEBqlwkWOAZ5h0Ne2zR2OtQbBMx/yPB/joc+6aPk9ziOaR2
	YsPzZMZa5kTGa6iitYARIm/lfx1mb1pLLD2TQtSlVZSq2b5L1OP9AN56zgHWjWoDr1bVkm27JdQ
	Qu6qqyJvr+sLcLa6c2Q+52Ne+3u9DN2ID22whdB9Tl3VRZDlTVv/n5aNyk5xJgyljrtkAd9H78U
	YE3bBXCIHm6KNg=
X-Received: by 2002:a05:620a:4720:b0:8c5:310d:3b2a with SMTP id af79cd13be357-8c6ccdbeeb5mr646477385a.19.1768999913732;
        Wed, 21 Jan 2026 04:51:53 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8942e6c9b83sm124581826d6.46.2026.01.21.04.51.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Jan 2026 04:51:53 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id E712CF4006A;
	Wed, 21 Jan 2026 07:51:51 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 21 Jan 2026 07:51:51 -0500
X-ME-Sender: <xms:58twaUGSkaSpbx7JXEZcxEnx57vxUAoduMTdegZwu8a5u5M9Mg5GDQ>
    <xme:58twaSODH4rN0LeVuGC31txCvV3AQMyf8ig2IJvk2hLk-vjtj30YHp05UAGQa1dQS
    OkaXFlxYQ8baIGqrvq8taVpGT6EHGEFNrqf1a-WVwRcwP_f0pryVQ>
X-ME-Received: <xmr:58twaWuQzJC_XwZiqktfROP6_V5V9E36i7JgsETfbmSkp98jrJIAlfDR>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeffedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopegvlhhvvghrsehgohhoghhlvgdrtghomhdprhgtphhtthhopegrlhhitggvrh
    ihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdr
    nhgvthdprhgtphhtthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlh
    drohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehlihhnuhigqdhfshguvghvvghlsehvghgvrhdrkh
    gvrhhnvghlrdhorhhgpdhrtghpthhtohepkhgrshgrnhdquggvvhesghhoohhglhgvghhr
    ohhuphhsrdgtohhmpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:58twaXXugDnVSIzPc3Z6tmRgJ0gzc-8kpLQlF6EU4_1T359kNr0AvQ>
    <xmx:58twadSMEqXBgc6u8BpISVpCgFbZnNBK-m9n-slSUZr_BmMMRXyQQQ>
    <xmx:58twaVJYT_K8atwdL48TaGRLXMspI_cX4L6NB3oMz9TS27ghfquNNg>
    <xmx:58twae3_JXhGRQsrMvzx9L3rTqWlzKH6-fDOyUi1yXzfXsRfn6I7KQ>
    <xmx:58twaYJ89IAFyCeo86kIWY9aLZFkQt1cwWFbCBN6iPl_iRTb-RzRxx1k>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 07:51:51 -0500 (EST)
Date: Wed, 21 Jan 2026 20:51:48 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Marco Elver <elver@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Gary Guo <gary@garyguo.net>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	linux-fsdevel@vger.kernel.org, kasan-dev@googlegroups.com,
	Will Deacon <will@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Elle Rhumsaa <elle@weathered-steel.dev>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>
Subject: Re: [PATCH 2/2] rust: sync: atomic: Add atomic operation helpers
 over raw pointers
Message-ID: <aXDL5NUOH_qr390Q@tardis-2.local>
References: <20260120115207.55318-1-boqun.feng@gmail.com>
 <20260120115207.55318-3-boqun.feng@gmail.com>
 <aW-sGiEQg1mP6hHF@elver.google.com>
 <DFTKIA3DYRAV.18HDP8UCNC8NM@garyguo.net>
 <aXDEOeqGkDNc-rlT@google.com>
 <CANpmjNMq_oqvOmO9F2f-v3FTr6p0EwENo70ppvKLXDjgPbR22g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANpmjNMq_oqvOmO9F2f-v3FTr6p0EwENo70ppvKLXDjgPbR22g@mail.gmail.com>

On Wed, Jan 21, 2026 at 01:36:04PM +0100, Marco Elver wrote:
[..]
> >
> > > However this will mean that Rust code will have one more ordering than the C
> > > API, so I am keen on knowing how Boqun, Paul, Peter and others think about this.
> >
> > On that point, my suggestion would be to use the standard LKMM naming
> > such as rcu_dereference() or READ_ONCE().

I don't think we should confuse Rust users that `READ_ONCE()` has
dependency orderings but `atomc_load()` doesn't. They are the same on
the aspect. One of the reasons that I don't want to introduce
rcu_dereference() and READ_ONCE() on Rust side is exactly this, they are
the same at LKMM level, so should not be treated differently.

> >
> > I'm told that READ_ONCE() apparently has stronger guarantees than an
> > atomic consume load, but I'm not clear on what they are.
> 
> It's also meant to enforce ordering through control-dependencies, such as:
> 
>    if (READ_ONCE(x)) WRITE_ONCE(y, 1);

Note that it also applies to atomic_read() and atomic_set() as well.

Regards,
Boqun
