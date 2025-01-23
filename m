Received: from mail-qk1-f172.google.com (mail-qk1-f172.google.com [209.85.222.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E95813AD03;
	Thu, 23 Jan 2025 18:25:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737656755; cv=none; b=M2xL5dojpe8Bd+6WLXc2R3oVP2sqP+8VKPSB3a9UsGLjmFRUD+M/OwIabXcdzdDuabVvkEQGyECd3iKQluj9fNRh9SrVqUd3obj1jGT2GyBMDSE+ZQeAG/TcGHT/XSwIFrsOvcMMv3CzzDu0UIlN1hTSZYFOECWH2ZpfTL/bP+0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737656755; c=relaxed/simple;
	bh=Lt11Y+mfu6ju52cnD7u6rQ7WnaOp7sEY6hPScANd6fs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dgyyxvJvBwMZuXnVBkrWtCb5GpZ0QG5ez/C6dXMTrkYxpIyYCM6WurQIT0sdgInWa8oHZB0m+F4dmwdM47tDlWvFth7f7IyaBPybNsp2ZRsQ5cHOCRgfbA0tiwL+6dMPQaJaTmA//Uo+ycoKNnGBIfX/rjR/1QD6zRTOl7oygqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bVnj32sb; arc=none smtp.client-ip=209.85.222.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bVnj32sb"
Received: by mail-qk1-f172.google.com with SMTP id af79cd13be357-7be44a90468so136302585a.3;
        Thu, 23 Jan 2025 10:25:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737656752; x=1738261552; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=JGAi0U35niXUoeRL526chV1IlQcDRnqevq9oTLb+UE4=;
        b=bVnj32sb6rOHPO64zTPkbsKltvTKb1MG9J8NZk1271JgFA74GQlQglTZFUrKAS1Py9
         vk1H/NXNdTdjvC8fZhnV5CV8EVan2Ck85x3KcJlFkvg5UBcKZxz2jOi4NM+uC4HiHOMe
         5bDdHgQa51p3xdPM0viIGS+IKCPiZTM5zywkjp5Qjw3FMiLXwtkTo4NQqKZqpRXLHixP
         1CaHUwfUHhwVSLHP7HrC2g0rm6yTcGsE/x2hCZ3BcLju9xhGEpA8edbtPgOlXNPA93J1
         v5xccRVoe0PMEUoCkrlt6YL2XCjJ5keju+5r9944+Q1lTHwrYvIRrsp3aYwmbfDxk1te
         ur1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737656752; x=1738261552;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=JGAi0U35niXUoeRL526chV1IlQcDRnqevq9oTLb+UE4=;
        b=AVgIFntRWEAmjoRN0Fd6C9mvLktGEIqQbbtFSquDkZn55bysFiP2yWFvqgSG0abuqA
         bmeDNY+JBRgQn6p0xtryuimEDqiCpqCIzJRv6RseJvdhHu6W+pjxgltp6nNPt0Htg10q
         Ce/z4DrC6YGpsQE35/ZMr+lB1G0tfviNe+VnHvaIObS/O4S2u8rQmaQAogFzcD6SkSxZ
         tdmtfN8V60UZlShTDtxc2YEedD5Z0ID+RvvgZqgUvE4jhVB3oiZkbvfIgJ8DeHsGFDSS
         6RH27N32v9mrft6m5einvK4V/80yzIZlcumFab0OaRI3VDl8T30++jxMe2HgZ4Su8xQS
         BrTg==
X-Forwarded-Encrypted: i=1; AJvYcCVn34B55p2+Ck/zbCgZz79t96GKENbifbqnnrYTSRlW13gp7Q4mc2xykrmagZ7s7cUT03ikh7kyJ2lsiKk=@vger.kernel.org, AJvYcCWGH3O2e3ZepcFqUR3YwrfZKHJpk2x8FObrHLIbcrhzitiY6QehrhapncQ+d/v57Fgx8sh/oijyZNjbDgcpY1M=@vger.kernel.org
X-Gm-Message-State: AOJu0YwdXFqMKn9kGjf4r3pi6gC8ViBWq7BdufM2yyX57FXcEWtwvIs/
	lgRATlqE95wxYYvKEYS0A0AE9s2tGU4O4XEC6qftWwL/AWEAqHb+
X-Gm-Gg: ASbGncsaKzmSxQ0c6oTHr9T+jocp4ueWpRybKDFXO8cOmD0oPUsjN2Jcq7uQP5QjWqp
	1d8AY4nxfLu9Wzq0bqEFEF+Orw+UT1H6n9BjkUa45rpYq2/Fsa/3FvN/1o4d+OJUm1YD2oNI/4j
	KYIJKb/ZvgA2Kq8qzQgYWP8myL/znwxRXTaL2dGCxvHyAOszczEBxGI5eLoa1bhfbJyOiXAfYso
	fax7UbOrxi6IW/GPHUjCvaJr+R3CKv9izMQh9TXbK8dAG0xIqSlJ2ME+GTWYGdesxaUMZUJ+MF0
	6TwBf4Wv006FBiRbzBUGx6yfLirgsU2D4CLXkwy0sMrhfsCX5fVEqrF6/sap4RNLNy1nv+g=
X-Google-Smtp-Source: AGHT+IHMdvpV97BPPTGjzGVtsoz8KBCQmJPsfIancz9ENFZMlceYmElrCHgCjMtLSL0r1fd9s+KXMw==
X-Received: by 2002:a05:620a:c46:b0:7b6:ecbb:592 with SMTP id af79cd13be357-7be63253e08mr5249038885a.54.1737656752384;
        Thu, 23 Jan 2025 10:25:52 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be9ae8be35sm10810085a.46.2025.01.23.10.25.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 10:25:51 -0800 (PST)
Received: from phl-compute-08.internal (phl-compute-08.phl.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 673C01200043;
	Thu, 23 Jan 2025 13:25:51 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 23 Jan 2025 13:25:51 -0500
X-ME-Sender: <xms:r4mSZ-Xvbg2Lwlg_F3TI8oZVQiLf-PRfyNJYReFYyx7Q_Ojw17S7NQ>
    <xme:r4mSZ6n-1Wi2_NRvc2faeURq0YOW1r8jAVOnuzIUoenNVxPOmTh6bke3wMCg5E3Wg
    iixocGwIyVo8UP3tA>
X-ME-Received: <xmr:r4mSZyacFS8t3U6xl1E7TSfCRhdCKZHqzx4fqxeTFYDYpL52vE80NhA7FG5L>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgvdefjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenogfuuhhsphgvtghtffhomhgrihhnucdlgeelmdenucfjughr
    peffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfhvg
    hnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvghr
    nhepgfetfeeujedvhffhveejleektddvveeuhefhfeelfeeguefhvdejveevjefgvdffne
    cuffhomhgrihhnpehkvghrnhgvlhdrohhrghdpghhithhhuhgsrdhiohdpghhithhhuhgs
    rdgtohhmnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomh
    epsghoqhhunhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqieelvdeghedt
    ieegqddujeejkeehheehvddqsghoqhhunhdrfhgvnhhgpeepghhmrghilhdrtghomhesfh
    higihmvgdrnhgrmhgvpdhnsggprhgtphhtthhopedujedpmhhouggvpehsmhhtphhouhht
    pdhrtghpthhtoheptghhrhhishhirdhstghhrhgvfhhlsehgmhgrihhlrdgtohhmpdhrtg
    hpthhtohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhg
    rgihnhhorhesghhmrghilhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuoh
    drnhgvthdprhgtphhtthhopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtgho
    mhdprhgtphhtthhopegsvghnnhhordhlohhsshhinhesphhrohhtohhnrdhmvgdprhgtph
    htthhopegrrdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghl
    ihgtvghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepthhmghhrohhsshesuh
    hmihgthhdrvgguuh
X-ME-Proxy: <xmx:r4mSZ1UMaaJmwyXhy2RTIs8vyxopsBj910_kKJ11L7WSgHXfAvrLqg>
    <xmx:r4mSZ4libtgR8X9OdnIKexQIvu_CfTU8PCxGwz7F5D1t67YyEKoiRg>
    <xmx:r4mSZ6emuXic3bhduBrBnEztshXhMFY89rr5XNRf2GxOoNFNz_pyUQ>
    <xmx:r4mSZ6GQVxlSRqPvjMj2_Tp2QraHHnZRIzgrH3LGQ9xlRpLHd7wgKA>
    <xmx:r4mSZ2kHVnGltfKiunty3qim6ZMx9Xf3oMlm2ZWnbZA82ZvUuaHBcSvH>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jan 2025 13:25:50 -0500 (EST)
Date: Thu, 23 Jan 2025 10:25:49 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Arnd Bergmann <arnd@arndb.de>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Lee Jones <lee@kernel.org>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Danilo Krummrich <dakr@kernel.org>
Subject: Re: [PATCH 1/3] rust: add Aliased type
Message-ID: <Z5KJrTG8PN-nRrLZ@tardis.local>
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-1-edbf18dde5fc@gmail.com>
 <Z46Gzg_5kv-MwZNL@boqun-archlinux>
 <b7492912-3e58-43c4-aa0c-e6bcd4925e24@gmail.com>
 <Z5KCuct3QmgGUkIU@tardis.local>
 <760f99ab-e5ba-417a-a918-4d191c7f3ec3@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <760f99ab-e5ba-417a-a918-4d191c7f3ec3@gmail.com>

On Thu, Jan 23, 2025 at 07:04:40PM +0100, Christian Schrefl wrote:
> Hi Boqun
> 
> On 23.01.25 6:56 PM, Boqun Feng wrote:
> > On Thu, Jan 23, 2025 at 11:21:23AM +0100, Christian Schrefl wrote:
> > [...]
> >>>> +
> >>>> +/// Stores a value that may be aliased.
> >>>> +///
> >>>> +/// This is similar to `Opaque<T>` but is guaranteed to contain valid data and will
> >>>> +/// Call the Drop implementation of T when dropped.
> >>>> +#[repr(transparent)]
> >>>> +pub struct Aliased<T> {
> >>>
> >>> As I already mentioned [1], the name `Aliased` is more reflecting the
> >>> fact that this wrapper will avoid generating the "noalias" attribute(?)
> >>> on the reference/pointer to the type rather than an intuitive idea about
> >>> "why or when do I need this". Moreover, I think the argument about the
> >>> naming of the counterpart in unstable Rust (UnsafePinned) makes sense to
> >>> me [2]: this type alone won't prevent `&mut Aliased` getting `swap`, and
> >>> it has to be used with `Pin`.
> >>>
> >>> Therefore, I think we should use a different name, perhaps
> >>> `(Always)Shared`, or just use `UnsafePinned`, or, as always, looking
> >>> fowards to a better name from anybody ;-)
> >>>
> >>> [1]: https://lore.kernel.org/rust-for-linux/Z407egxOy7oNLpq8@boqun-archlinux/
> >>> [2]: https://rust-lang.github.io/rfcs/3467-unsafe-pinned.html#naming
> >>
> >> I don't particularly care about the name, I mostly used aliased, because that's
> >> the name that Alice originally used.
> >>
> >> `(Always)Shared` seems confusing to me.
> >>
> >> I guess we can use `UnsafePinned`, but most people won't know what that means,
> > 
> > Hmm.. but doesn't `Aliased` have the same effect, i.e. most people won't
> > know what that means? Moreover, people who already knows `UnsafePinned`
> > will still take some time to realize "`Aliased` is actually
> > `UnsafePinned`
> 
> I guess I'll name it `UnsafePinned` then.
> 
> > 
> >> also I'm not sure if it's a good Idea to use the same name as a (future) 
> >> language type.
> > 
> > The benefit is that we won't re-invent the wheel since `UnsafePinned`
> > already does what `Aliased` does here. If we don't have a good name, we
> > should use the one that most people are already using. Honestly, at this
> > point, I think we should just use the unstable feature unsafe_pinned.
> 
> I think that's not implemented in rustc yet.
> At least no implementation is linked in the tracking issue:
> https://github.com/rust-lang/rust/issues/125735
> 
> Once that's implemented we can use a `cfg` to disable this 
> implementation on new versions that provide it.
> (Assuming we use the same API)
> 

Sounds good to me, thanks!

Regards,
Boqun

> > [...]
> 
> Cheers
> Christian
