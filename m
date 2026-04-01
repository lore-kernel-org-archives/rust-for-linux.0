Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14CD72E0412
	for <rust-for-linux@vger.kernel.org>; Wed,  1 Apr 2026 18:02:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775066534; cv=none; b=HaIAQ2uOBS6qqEbyJhYogxp1wGDBI9sAxsJIKi+6do80yAAiGaf3tqbn7wLkXXni1hVZ6k2WyZZcLlg+bBQez46xMBnYWj9qKwkBlop72fDmAVJXWgub2CwViCp7Ai6McBg6yT+cJV/dWpJjTjEOIiuaQRw3tgOrfObdWsHBm1k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775066534; c=relaxed/simple;
	bh=673cDiMuLrY67BQwqTQIlXW/A8IRm5g5waWlzw6xrqQ=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=ijXDYlUrtuixYvOec2zH9PRjU+W9kRUlaHnleu9KDA3eiPI2eQYYh5boDEC1WRnqfNghL4Ai9NOxORbhC7uqthTAQPptn0ssEKmEWny49dtnMSvjFTy4wZtIT6R7aUWJyLGsNFg2a4db1FF0VH41XrB9clLmguscBFoVmKAVq4o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu; spf=pass smtp.mailfrom=readahead.eu; dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b=fuYwREsP; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=FuWJiPak; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=readahead.eu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=readahead.eu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=readahead.eu header.i=@readahead.eu header.b="fuYwREsP";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="FuWJiPak"
Received: from phl-compute-12.internal (phl-compute-12.internal [10.202.2.52])
	by mailfhigh.stl.internal (Postfix) with ESMTP id 1552C7A008F;
	Wed,  1 Apr 2026 14:02:11 -0400 (EDT)
Received: from phl-imap-18 ([10.202.2.89])
  by phl-compute-12.internal (MEProxy); Wed, 01 Apr 2026 14:02:11 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=readahead.eu; h=
	cc:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1775066530;
	 x=1775152930; bh=CyC01+PRrIlUFfSp5dDKySjJNz4C7p/3AJFIaK4gwH4=; b=
	fuYwREsP6uyZ0HA1ldiZ7nBW/6eVTUZd9wqaT2pB9vqQ8tzbDHyKYGUPjIki2GNJ
	JtD7KUflF08BApWC+uoZrrB613aWASUAcpbwJuWRAprfTMvCfnK8A8X4Dh0DL8zV
	pINx9mmepBI5og7oPkKi7owABJEj7KA0RyvZyO8zXj/bEgMImrwr7pte4nj0RjI2
	69alGaL5xFIwDTeiEO+VoZ0MFXDT/deEs+ue4dBInvKkzPFFFNv3QCAn7CtWEaOg
	O0L/h3drFgijZrEOHVP/bw3HA0OVXn439A5JyWcBTAeyjWrdvCzgJduqcV3/+u18
	gh9by3SuKaztnvZ2urF1Tw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1775066530; x=
	1775152930; bh=CyC01+PRrIlUFfSp5dDKySjJNz4C7p/3AJFIaK4gwH4=; b=F
	uWJiPakXaVBYFbYHx4beiBM8PkDtx2AYFP8F2aCYKjxGi9jwQEieotHJZC7qX+Yp
	UU9lTls7RZqOT31b/ZvZk8fbhfpA5w/otbCS9T0pYIW1TUZwcklGMp7O2Ey3/CZv
	lmC3tlrb9tiViWOORAHFiVA0Hwjb/liuqiywV9gbD4KIsEO3iZwHKr8T+aFRt2ET
	1A1pY3tHYwD6L2Qyqpj4EizCXFgHSyA8bkiz+a1N0h6RCqwJZYUVNwmgF9TQ7uuS
	SRMJhPI8+VAFHh3G9A1Mb3PzsOsCg6RWJX95Ybcc1McbunidBMSnGLrbN9NZ5VtA
	ZqQCS2G1Ts8nSnYzrELHA==
X-ME-Sender: <xms:ol3NacdLdsF8t3Dlz25D50kU8QxitZmbBmaUwN63PcKN_VN_TrrQMA>
    <xme:ol3NaZDhdfA_kZ53wBzqqmypza_bKJ5ETuW1fwaYBshvz7U3TMIEtuhlHYBsGFcWQ
    a-yrPlgFQuzs9ix-zPuuwnfECEutg010Y_iBLurEx9XQ4FPsvGi2Q>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdefjeelucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:ol3NafIcPAhDIdb1EAYlUSWiUMgQyqrHY9qZ-5fjS_cmv6HOzZuo-w>
    <xmx:ol3Nacn08rtUaIW3TFpB7QKbU8LbGsT7OcTbH7lJEwnYE713iE_iMQ>
    <xmx:ol3NaXQdQZTzOOoQvlowXksKYWhZyPW849jVXRoX_c8zzTZAXLNO4A>
    <xmx:ol3NaeLVCucfMbn3Cr4Qsh4B3SIfJsP9ye_ruCusOodD552VzhVbRw>
    <xmx:ol3NaUoXH4m0xoZHViumK719fCQnDMQjrBdyPZe6USaHhnqfG6g8tw8z>
Feedback-ID: id2994666:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 5365B15C008E; Wed,  1 Apr 2026 14:02:10 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ThreadId: AhuZrXbOafIs
Date: Wed, 01 Apr 2026 20:01:50 +0200
From: "David Rheinsberg" <david@readahead.eu>
To: "Jonathan Corbet" <corbet@lwn.net>, rust-for-linux@vger.kernel.org
Cc: teg@jklm.no, "Miguel Ojeda" <ojeda@kernel.org>
Message-Id: <f24826ae-25bc-483e-b2be-44387f66b2ef@app.fastmail.com>
In-Reply-To: <87v7eaiqxo.fsf@trenco.lwn.net>
References: <20260331190308.141622-1-david@readahead.eu>
 <20260331190308.141622-8-david@readahead.eu> <87v7eaiqxo.fsf@trenco.lwn.net>
Subject: Re: [RFC 07/16] bus1: add man-page
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

Hi Jonathan!

On Wed, Apr 1, 2026, at 6:30 PM, Jonathan Corbet wrote:
> David Rheinsberg <david@readahead.eu> writes:
>
>> Create an overview man-page `bus1(7)` describing the overall design of
>> bus1 as well as its individual commands.
>>
>> The man-page can be compiled and read via:
>>
>>     rst2man Documentation/bus1/bus1.7.rst bus1.7
>>     man ./bus1.7
>>
>> Signed-off-by: David Rheinsberg <david@readahead.eu>
>> ---
>>  Documentation/bus1/bus1.7.rst | 319 ++++++++++++++++++++++++++++++++++
>>  1 file changed, 319 insertions(+)
>>  create mode 100644 Documentation/bus1/bus1.7.rst
>
> I'm really glad to see this documentation with the series!
>
> That said, a couple of notes...
>
> - Please do not create a new top-level directory under Documentation/
>   for this.  It looks to me like it should be a part of the user-space
>   API manual.

My intention is to submit this man-page to linux-manpages. It is included here to make sure it evolves with the series, but ultimately would not live in-tree. I thought I mentioned this in the commit message, but.. apparently didn't. I am sorry!

> - You need to add your new RST file to the containing index.rst file for
>   the docs system pick it up.  That, and some things in the file itself,
>   suggest that you've not run the docs build on this file; that would be
>   a good thing to do at some point.

It builds fine with `rst2man` (as described in the commit-message). It was not meant to be picked up by the kernel docs, so is not linked in any index.rst.

Thanks
David
