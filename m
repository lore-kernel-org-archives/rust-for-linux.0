Received: from mail-qk1-f177.google.com (mail-qk1-f177.google.com [209.85.222.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 656DB221F06
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 20:44:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766004283; cv=none; b=tnpErXAIkLeUU+fZep9QjNhGdGt1U0ZbdTeqsHHL8l5jbq1xDOE49rm7mvWFBZ95NvCHBXU2+gn7Nhj+7eJJrhtpiDfbtiloWQKkRVuGCh72L4wTjw8nHdOkuDU45koIxKPJ0GUJbPeqdTQ4zy1y16lzHlVTeOzktlpZTYPfKVY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766004283; c=relaxed/simple;
	bh=dGCO3NrcrkcYYc3a3/HNSDA6O9ZMMadlpAfT80L8CZA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Tm2n7/Q62fh6yqOx2pfL9rb4ONtZaw50GMbO0og5OhAbvGXswuvwrdbH3oGHM/e1Im+2JvWuvfa+kYJ+hzSUctS8CpuoOQM/8Heo0ixdeDwP2kAAZlk79EVDyoGtPa3rmkvHawJRQSWVbUh7RndJrWF5NH4wouY5G2/Y0cKZ1IA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qz3xLp9c; arc=none smtp.client-ip=209.85.222.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qz3xLp9c"
Received: by mail-qk1-f177.google.com with SMTP id af79cd13be357-8b2ea5a44a9so670587085a.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Dec 2025 12:44:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766004281; x=1766609081; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Vk1faWwss9rVcD8MpOFxkqobSFJv9Km7ObHYZXM+aM8=;
        b=Qz3xLp9c1VA/MRoPXL5lCoaBHgSfqIsUS4j8/p902CLI/OwKgv8/u+Oml/+kKd9xIf
         U0YZVFVNMS22K+HzzvTy8pscwtn9F9U598g3fpPzzrhFLkID84PHt0PNcPHTaPEmw4nI
         Lo8eCCgzQihpfGfckQD+Z1/cwUM7Ua14q88sfL3NzCd6ZBu5jMRkaPwrHUSQqKFfOjVi
         4WX7QYO9P89xg/dc0VP4SlqOkvpk4HYIcuy97MnwbZTo01GBE1StfPA+Rnr21GdHkqP3
         LnbEkb/MpWOjXnlxptXauhm5uXBo+hv59ZLCkLxzMY6VVA4+SulL3EzfnMGk327XTrGO
         PoWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766004281; x=1766609081;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Vk1faWwss9rVcD8MpOFxkqobSFJv9Km7ObHYZXM+aM8=;
        b=jjcwSbHqhdEkcFQH+OYxr9O3APBVS75wU3auehCslMeDKnRSkCeYAEGOQMmkXskUqB
         GsTwgDxq67/WD9ZQ84iX1Fm3F2V9/0zzq53dbbc8EL4KO80+nOnCkQoZm2OBIZPsT3ky
         6sUnxbVOEYA5+/jMKgFdsOP12+0DUJudaHSmdM48AkSZht4OKQBp2E5twpG2Liea4pTs
         Z8iGk8Ffgthny+Qi88GuGWEKUuMNyJmj8PsXZ7l1/ufwVMoYN3tCKWnQW3uNrQWIWP9o
         SaMRrqyrqpTUdUDY4f2dGZbpw4nCSrSlujlorLu5OjpcmUGJU7Mz7T4Jad9oIVs2ktOt
         idSA==
X-Forwarded-Encrypted: i=1; AJvYcCXGJsOM0xcUmtkS4X8TkmXGTY/NbuxNIACEwK9eyPAYhF/wXYPX0YCXxD70TPthKZAo7+3nM8d7fDw3eKtrFw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3FNYIa92+8qmbKDmQ8TKwIIuysKGzASStHtS2Os4Nbk9WKmKK
	xbdd++4ss7cPBH0A96TgRaxbCwLsxKe1kRQEP6xiS91jD/0M9HFr9sOi
X-Gm-Gg: AY/fxX4XreDK39Im2km3+G3d1Tz+Bd3/WlKdMK8q55vVffMge82SXlHSprWjEOaaX4y
	1ZRcHJc31uh3ZwjbhFjrJl831gpkJ06tL7KgCamOfe0dQ5QQeyfnZgIoIcyCmXUFFHgMJuI7k4R
	1dEgclZPBpeGL+qChEnE4eyJT1eNWWVZnopq1THd81Pxes3nHkHqtBRYJbE6X7eUGQcUoJ+P+nj
	9IWcMQJ3bOSDC38EL9nox7bKIUweriGwZ1PorAi9fYex2ywXBG17gaHwTrSLijMUO4OQ1JgJEbF
	PvcI00T4SMFQfC3GNUpt1M5PN7i7YvZwat5iTS2oEzxUkm/5ns9yX+EIJOM5ziHj8IlapBFUk/H
	cZKIXnbSHidVqQdL658Wh0ui4OI2yKAAB8Isz6Imrz2s6cWs2CCS74RRA7J6GgIewwg6ivE80Tm
	IGpjSqm7Pnu3E59UanAz0qexAS4wTNUAYAns864i2YhxmCGOG6SeBeRStUBt16qVo+5qE2Uj86L
	gKqNE4Q74soA5Q=
X-Google-Smtp-Source: AGHT+IFEFr+T1rfK67Z24UojcmD2eGj+xvKa7e5HAS9FYABYZw0sJvwm+Ypy/qrdM9lw72+pviIbng==
X-Received: by 2002:a05:620a:294a:b0:8b9:93d1:f280 with SMTP id af79cd13be357-8bb399d9179mr2463357985a.1.1766004281141;
        Wed, 17 Dec 2025 12:44:41 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8beeba3a480sm22486285a.41.2025.12.17.12.44.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 17 Dec 2025 12:44:40 -0800 (PST)
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4A02FF4007A;
	Wed, 17 Dec 2025 15:44:40 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Wed, 17 Dec 2025 15:44:40 -0500
X-ME-Sender: <xms:OBZDaa7HY8850iFjOi3ZWsg-H2vTto111da-AqbeqkPn6NAyh4rJ6A>
    <xme:OBZDacFpvK3vkvwZQCH2kBytbLoSYco92o1zx5pyBFjrlb5j3ZfyTpRF7fviZfcJH
    A7Y_1_nRivBVIeIzJw8umKOLJVpdmU2akYCOcStLJ9I6g3sqZgiRg>
X-ME-Received: <xmr:OBZDaVAvo6WLew9kFRhYDr-iQjcYqCz96hXc-KXCd9r1Tzy3kjgrcmwClM83>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegfeehhecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    uddupdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonh
    horhhisehgmhgrihhlrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtthhopegrlhhitggvrhih
    hhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhoth
    honhhmrghilhdrtghomhdprhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtoheplhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtmhhgrh
    hoshhssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:OBZDaRyLNYMOxT3RZH2443TNKsCjRmGjUtjgid7Fl_0zwmJ9ECy41A>
    <xmx:OBZDaZ6m5XXw4FB-oAazaFsbGdyNhjezLZGHD1WAnfb0upVb5iMRfQ>
    <xmx:OBZDaSy4Bhvaj7MvXV8ib7Kvfepf0IOZRt-Se0dM_O8DkpLP5925EQ>
    <xmx:OBZDadcNr0urE4BXYlCYV9qArjZ6ifK-m6YUUJwqiyxoWIDKdqoCbg>
    <xmx:OBZDaXB5XXF_Y1CexDTEzQjHudYQItgYoOvdbwzdOEDx6b3IEytE7trn>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 17 Dec 2025 15:44:39 -0500 (EST)
Date: Thu, 18 Dec 2025 05:44:38 +0900
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: ojeda@kernel.org, a.hindborg@kernel.org, gary@garyguo.net,
	aliceryhl@google.com, bjorn3_gh@protonmail.com, dakr@kernel.org,
	lossin@kernel.org, tmgross@umich.edu,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2] rust: sync: set_once: Implement Send and Sync
Message-ID: <aUMWNthqorDM-ICC@tardis-2.local>
References: <20251216000901.221375-1-fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251216000901.221375-1-fujita.tomonori@gmail.com>

On Tue, Dec 16, 2025 at 09:09:01AM +0900, FUJITA Tomonori wrote:
> Implement Send and Sync for SetOnce<T> to allow it to be used across
> thread boundaries.
> 
> Send: SetOnce<T> can be transferred across threads when T: Send, as
> the contained value is also transferred and will be dropped on the
> destination thread.
> 
> Sync: SetOnce<T> can be shared across threads when T: Sync, as
> as_ref() provides shared references &T and atomic operations ensure
> proper synchronization. Since the inner T may be dropped on any
> thread, we also require T: Send.
> 
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---

I queued this into my rust-sync branch for 7.0:

	https://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git/ rust-sync

Thanks!

Regards,
Boqun

> v2:
>   - update the `Sync` impl to require `T: Send + Sync` with the comment adjusted
> v1: https://lore.kernel.org/rust-for-linux/20251211230919.1303926-2-fujita.tomonori@gmail.com/
> 
>  rust/kernel/sync/set_once.rs | 8 ++++++++
>  1 file changed, 8 insertions(+)
> 
> diff --git a/rust/kernel/sync/set_once.rs b/rust/kernel/sync/set_once.rs
> index bdba601807d8..139cef05e935 100644
> --- a/rust/kernel/sync/set_once.rs
> +++ b/rust/kernel/sync/set_once.rs
> @@ -123,3 +123,11 @@ fn drop(&mut self) {
>          }
>      }
>  }
> +
> +// SAFETY: `SetOnce` can be transferred across thread boundaries iff the data it contains can.
> +unsafe impl<T: Send> Send for SetOnce<T> {}
> +
> +// SAFETY: `SetOnce` synchronises access to the inner value via atomic operations,
> +// so shared references are safe when `T: Sync`. Since the inner `T` may be dropped
> +// on any thread, we also require `T: Send`.
> +unsafe impl<T: Send + Sync> Sync for SetOnce<T> {}
> 
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> -- 
> 2.43.0
> 
