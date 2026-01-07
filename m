Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E9251E3DF2
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 00:56:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767833770; cv=none; b=rxjF+WOeHL9zGZ+QSYAv2+z7VAG1nd/SFv1iWykdIItEYAqjb0bKI7Lx8BY+DBVwlESPMabcfoUfxt57BccdhPxjiuJbi5kC4KDcPgC+3ZHDJ7x2BOpzUr2eVvlH3EaHul34WnnaKqxWXLRAa6fwe2g7UzJNlQnEQoWmnGCue38=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767833770; c=relaxed/simple;
	bh=YwYFk2Qx+js9gbhXOBYT/PL0EMA9IaaTTXp8tsgIuMo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r//oH5pnlHhs5XEeWmM2/twneZu3iWWoOO1MsAKtbOyxKA1g7ZNq1AhjTEnCQPHogRj/Z7XQGRiZjm/qADT9hgL6hucD5sVoKPP9Bi8a8uRuPmJPDCo1iPkzkLVQt3s5k/PAEm0KcEpkfD7mIOTkH2ZiwKTLRqMT0Gmt+ZgVRqM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QO6rh/u6; arc=none smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QO6rh/u6"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-121a0bcd376so693751c88.0
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 16:56:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767833765; x=1768438565; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=oG5BFbOLzzfCmy3i7IH0OAHPZrkRaMAHq+KjKb1KniM=;
        b=QO6rh/u6LhQDBbz+1vGzzFX6DjBPB6P91w8CwMHsQETte+mEvq8ruPGLKQWhLdlwGW
         r7qCGilZ/cNG5vRjyQvQGT7ri1NiPsumt9bu7peQ6wizYZKtOloKZGmdUcBwas5HoCiC
         liHEbR+5AOxxFIuvRL4smVwlTr4NEFyQ/CuuhfWP79LHqNRYeSun1Rw+p98TrmGisZY2
         dQLuHC9GZDIeC1rDK3r9XJmCGI89tI5wrz77tlWxNlH7H3q/ItQEVYGLTb1Dq4xxfVpK
         WMLS6Xtob6HGr58nQc4krdiwbvDutIAFq6+fC1S+yv4wDrMk3KlqQbQ0O5vBGvkECadf
         hWHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767833765; x=1768438565;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=oG5BFbOLzzfCmy3i7IH0OAHPZrkRaMAHq+KjKb1KniM=;
        b=BFdY5wXkFfK8rJ18KhBM+P3+QInzeFlyZS0uWtSfWGrU6tpHMR9nziZYSSMWhCYKzU
         SCVoIE0lyhS06CWTJ44nbt7UcjTlc+CcekSUqgwDgreS9v4z2gB7ArMGVXcoJZDAsgjp
         rTJAuerqD0e42sOH54sozC3c5ux+kOes3kw+fXrxe6wypFFGXfAJQYtHLQmlV60PX6Aw
         7MJCgJBpcWtLnm0B408p4Zmr6U0uXaRrS7jMrywmHOrMc4Q5WLCNdEvSs+ZI0jqVUczY
         RXjgzSEhnSj2Fm8oGkspridVdeLJq+rVCGbdrY7I4XXG+4LXVRFPifl3VmvwDPSq+7xR
         gjkw==
X-Forwarded-Encrypted: i=1; AJvYcCVxMCWjAC4HenoORMLp+Tuh0EXvRoFH6gKjLmkheddDJcdXskwYv7iE9ZCVMYfLzVoEufGsPP3f8EXamY5yqQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhdNmM64angocKMWd8C3kW994yQRCwGJj0AaJHadVxZigU+WSj
	VssL6x5F/DHZo4Idc/KO4clMypoq0V5rCn3vWpwjf5lj6PEuuUCxPe0BLM1XoYtI
X-Gm-Gg: AY/fxX6Xp15hwmNTjtznMpxrIKabY+L2O1XsKtd8m9p8yVOhTERA+bTo9pKUs103zLk
	5KU0c3Mf7k4jfh+Fi8VC5Ni0a+9I0V+8i3IVGdFQ1nd2irKQcyRAfdXbd6wBHsU8vp7eGWvn+wW
	djy6MLQ21Rnowao5/bsYy556LyNkbovhWRrt/I9Cne0yI4FZREWqlVlWDQb26ukBcw5zcO7YvKc
	KMLzEzcmDgVzBFchl7uOuL/Etjg+tEgna1RNyESekPiil9UTRI8FeGmUA6GLAvd7yYnrhXlc1JC
	WD0eIIi34Fwh1fm9x6u2MHoXdzH4oGJdaX+/G4DdDl+7zW/VP2MZPREUD7ipyfpQkyT+bW/SjDr
	Nw7KwziCfrqRgiaI7tfTDtMeNjrkoztIs/EkTwEtWEWkwmK4VxOWlPd6kGYraeU609gFqdmwOXo
	LUbVwSsy1YWOYMmz1akEOIolwyuENK4VFZnFeSgxfv8mjocjDmFO1fZTZDQhqYYGoSogIbX7joX
	2tTG8xstBTxuTkRu4IVtJKkaw==
X-Google-Smtp-Source: AGHT+IGIT0eYr8Gbwd/QQudTYQgriqF4Hv1aOqCZKTB6uNL4p+UUE718Oq8T33nlodImpPSbreHPXg==
X-Received: by 2002:a05:620a:2a09:b0:8b2:e5cd:fa42 with SMTP id af79cd13be357-8c3891b060cmr560895085a.0.1767827439197;
        Wed, 07 Jan 2026 15:10:39 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8c37f51cdcesm464558185a.26.2026.01.07.15.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 15:10:38 -0800 (PST)
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 63DD8F40068;
	Wed,  7 Jan 2026 18:10:38 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Wed, 07 Jan 2026 18:10:38 -0500
X-ME-Sender: <xms:7udeaVKzdJMPbU4Mg3W-QXRhLL4JDv2FlHGMHqIcKeFCObfm8VPhFg>
    <xme:7udeabgamZQz5glQPb3hJ8vzTpBBc6dxyoZR_22akKjslCMEqOz9cBEieH9yP3hzP
    RSbePhjIHlB4OvQzuy-P_b2C0_MMFp3l5SIcDkV_XLUWCD0CSwVdg>
X-ME-Received: <xmr:7udeaT1QmLEC-rwOO9X1h6CfcLhFotBgoE6-FretLwWU83HO2WJKZmpM>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdegfeeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeelffdvhedvheeiuefgleejjedtteeileekgeekueffffegheeuledvkeejjeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgpdduledqrhgtuddrqdhlihhnkhenuc
    evlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhn
    odhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudejje
    ekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhn
    rghmvgdpnhgspghrtghpthhtohepudehpdhmohguvgepshhmthhpohhuthdprhgtphhtth
    hopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehpvghtvghr
    iiesihhnfhhrrgguvggrugdrohhrghdprhgtphhtthhopeifihhllheskhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepmhhinhhgohesrhgvughhrghtrdgtohhmpdhrtghpthhtohep
    lhhonhhgmhgrnhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrh
    hnvghlrdhorhhgpdhrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghp
    thhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhmpdhrtghpthhtoh
    eplhhoshhsihhnsehkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:7udeaRgclG-yansGgQdLo3XFcsyoi01V0mv-E73P97Yer7z17x5aUQ>
    <xmx:7udeaU-LmN1lhNwEHeVqE2Hgvl2GgK-R5xQhUPRq3gT0cwCyRzlpAg>
    <xmx:7udeadK9monSxNQpauKJOIPNTfOOyeC9qB-rcf8cPAbJN5XH10RBxQ>
    <xmx:7udeaZzu6Bd-o2_AgUzPiETqp_DY-j5BkwvhpbcJb_lJR6uwUBWuyQ>
    <xmx:7udeaQ2Q7wpJdYHjy2myb3byMjIF8PEbFJIxrOeT1ymWobnHtnNY8_Mb>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 7 Jan 2026 18:10:37 -0500 (EST)
Date: Thu, 8 Jan 2026 07:10:35 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Peter Zijlstra <peterz@infradead.org>, Will Deacon <will@kernel.org>,
	Ingo Molnar <mingo@redhat.com>, Waiman Long <longman@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: sync: inline various lock related methods
Message-ID: <aV7n66KP_AeBzVBK@tardis-2.local>
References: <20251218-inline-lock-unlock-v2-1-fbadac8bd61b@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218-inline-lock-unlock-v2-1-fbadac8bd61b@google.com>

On Thu, Dec 18, 2025 at 12:10:23PM +0000, Alice Ryhl wrote:
> While debugging a different issue [1], I inspected a rust_binder.ko file
> and noticed the following relocation:
> 
> 	R_AARCH64_CALL26	_RNvXNtNtNtCsdfZWD8DztAw_6kernel4sync4lock8spinlockNtB2_15SpinLockBackendNtB4_7Backend6unlock
> 
> This relocation (and a similar one for lock) occurred many times
> throughout the module. That is not really useful because all this
> function does is call spin_unlock(), so what we actually want here is
> that a call to spin_unlock() dirctly is generated in favor of this
> wrapper method.
> 
> Thus, mark these methods inline.
> 
> Link: https://lore.kernel.org/p/20251111-binder-fix-list-remove-v1-0-8ed14a0da63d@google.com
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
> Changes in v2:
> - Rebased on v6.19-rc1.
> - Link to v1: https://lore.kernel.org/r/20251113-inline-lock-unlock-v1-1-1b6e8c323bcf@google.com

Queued, thanks you!

Regards,
Boqun
