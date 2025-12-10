Received: from mail-qt1-f174.google.com (mail-qt1-f174.google.com [209.85.160.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAFD2316917
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Dec 2025 23:16:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765408607; cv=none; b=TrN//rKwuBzBt9OkkuXmPdyGkca3vYYN1wlCIz/dugRq5kauEV6ItPNEy36JqVgtr4P8UQJyiaqs6y2oKnyj17JFYUGwL2pl0WuZkaQ4U9yodT4x6+97n+7xcIn//WVAa9I5CWo8E8S7htkc0pwDqiGLUb8fwlh9K46Esv439Tk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765408607; c=relaxed/simple;
	bh=l0RtyPHZ+Ix54QifQhLTGhFTA3v+L3EyhfXG/ZqkScM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Xe304JI6VyqtWsjTAe1IQDtF+EXK+iOdgLE+wsNmbD0PX+gM/r5o1p9wT5cJy5Wa1bPd7imuWf2C7nsWM07LVAZgA/OoH+XJmTnaqw92OlAoq0uTQah+ku5XhSz2atPJSlRzU1nd9jWdkghTMkacBgafYkIv4KfSr7ePBRTXGOA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KDXaiWHF; arc=none smtp.client-ip=209.85.160.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KDXaiWHF"
Received: by mail-qt1-f174.google.com with SMTP id d75a77b69052e-4ee328b8e38so2802691cf.0
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Dec 2025 15:16:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765408603; x=1766013403; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=g9fqsZDhXIOU56z8Su7/pzwrmQiHykwN0+E6dAXKTAQ=;
        b=KDXaiWHFoYCmx9MOEuJ6HJjH4R5xgxVrXXIXNG5UC53+wY3JtbRnlrTwcJEYN0HSKU
         TjmEXV4BGrfuoqO/wgSU6VRhYJLk34RmqrpZPJ4iFcfeFbhWNXW0t8ptvCL+BZ7ay32Q
         AMt7KkTfKepY6ULXIUi2Kays1x1QItfsRnw8WdYpjJoknHOhkNNjcmMD6pUjHESl4Ctz
         gUAamW4SnbsuQfZAFXdf1+8jGGtzNOocepe9MHZwpdtEe2qV84rlqZwOJdHNRKrKtRFW
         VSR1rKNHUfhGikQOVbBDN9OS4HeL4dxY/ADW9EOXKRVn7KPwvLbGalrJr6Mk7tMA0y7s
         wRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765408603; x=1766013403;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=g9fqsZDhXIOU56z8Su7/pzwrmQiHykwN0+E6dAXKTAQ=;
        b=w95iaK6x/BcqgxJ0Zmf09G2c9z9kpELj2Qojq2boZZx9/E/2cjxadBY2u3KMwT6vDo
         OuRFo3Cku6htQheJsRzuNLqMeqSagsiPx254IIW4jeKugPBTvIp3XLblzEyqYRMtNGkD
         w1rYIRq58HVvfA/VyuNCiSX/YFUFO8EtGVXHpNI8dXNF3oMRADz5niYU5koFJXex1yIx
         N9EUzyrvHK6vBHsKopYCGOM3IRhE2ma+9WhAbIctFhuj+mOEYa+sQlr/BJQE5pNJ0iSu
         JZ6cxMGdd28/S/RLI6020VX19B/cwCWLgEji7c9WIn0jJo9hDcLFMPdTcLQP0ivCoif3
         ySpQ==
X-Forwarded-Encrypted: i=1; AJvYcCX5dHF5YPQO5ksRn66GbJyBKzb16Niqr2uovGTLRpJDaUdRjF4m4/QIuqLRw4Pq4IpdwfJIVujDBd2QvK9F6w==@vger.kernel.org
X-Gm-Message-State: AOJu0YxbpqNjm3M2hnv86LM0GOuYn5t1iENLDAsAOKPN3Ttlw9Mh6hX+
	/mqhAXWX55ZYxJ52ux6VRRZwOnGvajwb3EMl5s70NkX/nqgD2WNLPgkz
X-Gm-Gg: ASbGnctlRmLHlsXpD5sN/0yRwvVMJuLC9CtcsFWTp0QVG8pw92nmYuoOS+TcB8FaAUA
	KpmjB1xkTWgFKN3X8QcmBH3MoRylH1n9cwrs3/19nsZsWW3It1jU6HMnnyT+BdY0OFoXcvuK/WT
	v4TWcgtatHwp/0lWcsGxZxJHIb+KAqhiQwvi7tiT5BdryF3X72qlNcBkeZAiRiq0kWNo7c4eXe0
	D5dYtffIDLFiIyXBz8/k9Whjc8WNom+LisiRL8RK/HGQkjUtsB/3mWo8LSn9WQV8td4RX26jQBl
	8he1JGgUByvpjHodjkwB/xQ9edrZJr2oEj6L6IR10tFZCNkO4HYgNqObiuNTr8U92zo1cJdbzAs
	pSPBcOmcckLduWW2Y6QTg2jHoAO4EJ1q7L+2rKnZuqyZzZrs08Nx4quOs712Ly3G/HXrlwXqaGv
	+0xdbJ5CzGfXcV2ebDeiw6UVCQpaJdFfgrXD7tjlIFDeu4LhL0jDa5LBFrRLtgdQk2HJnvOKwyg
	VNhabqEWfHzXviTyXZ0bh0Fhg==
X-Google-Smtp-Source: AGHT+IE49Q1CPkwypOMQGX1LOTBFn6NbpnIco2xJUe1xupMtcecpT7JfcSK1W1X5OF2j/YxQRxIWVw==
X-Received: by 2002:a05:622a:251b:b0:4ed:6803:6189 with SMTP id d75a77b69052e-4f1b1b0ff9cmr64425641cf.53.1765408603373;
        Wed, 10 Dec 2025 15:16:43 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-4f1bfb87836sm752521cf.25.2025.12.10.15.16.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Dec 2025 15:16:42 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 5F566F4007C;
	Wed, 10 Dec 2025 18:16:42 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 10 Dec 2025 18:16:42 -0500
X-ME-Sender: <xms:Wv85aVx1qt_nyhZsnUwjFNm8nLAFi2wW_Y8-1gOH0HQEjbNDrE2O8Q>
    <xme:Wv85aVsTf43R829WrEH2UJSQ3hiVg-AC-_aOqoeHCFU7_p7mofQFEzK5HY8ifv1W3
    2ESu5D1wjvy1ZINM98PdJZxOESyrc-4yQ6Q47rAAvQ_f4yOylcMgA>
X-ME-Received: <xmr:Wv85afFvRo3Bnu9CGp9pZD8gwASgm9Qwtx6YJNlpqjSiV6YziO4lsM_wQdIUVvphX0G2Dvr1Ku3TIpbBvN6DEZYDbVsFI2omJW8>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvfeejfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    udeipdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonh
    horhhisehgmhgrihhlrdgtohhmpdhrtghpthhtoheprggtohhurhgsohhtsehnvhhiughi
    rgdrtghomhdprhgtphhtthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpd
    hrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepphgvthgv
    rhiisehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtohepfihilhhlsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepsg
    hjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtohhm
X-ME-Proxy: <xmx:Wv85aT7_TfbLeDV_dXNDhLAN86rCkm3WKZ0eWpDlZUAVV1M6IJd9cA>
    <xmx:Wv85aQxsWh4hY2TEJFcfmBU85CQnZ0a8q2t-hdU8deGrWJrHOhQ6jA>
    <xmx:Wv85aZ0oVuAM2UHJcgBEc-rXf5s6W3DASZlUqP42mu0UTrLac6WAYw>
    <xmx:Wv85ab7gOZhHB9EO2CxZ45ra_qK-Wn3W1HS7rxtf3mlj0-lxivmGNA>
    <xmx:Wv85afaiPaMA-nNTzS8IQziVf0Xr2Oelv9aXFnYssIBANxMDm9pR0WlY>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Dec 2025 18:16:41 -0500 (EST)
Date: Thu, 11 Dec 2025 08:16:40 +0900
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: acourbot@nvidia.com, alex.gaynor@gmail.com, ojeda@kernel.org,
	peterz@infradead.org, will@kernel.org, a.hindborg@kernel.org,
	aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
	gary@garyguo.net, lossin@kernel.org, mark.rutland@arm.com,
	rust-for-linux@vger.kernel.org, tmgross@umich.edu
Subject: Re: [PATCH v2 3/4] rust: sync: atomic: Add i8/i16 load and store
 support
Message-ID: <aTn_WK-ldlzOxBHq@tardis-2.local>
References: <DESI62R10XIZ.245BISU72Z2V8@nvidia.com>
 <20251209.081456.1519886345847572170.fujita.tomonori@gmail.com>
 <DET9DDRLLQYT.1LUXV5C3U6ABB@nvidia.com>
 <20251210.083147.1370409203593259538.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251210.083147.1370409203593259538.fujita.tomonori@gmail.com>

On Wed, Dec 10, 2025 at 08:31:47AM +0900, FUJITA Tomonori wrote:
> On Tue, 09 Dec 2025 09:27:25 +0900
> "Alexandre Courbot" <acourbot@nvidia.com> wrote:
> 
> >>> Can you document this macro a bit, in particular the motivations for not
> >>> leveraging the existing ones (I guess this has to be with the new
> >>> helpers, but following the code through is a bit difficult without
> >>> comments).
> >>
> >> // Since i8 and i16 are not expected to support the full feature set
> >> // of i32 and i64, using the current declare_and_impl_atomic_methods!
> >> // would require refactoring it to handle specific types or splitting
> >> // the definitions. Furthermore, supporting Atomic<bool> will require
> >> // even more significant structural changes.
> >> //
> >> // To avoid premature refactoring, a separate macro for i8 and i16 is
> >> // used for now, leaving the existing macros untouched until the overall
> >> // design requirements are settled.
> >>
> >> makes sense?
> > 
> > Absolutely, thanks! Maybe also give a short explanation for *why* i8 and
> > i16 won't support the same feature set as i32 and i64.
> 
> I could add, though Boqun might have a different perspective.
> 

Yeah, I think it's more of an "undecided" stage. The reasons that why we
want to avoid the same feature as i32 and i64 for i8/i16 are:

1. For some architectures, 1-byte or 2-byte atomic RmW
   (read-modify-write) operations are not supported, they would generate
   worse binary than designing the algorithm with Atomic<i32/i64>.

2. For some architectures, atomics RmW are implemented by lock-based
   operations on C side, in that case READ_ONCE()/WRITE_ONCE() based
   load/store implementations are incorrect, because it would race with
   lock-based RmW for example.

   atomic_add_unless(v, 1, 0);
    lock();
    ret = READ_ONCE(v->counter); // == 1
						atomic_set(v, 0);
    if (ret != u)				  WRITE_ONCE(v->counter, 0);
      WRITE_ONCE(v->counter, ret + 1);
    unlock();

    Hence, we need to make a design decision here, either 1) we make
    Atomic<i8> support RmW and Atomic::<i8>::load() may contain locking
    on certain architecture (that also means you cannot use it as
    READ_ONCE()), or 2) we disallow RmW for Atomic<i8> if they use
    lock-based atomic.

I feel we are not having the enough data to make the call here, 
therefore I would avoid premature conclusion in the documentation.

Thanks!

Regards,
Boqun

> In my opinion, the reason is that the C side doesn't fully support
> atomic operations for i8 and i16. While the C side doesn't support
> load and store for i8/i16, we can easily support them with simple
> wrappers (as this patchset does). I believe that xchg and cmpxchg
> could also be supported easily.
> 
> However, supporting AtomicArithmeticOps (like fetch_add) for i8/i16
> would likely require more than wrappers; architecture-dependent code
> (likely with assembly). I don't think that it's a good idea to
> implement such.
> 
> 
> My plan is to add supoprt for limited atomic operations for i8/i16,
> and then use the i8 support to implement Atomic<bool>.
> 
> Once that is in place, I intend to replace the Atomic<i32> usage in
> SetOnce and OnceLite [1]. I believe the AtomicBool usage in the
> binder driver could be replaced too.
> 
> [1] https://lore.kernel.org/rust-for-linux/20251117002452.4068692-1-fujita.tomonori@gmail.com/
