Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF29B409263
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 15:09:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783523376; cv=none; b=Q0M7p0r9Y9lJf65qVDD7yD9SFIShhmPT/+vfrUruPlRe+Rn9DDUaME/f0mqnpGUnf0CN2TS6YUOK6OmFr+ZFrm0jjgb5cuWq7Po7bQ1UOoA43Zr37ahE0a1M6YGeDohido6dzXPDFRpjc0oqSn+7X7v0UAH5XPPmIISQAz4/hKU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783523376; c=relaxed/simple;
	bh=Ojm4HC+Qo3NA3bCB4Voj7HSWNha37gVnNM6dlE9kbIU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rN25uL2wCGIhNa1NENPaZtDgUdfzQrYcmE0WwZZSsQXDlfBxEWkC61ZzQ2f36Elze3l3bDRaCcDx9JmShWWvutiVkVayc84N8FrRDSeXRvxRk1iqZYPJ/gsZoHhwl5/jgg199Tk2aHeIUXKc0FZalpuJm/q2ct881U7091R1L+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fkuKQ4Wh; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fkuKQ4Wh"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cc6ae3e7f1so5469635ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 08:09:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783523374; x=1784128174; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=5PZNUkHdJ6nqcdgkr9hcvPfqh6tCZ4YTms0UgHLH5I0=;
        b=fkuKQ4WhFBS9jur2dGWmUYr13rS5cOSVjQLKyGbpwfA8ASWN/gBQKxgUXZ2gViy71k
         qdrMMPoYSxMbs7bYDfZ70RaHpUn8AsGwjSDtWSgss8EytnQ9yYCENqb6HMSpD9BkznOb
         sUW8FHBB4xydIBFkgsWPGoQkLswEYCdK+MvjwqrT0W3tXabmdUBX6KA6+PYdEBaDjsiV
         8GvNmoA+GBR91/7wVsJHVLKkUvGdLSHu0eVsfQBaOT4Zyacfndi1DJmil6HpEopa48v4
         E3gjZTsvEWu2/hflXYpN62dZ6qX+O1jOiTF/lhERVJLDCGD8OBA+MdOjczKZess6NgUf
         qDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783523374; x=1784128174;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=5PZNUkHdJ6nqcdgkr9hcvPfqh6tCZ4YTms0UgHLH5I0=;
        b=CO+HPFn3/Yscqi+1c1Y3N1f0dtxIPn4XwfxJABZnTjkljU3tkJ0FaPlRRgy/6/1a+i
         UVXaR901ncO3fOYHV+BukyOt7VXGhqciQoEgAuuoydAg/SQiVxP3/m1h5A5+F1a7A/5A
         GGJrMG3HARMISODUE9+jMDbSprk6JcCjtpPj+yNQWbmSK2xNiRWz4Ej8bIvk7vbp45oy
         eF11tmwU9iB2ChHSNdv/giHFg2GDCAIUlK07/9BB0TO5sQIJJ6E2PQYWSu0RPSm8Czgy
         MSW3NsXWnJlpxCCKv3/uekUZO7oQttgkwSaDLzk3DlxQv3kDFBOl3z1iazekdaUNaCnR
         LhoA==
X-Forwarded-Encrypted: i=1; AHgh+RowWfN4Kt/p/rBryeclPe3pGqcgbM9CiCC2VAcGC60kBvryCRUpvfAqZWfX7z1YEYYAc3lE1pwCff63CfiOig==@vger.kernel.org
X-Gm-Message-State: AOJu0YzOcARv90GLTYWS90857zpe5StZ2m4EonrhoOD7igEE+tDHwO3j
	qTnoE+prDxYAP5yiphNdELMk5zyd0nwQOpLPHFFeD0u/j1NjdYcfYuLi
X-Gm-Gg: AfdE7clJIxyo/v5qTteBYrHwvJlKt4smRa3xgS5FmgLkgYcYtyphVqu7CYvlXMduhbr
	IHXyxWUJXL3ucg4iI4mxx7aCmDUgkfdYjgyd7MbOO8RRfo0soWUlZHapmNIpAE/9SrLdPkLX+Ol
	F6YOwKKPZJyDw4DDLdxC2ol15Py9hoAjP/Dgg++yKRgngySb/s4ecS0pXxWdUcjeMCGx+IWSGJ2
	GLta36wrI5IDilmDSCseyDdgga/LG8FWDy30gqBMPKELL1+i6pnINP9b+ilDva3xyntj/tnMvo1
	5PsBYQVI6rRngyNoonV/pQ/wmy6svG0wDV/bEePtnnnjbDpXgvRh2jhVNhr9DjotOEwnzOVTIrw
	rurcQmbJdN4hR6k0mGv7ScjLsTtFifc52ofk4B07TVyCgaw8rpJRoHACp2ArzS0pcb2YTO1Ab0O
	qXI1CxenBdberH51zKdeHLNqJD+t+qZ9xLKliZkWzIbhMO4/byqgBMojPwvRan
X-Received: by 2002:a17:902:ef4d:b0:2c8:2808:3ec9 with SMTP id d9443c01a7336-2ccea36556dmr27151965ad.12.1783523374093;
        Wed, 08 Jul 2026 08:09:34 -0700 (PDT)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.160.236])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ccc9bdb56fsm29932865ad.15.2026.07.08.08.09.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 08 Jul 2026 08:09:33 -0700 (PDT)
Date: Wed, 8 Jul 2026 20:39:19 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Link Mauve <linkmauve@linkmauve.fr>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, jbaron@akamai.com, 
	aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, ojeda@kernel.org, 
	boqun@kernel.org, gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, daniel.almeida@collabora.com, 
	tamird@kernel.org, acourbot@nvidia.com, work@onurozkan.dev, nathan@kernel.org, 
	ndesaulniers@google.com, morbo@google.com, justinstitt@google.com, 
	fujita.tomonori@gmail.com, joelagnelf@nvidia.com, gregkh@linuxfoundation.org, 
	prafulrai522@gmail.com, nsc@kernel.org, japo@linux.ibm.com, lina+kernel@asahilina.net, 
	j@jannau.net, airlied@gmail.com, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Subject: Re: [PATCH V17 4/7] rust/powerpc: Set min rustc version for powerpc
Message-ID: <ak5ngpTqcKS1rOvH@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260708082454.1254320-1-mkchauras@gmail.com>
 <20260708082454.1254320-5-mkchauras@gmail.com>
 <ak4MwnDwIgdUhK3K@luna>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <ak4MwnDwIgdUhK3K@luna>

On Wed, Jul 08, 2026 at 10:39:30AM +0200, Link Mauve wrote:
> Hi,
> 
> On Wed, Jul 08, 2026 at 01:54:51PM +0530, Mukesh Kumar Chaurasiya (IBM) wrote:
> > Minimum `rustc` version required for powerpc is 1.95 as some critical
> > features required for compiling rust code for kernel are not there.
> > 
> > For example Stable inline asm support which got merged in 1.95.
> 
> Didn’t we decide on 1.85.0 with the asm_experimental_arch feature
> instead?  And possibly on 64-bit 1.87.0 if it isn’t possible to disable
> altivec correctly there?
> 
1.85.0 or 1.85.1 is not feasible for ppc64le.
PPC maintainer is ok with 1.95 for PPC. It's still experimental for PPC.

Regards,
Mukesh

> > 
> > Link: https://github.com/rust-lang/rust/pull/147996
> > Signed-off-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> > ---
> >  scripts/min-tool-version.sh | 2 ++
> >  1 file changed, 2 insertions(+)
> > 
> > diff --git a/scripts/min-tool-version.sh b/scripts/min-tool-version.sh
> > index 031f2192b390..99bfdcaa3396 100755
> > --- a/scripts/min-tool-version.sh
> > +++ b/scripts/min-tool-version.sh
> > @@ -33,6 +33,8 @@ llvm)
> >  rustc)
> >  	if [ "$SRCARCH" = "s390" ]; then
> >  		echo 1.96.0
> > +	elif [ "$ARCH" = powerpc ]; then
> > +		echo 1.95.0
> >  	else
> >  		echo 1.85.0
> >  	fi
> > -- 
> > 2.55.0
> > 
> > 
> 
> -- 
> Link Mauve
