Received: from fout-a3-smtp.messagingengine.com (fout-a3-smtp.messagingengine.com [103.168.172.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32CC155C97
	for <rust-for-linux@vger.kernel.org>; Sun,  6 Oct 2024 08:23:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=103.168.172.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728203019; cv=none; b=oNvPthJtOVMvF7YWBMhVwrlO9zxF5FdNs/cWp0zIII76rRxmJSgHfTs28ocwvoP7ppGkRB9F4fAXBQNbwxlOSjXovcHD+T9PtPZjn/YXBbc+4e9aeAd+bZTPmZxetqNsxJQSeCcJaId6FShZbp5vYuaawSBzjCOaXd+H1U1JoWc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728203019; c=relaxed/simple;
	bh=1Xy1QhvxqJyBYDbdVeeJAmtvv088lK6L3WAoA1iT/Jk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QE1PnjxwEsDikf7IMMnwaerz4KI5fjRBfdVP+OTXoLt04OTlNmfxSrfSkEmzEkI6hDMOUDekcr8IsJL4whHG+CR9EuiynsW4Qlrbd+ZE35cNoxnN89loF+35IY6m7lpLlDPH6ddZ72I8Te4EXsYYXu/hvmlc4DECSn+4zXgbrNU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ryhl.io; spf=pass smtp.mailfrom=ryhl.io; dkim=pass (2048-bit key) header.d=ryhl.io header.i=@ryhl.io header.b=IV7+8AHU; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=Bw2FELs1; arc=none smtp.client-ip=103.168.172.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=ryhl.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ryhl.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ryhl.io header.i=@ryhl.io header.b="IV7+8AHU";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="Bw2FELs1"
Received: from phl-compute-10.internal (phl-compute-10.phl.internal [10.202.2.50])
	by mailfout.phl.internal (Postfix) with ESMTP id A1DAA1380486;
	Sun,  6 Oct 2024 04:23:36 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-10.internal (MEProxy); Sun, 06 Oct 2024 04:23:36 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ryhl.io; h=cc:cc
	:content-transfer-encoding:content-type:content-type:date:date
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm2; t=1728203016;
	 x=1728289416; bh=bmrn+a1UA3qzzDW8pHwFN1FXwe7Br1LQ52I7HiDlYCM=; b=
	IV7+8AHUGLtlwuREi3grjE7+hM4gvUZmhQoJqYCi/acGTzHtZR17o370V81FOkn1
	y4wj4t7mZ59DHoZwPGqB6s91kAgMNQzMv6DAqtSZNwFLeHWGqlOyqqidQ2CewP7p
	jCA5j/dcbhQQ67cb3mfbET+wBHlGr5mr882n2p2BbkkWjI3CLEVnZQIO+vaeoO2Y
	G0rocFdJb6Ciso394e08E4/ryMe88ecR7R0KjCOlywGxIGjisxK7/l2zftiQsmgk
	G0xD8pZfdMKM36XqB+pxEfF3j0fNdwuubTAJyFTwohy1KOw+wrn47qPCl0IDLHmo
	IUvM0NbCiixf1cZVpDRZgQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1728203016; x=
	1728289416; bh=bmrn+a1UA3qzzDW8pHwFN1FXwe7Br1LQ52I7HiDlYCM=; b=B
	w2FELs1sOFB6CAWXI2UHLTDXekMJfEVc+TkZtCUrERrlnEv28mNca8HCFonAeugx
	4f7fJiE7WKk4XHCIGMt8jZ8PC4/oPiYeeHOVRZX18AdFNpEB/HHYR7Z2YEK+tsx3
	jNe5OWTc/l7T05Fwvw7Ij3FC70ITigjfBbFFBunJ8WPn4f6xzc0CbjpIZ+EsNQZq
	ZrSO7plaVSk3Z1Hj60k13yFinq1nXcchdGoTOUD8fvP0D63vw7pOdlzB5YnntZfF
	m46lDbIYacfiFfdCw62/ZIYIqff6isa/Qm9/SpCViPp31mLqFY52PSDOKiRQK6zV
	BlHMHVbJOwn4Fqifo5GIQ==
X-ME-Sender: <xms:CEkCZwvYhz0DFxeaXklWrtl7dogIqjrHzOSonW7x4y6VgNXcplDpVA>
    <xme:CEkCZ9f6CjtRFpe5CrIVYhGM6LUJpxaa3Zja0J-cw58mo1mVw_xFq4MhUDtdc5nSb
    1dNFMQMSMFw5mdACg>
X-ME-Received: <xmr:CEkCZ7xPnqh4vO5bI4K5UIgepynYOjTonbsSdukcMvlmMs3b2JoLsR2zfU-HrkX5SrFBCzkztn-ov8oAoUdB8ycZjp5LYhwi96eE>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeftddrvddvjedgtdefucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggvpdfu
    rfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnh
    htshculddquddttddmnecujfgurhepkfffgggfuffvvehfhfgjtgfgsehtjeertddtvdej
    necuhfhrohhmpeetlhhitggvucfthihhlhcuoegrlhhitggvsehrhihhlhdrihhoqeenuc
    ggtffrrghtthgvrhhnpefhgefhleegffelgeffffevgedthfelteegfeevieehudeftdff
    ffeludefhfegheenucffohhmrghinhepghhithhhuhgsrdgtohhmnecuvehluhhsthgvrh
    fuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomheprghlihgtvgesrhihhhhlrdhi
    ohdpnhgspghrtghpthhtohepkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohepfh
    gvlhhiphgvpghlihhfvgeslhhivhgvrdgtohhmpdhrtghpthhtohepohhjvggurgeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtoheprghlihgtvghrhihhlhesghhoohhglhgvrdgtoh
    hmpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhrtghp
    thhtohepghgrrhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghoqhhunhdrfh
    gvnhhgsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghlvgigrdhgrgihnhhorhesghhm
    rghilhdrtghomhdprhgtphhtthhopehruhhsthdqfhhorhdqlhhinhhugiesvhhgvghrrd
    hkvghrnhgvlhdrohhrgh
X-ME-Proxy: <xmx:CEkCZzNHPtURaE5HXrDQj0GhgIvv1lLhFJ3oR-2KWRgpt7M2G3DdAg>
    <xmx:CEkCZw_nw9iucpdifDXi17kO-Q-NSjh3vYdv4V-1QWsgeEVFIEFQ1A>
    <xmx:CEkCZ7V3u9FKZU5K_ShC3y0R-8Yse6ilJiUqm2cS6RduwxR5Et5n1Q>
    <xmx:CEkCZ5cn2H3bkoLstsS4xd2mSuPEbWxAyoYvroH9RmM5TUbh37FqgA>
    <xmx:CEkCZ0SfsOUdq5jiVMXWbl_nTjIq8OlRnCG1oRjlL1pm0lICU6v1pytr>
Feedback-ID: i56684263:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 6 Oct 2024 04:23:34 -0400 (EDT)
Message-ID: <ce9f4b14-3703-416b-b16e-1251abd9cb18@ryhl.io>
Date: Sun, 6 Oct 2024 10:26:36 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] rust: optimize error type to use nonzero
To: Filipe Xavier <felipe_life@live.com>, "ojeda@kernel.org"
 <ojeda@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>,
 Benno Lossin <benno.lossin@proton.me>, "gary@garyguo.net"
 <gary@garyguo.net>, "boqun.feng@gmail.com" <boqun.feng@gmail.com>,
 "alex.gaynor@gmail.com" <alex.gaynor@gmail.com>
Cc: "rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
References: <BL0PR02MB4914B9B088865CF237731207E9732@BL0PR02MB4914.namprd02.prod.outlook.com>
Content-Language: en-US, da
From: Alice Ryhl <alice@ryhl.io>
In-Reply-To: <BL0PR02MB4914B9B088865CF237731207E9732@BL0PR02MB4914.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/5/24 9:51 PM, Filipe Xavier wrote:
> Optimize `Result<(), Error>` size by changing `Error` type to
> `NonZero*` for niche optimization.
> 
> This reduces the space used by the `Result` type, as the `NonZero*`
> type enables the compiler to apply more efficient memory layout.
> For example, the `Result<(), Error>` changes size from 8 to 4 bytes.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1120
> Signed-off-by: Filipe Xavier <felipe_life@live.com>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
