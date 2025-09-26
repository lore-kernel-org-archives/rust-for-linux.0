Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7F2021CC71
	for <rust-for-linux@vger.kernel.org>; Fri, 26 Sep 2025 15:44:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758901491; cv=none; b=PqKJejKK0jaLM5eKZByrNBm1FscCPMbu6YdbCHYhXPpkzjpxe0vdAaLnDl7Kek9YAs8J7lJPUXD2ygoyQ7+SQponL9mBMQMzXdjwyqFeTZ86N9wzZyxpCvZMumsNBOjp+bnWGmOu8dJ4vGxepdiIEbmHkAMCgzKDiUgae7a4JLY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758901491; c=relaxed/simple;
	bh=gw8GlEm/pMe/T6lV132M5o7O/nbVio5JrXJlGluzWjI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TatjS81tBpn3NInxhJe4Pv4UJgM63ejW1pHjoRtkQ64Jh3oMp19KUfP5m7bVccMHIeaHs/Bxf/RT9KvqN2EpqOZ/wFhZiH9/OOHEjnSivBKDMAy6rXfRgkSCY2WJwdRCqoYhAC+Su0p91OGCOShDfZffGt6vIxPu5jPrFO5O6zc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WjzZa+Hc; arc=none smtp.client-ip=209.85.219.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WjzZa+Hc"
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-78febbe521cso18018946d6.2
        for <rust-for-linux@vger.kernel.org>; Fri, 26 Sep 2025 08:44:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758901488; x=1759506288; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1mcGhhHjp2eXgOL7P5TYM8JSLgVlfC9igU21PobzEN4=;
        b=WjzZa+Hc2Bvs4HPFJ4BTqH0d3NnRe7jnmlv4orJF6xTVdUGTr04GIzSdSMtglozzn0
         qHP4h6h9tzHV7fNtgTEGXM/3sO0O8NErtBicCRpsFBZ6ZP6/cSxl3DIb7IC4IjiXDl/x
         0GRS/PIp4kp+o9rJv2L39VRZdhTtini8wK9dMe7LIodr0+w/kUHdFovHMjErzhRdPeJs
         IYxMSIZMzLRUAEDWJbT2V1VvUIQKhJYFpkN0YMXjiROiwNFGB5A8LLPkkNYxZQAB/6Zu
         tAGvFT9EPSRX8Tyd5kbiAH60cNYht1SrcNLGJ9HMhUG5YPO+O3J89A2/WsVZjxDSKk4Z
         fgCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758901488; x=1759506288;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1mcGhhHjp2eXgOL7P5TYM8JSLgVlfC9igU21PobzEN4=;
        b=EVGjbLcNewMOorrUspFvvTwwaGPc43cTFMARuPrYAc93dh07yaKGjncUpKdgdIBSHO
         ZErDhjCGOTkaFCIQFcKjrzgjhonSr5HT9xuf5Vr25tnfbEwXdmoH8tYrmTS/M+ZQ3RCB
         XH6RxgznMik/VvnrrpuNhOz+V8Qb89jzz/cJk2tJugfhEfzYGu8YEnsr9vmX4frHHe+n
         0kQ9QKWrSUwvqjDzviRMXm053F3vISsQcEIVJY4zybJyerTtVFh0a69NYswCg9VxvFVt
         ON6PM+7OkWVqNvghWKtHsVG5koMl9T9X2xycCQ3MEie4z7gYu9+1YQ8IKggXxmfyBVdP
         hD2A==
X-Forwarded-Encrypted: i=1; AJvYcCXtxS46hav02McEVI2ilo3umlxNxjtyy3zhmRH5sJ4wdGf2bBT5v2XL3TkzddzMTXRJQIG5G9pxnSqqQOQlxw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnfDN6X0HwcQTJfmFIwk6j/YC2q6YiIv3HojUMvr7WYRREkkio
	6n56N1tKat2JlWh24fnswwGWv8IDP9Cxy9d1G2uaQasLTGSS4DCJGnJk
X-Gm-Gg: ASbGncvtmNceyS19kmXbLfxWplnZbO5USeTn6s8uKOm8qNM2va3Co8w57AGO+Hi2bxv
	a2AAxNICvmFsqI5tx+Qjg5EZ4WRyTlZ2d2R5Me0db0fsnVTG+BxGZFore+YEzziga050v0nGJhl
	zY+QCxgNZ+wpqZ9jBlYH9XRRt6GkKghbr1PJVmGuhPaM66CrCJbm79mJGY76UjeQGOQO0Iza4yn
	yOcxDgkbgYrF3hjE0u0e6cH5h/hNm11faog6TSbrMkm8w/nMKkI8JE59cP3Wi9sPGoOW16RLDda
	0Jiv7sBcdxZUqG8GBOSQ0g/3/GlhYQoTLW++6G/TYDQOMfVElmiSOwKEHJqexUvRO1aPLdna/pX
	ZLnEtrn9lJ5Jr5F8nb8BFxTSbxIRcI71/7XBWHxlNTrUuy0tnHWR7Ew/s958c3D2Cki3y0wpaU3
	EV2J3MURQMEoxLCGY2uAzd2MdmqaltB1M0qA==
X-Google-Smtp-Source: AGHT+IF4wq9zktArSY6pgVpnyiaBJyrWrNThCHzoU9ocyuGVqekUKxsMvPATedxtbT74AR7HQqtngw==
X-Received: by 2002:a05:6214:1c84:b0:731:e432:888c with SMTP id 6a1803df08f44-7fc386ed8ccmr41407516d6.35.1758901487586;
        Fri, 26 Sep 2025 08:44:47 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-80143053d1esm28046766d6.32.2025.09.26.08.44.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Sep 2025 08:44:47 -0700 (PDT)
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 25925F4007B;
	Fri, 26 Sep 2025 11:44:46 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Fri, 26 Sep 2025 11:44:46 -0400
X-ME-Sender: <xms:7bTWaD8GaXpVPbrps4d7E9n_bjzzRhZyG3UvDqjG81DMRYYMxzL2Tw>
    <xme:7bTWaP5evZu5Jr9rE7T_zoz5mMUoC-9VM42W6g_142QkRYuEIfMVqWZSfur5_keVF
    Uw-YrVo3i0uiyx6K7a6e2wombFiL7v2-MhxjU2qTfgBZcmuDcrq7Q>
X-ME-Received: <xmr:7bTWaDoLBZ1TjkSNsGNG9Isnd9Z5-o_3v-_n8RrKeYiNEoS79BAnCtlDLX9I7E3_Y2ICHPCmx3NsOJ4kQRgHwE2mfk-CRmS9>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggdeileejiecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    feehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehphhgrshhtrgeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthht
    oheprghlvgigrdhgrgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhi
    esghgrrhihghhuohdrnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothho
    nhhmrghilhdrtghomhdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthho
    pegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtmhhgrhhosh
    hssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:7rTWaLDaM191edQ-YKFNpdeiSbvBtv0cpOhQkc4eQR5XyuNUhps9_g>
    <xmx:7rTWaMMxsC4UmqKLuFihps-FBk1oH04IIIOSgN3xQpOaRyNBxu4Q1w>
    <xmx:7rTWaKnkSMn9Z8haCh4AUBredHO5C0g2OqlHlwk31tIpgC2aEKfb9A>
    <xmx:7rTWaOd94ceZ9RNOFgxiSxh7w7N-BU8xivt9AOWwAFKni64LYzL32Q>
    <xmx:7rTWaPCKNLmxIZnmFKhOcWjFMyzLQM-dpSYZbCkdoHOB8J79vxdCuKbB>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 26 Sep 2025 11:44:45 -0400 (EDT)
Date: Fri, 26 Sep 2025 08:44:43 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: phasta@kernel.org
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>,	Ingo Molnar <mingo@redhat.com>,
 Will Deacon <will@kernel.org>,	Waiman Long <longman@redhat.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,	Justin Stitt <justinstitt@google.com>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Christian =?iso-8859-1?Q?K=F6nig?= <christian.koenig@amd.com>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Viresh Kumar <viresh.kumar@linaro.org>,
	Asahi Lina <lina+kernel@asahilina.net>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Tamir Duberstein <tamird@gmail.com>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Krishna Ketan Rai <prafulrai522@gmail.com>,
	Lyude Paul <lyude@redhat.com>,	Mitchell Levy <levymitchell0@gmail.com>,
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
	llvm@lists.linux.dev, dri-devel@lists.freedesktop.org
Subject: Re: [RFC PATCH] rust: sync: Add dma_fence abstractions
Message-ID: <aNa069wZv1cn8VGh@tardis.local>
References: <20250918123100.124738-2-phasta@kernel.org>
 <aMwOoYe1xGDBg0Zv@tardis-2.local>
 <12c09de235023c99a8a864b17b2f797c7339bb7b.camel@mailbox.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12c09de235023c99a8a864b17b2f797c7339bb7b.camel@mailbox.org>

On Fri, Sep 26, 2025 at 10:48:06AM +0200, Philipp Stanner wrote:
[..]
> > > 
> > > Regarding the manually created spinlock of mine: I so far never need
> > > that spinlock anywhere in Rust and wasn't sure what's then the best way
> > > to pass a "raw" spinlock to C.
> > > 
> > 
> > You can use `SpinLock<()>` for this purpose, no need to add new
> > bindings.
> 
> The dma_fence C backend needs a spinlock pointer, given to it by the
> driver (so Rust code).
> 
> How do I pass a SpinLock<()> to a C function? AFAICS SpinLock doesn't
> implement as_raw(), so I'd have to implement it, wouldn't I?
> 

Technically you can use a `&raw` to get the address of the spinlock and
just use it, since `SpinLock<()>` is `repr(C)`, so it's transparent to a 
spinlock_t. So you don't have to ;-)

However, while we are at it, it makes sense that we do it right.

> Or rather, as it looks, I'd have to implement it for SpinLockBackend?
> 

I think the below should work, we already have a special from_raw() for
Lock<()>, it makes sense to have a special as_raw() as well.

Let me know if you want me to send a proper patch, or feel free to add
one in your patchset ;-)

diff --git a/rust/kernel/sync/lock.rs b/rust/kernel/sync/lock.rs
index 27202beef90c..78f3287a1372 100644
--- a/rust/kernel/sync/lock.rs
+++ b/rust/kernel/sync/lock.rs
@@ -160,6 +160,13 @@ pub unsafe fn from_raw<'a>(ptr: *mut B::State) -> &'a Self {
         //   `B::State`.
         unsafe { &*ptr.cast() }
     }
+
+    /// Obtains the raw pointer from a [`Lock`].
+    ///
+    /// This can be useful for working with a lock user outside Rust.
+    pub fn as_raw(&self) -> *mut B::State {
+        self.state.get()
+    }
 }

 impl<T: ?Sized, B: Backend> Lock<T, B> {


Regards,
Boqun

> 
> P.
> 
> > 
> > [1]: https://lore.kernel.org/rust-for-linux/20250905044141.77868-1-boqun.feng@gmail.com/
> > 
> > Regards,
> > Boqun
> > 
> > > 
> > > So much from my side. Hope to hear from you.
> > > 
> > > (I've compiled and tested this with the unit test on the current -rc3)
> > > 
> > > Philipp
> > > ---
> > [...]
> 
