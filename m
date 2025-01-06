Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A9801553BB
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jan 2025 15:31:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736177494; cv=none; b=pI1RC12EbPzTREpmAeyUyTBhBN+j/fF71E+qiW8ViOjje0ebJ6O+tKJORW7DcPjwhzuAhMhzU5GobNnERe+7S4TNtAfGuHHLGumjlVFgeuEB/+OSC4G95reEEKCjD0Dz3fCHJA8bNIFbLMAhQbiYlN1iQvJULY7qARlfavCYMf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736177494; c=relaxed/simple;
	bh=OL1dzVziuyOBxJh4F7gU5XWu6srZeYWBxSLxy73Zcxo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=D36HxYMsNYr59umgAR5nd5uIVJlazwPpiRNhc4bL1CAt5NQcei6Kp6urbE7ryWz76ktc1AACpQlHRXH/EAirahH7zhrLjKI4Rh+PzVNhR65h7bU/UBVLDK4nbkw83052kQeqAZ1MDJEGPkwesjvNVx3mYWcXW3EtkglbuTCfhYE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dSPxe28v; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dSPxe28v"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b6fc3e9e4aso1290207985a.2
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jan 2025 07:31:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736177489; x=1736782289; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=X52r0GkQcZZPJGFYtDUNHyBeRm1llrXcxJkAc/P/ZOQ=;
        b=dSPxe28vgXZDMMRSpqcXNKioR882SILxf5K6+po4T3cL8YEM8ELWnu3KBhm0cve555
         U4ORLIp/IzR62kCfCZ2xA44vVWuX10eyWTjGtYSlVev7TePjdcZqDSbrCa9wM+f0ai1q
         MbKee/ICa+sGO4meGuZ7x3Y9iXvNXnsEWnxzWbDDgqkoc+7ISVi1qk6cp5USKeyhKA6a
         t3U6m6OILCSjbrkchJlYqQhoIyvpAV7CMF938dfJG91EAr0mCRHTgnt99AeJQ9z5JHJy
         BWtVnzkM0w3ZfBcg35xVkXj70JUOrDNivVai1/YVvBUqQTCXMu8z2omN+QWYRtGHz7cX
         7zkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736177489; x=1736782289;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=X52r0GkQcZZPJGFYtDUNHyBeRm1llrXcxJkAc/P/ZOQ=;
        b=DKWNp1CTPevGdbbqcV3S8U52I66ZsZ+s0cxVTDPdRfkxNLL7OuBLyGEYzu1ZEcMdE5
         JtMyflcEI3DnY71NsYYmGex/fa6LUTJLbTrYCjl5UunJCPFrlp4dyeM38eMy/NX6I8Ac
         gU1wEbXc4oU9Ivm623frGCWkanYJGBbld8ZF9ixzRYdXt/AL22x1+PQGUEruiRvnUwl9
         QFYPzIs5jQrJ08jX/efHr165oA8yx968Qh/bIQEox/Rw5kL9hDzokVntwgL/+8cc9Zgi
         paT7TMfsrNC6/Z4ccYGBzXei3aZlRekuiYJFL3+LPNmwBZJg0VHtXcG4ZGyQuLwFH+sh
         fX0A==
X-Forwarded-Encrypted: i=1; AJvYcCWcaq4tmABQtfKbhLIwuPRfAKUofcg4DqEopg5DsOTJknjdGECTqex0LSDXKl99cKmanoPUiFc/umhwSiq4bg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyo5eHVT2+xwuyYdYCb6hUbtZnkrz4B6DmgyPfPyJ2LvO6f5M33
	m9dPfa3LvUO0euNdQuHE/DpKVjyCxAvP4pHbbxKhMeoVFUtEbjqF
X-Gm-Gg: ASbGnctalIatDe/QTQWlIKTt1RcSj3CE/DlbH4811EJRRIS+HduXhtg9hh4TdTvFMhu
	3Gw6pQpxQsSBqU3NNzKmyX7QbZWuLmAbHEwBFsn+86fL2RKlPJhCOwTtcHXprIlEDDtn2lmbDjR
	D1xbuNNotpIapvR52l4+sGpmSNyOWCxakAQ6MUaj7UbJNHd9E645Hdq2uPd5WQNbjWe32f9SHRS
	BkccZ4MqtGK14d/vL95iFtyqz6IxAgmmcbBMhq5kCdz+FQIHRBHQIS68vAG4bIPWxgPneh7Q+Aa
	H+gdABTjJgY/3NMudJxglDTJII2E+TEbTLZ22K7+E+aed24=
X-Google-Smtp-Source: AGHT+IEsif6+Ara9NLytHtI0fL0XNM5HT4OzqET72K9N0dXCMxn3ffu4qUDgw9b7GUWW/V2mFuawkw==
X-Received: by 2002:a05:620a:3710:b0:7b6:c92e:2e74 with SMTP id af79cd13be357-7b9ba75773dmr9395106285a.20.1736177489076;
        Mon, 06 Jan 2025 07:31:29 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b9ac2d15a4sm1516942185a.35.2025.01.06.07.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 07:31:28 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 144C51200066;
	Mon,  6 Jan 2025 10:31:28 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 06 Jan 2025 10:31:28 -0500
X-ME-Sender: <xms:T_d7Z9bMvd53v0CnyF96Mrf_TdnDDw-LOAPVZKDoFaklJXmh_TUX7A>
    <xme:T_d7Z0aXFg773NhtXNEoSerLypEtUZEUKbWvaFRf6fKUbY4tekxG2xxEJ8ve_aR1R
    qtzdyA8-daeMuBOCw>
X-ME-Received: <xmr:T_d7Z_-kb2t0BR3J6eG3RFPmAZYKHJ624QfKjLz8CfIZCEax65tHkAwMuPc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudegtddgjeejucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudefpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtg
    homhdprhgtphhtthhopegrlhhitggvsehrhihhlhdrihhopdhrtghpthhtohepfhgvlhhi
    phgvrghgghhgvghrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtgho
    mhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjh
    horhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegsvghnnhho
    rdhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgh
    eskhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:T_d7Z7rGvY5FMeLwKpvxyOi-uBS8mqbk-wr3boX2RaO5mKB-9kXzmQ>
    <xmx:T_d7Z4p9FAPB6qqTw6CkXy2gI_dZGgpobFH7bBUWAlE3WMVCCUIYrg>
    <xmx:T_d7ZxQMoqC27byftVVxP6bva4Vjhln-dkEacUyVrh_StBehDmWWFQ>
    <xmx:T_d7Zwqu5ui9-Ldc5mI5NIWBkqJEd_vvufmH7HzZl5vZuy8r5CK3tA>
    <xmx:UPd7Zx7jfZCg1SDf0L5LRToI9JCLWU74EwLZNZuijWKd9SJj2C0ls41z>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 6 Jan 2025 10:31:27 -0500 (EST)
Date: Mon, 6 Jan 2025 07:31:26 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Alice Ryhl <alice@ryhl.io>, Filipe Xavier <felipeaggger@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
	Filipe Xavier <felipe_life@live.com>
Subject: Re: [PATCH] rust: generalize userSliceReader to support any Vec
Message-ID: <Z3v3TjMfG1CHd05C@tardis.local>
References: <20241222-gen-userslice-readall-alloc-v1-1-c57b7d4972f0@gmail.com>
 <Z2hKTPIBaJ2K9HJn@boqun-archlinux>
 <7fee31c8-6319-44d5-b01c-7f5022054e10@ryhl.io>
 <Z3LI981PbEwMts1-@boqun-archlinux>
 <CAH5fLggzi4-ccTTpbwjC9RaJo-GFne27L8_f68sKsR-c3knY1g@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAH5fLggzi4-ccTTpbwjC9RaJo-GFne27L8_f68sKsR-c3knY1g@mail.gmail.com>

On Mon, Jan 06, 2025 at 02:34:13PM +0100, Alice Ryhl wrote:
[...]
> > > > ... what if the copy hit a page fault because the target memory (e.g. a
> > > > VVec) is not mapped? Would copy_from_user() handle this? Or would it
> > > > return a different error code than `EFAULT`?
> > > How could the memory not be mapped? A vector lets us obtain a &[u8] to the
> > > memory, which isn't valid if it's not mapped.
> > >
> >
> > I mistakenly thought that vmalloc()'d memory can be swapped out, which
> > is not the case. So you're right the memory must be mapped.
> >
> > But the usage question still exists: do you have an usage case for
> > reading userspace memory into a `VVec`?
> 
> I believe there's a use-case for a KVVec in Binder to avoid maximum
> sizes for a certain array.
> 

I see, thank you. `KVVec` makes a lot of senses here. I would still
suggest putting the details about the potential usage in the commit
message. Besides, Filipe, could you Cc memory management people next
time? Thanks!

Regards,
Boqun

> Alice
