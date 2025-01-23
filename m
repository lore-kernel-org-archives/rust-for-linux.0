Received: from mail-qk1-f178.google.com (mail-qk1-f178.google.com [209.85.222.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 654DA1C07DC;
	Thu, 23 Jan 2025 20:24:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737663876; cv=none; b=MJEw9JxVJwtSyyS4BtirVyUHnZGar3UKYpR6H31XHUjGH+MqT9tOFB5nrXpoxxsSP1zz9eiS1dRNdyjCfPGI+bYnR2srmcPCmIEL33gE163tZW/hyEG4Dzq1sRFJiy+p1G4IHbKdySnuJ6NInm/EucI7smftaSZIZHi80ODoYzk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737663876; c=relaxed/simple;
	bh=VhQN8XeBmhRHk5+v1nu5Jovs1gvk6kidsx6Rk0BcjhY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=DfOF0lVy8uyqrQMzxTTBZjTK7zb2vSMBICwvAM7xBWRIIRoldBZAyCpfwFthkjqmOfRuwZygTJSTlKkBkQCcw7/5GepHr/j+LtoVV/i9x7ZhHaZGlVlGPjBjYjh6H+oVDsOfA/FUATSyUDQaeO9YypfeOuGZ9Vj72ERr7gtlX6U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z7g9aitX; arc=none smtp.client-ip=209.85.222.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z7g9aitX"
Received: by mail-qk1-f178.google.com with SMTP id af79cd13be357-7b6f95d2eafso147147385a.3;
        Thu, 23 Jan 2025 12:24:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737663874; x=1738268674; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/PKq6ysaYuJgg+76IS4yJyVPo5Mo6AkfGqN/Sz1QY3w=;
        b=Z7g9aitXEIXV0pZi/0wB7Mti9+XDFtWHgyB52wv9LlnnnifcO6dCiHDb/CyZuKASJF
         spmfHZY1Z7nPlQUVyD331Jp+yOhrNvz8K9lKutJ/YkMx+ihXNY34ddwayG4Ni4gJjMiJ
         RY532kT/SPDfnM0Mu0DLujnkwkgyv73gKwepmXE8aeOq2Gu0dNdX24oQDIrU8IQC3FXp
         GpB66j6M0IvkPfmmToZW+t//9eO05nCpgL9Vl9WUhbJ/uiJkbXV9e4C6zVBSdP2df+CA
         i4G+dzVLQv7HuHOF+GmoA7dFccH2SaIYZNUZmTzYDNeY3w/9kZ1Ph62uGtN+bqViTigD
         QouQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737663874; x=1738268674;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/PKq6ysaYuJgg+76IS4yJyVPo5Mo6AkfGqN/Sz1QY3w=;
        b=prieSgy6NJ6yNnnibgZueZpLx+eZgh47JLvfuUBKKYtew7eQ0mfJKKbamUM+X6nDvD
         D27VA+oWyWF1y7xXH/IWsz2yCR9zTYBw5O/9zEaKm41unLvRMsH1WG9ViywP+psJQ1NJ
         g2Eu2StTU4lXczcC2j5dec61E8W83cEDyvQ8dseQcY7h+/91248FchBcRAUBCHwsY0EJ
         AQRlQE4AhP1+JuPf+Om/n4J5cWEye7dESuD5U6GT8VZGE01iKeH0tzh6Ng4HenxXaLLr
         bDywjCrEagANiJ+7STGeu+E0BJn2Ff3Z8oZv2k1w6NOo6uuSnWrvC9jYC1KgpqKhClre
         dlkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI6P9TJlcn+rfYa0ses+sd/hZimw5/Pcj98j82SzsMyrQ0WHjPTBjabNZEtkCSKIKG7uB3c+RqKHos/KAbYQ4=@vger.kernel.org, AJvYcCVuWSpkYUGH/jdciXxlHNaPa7Z5Q92/XlYfZ1tUugUn1hQCHQSoguLsjm4+VAhwIth7OT5dgEMYgl7O31M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yzq67fJnWQ/sgmCAKiwgt3eMCyys9TC/ps/DnVMYxbjg34E8FJk
	P5ZE8gSq1tlI8MJeZniH06RGGDYk1tx4f3F8Ag+jBQ5eUeQUahX2
X-Gm-Gg: ASbGnctlFdg0xTfTbx52pfsUnCR6YFdDr8unA9kNiZo2QO1XlNPcEv/m8hl+JNunrsk
	l0QFo8VM2WYqqlYz/cbCInUka7mmnPgRh5IJ/Qadq1hvLooZbhMeUNtaPR3lAExp3L7NuoFgBgU
	auX7AzW9C0bwUDq5cK06NqOjuxLetdKYM8ZsxwdcMTbC5kC/yujGnqip9UePR180/JnAWiRTcdc
	bqQGde0BS2ZR08haUaRRwDtnNwjU+Rkksc3g434ZgN9dic2cinXlm6SSndVzW3Sld85bBA0J3nR
	kuN0IqKY8PtBbr/4d8KhSLSUCBytUuU4pvfZPEEltidVzRwqW9h2Qpime1tS/J/n1jKMcHY=
X-Google-Smtp-Source: AGHT+IH0nOYbrW57J3SdfsgiFHLp4phMSIDw1KbsAHRgJ87MdDOU2CfyaKxUyOGt9H68aF8gy88ERQ==
X-Received: by 2002:a05:620a:3198:b0:7b6:d58b:9de5 with SMTP id af79cd13be357-7be632395b3mr4708208185a.13.1737663874148;
        Thu, 23 Jan 2025 12:24:34 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7be9ae7e16esm20633885a.2.2025.01.23.12.24.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jan 2025 12:24:33 -0800 (PST)
Received: from phl-compute-11.internal (phl-compute-11.phl.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 0D644120006B;
	Thu, 23 Jan 2025 15:24:33 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Thu, 23 Jan 2025 15:24:33 -0500
X-ME-Sender: <xms:gKWSZ_ElwXOW-jOll8aM-I4DWszeVQ7CxtcjhUGQWwfCYILQZ14EzA>
    <xme:gKWSZ8XJdRGWFedsCtwvQZwVjH2CS2EM8q28EwTR03EQ4XOgXiL9eQ-zwEG8NZjfV
    SJLxo7DZzUFwFFF-A>
X-ME-Received: <xmr:gKWSZxI_ahHWkmz_BtBOZ76lJ5AyweaOAYuxJBgERGgrhi_X8ONxt2GzwwQ-CA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefuddrudejgedgvdeiudcutefuodetggdotefrod
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
X-ME-Proxy: <xmx:gKWSZ9FyYuRLMMUkYuW3zojascB7xTWEOf9QT5BNDu5vTLkwaB27iw>
    <xmx:gKWSZ1VtAgTXPy5nyVr9RfFPRGsU0YYgvNcGOldqR5Uun1SCK4pobw>
    <xmx:gKWSZ4OHheRE5Wf_hGETLrAfYwfbTpIDIa9ilh-kTlOuBvwCS70O0w>
    <xmx:gKWSZ032-z1hCMS1SzNtxW4G0zIH5nmBSP1rJLxC7m9QSOuO5do9Qw>
    <xmx:gaWSZ6XZPaEcuHgYg4G1ii5grXkP3cNovqDgZxahLGlu1X07RBgfrpyk>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Jan 2025 15:24:32 -0500 (EST)
Date: Thu, 23 Jan 2025 12:24:31 -0800
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
Message-ID: <Z5Klf_poby1lbGTl@tardis.local>
References: <20250119-b4-rust_miscdevice_registrationdata-v1-0-edbf18dde5fc@gmail.com>
 <20250119-b4-rust_miscdevice_registrationdata-v1-1-edbf18dde5fc@gmail.com>
 <Z46Gzg_5kv-MwZNL@boqun-archlinux>
 <b7492912-3e58-43c4-aa0c-e6bcd4925e24@gmail.com>
 <Z5KCuct3QmgGUkIU@tardis.local>
 <760f99ab-e5ba-417a-a918-4d191c7f3ec3@gmail.com>
 <Z5KJrTG8PN-nRrLZ@tardis.local>
 <1fe7b736-48a3-4ff5-a084-43dcf602ec4e@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1fe7b736-48a3-4ff5-a084-43dcf602ec4e@gmail.com>

On Thu, Jan 23, 2025 at 09:18:33PM +0100, Christian Schrefl wrote:
> On 23.01.25 7:25 PM, Boqun Feng wrote:
> > On Thu, Jan 23, 2025 at 07:04:40PM +0100, Christian Schrefl wrote:
> >> Hi Boqun
> >>
> >> On 23.01.25 6:56 PM, Boqun Feng wrote:
> >>> On Thu, Jan 23, 2025 at 11:21:23AM +0100, Christian Schrefl wrote:
> >>> [...]
> >>>>> [1]: https://lore.kernel.org/rust-for-linux/Z407egxOy7oNLpq8@boqun-archlinux/
> >>>>> [2]: https://rust-lang.github.io/rfcs/3467-unsafe-pinned.html#naming
> >>>>
> >>>> I don't particularly care about the name, I mostly used aliased, because that's
> >>>> the name that Alice originally used.
> >>>>
> >>>> `(Always)Shared` seems confusing to me.
> >>>>
> >>>> I guess we can use `UnsafePinned`, but most people won't know what that means,
> >>>
> >>> Hmm.. but doesn't `Aliased` have the same effect, i.e. most people won't
> >>> know what that means? Moreover, people who already knows `UnsafePinned`
> >>> will still take some time to realize "`Aliased` is actually
> >>> `UnsafePinned`
> >>
> >> I guess I'll name it `UnsafePinned` then.
> >>
> >>>
> >>>> also I'm not sure if it's a good Idea to use the same name as a (future) 
> >>>> language type.
> >>>
> >>> The benefit is that we won't re-invent the wheel since `UnsafePinned`
> >>> already does what `Aliased` does here. If we don't have a good name, we
> >>> should use the one that most people are already using. Honestly, at this
> >>> point, I think we should just use the unstable feature unsafe_pinned.
> >>
> >> I think that's not implemented in rustc yet.
> >> At least no implementation is linked in the tracking issue:
> >> https://github.com/rust-lang/rust/issues/125735
> >>
> >> Once that's implemented we can use a `cfg` to disable this 
> >> implementation on new versions that provide it.
> >> (Assuming we use the same API)
> >>
> > 
> > Sounds good to me, thanks!
> 
> From reading the RFC It seems that `UnsafePinned<T>` should contain a `T`
> directly instead of `UnsafeCell<T>` so I should probably also change my 
> version it to match.
> 

Per

	https://github.com/rust-lang/rust/issues/125735#issuecomment-2299183374

, I think you still want to use `UnsafeCell<T>`.

Regards,
Boqun

> Cheers
> Christian
> 
