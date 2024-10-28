Received: from mail-qk1-f181.google.com (mail-qk1-f181.google.com [209.85.222.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E0831DE8BC
	for <rust-for-linux@vger.kernel.org>; Mon, 28 Oct 2024 17:39:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730137163; cv=none; b=ekl+0lpw1GKDMEKWPgi93Cdu46WFCGe65l2ZP4itixjzMwZWx2Rc22jUQMWAvJoh2jamrHkW7uPi13aB4fL5b97SFWiqwcftg5Bp4bIjXz3M03SdxcJ+ZgEXSa4gNK2fWe/uMGReO/IDa3PN4zZyRQ717IbrN+5sXfcKfVhUjrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730137163; c=relaxed/simple;
	bh=7n9+ZAdT2DGnWDqrIciHMd2O+9MxklbJBpEsLFYjhWY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=oPGaAaft/FiLqEDDdJmQNimcVTXJ3UGwu+wQ5xT0yrT7CXMo2GVxhnjzn7d8NHocSYhC79I05WxbRVM4TRQIB7BHmNnKn4msIJfYwZJnVO2pwYaE4YBKIo35YY5JFjE1p+DpcwKuRmBLIcRXj08MLZQFo9jy/mu+3FJczi/VQk8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DorkPWLz; arc=none smtp.client-ip=209.85.222.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DorkPWLz"
Received: by mail-qk1-f181.google.com with SMTP id af79cd13be357-7b13ff3141aso356341585a.1
        for <rust-for-linux@vger.kernel.org>; Mon, 28 Oct 2024 10:39:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730137160; x=1730741960; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=nECfhUTCWlRpBVCjeypHHNx8egy/qx2v1/20hjUIfKs=;
        b=DorkPWLzCH6Pfyw8zJAz1KxHRTYtqHJiYyTVf19tMLjXarw0odhukXOPsk4LJO1vOd
         /GQ7H+lijuIn5ZDhMihAwIoXKiP5HggI8CCc1U9KeqIi9sqBT/1bUTqjiXxXLOMy996T
         ezNQREyWcLjoW2IIbJEW73HLewFWeT2VyfjFifLTpE5bLZMxx0PwTGOVKQaTbp38t6SJ
         8/aMzkb/mrmRH1Kij+Dbup6hVSvRblqO3gUx1r3Wo3/1IS5M1wrwjwbddFE/Gd3DVs5s
         IHSusCx/7sf4x5XvT80+V7TvydeHq3CQl/EZ8dSgh7e3FgvHJ8erl8mBZGJacqZpRzCo
         6I5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730137160; x=1730741960;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=nECfhUTCWlRpBVCjeypHHNx8egy/qx2v1/20hjUIfKs=;
        b=IZGs/hpUykGNFzXX2cw07qm3i+XjbcXTvFjEgFZr5n3pC6gG3imc6BqKZpBH3nM0Dq
         RKiP+INoM6bWAYyTGQlsnU6jcEVSUyXj0rn8YJ46hgcF2bbQtee5GCf3pJuwrrvYl0zL
         PqYLTk1RNJhRJFxwiWWtIuSnIXtcJgrU7ueaa8Hns4CHP97bGUlS5cDPIv+WNp+7XNN8
         UljuoBUCOXMy9WjL8y8/oAeUpWzVEvE+JkLG30YrNv9mSdsj1sADxxSqUZeOCPa0MBMa
         JN32v0/VwOL0zkYnMyEYSkcW4zemMVapRU8rYOnwYoiemq27N+wJCw/MFJgPRLIuLtgi
         U4lQ==
X-Forwarded-Encrypted: i=1; AJvYcCUr2yKberL1nvta20RxJCjWej7RVA6foKYMhRQFk+AfzCOYc4gPqEj7eUg6nw+Zth2VOJm2CpuFL+Dz0/jikw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKFu5rEHkj7AGyLgr88QH1QZC0CN/tXpH33y9k/JUPHssWjD43
	VpzTyckMkGdjDoLFZbskJmLo6KqHvKYxza4wqLxC2VEsGe6XgStV
X-Google-Smtp-Source: AGHT+IHh5D6bvFvmfK3/woV055zWjJ6kT8fyG8cle36gvZgl2WWvYkeIGGpECOCmWqSVXrwC3fnYJQ==
X-Received: by 2002:a05:620a:298a:b0:7a1:dcc6:fbc2 with SMTP id af79cd13be357-7b193ef44b3mr1508360685a.24.1730137160306;
        Mon, 28 Oct 2024 10:39:20 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b18d2aab50sm335504185a.57.2024.10.28.10.39.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 10:39:20 -0700 (PDT)
Received: from phl-compute-03.internal (phl-compute-03.phl.internal [10.202.2.43])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7A8D31200069;
	Mon, 28 Oct 2024 13:39:19 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-03.internal (MEProxy); Mon, 28 Oct 2024 13:39:19 -0400
X-ME-Sender: <xms:R8wfZ6HzthzO3e4NN1rlP9HQiwBI-FCo8DCkebk62f22xRf-W5CHzA>
    <xme:R8wfZ7V9Khd0nJo8_e7NBtasnp6yhxP1siRnovjHGfj5JHeCg1dliPjpwTzghCVma
    -Ewb1FaZxwF5L05jg>
X-ME-Received: <xmr:R8wfZ0J8RNoCYqj1NfDC0fmGoJyPTtcPWARfz5eDhAdPbHZ1c00mHkEFsYE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdejledgjeehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdej
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepvefghfeuveekudetgfevudeuudejfeeltdfh
    gfehgeekkeeigfdukefhgfegleefnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrg
    hmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghl
    ihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepgh
    hmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopeduvddpmhho
    uggvpehsmhhtphhouhhtpdhrtghpthhtohepmhhighhuvghlrdhojhgvuggrrdhsrghnug
    honhhishesghhmrghilhdrtghomhdprhgtphhtthhopedvgedtjedtudekfeejudesqhhq
    rdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoh
    eprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhies
    ghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonh
    hmrghilhdrtghomhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhn
    rdhmvgdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtg
    hpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhm
X-ME-Proxy: <xmx:R8wfZ0Ggh4RxxlWrFaxpZyUtiSiKM97mytcgynh-q2ortYKmFbPA3g>
    <xmx:R8wfZwVm6Z0ojdn3hJa-3xg-OkaHfvzDhrJOyGyXOZNubgZHAck2RQ>
    <xmx:R8wfZ3OKi9HNYCi51XLzq9vldFYGfYGCn_n2jTSUm5ZUEOBmQdftdQ>
    <xmx:R8wfZ33WbmUzPR2ZQ-Cc7uO5YjLBCngGQNcN4T4wCg5gnJczwB--fA>
    <xmx:R8wfZxVu0u6kbF8yahxiiJ8rTazhTDnchfP3F1MDyb5WFiZQ5zdy2hWm>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 28 Oct 2024 13:39:18 -0400 (EDT)
Date: Mon, 28 Oct 2024 10:39:18 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: JCKeep <2407018371@qq.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: Implement fmt::Display for kernel Box<T, A>
Message-ID: <Zx_MRp1Ir9M8m-_J@Boquns-Mac-mini.local>
References: <tencent_CA5A5D6268F0D1419BAFA6AFB4EB5A37920A@qq.com>
 <Zx-_IzvBzL1TjQ39@Boquns-Mac-mini.local>
 <CANiq72kek2x8sPjsRRza7hCWLnauN60mxq0Fmx0_-kfxkromMA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiq72kek2x8sPjsRRza7hCWLnauN60mxq0Fmx0_-kfxkromMA@mail.gmail.com>

On Mon, Oct 28, 2024 at 05:52:54PM +0100, Miguel Ojeda wrote:
> On Mon, Oct 28, 2024 at 5:43 PM Boqun Feng <boqun.feng@gmail.com> wrote:
> >
> > Please use a Closes tag to refer an issue you want to close on GitHub.
> 
> Nit: it should be Link, because Closes is restricted to bug fixes
> currently, according to the docs (well, at least my reading of them).
> 

Then I guess I'm using it wrongly ;-) Thanks!

Regards,
Boqun

> Cheers,
> Miguel
