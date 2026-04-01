Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2EFE630C601
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 18:06:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775066821; cv=none; b=uvAcSBqwy20zXljfNekvz4Hx2IWzVHCKWaA12NtPoEZ14nLSMTtozmP86Kkt916pjVe1zfbVWExO+IHJypt1UX++qulQsl9VUUoc0/v+HNbFN6cThS+q9JhCSKTshagf+FHMobWhZW2AUn14pDvIJy15kFHls8RDL1gDZWa5vxU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775066821; c=relaxed/simple;
	bh=iCuSVxniOJmxtfngko0i9FNcCqmtrfryl0rvCK/eLho=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=rz7/xz45SLpjqzSasiKhYenOfqRyuA/EHeVDOflCrRhuJzd/fb3RuoRonZpo/ziDdnWcP4IaFiHlhmiicbhi72LRd1Np6FpFf6r88l1uoiel0urCSPO0HPOunAgSEY70HX5GcBqXHEK7Vg4bAgB0vIV3kg1klwhUeaaY09Cny6E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=mcX3wm7H; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=hcw41Mcb; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="mcX3wm7H";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="hcw41Mcb"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 653B07A00FC;
	Wed,  1 Apr 2026 14:06:58 -0400 (EDT)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-12.internal (MEProxy); Wed, 01 Apr 2026 14:06:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775066818;
	 x=1775153218; bh=jM0foTiI7lhoiHTOiV6k+RQEqnYXs9c1So8Nur7VZ94=; b=
	mcX3wm7H7sY12j1jPfeiLEiFLF76OElk51zKzY9nDOtiqHbEO16mvQO65Z5ccW5a
	58kpGZ3WXzv1n+XsBG+n8iel+J0e8Eu12a25j56aYL91ORhV/kM/8bWdgRsSd8Aj
	tF/bFZCgnS4nWduac65MOjxK18NXZhBoS98KI4heUTp8YQRQ+Qu858B3YwKdrBgJ
	I0ER0nBhsyXL+WGl8bEdM37Z2CjaXbCCdBlJptqyv0zDItlm4PmNl1sVzDY3pps8
	AL4yGSxWVCtnrQYou2nhNysAVgNPHNjKvquuZ7wvRp41zYyyPKFh7eoXPydodHsl
	qJ5NX388GN9SWcC5Ycz5qw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775066818; x=
	1775153218; bh=jM0foTiI7lhoiHTOiV6k+RQEqnYXs9c1So8Nur7VZ94=; b=h
	cw41McbupyANCDY8R7BoKNSi/noEHKLaZy+5M6EEa/8IZXbSNHVo2UpGwfb1X4kz
	iyReGKDqr4RnZQOQIYI6B+6WVDx9lYY9+2AtwiR4Vwwqt0iRNOGdBckKvQt7HRlw
	zqwSApKjESR8VHShSC1M2gid+6R1xECdlEQY5dBqUbrFarzdWmOBRjejAiZ/AuRZ
	BB6UFpUzAdaFkpfozs6UpOL3qmc2DCke8/zRXPAqh1mMaFEerBivzid2qHK453lY
	3NO3FlXHLk2GaNud1UfVBowtAGNCPHyHguhZpvRta9z44A7f/kLQite95foJ3xSG
	M5Zw4A0dxARBpjg8E3r6g==
X-ME-Sender: <xms:wl7NaSXjEK6gbz4dlNBJSy0ochkL4e4HprPBPmphrOq1WkW985pEiw>
    <xme:wl7NaZbI7qB14hizoeW67eyix3odGlLOjv_L0Ikbk4vNHW5zZZqfB6G3qwAx3zVEx
    zEaM4bCkMCSkTsG8fPZY7e6IflVEOyclu_2uAml0pBx4f20OfcWwg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefkedtucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedfffgrvhhiugcu
    tfhhvghinhhssggvrhhgfdcuoegurghvihgusehrvggruggrhhgvrggurdgvuheqnecugg
    ftrfgrthhtvghrnheptefhteefhfefteffffffteevueejleeiheetgeehffeileevfefh
    keegkeefgeelnecuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrh
    homhepuggrvhhiugesrhgvrggurghhvggrugdrvghupdhnsggprhgtphhtthhopeegpdhm
    ohguvgepshhmthhpohhuthdprhgtphhtthhopehtvghgsehjkhhlmhdrnhhopdhrtghpth
    htohepohhjvggurgeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheptghorhgsvghtsehl
    fihnrdhnvghtpdhrtghpthhtoheprhhushhtqdhfohhrqdhlihhnuhigsehvghgvrhdrkh
    gvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:wl7Naf8O4HNiP2zJ1vVVp6PSYnlDEFAPCs2L2iiMi99RkrnHVGKGCg>
    <xmx:wl7NaZiKE3L6OYhO1xE4fLDEjh7RB_HEcBUkJG4oFIM32BdKO4d45A>
    <xmx:wl7NaXfIN2L7Lh36QQeKmK7i1E3ImoeadTuhfL3kYCuhfjZ30lzKqg>
    <xmx:wl7NaYqSJT5ZhqgUVUwbYN1ps2e65GZjhzrkNa7QWNNbtbkXOu14OA>
    <xmx:wl7NafYo81UgwT9gcRbs4R_UPqOl2RzPGTP5rXArJNVMauZEunHtBYH3>
Feedback-ID: id2994666:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id EE7D515C008E; Wed,  1 Apr 2026 14:06:57 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AhuZrXbOafIs
Date: Wed, 01 Apr 2026 20:06:37 +0200
From: "David Rheinsberg" <david@readahead.eu>
To: "Jonathan Corbet" <corbet@lwn.net>, rust-for-linux@vger.kernel.org
Cc: teg@jklm.no, "Miguel Ojeda" <ojeda@kernel.org>
Message-Id: <98e34e54-2068-441e-aa6b-01bc8646c181@app.fastmail.com>
In-Reply-To: <f24826ae-25bc-483e-b2be-44387f66b2ef@app.fastmail.com>
References: <20260331190308.141622-1-david@readahead.eu>
 <20260331190308.141622-8-david@readahead.eu> <87v7eaiqxo.fsf@trenco.lwn.net>
 <f24826ae-25bc-483e-b2be-44387f66b2ef@app.fastmail.com>
Subject: Re: [RFC 07/16] bus1: add man-page
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Wed, Apr 1, 2026, at 8:01 PM, David Rheinsberg wrote:
> Hi Jonathan!
>
> On Wed, Apr 1, 2026, at 6:30 PM, Jonathan Corbet wrote:
>> David Rheinsberg <david@readahead.eu> writes:
>>
>>> Create an overview man-page `bus1(7)` describing the overall design of
>>> bus1 as well as its individual commands.
>>>
>>> The man-page can be compiled and read via:
>>>
>>>     rst2man Documentation/bus1/bus1.7.rst bus1.7
>>>     man ./bus1.7
>>>
>>> Signed-off-by: David Rheinsberg <david@readahead.eu>
>>> ---
>>>  Documentation/bus1/bus1.7.rst | 319 ++++++++++++++++++++++++++++++++++
>>>  1 file changed, 319 insertions(+)
>>>  create mode 100644 Documentation/bus1/bus1.7.rst
>>
>> I'm really glad to see this documentation with the series!
>>
>> That said, a couple of notes...
>>
>> - Please do not create a new top-level directory under Documentation/
>>   for this.  It looks to me like it should be a part of the user-space
>>   API manual.
>
> My intention is to submit this man-page to linux-manpages. It is 
> included here to make sure it evolves with the series, but ultimately 
> would not live in-tree. I thought I mentioned this in the commit 
> message, but.. apparently didn't. I am sorry!

If you prefer, I can instead include it as rendered text in the cover-letter, as is common with new syscalls. But the man-page is rather long, so I kinda liked including it as a patch. I am fine either way.

Thanks
David
