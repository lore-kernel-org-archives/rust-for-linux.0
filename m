Received: from mail-qt1-f180.google.com (mail-qt1-f180.google.com [209.85.160.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4126F253B66
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Sep 2025 15:06:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757516783; cv=none; b=gL0GV0gcD+QVO6phaLRv6z5gP6VddiH7z32Rlx9SETfDxhuDLgnFQUvwxrlHsE4yt8OnvO5PmzLaj2/Nm5vicsRdsk9k9AitrA65hKIiZZdapmLeelr2/+wylYZcJY7d6q6SbagZjmKTKRQg+zvotHs2kaS+AHtUXz6pOfdrSZQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757516783; c=relaxed/simple;
	bh=WRj/k0r2xtwk/yI5lZIzerS6VoumZFaocGJzFvR3CG0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZNT3p8rwYKcp7vqIQ2q/8rmOeVGY+vmqPeWWUvOunm2dDCVWUBIfk4PRIyIbmLnUZTr8E952Znn+PuoS6fBJ+C4lPfUS8rRnZ0873ZtmppEAh+w0IklnMUzv2Q/npeYAVSVG28LXPK+nKo4jIx3Gu6dqa5NUA+QXe1UGcD48HPM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZzrLkGbN; arc=none smtp.client-ip=209.85.160.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZzrLkGbN"
Received: by mail-qt1-f180.google.com with SMTP id d75a77b69052e-4b38d4de6d9so34662321cf.1
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Sep 2025 08:06:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757516781; x=1758121581; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:from:to:cc:subject:date:message-id:reply-to;
        bh=QkuRyXmfbcMHv2DSfTU9nR1jehGN19h5trO6Cne7aXk=;
        b=ZzrLkGbNSk755WFja+5rH+8jP1OwKKgj+L7hR8AKSzScBV61E9eX7wYdl+WF9Mke1m
         Fc+t2ovSd0CwonCK3GaB5lRoSR+WKkCfk8xldAcAbEVX6NsNaL3LTZTUGsZHt9Eb2YQw
         yDXA4Hfa0ubwxvjz6r5P1/VwO7bZaEhnCJwXVgC5wh5IkHhxRL9xVs0jntYCYwoTf5IG
         o7YsNK7ub6OSofmb7fD3HmICswfJiEhDAN+Z+Ljn7eUvUR5FAgZHp5WAB3uI3rN5yXgM
         /0+81IitrqA74jLYLG0EO/9KhrTfHLpHe8WfUM8JFi9Fa4Mp0zp88bRAvD41Hv/OSuIL
         4Pgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757516781; x=1758121581;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :feedback-id:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=QkuRyXmfbcMHv2DSfTU9nR1jehGN19h5trO6Cne7aXk=;
        b=qecx+6Vvw+69Y8dM6PqGEbOPEt8STOh7sJ4HZaQqe70cpd99UCT1D7CvHdePmDzfCR
         rE422y8NW2PhHTIBf8MHtjROYC60WFPHBRQLWW5s4p32b7WTL0M8rMmiO7ImBslAlwo2
         9zS4qMe/iTVZy8dyD/i+tSFgssMAZrRALClGlOlKD0Yo6tI2uEMD68P5OW/x6s/pp/o+
         Y5wbufPPX5YkdPPwpt1diZxiJOW/7PUfBuQIiKyD9SOYpqVBVPOSeMh/hiHNO/Q1xBV5
         HDi+k+uZBrAjLfLXAHux6Ugvn2bKbg2sii8WzR2t40Yew+WqiGnPjC9aTVOY/9ieSNM5
         eZtg==
X-Forwarded-Encrypted: i=1; AJvYcCW2bxmf49mAeugtvfjXBC67hjHzdS0MriVr+CE3sOONVyUSo+nVQeTEXMT8DQKocWpVt7yecNNP+1coPo4UYA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6iwd/ygn/TrNLD0bb1mKGLC77Zqfj1aGpNWIC2rsKj+P7Mg87
	59/l90dUZ6Z2Og5ehJKJ9uKHtbmhgtJ6pzdeoBzYZyfowWNlgqrYkTRQ
X-Gm-Gg: ASbGncstd8qIb9INM7I0V5LjzBn1og5FCcRPwIQ1NnsSor0kw6uR+x7P4b3bV0ho950
	StaPWri+VA1QerOFoA4ggRDg8dI+WTQnbCVQccL1aRTwmQIwv4hgpWXnjHPsDUDYnyMG7D0vgcv
	68ZQCTPt+15SQ46GyrwmLlT4iULqff3uNBD/2GX1L3ERi+tv77IDfk5O9QgOqVYxsc/rJgQwmxw
	oIp0RCVUFbUPdS7CZnV7jEUYYWzxAvTOMFR2AE976BKWFpchpJQPiY7qMYazoeKeb6Tb7YDNrb7
	BSq3kQeSWRHaT8cf0R3uQfM2DB+WQ5G9koxFbwYJx85Qa6p4thZtQX38km3j6k7hmKZ3UdCVaRc
	2vtEFgHKgdqB24AuyP69LOincu5DdBDAWRW9P0fZJwyPhmtLYqVVb+UOSS+Yeci3b4zwzF7n9w+
	yNI4N5HU+g7U8CAv47dnw4HeU=
X-Google-Smtp-Source: AGHT+IGV730dPkH+7LPV2ZmENlvah0J2LDWVfeVyU3QtTkU3pVSmsCeZ/SDh7VcDX1L/gE2E8Wx/Mw==
X-Received: by 2002:a05:622a:5444:b0:4b3:c78:fc18 with SMTP id d75a77b69052e-4b603776dedmr98515491cf.68.1757516780637;
        Wed, 10 Sep 2025 08:06:20 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-81b599c4331sm307244185a.26.2025.09.10.08.06.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Sep 2025 08:06:20 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8D026F40068;
	Wed, 10 Sep 2025 11:06:19 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 10 Sep 2025 11:06:19 -0400
X-ME-Sender: <xms:65PBaAe_lUZfbyXcyHf1mthf5kq-L9xmUHS8n9OtE6YO4xzFYEN1tQ>
    <xme:65PBaAsoQeOPK1s884KNimoLD2yhwMwqIiSSRRGlhVLGMZFccB8n5xZ4cPMgpUgbC
    37v-Wm5Pkm9poCmPw>
X-ME-Received: <xmr:65PBaNAt-l4LToBGUFm6m6q5hdvKWpTqHjoQkPZeRAd86Uh_OX3qqsWz6rRBNBjUbYD2i3zh_dp4ACPfk5xSdFZEsL4UgzSc>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdeggddvfeeitdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgesthekredttddtjeenucfhrhhomhepuehoqhhunhcu
    hfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtth
    gvrhhnpeejhfeikeekffejgeegueevffdtgeefudetleegjeelvdffteeihfelfeehvdeg
    keenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepsghoqhhunhdomhgvshhmthhprghuthhhphgv
    rhhsohhnrghlihhthidqieelvdeghedtieegqddujeejkeehheehvddqsghoqhhunhdrfh
    gvnhhgpeepghhmrghilhdrtghomhesfhhigihmvgdrnhgrmhgvpdhnsggprhgtphhtthho
    pedugedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtoheplhhoshhsihhnsehkvghrnh
    gvlhdrohhrghdprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdp
    rhgtphhtthhopegurghkrheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepohhjvggurg
    eskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhmrghi
    lhdrtghomhdprhgtphhtthhopehgrghrhiesghgrrhihghhuohdrnhgvthdprhgtphhtth
    hopegsjhhorhhnfegpghhhsehprhhothhonhhmrghilhdrtghomhdprhgtphhtthhopegr
    rdhhihhnuggsohhrgheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepthhmghhrohhssh
    esuhhmihgthhdrvgguuh
X-ME-Proxy: <xmx:65PBaAH16bORS4q37pnLds3DfUUBzlVGn-Pt3fvYto7VJvQoHMMSdw>
    <xmx:65PBaFu3iMhSF_sd2as6faYW2plPJt29UweisNI06gLQE5WIPPAIbw>
    <xmx:65PBaOlkkWu1_rVjx7sXNNNNs2HD5bNmGq9-P9AJ8tWUKSEy_FPo5w>
    <xmx:65PBaANikgn1PRJTlXAFqhkGv79Ja_NXr6ICMfQHaLTy-zD2f_1Q4Q>
    <xmx:65PBaCwN7TiYe2N5IxvtRfb_zC04VSLMVczKIFFj30SuybJgPqrsO9If>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 10 Sep 2025 11:06:19 -0400 (EDT)
Date: Wed, 10 Sep 2025 08:06:18 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Alice Ryhl <aliceryhl@google.com>, Danilo Krummrich <dakr@kernel.org>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>, Fiona Behrens <me@kloenk.dev>,
	Alban Kurti <kurti@invicto.ai>, rust-for-linux@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] rust: pin-init: add `#[bind]` attribute to access
 previously initialized fields
Message-ID: <aMGT6h5yIcpR3mCg@tardis-2.local>
References: <20250910100755.2361281-1-lossin@kernel.org>
 <aMFQL-Hq1KvBG5lh@google.com>
 <DCP1Y8N4SRRF.25V7F6PV5ODCQ@kernel.org>
 <CAH5fLgg+-oz_cP9=ke+ukp9qYZAsD=hKqvvGfkJWRcCKdrTQ-g@mail.gmail.com>
 <DCP456FHT625.1L5BVZ4LPD8VQ@kernel.org>
 <aMGE64_J5R8U_rk5@tardis-2.local>
 <DCP7JTWPA4QS.9PTE12UVZFDC@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DCP7JTWPA4QS.9PTE12UVZFDC@kernel.org>

On Wed, Sep 10, 2025 at 04:59:11PM +0200, Benno Lossin wrote:
> On Wed Sep 10, 2025 at 4:02 PM CEST, Boqun Feng wrote:
> > On Wed, Sep 10, 2025 at 02:19:00PM +0200, Benno Lossin wrote:
> >> On Wed Sep 10, 2025 at 12:40 PM CEST, Alice Ryhl wrote:
> >> > On Wed, Sep 10, 2025 at 12:36 PM Benno Lossin <lossin@kernel.org> wrote:
> >> >>
> >> >> On Wed Sep 10, 2025 at 12:17 PM CEST, Alice Ryhl wrote:
> >> >> > On Wed, Sep 10, 2025 at 12:07:53PM +0200, Benno Lossin wrote:
> >> >> >> Assigning a field a value in an initializer macro can be marked with the
> >> >> >> `#[bind]` attribute. Doing so creates a `let` binding with the same
> >> >> >> name. This `let` binding has the type `Pin<&mut T>` if the field is
> >> >> >> structurally pinned or `&mut T` otherwise (where `T` is the type of the
> >> >> >> field).
> >> >> >>
> >> >> >> Signed-off-by: Benno Lossin <lossin@kernel.org>
> >> >> >
> >> >> > Is there a reason we can't apply this to all fields and avoid the
> >> >> > attribute?
> >> >>
> >> >> Adding the attribute was due to Boqun's concern on v1 [1]. I think it
> >> >> might be surprising too, but I'm also happy with no attribute.
> >> >>
> >> >> [1]: https://lore.kernel.org/all/aLshd0_C-1rh3FAg@tardis-2.local
> >> >
> >> > IMO the ideal is if it works without an attribute. Perhaps trying that
> >> > in the kernel is a reasonable experiment to find out whether that's
> >> > reasonable to do for the general language feature?
> >> 
> >> @Boqun what is your opinion on this?
> >> 
> >
> > If we plan to make the in-place initializer language feature behave
> > similar, as I asked here [1], then dropping `#[bind]` seems good to me.
> 
> I don't think we can promise how that language feature is going to look
> like. It will definitely support accessing already initialized fields,
> but in what form remains to be seen.
> 

Sure, but in kernel we are able to stay the same as whatever the
language feature will be like, right?

In other words, as long as we propose the same thing to the language
feature and keep kernel code and language feature synced (presumbly
there could be some more discussion on the syntax when presented to Rust
commmunity), then I'm think it's fine.

Thanks!

Regards,
Boqun

> ---
> Cheers,
> Benno
> 
> > [1]: https://lore.kernel.org/rust-for-linux/aLshd0_C-1rh3FAg@tardis-2.local/
> >
> > Thanks!
> >
> > Regards,
> > Boqun
> >
> >> I'm open to take v2 or v1, whatever you guys prefer.
> >> 
> >> ---
> >> Cheers,
> >> Benno
> 
