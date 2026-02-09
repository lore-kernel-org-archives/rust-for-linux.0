Received: from fhigh-b5-smtp.messagingengine.com (fhigh-b5-smtp.messagingengine.com [202.12.124.156])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF39022B8AB;
	Mon,  9 Feb 2026 12:47:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.156
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770641257; cv=none; b=qgfBtu6T7CWBP6d2/k+ojHYWnkGiUQag93q6umgOurohPWYv+fD8RiIjbhE/l2ISKH0w0NT1ZxwOFi8YhXUIzNNYYeWm9tQL8BcK6rJZ1uBdR/Z+3Cp+ovPSnffZJyRn+H15tC4gWz/6S8RWBG7Ef9KGtVuUFhmQAtsn9BGdOCg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770641257; c=relaxed/simple;
	bh=RDcaStnUbAimuMXULCprr5C0mVOOx8METC8SN47KIsk=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=dNWio9GGDvqh7HaNreficQhiUw9gwO2lJ5wo7w69G8F6PwcHvCiMp0mZHo/WnorjAsUGpTzjDn2lnxMwVQXmy6WocDFUjbHJL0R2UPba9N7DXYepBXeVQmqSpIuAIAbwLFj6kQlfwnvpUQr8z3oVFo2eKAQ/2ihb608eYMXJxIQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net; spf=pass smtp.mailfrom=jannau.net; dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b=H6HT3TZ2; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Ow900fby; arc=none smtp.client-ip=202.12.124.156
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=jannau.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=jannau.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=jannau.net header.i=@jannau.net header.b="H6HT3TZ2";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Ow900fby"
Received: from phl-compute-09.internal (phl-compute-09.internal [10.202.2.49])
	by mailfhigh.stl.internal (Postfix) with ESMTP id B82237A01A0;
	Mon,  9 Feb 2026 07:47:35 -0500 (EST)
Received: from phl-imap-02 ([10.202.2.81])
  by phl-compute-09.internal (MEProxy); Mon, 09 Feb 2026 07:47:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=jannau.net; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1770641255;
	 x=1770727655; bh=RDcaStnUbAimuMXULCprr5C0mVOOx8METC8SN47KIsk=; b=
	H6HT3TZ2Ti6ofe+B7/4bXT+1q4Mq/VmXifUwSYQX/cgTpUByH73S9gzOYEnmWtHU
	UTLfbgN9sob9NhcCmodBd7FyMq91Mg0GkjuHlAtCIVbGolpZG2QP1HEWA13Rw5YC
	ibBIDj0uBImTgDjEKI1ksebc9EXjUM5wFF1bgpeskiH7uVp9w+U0paRcNImRnMgH
	XHIxM/1k7MKr0P0dXEb8WOrgWfyERZXsnH1rYEWTij/mLmj/eJ23EpGtqV/OBe8Q
	T5PaFKHc2h/9Fro2K7HjgCxcjSyj4+maVAaIFNim2UC6qRoOeFsIs3Upz8MpN9cI
	qH0yE379nZ2BS9FRT6Lxig==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1770641255; x=
	1770727655; bh=RDcaStnUbAimuMXULCprr5C0mVOOx8METC8SN47KIsk=; b=O
	w900fbyt87IxkXJT2AsPxUYnxxlYPMEforHpEx5CPXZ98jdk3dbJpmzDv6tVhw56
	UZPjGdfvZSfpmzleaRs8D+1JzzwvQ0vK0Gf7TwLJ5VYp1DgBUHUeLNey0uwnpDIe
	nzIHpsOSXgPdf+eBmj7thaQuhiWzwfR+GYUoJbmo4O7cSZ52cnIUrob26h1bcR+8
	0QtnH/ygJmWMZbCHRdVpxHhXgtJynKWRJ5QDMUGBRNTn5qfRYmoQO8nQfeAtuXoz
	8EgkGNRLoVVlp6pyHZalo2Z4xkxM7HRowAYiA8lubihBatWrhVvhPXrz1NCcs5ka
	cpWIODdH0yLdHcotx5mEQ==
X-ME-Sender: <xms:Z9eJaXbEXhglXPWGrPO5AOHVFWYm6KwpAlj7UZ2pBpVPyZl5bdA3dQ>
    <xme:Z9eJaRN-MtHwCR2Ilk9-EFB0uZ2JNqz5k1R8aDft7EZrq_vu5snk-11worPP7Ri9X
    Qetii5Vf0B6WKIUik7_XJZWPtnYBfh3lsaLW18OqI96TbatVi8bng>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduleeikeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepofggfffhvfevkfgjfhfutgfgsehtjeertdertddtnecuhfhrohhmpedflfgrnhhn
    vgcuifhruhhnrghufdcuoehjsehjrghnnhgruhdrnhgvtheqnecuggftrfgrthhtvghrnh
    epheejtdeffeethfetgefhffejudegheefueejtedvhfeuheevfeekheetfeduffevnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepjhesjhgrnh
    hnrghurdhnvghtpdhnsggprhgtphhtthhopeduuddpmhhouggvpehsmhhtphhouhhtpdhr
    tghpthhtohepuggrnhhivghlrdgrlhhmvghiuggrsegtohhllhgrsghorhgrrdgtohhmpd
    hrtghpthhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtoheprghlihgt
    vghrhihhlhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepuggrkhhrsehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehlohhsshhinheskhgvrhhnvghlrdhorhhgpdhrtghpthht
    ohepughrihdquggvvhgvlheslhhishhtshdrfhhrvggvuggvshhkthhophdrohhrghdprh
    gtphhtthhopehnohhuvhgvrghusehlihhsthhsrdhfrhgvvgguvghskhhtohhprdhorhhg
    pdhrtghpthhtoheprggtohhurhgsohhtsehnvhhiughirgdrtghomhdprhgtphhtthhope
    hlhihuuggvsehrvgguhhgrthdrtghomh
X-ME-Proxy: <xmx:Z9eJafRDMNB8Ht9QmdK8mSnBw6HC4Cgwtx7-cL8lQGHzIDxn0XyqNw>
    <xmx:Z9eJaWS9FIWcvPA1rW2tMG-WfiJa9XKugPgXafxEYhCHWJWTrNE4ZA>
    <xmx:Z9eJaT5NK8f9JDN6x8R6xYss1PiDz2wtDKUq78HLPpSgr71qkhHaCQ>
    <xmx:Z9eJaTWllneQ7EVqss2cw2wi2sZat69ZyT0EyD-dwhP3w7hWI43FKg>
    <xmx:Z9eJabKjI2htXehQeK4wYM1p8LyV8JZTvs58GGIyJjzI5cBXYI_E46n8>
Feedback-ID: i47b949f6:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 3925B700065; Mon,  9 Feb 2026 07:47:35 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AFB7yJ7vYniR
Date: Mon, 09 Feb 2026 13:47:14 +0100
From: "Janne Grunau" <j@jannau.net>
To: "Alice Ryhl" <aliceryhl@google.com>, "Lyude Paul" <lyude@redhat.com>
Cc: LKML <linux-kernel@vger.kernel.org>, dri-devel@lists.freedesktop.org,
 rust-for-linux@vger.kernel.org, "Danilo Krummrich" <dakr@kernel.org>,
 nouveau@lists.freedesktop.org,
 "Daniel Almeida" <daniel.almeida@collabora.com>,
 "Gary Guo" <gary@garyguo.net>, "Benno Lossin" <lossin@kernel.org>,
 "Alexandre Courbot" <acourbot@nvidia.com>
Message-Id: <d2b1efd0-dfc4-4ea0-9bbd-74f57cfaabd6@app.fastmail.com>
In-Reply-To: <aYnVvFwBk1SfiJGQ@google.com>
References: <20260206223431.693765-1-lyude@redhat.com>
 <20260206223431.693765-2-lyude@redhat.com> <aYnVvFwBk1SfiJGQ@google.com>
Subject: Re: [PATCH v7 1/7] rust: drm: gem: Add raw_dma_resv() function
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Mon, Feb 9, 2026, at 13:40, Alice Ryhl wrote:
> On Fri, Feb 06, 2026 at 05:34:25PM -0500, Lyude Paul wrote:
>> Reviewed-by: Janne Grunau <j@jananu.net>
>
> I think this email is misspelled?

It is, likely my fault. I noticed a few of those particular misspellings in the last few weeks.

Janne
