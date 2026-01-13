Received: from mail-qv1-f52.google.com (mail-qv1-f52.google.com [209.85.219.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E1DC374183
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 10:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768299065; cv=none; b=BOPyJFzISw3Ll/dZiue+ci5JIaG3Nk+5UaWFBzJijHghjI+nfpY6364Za3VCsGMRaK7d1r4TovX3bHc2/OQ+ecdZKVu5cuL1SHgUVZdFizR4yuqHZso0flHPwEUVSYhtL3wR246xa3YNndcakReKPvPfBslVWNBo8tu+c3OnWcY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768299065; c=relaxed/simple;
	bh=2f90CNsfCuBoKghP+aaC66DR39AW0IHnWvXdcXMQi4g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u0zL9FLPww9Pji0cFwhuB5bQ2w0T9yWAorhp5h1UnLVP6FhrQVGsmsV42miNs4JDu3qKgsFaBRiT9/rx5OFxuFfoEkRPTYDB+kYijEoNudbNoZ0qiGORhDgFgqFpTJrbyPBU3YFIDRS1h3SEwZ9kUOl7QveS9BSrDn500SoIFKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RuO6zWSz; arc=none smtp.client-ip=209.85.219.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RuO6zWSz"
Received: by mail-qv1-f52.google.com with SMTP id 6a1803df08f44-8908f5ed4aeso60339156d6.3
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 02:11:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768299062; x=1768903862; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6tQW1OhjI2UR8uOvz3DjlbbXZCR4tzMihhBgEbecFhc=;
        b=RuO6zWSzZVOKN++UCoFknjLtPQRRwJlYi1GEqpPgw5wCixIHwdVRN0qVm1fIe4qeaX
         R6va2pkhHaDJ2uoZpJUeuwCEX6p9ykhPn+sLQUmscVYzkfveqjzURnKNaj2/PJw2KqIQ
         hxiA8Tb+8Tm1f3Ce1Y17+zhF/RUy8nIUDCxUKLbkDZ37YjK2x5QIBF8As3N0h7+qPqeq
         sp7cQ8ElGdWReEBiVNDgeAajIU2PmsQc99RQoEVBhJd8/B3VABMfTSjrIM+onycisDKv
         u/hb+TBtf2vTPuwCumjIrAoki8KcHJUU8ZUMiFLCdGZil4ijXHR44Y455EvAYh3cpVmR
         DT5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768299062; x=1768903862;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6tQW1OhjI2UR8uOvz3DjlbbXZCR4tzMihhBgEbecFhc=;
        b=NNLwV7/3HSieL7jVhnCI3JEGqUrKU8uGIhKy++qNQdv09dejcO2dA1PgRhuWBVHctC
         bmj42qn6ZxTcC1i35HEsJ2FAe+txM37H4uk5q2bX+FaeHPI7WWg6bhLRg1wGohAXnwGO
         3P8kJR0+omcZglbeN2rY39NnL3S8F6yjH6cVXYqfw0LxczZSvTh6ZJBBDAhSwut96A22
         yqx+rEmXHtGHb5A/JpslI6TffyhvcFWWtJZqjJH1+0TlaxVXXdsqdLcjgIRN+oU7UEHo
         WCEPEObI+HGCazvqNsaOYFYDo2Lg1GL3e7i7600TSJLr2tFtU2tohQEfQyY31Cod5/bV
         G2tQ==
X-Gm-Message-State: AOJu0YyYiQwmIFkj3Wf0ft5QCb+PfegIweFUfGQO0/xK358J7ZXe1aup
	XvzO3iI68WOq3NAyJCTTJ0jekc3HlP8QQzi9ghBSu84iNB0ZqXeLEK1S
X-Gm-Gg: AY/fxX6E5X1iVDv4uKsITB8LHPxIrc0WL4fduuQ8Nk9eqISlukQKaxwbbzM3PIug93W
	QTXpQ20Y800Y2pfpy+z47CoG71AYUCKgJ+MBGyVibv94GdEWxeWs052YLq9fCjWvejUrA8NffAS
	Cf/gi8VH9l2wUGOPCfSWFmKRa24mvQGDChkNmpyna3kdb79H5q7G66KsZWZu0Q1idPBjRn0HEJf
	pRuXcCMax/geTXVUS/cxhoeLNwsEmfTUJQ9c67saz6rjb3XiGJOV+XptS611tXyPuXUUUoOpUjd
	wcVmOA/qp59QohUmnNnVaqIMpct6gG6AmcUu6XYNGvx1EGE6l97T0FO/Wru3NXd+GWvEFuMPcE1
	AphZuQc+23b+KkxPX3efpn5VeOsJyJr/9bevIqh8O3UbPmeXl7ncKbNIQync4wTmdYfTKL/b1+z
	L7krbwe0Neq5N0JlFBYoH0h2DbNTen8c84BkTAtNaKRpqrnP50E3xNdGafAPfSpxiCHSaoj7zuK
	p/Q0RwrwurF6o4=
X-Google-Smtp-Source: AGHT+IF92m0t0nWWyjIcNLRTPI9z+3xehzh2T5tPMBCO+4KCBeZt3oWad7zHggAE+KBmxDu+XToavw==
X-Received: by 2002:a05:6214:4a03:b0:87c:275d:adcd with SMTP id 6a1803df08f44-890842db0aemr313955886d6.41.1768299062439;
        Tue, 13 Jan 2026 02:11:02 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-89077267e14sm154746046d6.49.2026.01.13.02.11.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Jan 2026 02:11:02 -0800 (PST)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8CEEAF40068;
	Tue, 13 Jan 2026 05:11:01 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-02.internal (MEProxy); Tue, 13 Jan 2026 05:11:01 -0500
X-ME-Sender: <xms:NRpmaXYmfg_8Okl8R8q0TzR5U5-LehUgBoGwMSQJNWYU_vjm9WA62w>
    <xme:NRpmabmrjOhtjwWP24h6UUqrpBrdKCC4_p4ZfiBvaeprBUR3ZgK9xyWJkI_nMz15U
    9Kyaoi2Bj0FMZf9kU4PF57-aHlokiJio5eMLodMYNhG2z-E_qMjWA>
X-ME-Received: <xmr:NRpmadXbI0JE2UBFKU0HyETqv4YkKyWwAlLaQUrNadGpl7LZ5ij3uoWS>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvddttdehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpefhtedvgfdtueekvdekieetieetjeeihedvteehuddujedvkedtkeefgedvvdeh
    tdenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepphgvthgvrhiisehinhhfrh
    gruggvrggurdhorhhgpdhrtghpthhtohepmhhinhhgoheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrdhorh
    hgpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgvrhdrkhgvrhhnvghlrdho
    rhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmrg
    hrkhdrrhhuthhlrghnugesrghrmhdrtghomhdprhgtphhtthhopehtghhlgieslhhinhhu
    thhrohhnihigrdguvgdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:NRpmadI2QF01QGOjzZDisZyQ4u4jaTMsJ-5QwfofwoHY3SRbo9s0TA>
    <xmx:NRpmaduWq-26Dh4izT8ERDMRkVENFX29XhMTDD3cvn4oNHJXmZIknA>
    <xmx:NRpmaS19XJgnnGdEm33XnhIrx7vY1Xs2qr85A1ixclhS1HfAgN6QUA>
    <xmx:NRpmaVNLD6YMhHo24SxeEPX7O0vAhTLL1WP4-otGyPtD21x6gbDkdg>
    <xmx:NRpmaSW56GNjvF4SCDVWGtEM9jLlqoXYoAwMqbeETWj2SnRTECU_dSMv>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 13 Jan 2026 05:11:00 -0500 (EST)
Date: Tue, 13 Jan 2026 18:10:58 +0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@kernel.org>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>,
	Alice Ryhl <aliceryhl@google.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Benno Lossin <lossin@kernel.org>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [GIT PULL][PATCH 00/36] Rust synchronization changes for v7.0
Message-ID: <aWYaMkUxT46Fmnj4@tardis-2.local>
References: <20260111115808.5702-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260111115808.5702-1-boqun.feng@gmail.com>

On Sun, Jan 11, 2026 at 07:57:32PM +0800, Boqun Feng wrote:
> Peter,
> 

Kindly ping ;-)

Regards,
Boqun

> Please pull the following changes of Rust synchronization for 7.0 into
> tip/locking/core, you can find the details of the changes in the git tag
> message below.
> 
> Thanks!
> 
> Regards,
> Boqun
> 
> ----------------------------------------------------------------
> 
> The following changes since commit a45026cef17d1080c985adf28234d6c8475ad66f:
> 
>   locking/local_lock: Include more missing headers (2026-01-08 11:21:57 +0100)
> 
> are available in the Git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/ tags/rust-sync-7.0
> 
> for you to fetch changes up to ccf9e070116a81d29aae30db501d562c8efd1ed8:
> 
>   rust: sync: Inline various lock related methods (2026-01-10 10:53:46 +0800)
> 
> ----------------------------------------------------------------
> Rust synchronization changes for v7.0:
> 
> - Add support for Atomic<i8/i16/bool> and replace most Rust native AtomicBool
>   usages with Atomic<bool>, and further switching will require Atomic<Flag>
> - Clean up LockClassKey and improve its docs
> - Add missing Send and Sync trait impl for SetOnce
> - Make ARef Unpin as it is supposed to be
> - Add __rust_helper to a few Rust helpers as a preparation for helper LTO
> - Inline various lock related functions to avoid additional function calls.
> -----BEGIN PGP SIGNATURE-----
> 
> iQEzBAABCAAdFiEEj5IosQTPz8XU1wRHSXnow7UH+rgFAmljjIkACgkQSXnow7UH
> +rizPQgAi5rdVoIpjN9BaQtWVHcAwBhbD7WhboxDhsSdEl3yaw0E7OLML5IyupLP
> BUsrI5BAhwUaIpE/4PT9RePLCOeFqCKfz9eyQpb6uEwLVKcx8WESrItrlStqK8dG
> lAZEV07SwAWq/ARsgI02LZnyDQxxBrX8Q4FKZgglpaBxieVXmQjekcSF2W6s3lka
> qWXB7MU38D3DZjKr6Lpp8BjdI7qTNInEZDGtRPncIId+4Jj7V5IpEX/NThyrDLp1
> M0UzXOMzexIfeSm3oz95II6R+GeDpruI6pN8QDtljaTL0Al5/z5yO8Zj9KIPGAl4
> 9JRUJ0pNVrAUljjJ4ap8hIMPlOWqjw==
> =JOZ1
> -----END PGP SIGNATURE-----
> 
> ----------------------------------------------------------------
[...]
