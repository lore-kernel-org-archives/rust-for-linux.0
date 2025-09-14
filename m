Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E618D21E0BA
	for <rust-for-linux@vger.kernel.org>; Sun, 14 Sep 2025 20:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757883434; cv=none; b=JvkopdKeQU0hMVC5PYAST15Fz6+jD7GvS8l1PFIwF13LtIO1ucM9oeMaKJ3KFB4Y1A4ZIVRRatKZTSm7IKNNQNECUJnSKddSo1YPHu/rvhfViSNIJfkbuigBIGIT6VdroqV2b47cRoewIIWD6I4opNgrzHWXx2uK8N0TtOvh4LY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757883434; c=relaxed/simple;
	bh=E+1Rhf4TtAslOVEyRfpCz7urUP1VaTu8F6OjeI/pzV0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PcxjgL8oFA/QAkgtNjp4F3m1iliL+zbrKQE9NUbBhqYohl7LSxvoiqMuhdYI+5u4ezATE5PiNUeNBVypZRGaiSxuMexFueYnyCN4bf2WZXicWJkt4S9ublrP0FAs40BeSwmIuTPEW3LGM9tbbkeS63VgPUfnEbBDxiQT2+iDYic=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CTcjB1gH; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CTcjB1gH"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-77504ee95b7so10811246d6.1
        for <rust-for-linux@vger.kernel.org>; Sun, 14 Sep 2025 13:57:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757883431; x=1758488231; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=lYzC7DTlBazYH/vrpI5c9K3KG0tzYBKVkyZN0WJVZs0=;
        b=CTcjB1gH7S5mGlHx91tzrqZkCiaZtqZQSlOlv0s9MeUOE60zzW5MRYp3jU1DO1gZCV
         dhiXdSDUY2ZwkbGbRI+YCwRPKfFOmjTKTrjPJ7pGFagOX/fthJ1cQufcY1h6JM6tiDcU
         ieNUC/0CXwB9R0Na9bgx4GvhgaKdQs40PHlIx6VzFcParNR3FRaFslGZ7IMPySA+wXLU
         i+KuMrev0K7/WkQ6SUNLfnoYDHj9N9twfhSjWHwE2psw3rYTJaMwzCKqBDBTuXnJkQOw
         hkPMEIMsfWXOeYgVZMXWbxe+JfpZFQDXyKhR1MK13GZOeeZE8lkiMThyph8oi9gb3OaC
         y/tA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757883431; x=1758488231;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=lYzC7DTlBazYH/vrpI5c9K3KG0tzYBKVkyZN0WJVZs0=;
        b=AQg3p37TXl0SgzQJCpzVJVq0A2yar0t59dMLp6Tq7Yc9Ja/ylfvhvJASECHrTGA+4j
         cYoBDMCpG/rnJ8SGhS52UdX6UszwVKXvXlbH50DRGDfzfBU+cYFr40CUO6OpxK65Sp+Z
         50QNpyTlGYA5adkPnXWgCzTa2IWoO6vHrsEtGp0VIzPWZhrxRA0J45FY9hI3owrmi2d3
         ECP58YPqibWTXBZILiGk801/QSKA4LYjHghNxR0Gyqvz/Gk/OWmrvukhis1bIjng44Pw
         MOvWanedNhj+6I8+ofTHyY/4n8g7WKsxTHoqkQpE69XZaluFZfqsEn2GvpfquPrkdiWE
         7LUg==
X-Forwarded-Encrypted: i=1; AJvYcCXXRNtTgeMB1JqsGokL8Hw9Wl63jc4eaG5oGTMTU/DMBOrTJYVAk7+IHoo0BDoDmnN+IsgKOuZEYKX5nX5XeA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCQ28RfxNvgdiPef9CQ5zsilvsZg1eVWh4iLEY17YkCqSbXaeb
	W3u1rERMBG1e4X97LbLbSaKT2t6hQ99J6nCEwRmj8E164Jl0tMaMF8gp
X-Gm-Gg: ASbGncsNywUYAi0NT5S66NjWXOA7DS0pYS4u5QnBueKzL0PxvG+6mCmEw6562X6drt5
	cITHW85aAHIyAuU8PdFEmSmsA+iJR2PID54282WLNND8Yv0UEG7SV9P/uRWZ4qWrJSRrY/oA2pZ
	TH9tdxvkkuF6+RY1WA/PG+e6Gel1rnLlZ+OJ6wyfLrtwtC5ZnlsXxBcVaR2vZ/ClfeKk61fGs2q
	Q+OD6iXaxFEYrb9pKHZa+ExRJySQgf9geJRGdTWyYSoR9KzCsm3BzYHbcKE9u/lyuupt+Bs/nlf
	1xgR3viyhE47cyTVBX56Zys3VDQQu67GtRHOY547jDRGI2m91uGNcUSzfUJTd0ZMYt7bI3LZ0Qk
	XCZiwiZzEyjT5gvWsh6OrDZuiTuJRl2cDNzALrk3BCQis3azGD/gBxlQ/YZuu9sARnnmCdFRd66
	XjtsJY3jPyK+ADIea/qzVIsfk=
X-Google-Smtp-Source: AGHT+IFwb8QYA51dTPTDUlRdj4ZuYKyJJ+3+ho4CbwnE8QXUiHnNdyvgLPli+R0c1GQPsHhdkVTnuw==
X-Received: by 2002:a05:6214:5018:b0:77c:394f:4580 with SMTP id 6a1803df08f44-77c394f5105mr37329426d6.51.1757883430705;
        Sun, 14 Sep 2025 13:57:10 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-763b6800370sm63337246d6.33.2025.09.14.13.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 14 Sep 2025 13:57:10 -0700 (PDT)
Received: from phl-compute-07.internal (phl-compute-07.internal [10.202.2.47])
	by mailfauth.phl.internal (Postfix) with ESMTP id A2F69F40068;
	Sun, 14 Sep 2025 16:57:09 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-07.internal (MEProxy); Sun, 14 Sep 2025 16:57:09 -0400
X-ME-Sender: <xms:JSzHaOIRsv71NhpZLHqXUc3JKAlS9Ah_ieKzQYgv8HOSIlXtBAgfTQ>
    <xme:JSzHaBXnObaCztPZKhQkyK5mGMi5MgVzCW6yhpwo8aah5JRL73g4z0x6xc-m3_fNY
    fbW75lawyS69E1pIA>
X-ME-Received: <xmr:JSzHaCjA2BULm25Bri64ocYQvXpP-HyCzdTk8tfWfoc7nCNlprW7NyWFxjimHgorLErUVh_xNz62_9_u8Lh_zyuY9lo46WXD>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdefheekfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtudenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeffiefhtdeiudeigfeviedvgeduueekfeegvdelhffhkeekgfdufeeugfefjefg
    udenucffohhmrghinheplhhotghkrdgurghtrgdpkhgvrhhnvghlrdhorhhgnecuvehluh
    hsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgv
    shhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehhe
    ehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgv
    pdhnsggprhgtphhtthhopedujedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepug
    grnhhivghlrdgrlhhmvghiuggrsegtohhllhgrsghorhgrrdgtohhmpdhrtghpthhtohep
    lhhoshhsihhnsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehpvghtvghriiesihhnfh
    hrrgguvggrugdrohhrghdprhgtphhtthhopehmihhnghhosehrvgguhhgrthdrtghomhdp
    rhgtphhtthhopeifihhllheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhonhhgmh
    grnhesrhgvughhrghtrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdho
    rhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtph
    htthhopehgrghrhiesghgrrhihghhuohdrnhgvth
X-ME-Proxy: <xmx:JSzHaNvGer0ixFUgKKlDhw0LW9B04pndaPJeIldcJA00vo03TGYBdg>
    <xmx:JSzHaCw3VeV2-R-f7KMA66fZwlYWvIErwTVE1xvJa78Adb3n2-uWkw>
    <xmx:JSzHaCaoX_Oh9PjABqJEKtn0fjooiLTW8bv4zGFUPmXpLVt93pGT3Q>
    <xmx:JSzHaBV7GdF6-sM8vNRLc-hXyrntYZKmQvTVJyBztX30JGp4vH3HRg>
    <xmx:JSzHaDHiq1zp2fQ2qxGFx9wXFc8lKIVzj9V7aFHRtCK0NT8Ra40nNg7K>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 14 Sep 2025 16:57:09 -0400 (EDT)
Date: Sun, 14 Sep 2025 13:57:07 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Daniel Almeida <daniel.almeida@collabora.com>
Cc: Benno Lossin <lossin@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>,
	Waiman Long <longman@redhat.com>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 3/3] rust: lock: add a Pin<&mut T> accessor
Message-ID: <aMcsI14mzwubhT6e@tardis.local>
References: <20250828-lock-t-when-t-is-pinned-v2-0-b067c4b93fd6@collabora.com>
 <20250828-lock-t-when-t-is-pinned-v2-3-b067c4b93fd6@collabora.com>
 <DCK43W485VCY.3KE72NNMDP32D@kernel.org>
 <BD4724FF-4AB7-4551-B71C-C22E6E709F19@collabora.com>
 <aL47zBoNpvjYxec5@tardis-2.local>
 <A2534940-B847-40F6-8420-4ABEAE1D9A39@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <A2534940-B847-40F6-8420-4ABEAE1D9A39@collabora.com>

On Tue, Sep 09, 2025 at 04:50:19PM -0300, Daniel Almeida wrote:
> Hi Boqun, sorry for the delay,
> 
> >>>> +
> >>>> +    /// Returns a pinned mutable reference to the protected data.
> >>>> +    ///
> >>>> +    /// The guard implements [`DerefMut`] when `T: Unpin`, so for [`Unpin`]
> >>>> +    /// types [`DerefMut`] should be used instead of this function.
> >>>> +    ///
> >>>> +    /// [`DerefMut`]: core::ops::DerefMut
> >>>> +    /// [`Unpin`]: core::marker::Unpin
> >>>> +    ///
> >>>> +    /// # Examples
> >>>> +    ///
> >>>> +    /// ```
> >>>> +    /// # use kernel::sync::{Mutex, MutexGuard};
> >>>> +    /// # use core::pin::Pin;
> >>>> +    /// struct Data;
> >>>> +    ///
> >>>> +    /// fn example(mutex: &Mutex<Data>) {
> >>>> +    ///   let mut data: MutexGuard<'_, Data> = mutex.lock();
> >>>> +    ///   let mut data: Pin<&mut Data> = data.as_mut();
> >>>> +    ///  }
> >>> 
> >>> The formatting looks off in this one, there should be 4 spaces of
> >>> indentation here; there are also 2 spaces in front of the `}`.
> >>> 
> >>> Also `Data` implements `Unpin`, so you're not following your own
> >>> recommendation from above :)
> >> 
> >> I´ll fix this :)
> >> 
> > 
> > If the fix is small, feel free to send a diff and I can fold it when
> > queueing (i.e. no need to resend the whole series). I'm trying to send
> > it to tip before -rc6 so there will be some more tests. Thanks!
> > 
> > Regards,
> > Boqun
> > 
> 
> 
> This should address what Benno pointed out:
> 
> 
> diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
> index 7191804a244d..cb00fdb94ffd 100644
> --- a/rust/kernel/sync/lock.rs
> +++ b/rust/kernel/sync/lock.rs
> @@ -258,13 +258,13 @@ pub(crate) fn do_unlocked<U>(&mut self, cb: impl FnOnce() -> U) -> U {
>      ///
>      /// ```
>      /// # use kernel::sync::{Mutex, MutexGuard};
> -    /// # use core::pin::Pin;
> -    /// struct Data;
> +    /// # use core::{pin::Pin, marker::PhantomPinned};
> +    /// struct Data(PhantomPinned);
>      ///
>      /// fn example(mutex: &Mutex<Data>) {
> -    ///   let mut data: MutexGuard<'_, Data> = mutex.lock();
> -    ///   let mut data: Pin<&mut Data> = data.as_mut();
> -    ///  }
> +    ///     let mut data: MutexGuard<'_, Data> = mutex.lock();
> +    ///     let mut data: Pin<&mut Data> = data.as_mut();
> +    /// }
>      /// ```
>      pub fn as_mut(&mut self) -> Pin<&mut T> {
>          // SAFETY: `self.lock.data` is structurally pinned.

Applied and queued:

	git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git locking

I also remove the part in the commit log where it mentioned about pin
projection, since the pull request for that is already created and
merged. Thanks!

I will give it some tests and see if I could send a pull request to tip
early next week, so it can be in v6.18.

Regards,
Boqun
