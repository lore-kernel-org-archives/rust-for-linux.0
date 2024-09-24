Received: from mail-qv1-f41.google.com (mail-qv1-f41.google.com [209.85.219.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C4A513DBBC
	for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 23:34:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727220846; cv=none; b=dmewJst7Ej3co2UIRM9SXJ6VXIbtOOmHky36PLzIAOX/PzAV9l4RumGQl15xgWX/6MlkLmtcYIGWb+rBhxMea6T6Uf1elkCO5KY4NYGB3Q4ykrVSzitn8qqjiUetLcyNhWvJK5Mq5+9cQZbGkZJFNPPnTYENs8Big/yOMsHKvPw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727220846; c=relaxed/simple;
	bh=XhX8GUAsBEnzgXRyK+f8s5DKsQUR/v+eHfEB0nBMSA4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k1zZiIXtkkVyprDX88n2K6XKcx2ClGBxPce9TVywx/cVW61f+nHOT4xGENCTpZRKRClD05GedLih7H1umHcestD/phIkyO1SEd1n+iYkqbGXlzU4a0+W5w+xsOMIOQuqpV8c1EfdCJp8QxuqwUyuNb4P+jv5azcnHWqaiWQVhh0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YvpFOd4a; arc=none smtp.client-ip=209.85.219.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YvpFOd4a"
Received: by mail-qv1-f41.google.com with SMTP id 6a1803df08f44-6c36ff6e981so49724486d6.1
        for <rust-for-linux@vger.kernel.org>; Tue, 24 Sep 2024 16:34:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727220844; x=1727825644; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Y8M8n0cj9zYAMTPaQgISF+EnvGImV2dm0T+zi+7ljBI=;
        b=YvpFOd4azeCO0hOQAnV+Zp0cheWnlfIa/OuqLQDU2ScO3FTflh7WFjW/jWj+jiJyIS
         XRzXewFFQwsV7RxfZ6+cmJYRqhYlorEFWntwP40Hr0SsP8u5skAvhHZu3GhE4+hwrWRJ
         H3f6G34tyGJNhwq/oXngfSsIOa2er7gC+c/DCgrT74xPApg7GjRuBztscxPsNXxMvySG
         5i/xx3onE/NOFslpnGhxOyYNoO2OgIccDqJKi17bQzrDnCrCSzJP9lQatgsUtOWcXxFK
         /IVJIrov9EMapTxSMEyv8sPTCrS4EH+q0Ssyk7WULPQ+/E36/EM4PHHBJN9Sx7cC5/bI
         Im3A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727220844; x=1727825644;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Y8M8n0cj9zYAMTPaQgISF+EnvGImV2dm0T+zi+7ljBI=;
        b=nrppXmFldZUnCdZku2tH9R9y4yImE6+tx8G2h2qPWpFGgfH3pYpEdTL+LNTm239I3k
         J/twP7HMM9smEPrcP01HZW50NWUqmMrxkj0H0ZQ6ZQYYrIW/nFpDjFdGI7ou7D/pjxZa
         ajqVZF701b3r3JGR+x0Z1Zt7bs0kMyB1JT2ERbyGreCgAk9oW2bs35gCrZn1cAsuCbb1
         VMKn9udtd6RJo3VcOd+q25JWvi2jGFJ1mQn889KyhSyr3zSIrmBcQByupqujkMQju9fN
         rVl7uwpnIyrrGXfEbFQcEbNKEIFxSI2zDEEOr3q0H5ekdC/FGUPI7A6jWQ62QnAw2naR
         H0oA==
X-Forwarded-Encrypted: i=1; AJvYcCVikdZHSdI1FC1tVOwrA43kTitASnNt+IOonPDhyf1aghqKjObi0sDDc4yvxtppx+Wm1YhzzmoylGMBBnhN0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyOZw7jN7nN7/z5FvLX8VwzmS6jxo40WAedBAggiaAkSZ5KHjVP
	o1rcVm5KwhwFh8g6Aor+OC7rZsdWLNRbXwcsjtgxBdeKCixx5+H4
X-Google-Smtp-Source: AGHT+IGj+oNTIsKgipCmY5aFfd4azhhFG8NLQagbsy0gL4vnypxi0QnwC08Jd/Vi/7cDRs9OPMOTlg==
X-Received: by 2002:a05:6214:3d08:b0:6c5:508d:7f81 with SMTP id 6a1803df08f44-6cb1dd6860emr16787346d6.26.1727220843905;
        Tue, 24 Sep 2024 16:34:03 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6cb0f552c0asm11235996d6.86.2024.09.24.16.34.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Sep 2024 16:34:03 -0700 (PDT)
Received: from phl-compute-09.internal (phl-compute-09.phl.internal [10.202.2.49])
	by mailfauth.phl.internal (Postfix) with ESMTP id 99E5A1200043;
	Tue, 24 Sep 2024 19:34:02 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-09.internal (MEProxy); Tue, 24 Sep 2024 19:34:02 -0400
X-ME-Sender: <xms:akzzZv8E7E3eavvu_64QtAvk82V4CNiud71GliPzaQ1S_4Y67GcofQ>
    <xme:akzzZrtWBT8u6dndC0D5N7xNNCQduYFcTVPYL5NKZpp6aGtzBhPv3HreIvMkdd5-g
    _XE9rkyr6JzkLshiQ>
X-ME-Received: <xmr:akzzZtBH9ratwBx1cGxuKVrE-AgwGzLILn3x5IK2gPaFeqhWmPYNbvC9UPKoow>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddtgedgvdegucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtrodttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeejffegieejvddtgfekkefhjeegjeevuedugfeh
    fedtkeffjedtleeiuefhvdefgeenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuve
    hluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdo
    mhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejke
    ehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgr
    mhgvpdhnsggprhgtphhtthhopeelpdhmohguvgepshhmthhpohhuthdprhgtphhtthhope
    hgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopehfvghlihhpvggplhhifhgv
    sehlihhvvgdrtghomhdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtg
    homhdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegs
    vghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtphhtthhopeifihhllheskh
    gvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhonhhgmhgrnhesrhgvughhrghtrdgtohhm
    pdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkhgvrhhnvghlrd
    horhhgpdhrtghpthhtohepsghoqhhunhesfhhigihmvgdrnhgrmhgv
X-ME-Proxy: <xmx:akzzZrffBAT_B73xsTKA-t-Ri0e1zj_7q6pEdEZxFPfms0-k67ucwA>
    <xmx:akzzZkNvCUISKjB3XBVPqBcRTEcDHZofH3TUyKcYKWWb-1lDN_OFJw>
    <xmx:akzzZtktpcSjmpfPEo-feznD1c4PYhBQqXeIvuGlrdZyTeZySy71bw>
    <xmx:akzzZusMLwahUeJS7_EgkUI71cEgyb5AhpiUTJQz819GbxdYmJuBNA>
    <xmx:akzzZutu-KI2SbOVLpnIkBhlaGU0fJxW1d_W1w4bcweUf5FbOGng1jA7>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 24 Sep 2024 19:34:01 -0400 (EDT)
Date: Tue, 24 Sep 2024 16:33:20 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Gary Guo <gary@garyguo.net>
Cc: Filipe Xavier <felipe_life@live.com>, aliceryhl@google.com,
	ojeda@kernel.org, benno.lossin@proton.me, will@kernel.org,
	longman@redhat.com, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: add trylock method support for lock backend
Message-ID: <ZvNMQBrFTDNKPiFe@boqun-archlinux>
References: <DM4PR14MB727673292DEC9134C3FE559CE9672@DM4PR14MB7276.namprd14.prod.outlook.com>
 <ZvJkFr6kdVx8kIMq@boqun-archlinux>
 <20240924212415.06aec709.gary@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240924212415.06aec709.gary@garyguo.net>

On Tue, Sep 24, 2024 at 09:24:15PM +0100, Gary Guo wrote:
> On Tue, 24 Sep 2024 00:02:46 -0700
> Boqun Feng <boqun.feng@gmail.com> wrote:
> 
> > On Sun, Sep 15, 2024 at 12:23:39PM -0300, Filipe Xavier wrote:
> > > Add a non-blocking trylock method to lock backend interface, mutex
> > > and spinlock implementations. It includes a C helper for spin_trylock.
> > > Rust Binder will use this method together with the new shrinker abstractions
> > > to avoid deadlocks in the memory shrinker.
> > >   
> > 
> > Getting better, thanks! Please see below:
> > 
> > > Link: https://lore.kernel.org/all/20240912-shrinker-v1-1-18b7f1253553@google.com
> > > Signed-off-by: Filipe Xavier <felipe_life@live.com>
> > > ---
> > >  rust/helpers/spinlock.c           |  5 +++++
> > >  rust/kernel/sync/lock.rs          | 16 ++++++++++++++++
> > >  rust/kernel/sync/lock/mutex.rs    | 11 +++++++++++
> > >  rust/kernel/sync/lock/spinlock.rs | 11 +++++++++++
> > >  4 files changed, 43 insertions(+)
> > > 
> > > diff --git a/rust/helpers/spinlock.c b/rust/helpers/spinlock.c
> > > index acc1376b833c..775ed4d549ae 100644
> > > --- a/rust/helpers/spinlock.c
> > > +++ b/rust/helpers/spinlock.c
> > > @@ -22,3 +22,8 @@ void rust_helper_spin_unlock(spinlock_t *lock)
> > >  {
> > >  	spin_unlock(lock);
> > >  }
> > > +
> > > +int rust_helper_spin_trylock(spinlock_t *lock)
> > > +{
> > > +	return spin_trylock(lock);
> > > +}
> > > diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> > > index f6c34ca4d819..f4e51a5a1f23 100644
> > > --- a/rust/kernel/sync/lock.rs
> > > +++ b/rust/kernel/sync/lock.rs
> > > @@ -58,6 +58,13 @@ unsafe fn init(
> > >      #[must_use]
> > >      unsafe fn lock(ptr: *mut Self::State) -> Self::GuardState;
> > >  
> > > +    /// Tries to acquire the lock without blocking.  
> > 
> > As I suggested in v1, "without blocking" is not accurate here because
> > a lock can be a spinlock. So you can just remove it. I think the word
> > "Tries" itself implies "neither busy waiting nor blocking".
> 
> It seems that mutex_trylock contains a loop, so it's not
> exactly wait-free.
> 
> Maybe `blocking` is indeed the correct word here?
> 

Function document should be helpful and general as much as possible.
The cases where try_lock() is needed are mostly (also according to the
commit log) avoiding waiting for the owners infinitely. So when users
call this function, instead of "blocking", the thing they care most is
whether this function would wait for the exising owner (if any)
infinitely. And I think mention the behavior around "blocking" is at
least unuseful maybe also misleading.

Perhaps I made a mistake by calling "without blocking" "not accurate",
but my read of "without blocking" is "otherwise (when using the other
API, e.g. lock()) it might block", which is not the case for real
spinlock at least.

Does this make sense?

Regards,
Boqun

> Best,
> Gary
