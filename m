Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B52273D8F
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 16:15:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762791301; cv=none; b=V8rOrHoUMs/84ZPzVh5LKGnnEHP4vwbBD5+zriBHA36X/94/N+ByRGs4DkfHBXOl5k6DMaTCfEYFIg6VycvwXqa5x/04V/tSTYlypOakXUBxvU4Ie0j5hIzG7QfeRt9wxiGEENKD1MPsqJ0AIENT/Xbpe+dimVoEfme3Km5RrEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762791301; c=relaxed/simple;
	bh=wCwIMg05Fr7S6Fzg5AE1/fiPcrVmA+i0UG6gr4zYIXQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rs7fqQjzTD2NiWeX0KDpDkO98i/zOLCIMdJdeTb/zv9tIU/7Dzq3+Xjq5JLPR4maE8N+Orj0YLEAbDTnoVpaEgwFZx/4wk8bFN0XNEUfyrAGN9VSa3AsM7NnaMPwSWZMkJSfgX2xme54O56xpKGnqFF98A438VuJu6ObbUwdzPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RMn9IfXU; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RMn9IfXU"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8909f01bd00so317905485a.0
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 08:15:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762791299; x=1763396099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P/Kct4bzMEhOJ6GwzgWOlfhVKxDp6V9lcfltIgQVqq4=;
        b=RMn9IfXUQV0t/XJwnE1/4IQb8kuafTU01COBMwLrrBsCwr08UDiFrPk/vQPxSR8WJV
         2hVSEz/yiAb0OxzEXHUdI0BVwMa3o2fNP+OOiYhqMqaluszInEKEw3bTceVf4wuQFyzX
         9XCdze+O7h/XR+AM1DA7ONkZkXwMpvYrSxoMpqJf6MaWDs+U1b53doSv8oBXUnhUYRHM
         3pHbdh0/sXAVY0kSarQkiazBB8SIQeixoSfJzRZOHChvFQvibmDTEb3yNrLToLQ61Ttg
         GnEDwtDAUxu8DrT3Whe0HMtAANkKrgcJ0G6Y4tGbhP7YiT0flF52ppWOnaog60VonOv2
         PYLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762791299; x=1763396099;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=P/Kct4bzMEhOJ6GwzgWOlfhVKxDp6V9lcfltIgQVqq4=;
        b=bLnzPHFJo20kkeOf2ZUL9ozZqLhpZTFQED5wh9i9PNhCNo9Z27PgwhAd2xmnR+jsQ1
         oi4tv/cnpO+NP5hiNm3byythsqsJQg7EbWffbAvDxirY825xIehFKso5I+kHoI75IKJE
         ZL6iIQbnjwr70EnaslrBG5qalytMd1Dh34YwP9XGDU1mkKexY5A3PrJt1OXhdm8k0vav
         gy4nC6xb3zcSLB7Pl0WjGKRQhdJVKX/Cz7MuDTCDQDB4CWSeNSiXc8KZ1cyKz5+RETRU
         sVuZfa7jS/dyg9KQruzxvBg3ZNpsi1Rbsanr3sVEPoWpE43A9hZZKgtkW/oejo5zzucZ
         TxbQ==
X-Forwarded-Encrypted: i=1; AJvYcCXmD0xK3nqUws69RoygNNriyzce4AE0wqECMePoAc78JmPvAq0guteJ4OmZhAoEnat9xNTEWvkdFH8mI4FXjA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBzr1G6pgvkyu5l1Ko9Q/Qiq37pFUVeQ9UHbxbm0286J4wrVee
	vpmxbDwGifENc8OjKZwe92WRn+oefmYauPQRJaJMWBD9t5kvMwncktEL
X-Gm-Gg: ASbGncsYo5I630VBIK+V5k6PYg6W+hK4xYV85M7FSpk98lXpLn2rfwlgD9XSZk0Bm7S
	viGT0Dz0LktQZgkOcUJ/XgT84ne/yZ6Ik5RRmht3EasUYV2BXZP1jqheBNpFUxjvoaCPF4GSxOO
	5QKO9u5g4VHprITXZ7B741QYQPhkjCo3ceLyFVOzo5lpMTVC4+gl8SsbvHaJndCp7bT2Cqqut8U
	chNQhj3brKLS/fkOBLm2qElNnkdzegkxQsrQGtKaHybM7MyQ3OdkiC+Y4aHexy+b0ZCRPSlCQqA
	6DKOf28IXVuB5uYXfwPbaxFTAhh7f0oKRmPHLEy/wOUy8VL+4g3eibLS1Pwwb+2CAV+LYJ3BktU
	pAObC5ItcMC0qYFcpR1m5AxPFunnzpn1kVKQduyFMrv1qpZsCocR7Gu74eR/Zq0QsNylkh0TLuZ
	dFiFvbb626mJL8giFxJ7XnT0uHr1KCXzvnbOuapGtGqw6hdWUKRgww2Los4d3abJlc5850r4Wt2
	ohYgdleL6CVbf4=
X-Google-Smtp-Source: AGHT+IEg8ifX+DxXw1qP1w0Mi7ErOb4gg9ELdEwxT4OjF3HRAe1jgN/4PpoeVoEX/B9yNqJ/ThdV8w==
X-Received: by 2002:a05:620a:1a12:b0:89f:493e:73e3 with SMTP id af79cd13be357-8b257f7492bmr1159028885a.68.1762791299068;
        Mon, 10 Nov 2025 08:14:59 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8b2355e9a35sm1018393185a.20.2025.11.10.08.14.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 08:14:58 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id CD8BCF40069;
	Mon, 10 Nov 2025 11:14:57 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Mon, 10 Nov 2025 11:14:57 -0500
X-ME-Sender: <xms:gQ8SaQfS0pD66rE6Xe7EhJI8BGuLmalfg-Rr9CMgOCaatSfVfdKPjg>
    <xme:gQ8SaabHW4Vfwr7ovmXcsPT-iOJRq4Zye3oyptXLkh5uKzBQAjynviwHgplBoMBLj
    WfrkkLrWYumpLMgkFcMoViffCRiUgaqhNopKZZYHTKbQ0W3uyzG>
X-ME-Received: <xmr:gQ8SadHn9ccUgK5eBZ81uLAa5iH0FTqJ7oA8W0chS_Yudno0772j-Wc8w9HqD_B-HixZT_10cCnZkFWYUMPT5E0kNj66rr9L>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdduleekjeejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffei
    vdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsoh
    hquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedq
    udejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmh
    gvrdhnrghmvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmthhpohhuthdprhgt
    phhtthhopehfuhhjihhtrgdrthhomhhonhhorhhisehgmhgrihhlrdgtohhmpdhrtghpth
    htoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprgdrhhhi
    nhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdr
    tghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepgh
    grrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheplhhoshhsihhnsehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvg
    hrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:gQ8SaQkAHmdt-yPWc_0HEjGQgBh7vtORNDj5qtKNB-2fXTIJbywCyQ>
    <xmx:gQ8SaYddaKlX0jhjC-uXAyDKzoabWbIzFvwoTQ_otUNuipuqFzzYHQ>
    <xmx:gQ8SaWHvzybYipAJVWrrdIlEMKEosIaUhXEaNIyDmivz4mniVCwy8w>
    <xmx:gQ8SaWgt0fLsVFZwWDAz1ua058Kz2Y8_CbpBDenPFH-adNHuGk7QrQ>
    <xmx:gQ8SaS0w7RpExGEs1n8jBuGa1ezFHG53MmU8QKf0Ad8ipk0O-xLEmFNu>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 10 Nov 2025 11:14:57 -0500 (EST)
Date: Mon, 10 Nov 2025 08:14:56 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: aliceryhl@google.com, a.hindborg@kernel.org, ojeda@kernel.org,
	bjorn3_gh@protonmail.com, dakr@kernel.org, gary@garyguo.net,
	lossin@kernel.org, rust-for-linux@vger.kernel.org,
	tmgross@umich.edu
Subject: Re: [PATCH v1 1/2] rust: Add support for calling a function exactly
 once
Message-ID: <aRIPgOPvi4uhGQcM@tardis.local>
References: <20251106.091026.1308953895982406095.fujita.tomonori@gmail.com>
 <aQy0zxs53EAnntwR@tardis.local>
 <aQ21xajAygTbi582@google.com>
 <20251110.182150.1392834304602894143.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251110.182150.1392834304602894143.fujita.tomonori@gmail.com>

On Mon, Nov 10, 2025 at 06:21:50PM +0900, FUJITA Tomonori wrote:
> On Fri, 7 Nov 2025 09:03:01 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> >> That's my point (and probably also Andreas' point), we already has the
> >> type `SetOnce` to do this, no need for a `OnceLite` type if not
> >> necessary, and the fact that it can be zero'd by debugfs doesn't change
> >> it as I explained above.
> > 
> > The SetOnce type doesn't do the same thing as OnceLite. SetOnce has
> > three different states, but OnceLite only needs two. I don't think we
> > should be reusing SetOnce here.

I mean 3 states should cover 2 states, right? In this case we only need
to support SetOnce<()>, so I think it's fine, see below:

> 
> Yes, SetOnce provides three different states and the feature to set a
> value, which are not necessary for this case.
> 
> So there are two design options: 1) to add a new minimal
> implementation that provides only the features required for this case,

Just to be clear 1) will still need to be in kernel::sync module, as per
our previous discussion.

> or 2) to use the exisiting, more complex implementation with richer
> functionality.
> 

or we can just add it into `SetOnce<()>`, for exammple:

impl SetOnce<()> {
    pub fn call_once<F: FnOnce()>(&self, f: F) -> bool {
        // ORDERING: Relaxed is fine because we don't expect
	// synchronization here.
        let old = self.init.xchg(1, Relaxed);

        // We are the first one here.
	if old == 0 {
            f();
	    return true;
	}

	return false;
    }
}

Thoughts?

Regards,
Boqun

> Could we make a decision so that we can move forward?
> 
