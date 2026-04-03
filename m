Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05BF370D57;
	Fri,  3 Apr 2026 08:12:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775203980; cv=none; b=EnxuUFJdl7ah0wDWrRQlyxDvNYIArGppbzdzeCU7kLxTksoAkByViEAVmOL5iIaqKVhMxmmOQ1ngfnlAbXMSPfSUP3U2qX9KOgqosOcNvULdWv8JVSyLZhnUdps/+stvHmNNgj1y+CwEyjLO4qQSlwQy49tKCv+tJBXxIijuroY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775203980; c=relaxed/simple;
	bh=kkVWUWuA6UQRSH7yzsCYqkzfZ9qy6TXVVucX0u+U86o=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=dsYYNLWkPSeluY2E3NQuz5RLKwnUT3uC62QKX2G5eC9ZdEd3ymD9bbFsX0EGHMsVmYmsTraXBPn7w6PVMbVAxlfCRoaNhEimsxHrlrHurGfcO9UDgeLWB7iSy2D5jTNclFwAQKTLnM3yq0yzqc6n70woa6N0PFsEGXsVnTmiL4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fabian.gruenbichler.email; spf=none smtp.mailfrom=fabian.gruenbichler.email; dkim=pass (2048-bit key) header.d=gruenbichler.email header.i=@gruenbichler.email header.b=cncFbwVl; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hgC//gyg; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=fabian.gruenbichler.email
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=fabian.gruenbichler.email
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gruenbichler.email header.i=@gruenbichler.email header.b="cncFbwVl";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hgC//gyg"
Received: from phl-compute-03.internal (phl-compute-03.internal [10.202.2.43])
	by mailfout.phl.internal (Postfix) with ESMTP id 4461CEC0360;
	Fri,  3 Apr 2026 04:12:54 -0400 (EDT)
Received: from phl-imap-17 ([10.202.2.105])
  by phl-compute-03.internal (MEProxy); Fri, 03 Apr 2026 04:12:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	gruenbichler.email; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm1; t=1775203974; x=1775290374; bh=EkYhMFUzna
	61l24QjGi23lZLklSn1MZcKMUIKqU2kd8=; b=cncFbwVlYl69uKE3djnhbp0xHH
	+d4PTQgMcU/Fc52bZdy5I9kzgi86rHRJPBvD8D1uCCVX8bx6X5OOl96x55vGSOJb
	MqUmC9ZE99m9f8RStyzuuwtmQ03jpM6lO0quWPjXPGSmlUzJWh4SqvcoJpcHy/1Y
	lCkOnXrTyno6ZUVRppaxAJWt02BuEj2UN4eM1vwwuKFZWfXn6mjEoQTqnipEh1O7
	0N1eBDCxhfF4q+bJYoCXpVqz3xtPkxj/q2rdnXXGdhZIWwem+XLdUlt9eS9yCBVs
	UwqoV3MVFOlrTGIhlwnVnmiKzVJOqDV4sCCM0XbziLK+aqUmwcoV7R9R3xWw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775203974; x=
	1775290374; bh=EkYhMFUzna61l24QjGi23lZLklSn1MZcKMUIKqU2kd8=; b=h
	gC//gygIrrgxbzQkL9IscVEbKkXbvCcpzbW2JBM82ZYg1dx4XipXUwAQ19I3kCyx
	MiYKPr8Wh8He588BtrF7r/I/lSwl8BVoX0eTYeASmu8sc5OeqP10WpxD0bWZwqi1
	9lxh++2L/F/k2qtClVfd7rrMOK/vpvaO61zr6P4gENxZuyL6cc3kVchH/yyXR8e6
	GJQ/V/5+PIfw3OfAWMGL6PiFmVpYQj9xPiQLDLpEK2915dm+jKgt+n2XdEKqJKEu
	VbBpqoV+gtmr6Ofh4bJ+LSTyWYHy9+na0NUOfvtm19fJ4NKGGS/oriLAuzQsMPeL
	ZKwiN6oV57b5lghlVRszg==
X-ME-Sender: <xms:hXbPaU0lnZReNw0I2KyIkkpsYE67csDV8Bhw5c4-mAbSJLY9CKNpiA>
    <xme:hXbPaZ7j9npNOk_oN8epLA-yCSfuTaKC-LdQCZbCIRWAoeK4wMvliE3Owa90JNElZ
    f7_JzMb4Byqv1k2NXHU6N9i_Hiz9ExsppmCoY_9KOY70MS8JfBFKqA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdekgeefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertdejnecuhfhrohhmpefhrggsihgrnhcu
    ifhrtphnsghitghhlhgvrhcuoeguvggsihgrnhesfhgrsghirghnrdhgrhhuvghnsghitg
    hhlhgvrhdrvghmrghilheqnecuggftrfgrthhtvghrnhephedujefhieelhfeiieetkeef
    gfekgfffvdegfefggfejtdektdehudefheelhefgnecuffhomhgrihhnpehgihhthhhusg
    drtghomhenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhm
    peguvggsihgrnhesfhgrsghirghnrdhgrhhuvghnsghitghhlhgvrhdrvghmrghilhdpnh
    gspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheprhhmkhdo
    khgvrhhnvghlsegrrhhmlhhinhhugidrohhrghdruhhkpdhrtghpthhtoheptghhrhhish
    hirdhstghhrhgvfhhlsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghhuphhtrghruhgu
    sehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghruggssehkvghrnhgvlhdrohhrghdprh
    gtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehlihhnuhig
    qdgrrhhmqdhkvghrnhgvlheslhhishhtshdrihhnfhhrrgguvggrugdrohhrghdprhgtph
    htthhopehlihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:hXbPafT1n9mlFz3LeN2M9coMgiG10furdBYIBh8uP_4lA4Ff3ViKNw>
    <xmx:hXbPaVumkcLNGvMd90StAxAKsZgCxjTejmiYQvvauOJV07e88ryLxw>
    <xmx:hXbPaZHG3XrLB2JeplWkYKSeCcaQCDUMFOtIcT1WlLU0uNsK8U4ETQ>
    <xmx:hXbPaeyHIW4F7g5FBUdf_k6otEHqqL05abC8pZGrdbCW7srMlVo8ZQ>
    <xmx:hnbPaXf44G-2s8CsT1dbGcVUJpJQnTWGCF9cYAO7pKuxhebuJ-sasyWS>
Feedback-ID: i1739464b:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 93A6DC40071; Fri,  3 Apr 2026 04:12:53 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AJ9MI3eEke2w
Date: Fri, 03 Apr 2026 10:12:33 +0200
From: =?UTF-8?Q?Fabian_Gr=C3=BCnbichler?= <debian@fabian.gruenbichler.email>
To: "Miguel Ojeda" <ojeda@kernel.org>,
 "Christian Schrrefl" <chrisi.schrefl@gmail.com>,
 "Russell King" <rmk+kernel@armlinux.org.uk>
Cc: "Rudraksha Gupta" <guptarud@gmail.com>,
 "Ard Biesheuvel" <ardb@kernel.org>, linux-arm-kernel@lists.infradead.org,
 rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Message-Id: <d47bcff5-ae97-4a27-8348-efef67ed3d98@app.fastmail.com>
In-Reply-To: <20260331190053.482607-1-ojeda@kernel.org>
References: <20260331190053.482607-1-ojeda@kernel.org>
Subject: Re: arm `rustdoc` Rust 1.85.0-only build error
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Tue, Mar 31, 2026, at 9:00 PM, Miguel Ojeda wrote:
> Hi Christian, Russell, arm, Fabian,
>
> For Rust 1.85.0, for arm32, for the `rustdoc` target (i.e. all those
> combined), I am seeing:
>
>       RUSTDOC   
> .../1.85.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/lib.rs
>     error: target feature `fp-armv8` cannot be toggled with 
> `#[target_feature]`: Rust ties `fp-armv8` to `neon`
>         --> 
> .../1.85.0-x86_64-unknown-linux-gnu/lib/rustlib/src/rust/library/core/src/../../stdarch/crates/core_arch/src/arm_shared/neon/generated.rs:7538:48
>          |
>     7538 | #[cfg_attr(target_arch = "arm", target_feature(enable = 
> "fp-armv8,v8"))]
>          |                                                
> ^^^^^^^^^^^^^^^^^^^^^
>
> The issue is [1], was introduced in Rust 1.85.0 and was fixed already in
> Rust 1.85.1 [2]:
>
>   Link: https://github.com/rust-lang/rust/issues/137366 [1]
>   Link: https://github.com/rust-lang/rust/pull/137632 [2]
>
> It is unfortunate since our minimum is going to be 1.85.0 since that is
> what Debian Stable has (even if patches may be on top) -- I generally
> test the latest patch versions for each minor, but I noticed this since
> I also test the actual minimum, and I am bumping it to 1.85.0.
>
> To be clear, it is likely almost no one actually cares about this, since
> nobody complained yet, and this can easily be fixed using the already
> released Rust 1.85.1.
>
> By the way, what is Debian's policy on upstream Rust patch versions?

In unstable, we pull them in usually by virtue of lagging behind a bit anyway.

In stable there is no policy per se - both importing a new smallish important
upstream release, or cherry-picking patches are options in general. A few
packages with clear upstream LTS policies are updated often (systemd, glibc,
the kernel itself, firefox-esr and chromium would be the most popular
examples). If there is no upstream stable release series that matches Debian
stable policies, the usual approach is to do a targeted backport of just the
fixes.

It's a bit unfortunate that the timing lined up like it did, because given the
lack of rustc LTS, usually there are no point releases for the version to be
included in Debian stable anyway.

It's up to the stable release managers how big of a delta is acceptable.

I will check how the full diff for 1.85.1 looks like compared to just picking
the rustdoc fix referenced above, and then file a stable update request. AFAIU
either option works for you?

The next Trixie point release is slated for May 16th, so we still have a bit of
time to discuss this with SRM.

Fabian
