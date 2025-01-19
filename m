Received: from mail-qk1-f171.google.com (mail-qk1-f171.google.com [209.85.222.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC68813C9B3;
	Sun, 19 Jan 2025 17:51:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737309068; cv=none; b=Xnquwz9J8YWvv+oNEwry3PbS0/wAiX8nEe+frQVYtLFDeDRS19rYtZXgJOBVme4CHhobJGQrcHMonuL5cmIbzcZW12Cz5Zphgih3rb0XUqE3hHq4kPX1evR6lqNeaNgC+qu2gO+CjZuI5u7H+wd6IT7CW87ZubCsRcavEs8e/XE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737309068; c=relaxed/simple;
	bh=4R0jenqwaF+HoEl/UA7wfQV05sPAffHKNhpviQxaMpk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=V7eJShEbr3tV1dO6e9/+ysonEKOPJeeC7stOFjvGOcNwZB1Xwp5PXtw/Z2mBbzEYHxzoiJYK6cG6W5EA43zpf6luJWHLRht0Ga2pBjQJ30Nbf+MABFTxyzK/4TFgCtlUzm2fC2ijNcVwva0plFl9solPNZUith1SyogTcjEo9FA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bgRWrjzf; arc=none smtp.client-ip=209.85.222.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bgRWrjzf"
Received: by mail-qk1-f171.google.com with SMTP id af79cd13be357-7b6ff72ba5aso363712085a.1;
        Sun, 19 Jan 2025 09:51:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737309066; x=1737913866; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=Eob8FF1frnbw5Zlnu5FB/I8cA/uX2wtiZsLngag8gUk=;
        b=bgRWrjzfvVGOcPycIKns6lr2XH2OhHSJSMjWSa7RyASiXn39yBr31X9wGKOEfTqb4C
         HfMoFEGZpB1vFcoSwU4Tmo58VGIcVHgtBpHRKWrzKOG5zmTNppuzIbDxDFAMTCe1dx4l
         b4eL02eKaH2zkJa6NCpH5dAffpAOI7xufjZ7R5qZPldIJc/sv7PBlYINkwFhzlt77Xa5
         jD6/gqLbasprzGY//X6yUDiEo8CH8N/G9ofE4lDxC3U502b4yf6f/1tngKmH2MEoWr7i
         /YMT2DF1+DwsH32kXU4GoQ+7LZbjsechto0MVa59etaU9MXXZpOKWtL6Tgz03sf0FVkx
         uenA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737309066; x=1737913866;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Eob8FF1frnbw5Zlnu5FB/I8cA/uX2wtiZsLngag8gUk=;
        b=EVyKZHJ3AbtHFWR2hN7MwVbVmBy4jzynx4ZeuXXmd2z7P6IEQDaIhZo4YSwKjsEIeI
         gJrd1o5q2GkkkpJVHtYu4o0k0dihAsb8uzddCkLVKyHNFIxjygGJAinR4Ulwj9xk48vH
         aBU2X5OJP/4k063iVEtTaS5q2TzQx6diRQHyEPN2yZw9FYaiaUU728IPJz8lNES69h7R
         aBFRyJ7xh4TDYmYCrC0kOPzXigtp0ezW8/8sx8iuWqfY0wVC9rWDvVhag3HFFeebOMEY
         fftOsmxbK7YIdW8ZTINOyClvRenuQDS7Psj8TNPe+o6hjJo2MlsHrlKBn802n32rqFLm
         m+cA==
X-Forwarded-Encrypted: i=1; AJvYcCVQiRWcX4iuZ3BAv8lVqdlhCmpGqntVztWseboIgvBXSahmuFfTiRlY6/WO4wdAL2W0YLKJCv60oyAWcSI=@vger.kernel.org, AJvYcCXavujtDpTK8IjXzy61eLhu8NAP7F1T7GknCXbi6mVG5Zn1bFz0aRL9sco55pyTA4bm6DUzlRg5QZz4iHmGrAg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwbqrR0v83BitotYFp1zYR3pRfaagsXVVT0UitvK4r+KvAtX4Yy
	jEXEqZaM+5kUaq4dVY/6SIj86U/6l/5PGoDA4c5go0xuUpph7gBf
X-Gm-Gg: ASbGncuzAAoiZjC+SHptSxzmM6DrVO76NXz0GM3IppX8QjYPOo6yzCiYfXL3gho+bcX
	OHpywgL0k2ivmb/Z67hSYJewWw/fLsw6S+lKmV9sXmJ0nZc9fKMdp2oPwDR9HY6Rkbnc0991br1
	rb2kmnKXZG3mAgcQuSpXSH3McK1PI38ltJVA2i+r1ofng+P/gTS3HVR+/Ml5lLvMAO4SvYJ1Xs/
	OlC+Dt6/tdKk1sAGdvDPD8cQK9xC/vSoIvb+BfZsgswlbi50jig+Wwi6iehi9y8ncP1XDWU0VLz
	W6feIJCvcbqpCMq9Lg7mWT2HLD5XrlRDKvzmn56d0E0nt86iGX8s2Zf0ja4x
X-Google-Smtp-Source: AGHT+IGdWtopTkNb6QRkZFDXJunfFBaougrTRTW4/Zwbc02Obcn/Iqm8eFYLs5drxOmxYZCEAf5nGA==
X-Received: by 2002:a05:620a:19a1:b0:7b6:6701:7a4d with SMTP id af79cd13be357-7be6328a7e0mr1831028885a.56.1737309065690;
        Sun, 19 Jan 2025 09:51:05 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be6147eccdsm346456285a.27.2025.01.19.09.51.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jan 2025 09:51:05 -0800 (PST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 794001200074;
	Sun, 19 Jan 2025 12:51:04 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Sun, 19 Jan 2025 12:51:04 -0500
X-ME-Sender: <xms:iDuNZy2FijQ8LMekeqAdpQl1Z8JoqJmMAFHqbcMXwsgNwHuxwToKEw>
    <xme:iDuNZ1E-E-YWv-wIfOkfn4H1sphA7nT40b2Mu09UN5caM5G1PlDH854ZgP-m423e8
    x-Yaz0FF9VPm8VnWA>
X-ME-Received: <xmr:iDuNZ66mOui8-rVOcTuBKaQIzhdlPjgAYtgsczeCUYAChDzzLt7dO4kW4r4>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudeijedguddtgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpeffhffvvefukfhfgggtugfgjgesthekredttddt
    jeenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeevgffhueevkedutefgveduuedujeefledt
    hffgheegkeekiefgudekhffggeelfeenucevlhhushhtvghrufhiiigvpedtnecurfgrrh
    grmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgr
    lhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppe
    hgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepuddvpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvg
    drtghomhdprhgtphhtthhopegurghnihgvlhdrrghlmhgvihgurgestgholhhlrggsohhr
    rgdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtth
    hopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgidrghgrhihn
    ohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtoh
    hnmhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothho
    nhdrmhgvpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehtmhhgrhhoshhssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:iDuNZz24BGTMp-7ffR3P9kNXgs7ti7KrbI-Lt4Qx-fAiEiOa4cfCVw>
    <xmx:iDuNZ1EECc6gZxqFQpqTMHrbIfuzxWTWVx1b0y4pSr_QhQIXepLTZg>
    <xmx:iDuNZ884So1XmZl0MKcP5ys3aC3CAJxy0tf6iHIZNmOz1aUjf2PgUg>
    <xmx:iDuNZ6m7FSsDQPZHY5S8JOsWgcWSumTcdcJB0e4jF_Q0DbwGb9CozA>
    <xmx:iDuNZ9GJV3VeXOrepA7e4jMuhASS_WmNocvliGlvU51uPykMok-qsYmv>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 19 Jan 2025 12:51:03 -0500 (EST)
Date: Sun, 19 Jan 2025 09:50:50 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>,
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH] rust: irq: add support for request_irq()
Message-ID: <Z407egxOy7oNLpq8@boqun-archlinux>
References: <20241024-topic-panthor-rs-request_irq-v1-1-7cbc51c182ca@collabora.com>
 <CAH5fLggjAu+YPBxJh0_K933McnnSC=pEBhVV9YxMbUGzukE3ng@mail.gmail.com>
 <04864DC4-FA5B-4D7A-8EE5-BDA1E8F88007@collabora.com>
 <CAH5fLgiaVg1+PZxGr0Y_oyu9pJfTSRuN9n4EomFGhnvnZXC4cg@mail.gmail.com>
 <20499935-B328-4DE3-AFBF-B692FA3434E5@collabora.com>
 <20250115113836.18992e92.gary@garyguo.net>
 <71A92388-A636-47F4-9B1C-0154D9AA9839@collabora.com>
 <CAH5fLgiOASgjoYKFz6kWwzLaH07DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAH5fLgiOASgjoYKFz6kWwzLaH07DqP2ph+3YyCDh2+gYqGpABA@mail.gmail.com>

On Thu, Jan 16, 2025 at 09:29:44AM +0100, Alice Ryhl wrote:
> On Wed, Jan 15, 2025 at 1:31 PM Daniel Almeida
> <daniel.almeida@collabora.com> wrote:
> >
> >
> >
> > > On 15 Jan 2025, at 08:38, Gary Guo <gary@garyguo.net> wrote:
> > >
> > > On Tue, 14 Jan 2025 15:57:57 -0300
> > > Daniel Almeida <daniel.almeida@collabora.com> wrote:
> > >
> > >>>
> > >>> It's not the pin_init! stuff, but the Opaque stuff. If it fails, then
> > >>> it runs the destructor of Opaque<T>, which does *not* run the
> > >>> destructor of T.
> > >>>
> > >>> Alice
> > >>
> > >> This is pretty unintuitive if you take into account trivial examples like
> > >>
> > >> ```
> > >> struct Foo(T)
> > >> ```
> > >>
> > >> Where dropping Foo drops T.
> > >>
> > >> Is there any reason why dropping Opaque<T> doesn’t behave similarly?
> > >>
> > >> — Daniel
> > >
> > > `Opaque` means that "this is a blob of bytes and don't touch it". It
> > > can be uninitialized, so no meaningful action can be performed when
> > > it's dropped.
> > >
> > > Best,
> > > Gary
> > >
> >
> > I really think that the documentation for this type has to be improved somehow.
> >
> > How is this a blob of bytes that can’t be touched, if it gives out a *mut T?
> >
> > I think I’ve consistently seen code that either accesses or mutates the inner T through
> > the pointer.
> 
> It's not a problem to give out a *mut T. A Opaque is a blob of bytes
> that *might* or *might not* contain a valid `T`. When you dereference
> a raw pointer to the inner value, you are unsafely asserting that
> *right now*, it does in fact contain a valid T.
> 
> The problem we're running into here is that Opaque is intended for
> wrapping C types, but you're using it to wrap a Rust type instead. I
> think we should have a new container type called `Aliased<T>` defined
> like Opaque but without the MaybeUninit.
> 
> #[repr(transparent)]
> pub struct Aliased<T> {

Hmm.. I feel that `Aliased` is a name that reflects too much more
compiler/backend details other than programmers' need. That said, the
best I can come up now is `Shared<T>`, which indicates the field is
always shared therefore even a &mut could not assume noalias.

Regards,
Boqun

>     value: UnsafeCell<T>,
>     _pin: PhantomPinned,
> }
> 
> This type can then serve the purpose of a Rust type that might be
> accessed in weird ways, but *is* guaranteed to hold a valid Rust type.
> It's destructor will run the destructor of T.
> 
> Alice
