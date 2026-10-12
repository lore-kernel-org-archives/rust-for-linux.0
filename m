Received: from sender6-op-o11.zoho.com (sender6-op-o11.zoho.com [165.173.180.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C89E37C90B
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 16:06:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.180.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791821208; cv=pass; b=aBdSeXv9T/JlseaiE6IPhkxW2x/CaVPhl/eXzZrdNpRgob8Bb0w2PFp1BdLxtobwJgT3AkOS+L8kfZyz4Psh6WPRq3AU/g+rME+4UalbidbvEU6qAOK50ti+4dl/jn6sYEnjkn9aK7J6DScYJCavT/5sO+rIGjfqNRtR8Fm53ZU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791821208; c=relaxed/simple;
	bh=2YY5M56GxFF0JFDP2oDui1enuzFvW89M/UK+HgLJX7o=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=nCmA1AUCYzufANz/406i5Tv4PSjZ/VnFJZqbjNcGYbiLSKv0mo5al5Zy2dFe//T4h/IgjXyyuuTSe0IJtMktb+eX2JPcF893ZFoerakwAhdUeoqm0bX0ycmC8bAW5NDHf2LJVg919pMo/va6HmPyFPug1BnkQU5AlnEWrepMv7A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=jS4AGKSb; arc=pass smtp.client-ip=165.173.180.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="jS4AGKSb"
ARC-Seal: i=1; a=rsa-sha256; t=1791821196; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TnTzHKL6in7wiqhrDLUMWWDHjHrPlHE8ZmymRpr4mNr2C1YzpFqXb+IX56VyIJ3uk/F2HvHpLYrHlMs1FYzpsAV/g0DPFweZRbm7IvGzIhu4TlK02jc23ssfedDGSsWcxNVqj4T6XiPSTUY4xSGaWFqmZSH7dR+l+XWHYH8n/6s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1791821196; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=kpl7bgQq54ugqONoh1i3qk1kF/nXr2JA7OnourSb7I4=; 
	b=FTSVgT2utbFHnxaYt6a9SNVnHeYl11kZECO74fpCgPG9ryBlpYg2sLGsi+sIUilo/PttkkkeSUpC4BSDoJw7lAfQxk1kJzBJZ/ILrRAOcC0iak1BqxdBiZnzXQQ082CKcmPS/803LmYy2YH2WTi8ZsdPEtCHreHLcMaJw40sGQU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1791821196;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=kpl7bgQq54ugqONoh1i3qk1kF/nXr2JA7OnourSb7I4=;
	b=jS4AGKSbFD/PUfeheC1u/TG9n1rxRB9yGNaYOyP+hIVHe0JTwiJJa4tcfqgcDqhH
	9gwBCKsQDnHJLNVrDzOHtvKo+jrNlxWfjyJId8tulfZ93WvdjAG3x8c5v7mSLAOWOwe
	/5UDHzhoHf81zq6wljzwoDeELPVY5JyVgCOTebeQ=
Received: by smtp.zohomail.com with SMTPS id 1791821195310505.8212225900496;
	Mon, 12 Oct 2026 09:06:35 -0700 (PDT)
Content-Type: text/plain;
	charset=utf-8
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH 2/7] rust: drm: gem: gate open/close callbacks with
 RegistrationGuard
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <DM22LS0S86HB.2G9NWE78JHV0@kernel.org>
Date: Mon, 12 Oct 2026 13:06:20 -0300
Cc: sashiko-reviews@lists.linux.dev,
 Alexandre Courbot <acourbot@nvidia.com>,
 ojeda@kernel.org,
 dri-devel@lists.freedesktop.org,
 rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Transfer-Encoding: quoted-printable
Message-Id: <0CA5ABE5-C198-45D5-B393-50AA219D6F14@collabora.com>
References: <20260814230923.1292966-1-dakr@kernel.org>
 <20260814230923.1292966-3-dakr@kernel.org>
 <20260814232106.01AA71F000E9@smtp.kernel.org>
 <E989BBD7-DF97-4384-AFC1-3D7448A1C747@collabora.com>
 <DM22LS0S86HB.2G9NWE78JHV0@kernel.org>
To: Danilo Krummrich <dakr@kernel.org>
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External


>=20
> close() is a pure optimization callback, e.g. to unmap memory that =
userspace
> can't reference anymore anyway.  For the reasons mentioned above, =
providing it
> to the driver after the DRM device is unregistered is pointless, and =
calling it
> when unregistering the DRM device would be pointless too, as any data =
it could
> ever access is dropped at this point anyway.


So you=E2=80=99re saying that close() can be removed entirely? Or did I =
misunderstand?

=E2=80=94 Daniel=
