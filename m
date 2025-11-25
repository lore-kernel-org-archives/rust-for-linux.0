Received: from sipsolutions.net (s3.sipsolutions.net [168.119.38.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 22745286881;
	Tue, 25 Nov 2025 07:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=168.119.38.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764056423; cv=none; b=TWVv08nlo1PauvDW2BL2G0kChiwTC7f9TtQy90L0S0WRynlOuwEa4i0XMhsm/sNEmuZhKvcO25LMT+APTWSYnKpDHE6FzL+iSqJY0WAAt6vA5mwdv6qtEmRw4QwLdtWEOjSDRQ8P11vRu7N/pULrE6YUwIBse1NnZxJcaO3kNoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764056423; c=relaxed/simple;
	bh=NHne8B71rhlo4JDZkWGouJWY6gpQg/ock03JEjHdivU=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=AiRHA52IfbsraeUjjkH2IQvAKCADsGy0cB+G0eh7xBhiX8kIcwwDLz9V9d4an7t/5MDpGe8wPz/UJ/LupVZRgaMbuhPAmcyRpoFw2TuihZNUGnMITp0AwjEyEIefDmpssVxw3PIsbtVB7cv/vrocjDpx7UUMokavKBXQESOuSmc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net; spf=pass smtp.mailfrom=sipsolutions.net; dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b=voj3zK9s; arc=none smtp.client-ip=168.119.38.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sipsolutions.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sipsolutions.net header.i=@sipsolutions.net header.b="voj3zK9s"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=sipsolutions.net; s=mail; h=MIME-Version:Content-Transfer-Encoding:
	Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-To:
	Resent-Cc:Resent-Message-ID; bh=NHne8B71rhlo4JDZkWGouJWY6gpQg/ock03JEjHdivU=;
	t=1764056422; x=1765266022; b=voj3zK9sqDhiSNUioFFwAvFcallddhp4XHu5czvOu8XEwtP
	Hjw2sAWIUJRWMhNTyhhSTuvq+/B0HpGlrDAyb83Auspnm3mSwj1eJBK+givR/W2ryums7BqmHWccv
	4Z13Jlxw1YriUoekQ/tA7yWNmVNChdIz07ArgkVOZA7ywERQsSHFFtjg4105g2r16HFLiMCf+zhrC
	kXCcX735Jarad9yW/opbfkebsNpeW4x3L3u7kuNxrSIu3f+zayHMrOTBps/qTrDLGbgVECdQwIyDA
	ry9N6HybANQlImmPA4bxqIxktghzFxtyMaCwRcKD5UaxKVDc5OqINtidRegia90w==;
Received: by sipsolutions.net with esmtpsa (TLS1.3:ECDHE_X25519__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.98.2)
	(envelope-from <johannes@sipsolutions.net>)
	id 1vNneq-0000000BNRi-1osg;
	Tue, 25 Nov 2025 08:40:16 +0100
Message-ID: <dedea008d546a2a29d3b604e9f4b0c0dec3ebac1.camel@sipsolutions.net>
Subject: Re: [PATCH] arch: um: Don't rename vmap to kernel_vmap
From: Johannes Berg <johannes@sipsolutions.net>
To: David Gow <davidgow@google.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Richard Weinberger	
 <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>, Miguel
 Ojeda	 <ojeda@kernel.org>, Paolo 'Blaisorblade' Giarrusso
 <blaisorblade@yahoo.it>,  Alice Ryhl <aliceryhl@google.com>,
 linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Date: Tue, 25 Nov 2025 08:40:15 +0100
In-Reply-To: <CABVgOSmAGahEaa71_fOT4Oo9Wg91X6rN+1_KgVVvVzmd4vuMCg@mail.gmail.com> (sfid-20251125_083645_823712_C74034DC)
References: <20251122083213.3996586-1-davidgow@google.com>
	 <CANiq72=MXHZ2XswxkfzLqUEPwriNy=_sxAQpOYoYW8iNgyuJ8Q@mail.gmail.com>
	 <bfb512e24f365695534313b375fc0c38d0a843b2.camel@sipsolutions.net>
	 <CABVgOSmAGahEaa71_fOT4Oo9Wg91X6rN+1_KgVVvVzmd4vuMCg@mail.gmail.com>
	 (sfid-20251125_083645_823712_C74034DC)
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-malware-bazaar: not-scanned

On Tue, 2025-11-25 at 15:36 +0800, David Gow wrote:
> >=20
> > Or it's not that urgent because all this came up in -next now? I didn't
> > really see (or fully understand) all the build bug reports.
> >=20
>=20
> I'm happy for this to go in via any tree. (Worst-case, we could
> possibly take it via KUnit, though I'd rather not, as it's not really
> KUnit-related at all.)
>=20
> The issue has actually been around since probably 6.16 (c284d3e42338
> ("rust: drm: gem: Add GEM object abstraction")), but since it only
> applies to people building Rust graphics drivers against UML, which is
> not super common, it seems like it's only come up in randconfig builds
> so far.

Oh, interesting, OK. I guess then given that it's not super important
and how late we're in the game, I'll just throw it into the (relatively
small) pile we have for UML for -next. Given that we removed the pcap
driver in 6.11 (12b8e7e69aa7a) I guess we could even ask stable to take
it, but it's not even that important until someone wants to test the
rust DRM stuff in kunit or something :)

johannes
