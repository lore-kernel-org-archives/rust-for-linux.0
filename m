Received: from mail-qk1-f176.google.com (mail-qk1-f176.google.com [209.85.222.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 177931BC064;
	Tue, 21 Jan 2025 21:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737494118; cv=none; b=ch+cFXl1zt/Jv2SdIXwRNp8X8brC0VpdiIRRidGPWCqtiOxQDhULvzga+Tx5ZQKoM8aEOKT5LnBABNaui6uf4a/xnhLmwkHu/558vSuuKZLOul5F+rt4TNs4NYrx2DCjB+bqjbF6fRg3UdPxUetBMPaNcpp70TGEXZQHErTg8hE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737494118; c=relaxed/simple;
	bh=QHOzMlKZLUSc1YLevclrOpCrMALw/QjBa3Rd3V0xtOI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cg9VCDBOYncLLNkNyzk2rSd7g/2woLLWrkDldVl+y66JyZTLThSt4OL6mRx++k506OWuoCkBIfevVfWyydbl0Hr+PPB3zCscJAbVNRyB2Jjz/iQXVBBhXgdWG6MLi06gueB5ssTECYzvqz9nTVRvn47OeSD77nJPpHoLujKSmoU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZUrq/dqz; arc=none smtp.client-ip=209.85.222.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZUrq/dqz"
Received: by mail-qk1-f176.google.com with SMTP id af79cd13be357-7b6ff72ba5aso586151185a.1;
        Tue, 21 Jan 2025 13:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737494116; x=1738098916; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jcw9U8QyHkBiOpfJCzEn+eB5p6z9j9190tp3Zky5P4k=;
        b=ZUrq/dqz+T6ChRnwNeXdKTSN47Ym0J6PQm124scEGndGw0t75dq3oKsN0V/o1gE4zv
         pV48x+bZ2XZztGocyV/CemsHyboThKF0p1DrmBARyjm1yuWJDyY9NRcxOI2I+kPa0dt4
         p+PPxqJujSUq/i0/zb08vempvXH0IG1uM18zMAiGkkRK9kfHv9cQo8l7rlzHlVeNhblN
         2Z+eKfoxNRdHM5B7F40wwA5CjMWtlaPbmeWtxgcewTAmuE1aV342LC8pDVNZmyKeRoBo
         O0Kiv5zWAriZNgAS6X0a0W86MQBh0XHNHaA/OVjgL6sR5qA3R94BkF2RvEwM+0kKZawn
         BplQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737494116; x=1738098916;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=jcw9U8QyHkBiOpfJCzEn+eB5p6z9j9190tp3Zky5P4k=;
        b=VasA0VCrh5dBwrKkKsebUPscK70IywWRDg2iuiP1gg+bGdnOrQ+aIOV9QNh10Jw3Cy
         Kh5eeMTff5+dZAsF+aN8bWSF4ixvK1AA9VCPaYEYzNcilqaOjQE1Kjd4Yj9GAPuxQA2q
         S0vE11Jtk70lmpb7TFK9qi+jtyydZAIoqd4Uw1qZpkaiasAFk3SaVi+JmlvxoS7qJ0sh
         dAviTdzwhRNcGgvm9bSJD3RP6jEh/1bQr/Et3n8ojpwDamg7XWuraOPXNCxumR/Lr+DV
         VnyayZAQZfkrdvJuEpW4z/YafKtYCciTkFE/9zXrrQEl9/JRsjhU5DTJtISoXzgx+R1V
         CPmA==
X-Forwarded-Encrypted: i=1; AJvYcCV3ZAyyG4LqORRdBxDXuw0pAQa/3pC4uB1AJwFCMWaJzwWFI5iMc4sSSzJYQ+kddhqVlIEyhclt/LmKE74=@vger.kernel.org, AJvYcCXhhYTtFUf/A8aMPRd4Yhh1CeEdSCdU9/uEgbGydTgMr8xut4Gu7jAsbnVV3+q1wGeNU9/eJxsafXyzxrceHh8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTFrhMRci6s0ONmo1vCncsMYCZJVfpbGg0fy/j1SF1xnWn+xuW
	8DzGpdB3JeECmL4TOuVWopmS1JMw1oIasmlzM3oO2CNoc0g4wq9F
X-Gm-Gg: ASbGncuy5UcEJG4XswURAerqi2+x0jrBB8XR9tUE3kcpqrpxiZJfHcdt1NTNEx2O/bB
	vCSB7qcItiqaiNHLlRgg6ru7orJNiTrkB0neHJSFwjj3pcmQipLvQUBy47PgA7kwmh9Q76dfA8T
	U0z2IlclmICaoKQ8kvR97uwllRJOCyG/Jj7lMBVsSh7koDezZ5/v6BcOzvc3HMuKb1EwarIkKnb
	enkudD33Noc/tYJ6rDmFYesDGzFA0kP87zYAVfprQx9xrOf6G9lFtjFoujTEOMvEhA8CB8DUvN/
	+mSK7UoRxD7vKytB6c1it8qohL44zWwc3M6RmAUxOBPrEbA/w2fzG30pBHAB
X-Google-Smtp-Source: AGHT+IEAx/Hl9gkAuGei3KiuEqZprUGlrttfvyzsdi8CzWYVMLhg1S+/Xz0GEeCVn5e0mJpv6Rzt0Q==
X-Received: by 2002:a05:6214:3007:b0:6d8:a027:9077 with SMTP id 6a1803df08f44-6e1b216fda0mr256497406d6.5.1737494115737;
        Tue, 21 Jan 2025 13:15:15 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e1afc117a2sm54775196d6.40.2025.01.21.13.15.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 21 Jan 2025 13:15:15 -0800 (PST)
Received: from phl-compute-04.internal (phl-compute-04.phl.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9937C1200071;
	Tue, 21 Jan 2025 16:15:14 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Tue, 21 Jan 2025 16:15:14 -0500
X-ME-Sender: <xms:Yg6QZzZE1qYG6kagPCCNa4IgfbrxikVl6Y5RoUeHc0CbrUk5pAEFng>
    <xme:Yg6QZyarQYiMv83kRfXta2hVDVt1efubcBQliik-itUhZxnzkT37M6Ca6Q3mz5uWF
    rFtV3UGYMQy4citdg>
X-ME-Received: <xmr:Yg6QZ19bIrbxYjtxBqGnBUhi_IPLPnqTfXdMH4kR2wxBPHf4IKxYiZd8Hi5H5g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejvddguddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtuggjsehttdertddttddv
    necuhfhrohhmpeeuohhquhhnucfhvghnghcuoegsohhquhhnrdhfvghnghesghhmrghilh
    drtghomheqnecuggftrfgrthhtvghrnhepgfekhfehkeekjefgkefhjeejteekfeejjedt
    leegfedtkeevieelheegjefhgffhnecuffhomhgrihhnpehnvgigthdrphhusgdptghurh
    hsohhrrdhnvgigthenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhl
    fhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeile
    dvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgt
    ohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepuddupdhmohguvgepshhmth
    hpohhuthdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgt
    phhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrgh
    grhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihguhho
    rdhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrdgtoh
    hmpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghp
    thhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehtmh
    hgrhhoshhssehumhhitghhrdgvughupdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhn
    uhigsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:Yg6QZ5qtL02B2exFyc00WVgR-BlJNOtN6LWImSiGQOp4aCj2XILCwg>
    <xmx:Yg6QZ-oKgYUXwxNK4MTPi3k8opqYkVujBYk8eIDxfxVowVKKuG6-CA>
    <xmx:Yg6QZ_R9XkSzDpWMt0eX-CHlg-D8wZNyFkbTBUh4xYF1Gx_LW4epLQ>
    <xmx:Yg6QZ2pq8ijF53eH00Lux8bdv4z4W6275VX5t5OXy05Rjc5CE446zQ>
    <xmx:Yg6QZ_5XO0lLSz4uATW1v4WeX5GodtTItp7usbPDDrE6lJlH0AwvZlo2>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 21 Jan 2025 16:15:14 -0500 (EST)
Date: Tue, 21 Jan 2025 13:15:13 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 2/2] rust: list: make the cursor point between elements
Message-ID: <Z5AOYbZGhgB19KzC@tardis.local>
References: <20250121-cursor-between-v2-0-1b24cd377618@google.com>
 <20250121-cursor-between-v2-2-1b24cd377618@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250121-cursor-between-v2-2-1b24cd377618@google.com>

On Tue, Jan 21, 2025 at 10:14:24AM +0000, Alice Ryhl wrote:
[...]
> +/// References the element in the list next to the cursor.
> +///
> +/// # Invariants
> +///
> +/// * `ptr` is an element in `self.cursor.list`.
> +/// * `ISNEXT == (self.ptr == self.cursor.next)`.
> +pub struct CursorPeek<'a, 'b, T: ?Sized + ListItem<ID>, const ISNEXT: bool, const ID: u64> {
> +    cursor: &'a mut Cursor<'b, T, ID>,
> +    ptr: *mut ListLinksFields,
> +}
> +
> +impl<'a, 'b, T: ?Sized + ListItem<ID>, const ISNEXT: bool, const ID: u64>
> +    CursorPeek<'a, 'b, T, ISNEXT, ID>
> +{
> +    /// Remove the element from the list.
>      pub fn remove(self) -> ListArc<T, ID> {
> -        // SAFETY: The `current` pointer always points at a member of the list.
> -        unsafe { self.list.remove_internal(self.current) }
> +        if ISNEXT {
> +            self.cursor.move_next();
> +        }
> +
> +        // INVARIANT: `self.ptr` is not equal to `self.cursor.next` due to the above `move_next`
> +        // call.
> +        // SAFETY: By the type invariants of `Self`, `next` is not null, so `next` is an element of
> +        // `self.cursor.list` by the type invariants of `Cursor`.
> +        unsafe { self.cursor.list.remove_internal(self.ptr) }
> +    }
> +
> +    /// Access this value as an [`ArcBorrow`].
> +    pub fn arc(&self) -> ArcBorrow<'_, T> {
> +        // SAFETY: `self.ptr` points at an element in `self.cursor.list`.
> +        let me = unsafe { T::view_value(ListLinks::from_fields(self.ptr)) };
> +        // SAFETY:
> +        // * All values in a list are stored in an `Arc`.
> +        // * The value cannot be removed from the list for the duration of the lifetime annotated
> +        //   on the returned `ArcBorrow`, because removing it from the list would require mutable
> +        //   access to the `CursorPeek`, the `Cursor` or the `List`. However, the `ArcBorrow` holds
> +        //   an immutable borrow on the `CursorPeek`, which in turn holds a mutable borrow on the
> +        //   `Cursor`, which in turn holds a mutable borrow on the `List`, so any such mutable
> +        //   access requires first releasing the immutable borrow on the `CursorPeek`.
> +        // * Values in a list never have a `UniqueArc` reference, because the list has a `ListArc`
> +        //   reference, and `UniqueArc` references must be unique.
> +        unsafe { ArcBorrow::from_raw(me) }
> +    }
> +}
> +
> +impl<'a, 'b, T: ?Sized + ListItem<ID>, const ISNEXT: bool, const ID: u64> core::ops::Deref
> +    for CursorPeek<'a, 'b, T, ISNEXT, ID>
> +{
> +    // This can't use `ArcBorrow<'a, T>` as the target type because 'a is too long. It would let
> +    // you obtain an `ArcBorrow<'a, T>` and then call `CursorPeek::remove` without giving up the
> +    // `ArcBorrow<'a, T>`.

I'm not sure whether we want to mention `ArcBorrow<'a, T>` here, because
`ArcBorrow<'a, T>` is a (smart) pointer type, which should never be used
as a `Deref::Target`, otherwise CursorPeek::deref() would return a
&ArcBorrow<'a, T>, which doesn't make sense, and a bit challenging to
implement I think?

> +    type Target = T;
> +
> +    fn deref(&self) -> &T {
> +        // SAFETY: `self.ptr` points at an element in `self.cursor.list`.
> +        let me = unsafe { T::view_value(ListLinks::from_fields(self.cursor.next)) };

Shouldn't this be `self.ptr` instead of `self.cursor.next`?

Regards,
Boqun

> +
> +        // SAFETY: The value cannot be removed from the list for the duration of the lifetime
> +        // annotated on the returned `&T`, because removing it from the list would require mutable
> +        // access to the `CursorPeek`, the `Cursor` or the `List`. However, the `&T` holds an
> +        // immutable borrow on the `CursorPeek`, which in turn holds a mutable borrow on the
> +        // `Cursor`, which in turn holds a mutable borrow on the `List`, so any such mutable access
> +        // requires first releasing the immutable borrow on the `CursorPeek`.
> +        unsafe { &*me }
>      }
>  }
>  
> 
> -- 
> 2.48.0.rc2.279.g1de40edade-goog
> 
