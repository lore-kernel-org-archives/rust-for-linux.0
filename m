Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 592A56FC5
	for <rust-for-linux@vger.kernel.org>; Mon,  4 Nov 2024 06:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730700499; cv=none; b=opxoDv8tjrs6wlJcZHdGGeGXYS2VgKj4bW5GmEXw+LcSGEUlgOBv37aFiQ3FoZ8AxUTa9V+BzFQ4Ztu1gaGcyoNm0DtE8Eu31D1phzM15XVRfcXxi8l+7FxTGfnXLj2FfHG5RRvPiPkoNteoCNQci/a+GRRFKKp1zBsRkmABMXg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730700499; c=relaxed/simple;
	bh=nJyNh0OCf+mt/G/ye4fp/HaKW30GfbAXONgJhizhUbY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gP2E5TfKNcf1ys7wW5mvliCbwYz8+YGvfLB3tppmjTW3X3+udZdSV+puQ1gdAYSoSnzVfzLGuD5lF/kZhWexyxk6cjoPgNA27PdRbP4R52SB4ExTw5LGg3xYWBVZb52l30zM6aqa0ak6n8cfo9BuzGKxgeiEXqNB7NEM8z5fijE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=a0D+ZX+D; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="a0D+ZX+D"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7b1474b1377so338782985a.2
        for <rust-for-linux@vger.kernel.org>; Sun, 03 Nov 2024 22:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730700496; x=1731305296; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SW+RvmKJcto1pkLoXXYXLIklISppKq7OJ3PEIrF6I9g=;
        b=a0D+ZX+DQ5+HtX07t/27lqQVpIckgbg9bUc7FCet0DgPbjxHfLsvvvz5Kn8N3yfHA8
         DMjb2aa4IljoizV2vOAYcZuOw9I+a0QXJzsF+i4bh4t4jVTIlPgHIdHwW3Ld58VS3BcE
         12lNNfbo3khfOQtfRxV7+/MrlgdthkMfUL3FFcH2q4WFYQ/IcmnHv78i4tXt1U6slDCj
         gcXImgpTtmcUDiSBmOASjRvuTtwxJhQEQuBt1dg0iTDsUQypJRnBpuuFDUt7BgVPdl4a
         PDimCrQaDk6LsD2ff2HI6NSYGy07O71dcthy7Rq8rmCHGKhpsxw0uVbKmsYvht296NQB
         d1yQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730700496; x=1731305296;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SW+RvmKJcto1pkLoXXYXLIklISppKq7OJ3PEIrF6I9g=;
        b=nNB7NbG9NpvfrbwjWdgSYHWvSFNY80srPmoFhN8a9qv0j0vLPWD2cuH55eheiGw9NP
         pf5/Fw/+sZGtIDJkdGp1G41936z6Xa7BBf7gbItVnUHfswq+2QOhRebJS3V4Lai81FyP
         c950GzITizmO1LPZoHCUDuDTGRbrYtGpjZ0hqijbWoCcYp+zbEh51GtKUZmCmx+n4m7h
         ftIXp19ql3/gseAIEbw/5QiY1hQG4QflIamLPithvxD5kLb++jAyi3PVpDVqIDsstjsy
         D98L/5prb1T33NmQNJxblWjlCp03qwdzZF1lj4G5jqisMA3e4hhHmYCIvCvZMyohDoXX
         6Vgg==
X-Forwarded-Encrypted: i=1; AJvYcCWAcxziHL8hwvCLYH7KMFUC64ZgxP8/aUPqJJWJBC99t20q+unwP4djvmkKa6rxPe8be/M3FTOK14IY3GcBmQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2KXxciVR21j9EjkLxYFAmwcyW0UjZPT2tTEQTxqJp4WlKGxP1
	RaZUVNFxGWRnZCqfpVl5Dr5BwTPL4p6JNaEHKeki6gzlVTDZeEqw
X-Google-Smtp-Source: AGHT+IHnbDqq9z7DV6XTkDm/Cc5agc9HifiWdJ2sImOff5mr+dNgpJnEHihpCZq7Y9UmuOsfnC5RZQ==
X-Received: by 2002:a05:620a:25cc:b0:7b1:4a0b:891 with SMTP id af79cd13be357-7b2f24c6b1cmr2127837285a.3.1730700496225;
        Sun, 03 Nov 2024 22:08:16 -0800 (PST)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7b2f3a112edsm387537085a.58.2024.11.03.22.08.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 Nov 2024 22:08:15 -0800 (PST)
Received: from phl-compute-12.internal (phl-compute-12.phl.internal [10.202.2.52])
	by mailfauth.phl.internal (Postfix) with ESMTP id 14CA31200043;
	Mon,  4 Nov 2024 01:08:15 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-12.internal (MEProxy); Mon, 04 Nov 2024 01:08:15 -0500
X-ME-Sender: <xms:zmQoZyoL2lQxbe1TN-n0ptLVTdK1pSOS8WARTeEVrOt7VnBUa6RfYg>
    <xme:zmQoZwqZjAWqvi1OX5KzNTYjCC-XMqLKfjSKtmT6HdzUulK_hzn54US0xHmlsgNWv
    YeilR4tkGraFBTeYA>
X-ME-Received: <xmr:zmQoZ3N99GaQKunbLTo-UBoZZe54M6z6Z1pWGBYVTECkb6bDHcRC9c5wNCs>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvdelhedgleduucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddtvden
    ucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrd
    gtohhmqeenucggtffrrghtthgvrhhnpeehudfgudffffetuedtvdehueevledvhfelleei
    vedtgeeuhfegueevieduffeivdenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmh
    epmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhi
    thihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmh
    grihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepudefpdhmohgu
    vgepshhmthhpohhuthdprhgtphhtthhopehfuhhjihhtrgdrthhomhhonhhorhhisehgmh
    grihhlrdgtohhmpdhrtghpthhtohepjhgvnhhsrdhkohhrihhnthhhsehtuhhtrgdrihho
    pdhrtghpthhtohepmhhighhuvghlrdhojhgvuggrrdhsrghnughonhhishesghhmrghilh
    drtghomhdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghr
    nhgvlhdrohhrghdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgr
    rhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhroh
    htohhnmhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhho
    thhonhdrmhgv
X-ME-Proxy: <xmx:zmQoZx4otiP5C5KIljxFuqa73J3p2hr6yZL4b17JmQHT39d7uMrJDg>
    <xmx:z2QoZx7NhRi5JaMRxCVMcijbYwi1uKMs8PjhObZ0gbAkEfvomv0pZw>
    <xmx:z2QoZxjmz0MlLJpCHIiBebRDbcjaZ4gfMb-kFPljJYVwjXYyQqGrfg>
    <xmx:z2QoZ74Z_AgKtEMhsvIHCoHJ3Jys3Vb3jaYr8WyWhC5X94c3VDz5Vw>
    <xmx:z2QoZ8J2UNoiCE8wEt7HZ_FblJgt3Sgr_bIwR8wWPpmZVrW_kw_i3Dkf>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 4 Nov 2024 01:08:14 -0500 (EST)
Date: Sun, 3 Nov 2024 22:08:13 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: jens.korinth@tuta.io, miguel.ojeda.sandonis@gmail.com,
	rust-for-linux@vger.kernel.org, ojeda@kernel.org,
	alex.gaynor@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
	benno.lossin@proton.me, a.hindborg@kernel.org, aliceryhl@google.com,
	tmgross@umich.edu
Subject: Re: [PATCH v1] rust: Add pr_*_once macros
Message-ID: <ZyhkzafudRiL4H39@Boquns-Mac-mini.local>
References: <20241103030530.76756-1-fujita.tomonori@gmail.com>
 <CANiq72n3bdNoYsSo47BGK2AJX_yhREoOxfKwkMBwz4v3bR-UHQ@mail.gmail.com>
 <OAo8RFp--B-9@tuta.io>
 <20241104.111512.1370021952355538395.fujita.tomonori@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241104.111512.1370021952355538395.fujita.tomonori@gmail.com>

On Mon, Nov 04, 2024 at 11:15:12AM +0900, FUJITA Tomonori wrote:
> On Sun, 3 Nov 2024 23:29:29 +0100 (CET)
> jens.korinth@tuta.io wrote:
> 
> >> Hmm... Isn't this derived from what Jens was working on in Zulip? (Cc'd)
> >>
> > Looks very similar. But more importantly it's missing the hotpath
> > improvement suggested by Boqun Feng, which improves the perfomance
> > significantly:
> 
> I think that it's better to start with the very basic code and then
> optimize it with commit log that includes benchmark results.

I don't think that is necessary, if you look at how DO_ONCE_LITE_IF is
implemented today in C, it already has the load for checking:

	if (unlikely(__ret_cond && !__already_done)) {

you will just need to use atomics to fix the data race issues in C, and
the xchg() to fix the "not exactly once" issue.

Regards,
Boqun
