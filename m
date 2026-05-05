Received: from relay.hostedemail.com (smtprelay0017.hostedemail.com [216.40.44.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50EE41391;
	Tue,  5 May 2026 03:20:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=216.40.44.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777951204; cv=none; b=I2H1Mh/NTBhj0vOH4B7rSNRgDIfpSFrimWtTT2bo639rl/yDcFz+KgtjNTLKXfk/p6RA7/0rdMHpLGAh8f3+SJnEbbUh6gp76PDfzzSbJxj+4m+PDFLTHt/Xti54uJ3uoZAwlrDQbKI0oGbVFQAoz18lCkNFZUZZ0GYIU3SB+UE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777951204; c=relaxed/simple;
	bh=jmxgOVllhBbd9wXodh3HETSqlS5j5u2VP8XIaex08Vo=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=LhSNuf3uoqfl5METrSjk6rHkrfGEdN7MMdvBVcnj4pv8+FyQ1hbF39F3WjhT9wNruEMyCui7OKrRExwgURCnYZP8FxKoATrq2eDj/oj5NjPMXjmnvE2heKZ/+fd9BckL/SSvjp2TPJSZbv0BOQBIs6S/E6vplaDmvgEVfAsT1hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com; spf=pass smtp.mailfrom=perches.com; arc=none smtp.client-ip=216.40.44.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Received: from omf17.hostedemail.com (lb01a-stub [10.200.18.249])
	by unirelay10.hostedemail.com (Postfix) with ESMTP id 0F4BEC1A11;
	Tue,  5 May 2026 03:19:55 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf17.hostedemail.com (Postfix) with ESMTPA id 742501C;
	Tue,  5 May 2026 03:19:51 +0000 (UTC)
Message-ID: <0b127006e552de855ba7d33c15d2199436a001cb.camel@perches.com>
Subject: Re: [PATCH 2/9] docs: escape ** glob pattern in MAINTAINERS
 descriptions
From: Joe Perches <joe@perches.com>
To: Randy Dunlap <rdunlap@infradead.org>, Mauro Carvalho Chehab	
 <mchehab+huawei@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Linux Doc
 Mailing List <linux-doc@vger.kernel.org>, Mauro Carvalho Chehab
 <mchehab@kernel.org>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, Andrew
 Morton	 <akpm@linux-foundation.org>, Matteo Croce <technoboy85@gmail.com>,
 Shuah Khan	 <skhan@linuxfoundation.org>, Matteo Croce <teknoraver@meta.com>
Date: Mon, 04 May 2026 20:19:50 -0700
In-Reply-To: <c2efc1a7-4406-4590-b863-5f258f3cae50@infradead.org>
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
	 <31f673089e2a83dc1fee17d47784579874476ca5.1777908711.git.mchehab+huawei@kernel.org>
	 <c2efc1a7-4406-4590-b863-5f258f3cae50@infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Rspamd-Queue-Id: 742501C
X-Rspamd-Server: rspamout06
X-Stat-Signature: 11gcgsis8m83z1ercfiacqiuiabwy93s
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18JsanZu4qjYVqfZJhpe4jI5xqiKGjBVOw=
X-HE-Tag: 1777951191-122
X-HE-Meta: U2FsdGVkX1+v43GpVe2wpFTyNj9MLUUe74T7SINuWikNgvBdDwYZswVa7M2+BHDP+nnCHtBOxciEdyU999aDJ4vtlMYMayRbHfW1Ug7Wte2ur4yPKxA4hSAgvOIE9a7/h1qv9uCDW0T2tAz1/SgFkzkUkSz+2ccmvXQr3UJbEJd2PoEt1azJRKywVbU6so1E+zfSV07zQZXOsG914l4KMWL0guVaaVWND9lEsF1fVO60jjuBXo0sX8DmsBdrrkmJxtG/oWx54y22pR3AiRUcPsgW91YG9nRnziUDSoPPwBOn1a0o+okWi0PJouxZcENpgTCJKVC/Ak/zBNhozmDULjuHbatnWjkQznb9m7or1vaeiIJGCVRCUCEYduyI3rEf

On Mon, 2026-05-04 at 14:20 -0700, Randy Dunlap wrote:
> On 5/4/26 8:51 AM, Mauro Carvalho Chehab wrote:
> From: Matteo Croce <[teknoraver@meta.com](mailto:teknoraver@meta.com)>
> >=20
> > Escape '**' in the MAINTAINERS descriptions section to prevent
> > reStructuredText from interpreting it as bold/strong inline markup,
> > which causes a warning when running 'make htmldocs'.
[]
> It's nice to eliminate one warning from 'make htmldocs', so this is good
> in that regard. However, there are still multiple problems (not Warnings)
> with '*' characters in the MAINTAINERS file:
>=20
> 1) 	   F:	*/net/*		all files in "any top level directory"/net
>=20
> In the html output, it shows "/net/" italicized (that's what one * does).
>=20
> 2)	   F:	fs/**/*foo*.c	all *foo*.c files in any subdirectory of fs
>=20
> In the html output, it shows
>=20
> 	F: fs/**/foo.c all foo.c files in any subdirectory of fs
>=20
> with both occurrences of "foo.c" italicized (dropping the '*' characters)=
.
>=20
> These 2 examples are actively wrong.
>=20
> [adding new:]
> We would be better served by just putting file patterns inside ``fs/**/*f=
oo*.c``
> quotation marks IMO.
>=20
> Ah, similar to what you do in the table output.
>=20
> Oh, with one little glitch:
> E.g., in the very first entry for 3C59X NETWORK DRIVER,
>   F:	Documentation/networking/device_drivers/ethernet/3com/vortex.rst
>   F:	drivers/net/ethernet/3com/3c59x.c
> it looks like automarkup is applied to the Documentation file so these
> 2 files are displayed as:
>=20
> networking/device_drivers/ethernet/3com/vortex, drivers/net/ethernet/3com=
/3c59x.c
>=20
> with the Doc file underlined and missing both Documentation and .rst.
> Or maybe that's what you intended since the automarkup link does work.
> It's just not what I expected. Oh well.

Please stop trying to format MAINTAINERS into rst.
It shouldn't be formatted.
It's simple text.
