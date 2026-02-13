Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0B0AB357A41
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 10:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770980401; cv=none; b=I1NdtGi0+GZwugBRRUYX2ELf4sRar78lChNwdlMZlou4GB8w+7RkOTh9nOTV03HBqL2J+LbUEc44pXcJPxYn/TCahir81tawosGEcZGJF3+qP5O0ZeBX2/w11KzHLtNX6kRFWUXoE2Sa2KMPGUKpEmVOLH2hs6a95YM8DcRZ6Uk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770980401; c=relaxed/simple;
	bh=30h1z13cxlxr/X1p+ssumnMPM0HhqDYeVwqXWJ2bvNg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OeqTLPYshsMYVSsiuN6Ir3alrn06BZ1UN3mvH8OvwT/cOkwkMGJG+CzGdxKksg9WykUun+LA/SBsmt+lORgwDw/td5TzSw2+y19O3NSLceZOuqUHMDOSZvS5+2Ve4ucAaA3JyZ+9B5Pn2GBI5Oo25bbIn0zYfwnF8A0u4do0i+0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4F86E1570
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 02:59:53 -0800 (PST)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 6CBE93F73F
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Feb 2026 02:59:59 -0800 (PST)
Date: Fri, 13 Feb 2026 10:57:49 +0000
From: Liviu Dudau <Liviu.Dudau@arm.com>
To: Mark Brown <broonie@kernel.org>
Cc: Onur =?utf-8?B?w5Z6a2Fu?= <work@onurozkan.dev>,
	daniel.almeida@collabora.com, aliceryhl@google.com, dakr@kernel.org,
	airlied@gmail.com, simona@ffwll.ch, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, lgirdwood@gmail.com, ojeda@kernel.org,
	rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 1/1] drm/tyr: make SRAM supply optional like panthor
Message-ID: <aY8DrSjWm5w6Lfs-@e142607>
References: <20260212100538.170445-1-work@onurozkan.dev>
 <20260212100538.170445-2-work@onurozkan.dev>
 <4b00826f-52b1-48a1-b6b5-70ee62f7c014@sirena.org.uk>
 <20260212151644.4c179594@nimda>
 <6704ddce-e0bb-4b50-b81a-a098816f3ba3@sirena.org.uk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6704ddce-e0bb-4b50-b81a-a098816f3ba3@sirena.org.uk>

On Thu, Feb 12, 2026 at 12:21:07PM +0000, Mark Brown wrote:
> On Thu, Feb 12, 2026 at 03:16:44PM +0300, Onur Özkan wrote:
> > Mark Brown <broonie@kernel.org> wrote:
> > > On Thu, Feb 12, 2026 at 01:05:38PM +0300, Onur Özkan wrote:
> 
> > > > Panthor handles SRAM as optional and tolerates missing sram-supply.
> 
> > > Does the RAM really work without power?
> 
> > If the platform has no separate sram-supply (meaning that rail is
> > coupled to mali), RAM should still be powered and work fine. Panthor
> > already relies on this model by treating sram-supply as optional and
> > as far as I can see there are no RAM issues on Panthor.
> 
> The panthor driver is buggy here and should be fixed, the driver should
> treat the supply as mandatory and let the system integration work out
> how it's actually made available.

Please note that the sram supply is mandatory in all compatibles except
for the "mt8196-mali". This was to work around the fact that MTK has decided
to control some supplies via another method and not give Panthor control over
those.

We should fix Panthor to check that we only treat the sram supply as
optional for "mt8196-mali", but that doesn't alleviate Tyr's need to support
optional regulators.

Best regards,
Liviu

> 
> Trying to open code this just breaks the error handling.



-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
