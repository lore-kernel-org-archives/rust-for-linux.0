Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D9433A1B5
	for <rust-for-linux@vger.kernel.org>; Sat, 28 Feb 2026 00:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772237621; cv=pass; b=FfVnVDfyvheJHo0WVJucoQzVTHDhilp7KCG4rWZkh6CuuAbVdtz13KASCtweSk+Ehs43qLDery/yqaSqdXuR4e/AkGQabt1jHMLIYefzpnRcvITrXE+sJAbF2dYqd0kQ5eVL0AvB7nqXe0diAZ4Vcni7IQHEFfE5cdw7DpQJwDs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772237621; c=relaxed/simple;
	bh=q1iF6ylRa9Z/xG4aQu0aLdllB+fBGDMzo43AXSAhlmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c31RKg6cvVkQEExo9zcSQ7hTC1VWYzUctTz8ZjU5emmECvL8gSJoA80/mZfRP0lZIs+JLxbrDxv7M+sxZurwr6DgfpxxIWzaDK0XwBa3X5cq+FUjFzSdDfFgEsFtZJWfiOpa8sP1lTluSjn/3VC/VH/7fTHLlKgzh7zu0Ox3JUA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b=VkOMXJUy; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=deborah.brouwer@collabora.com header.b="VkOMXJUy"
ARC-Seal: i=1; a=rsa-sha256; t=1772237613; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=ePtpIOKS+fvW+4dbRXrPfx+FTTMydXioaFIb1XIJz527niLqsk68C2l0f1LOYghHI0DCGcscqP6jHVAamJ5meXPOaKUCPi60+NI4BElG2C/+QdgUgViyppae3PyPgFm3NfNSoGmHzBBJTIFSZ3WZEKUJ/0TPrzuZaEngzGu+RtQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772237613; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=E+gQjBDjStAtWfy0cvuxuAJ4L7JMYB6VGEv1Esi3zCE=; 
	b=Y193x97AmcjoblC3H3NybhkMoMZ1JNnWwhf11oUpsaFrmTZTFkFt2B0unU8xvkL2sAPIvmgGkzUpZZojd1zz8Cjn/j7rPv3BALoNAZIEtsq2kXkvyVbObFPF9hkvKmsdCe0Z6IYsdEzwPjiSDChMiB+TBf9URqDSlPzxJbRTQlY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=deborah.brouwer@collabora.com;
	dmarc=pass header.from=<deborah.brouwer@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772237613;
	s=zohomail; d=collabora.com; i=deborah.brouwer@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:References:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=E+gQjBDjStAtWfy0cvuxuAJ4L7JMYB6VGEv1Esi3zCE=;
	b=VkOMXJUykAQSAL3VtOOAUmkdTvwPU4tTdvCesQ0IGw+4XGzQV+mQbjq2S3mT2h37
	8DEA1tECqckjM3ymPzpeuXjl8uCehzh79KnkvypVm4VoNnMIRK+J9+Rsb7wvJii1atc
	HSjhxunhbkgQaFzvet4onBOhAz+0jZiQBAKNvaoc=
Received: by mx.zohomail.com with SMTPS id 1772237612443141.4560156068078;
	Fri, 27 Feb 2026 16:13:32 -0800 (PST)
Date: Fri, 27 Feb 2026 16:13:31 -0800
From: Deborah Brouwer <deborah.brouwer@collabora.com>
To: Boris Brezillon <boris.brezillon@collabora.com>
Cc: Alice Ryhl <aliceryhl@google.com>, dri-devel@lists.freedesktop.org,
	rust-for-linux@vger.kernel.org, daniel.almeida@collabora.com,
	beata.michalska@arm.com, lyude@redhat.com
Subject: Re: [PATCH 05/12] drm/tyr: add MMU address space registers
Message-ID: <aaIzKwoc2sz9dZwi@um790>
References: <20260212013713.304343-1-deborah.brouwer@collabora.com>
 <20260212013713.304343-6-deborah.brouwer@collabora.com>
 <aZl2Qzl4knlY19Hb@google.com>
 <20260222191318.0ddf8eee@fedora>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260222191318.0ddf8eee@fedora>

On Sun, Feb 22, 2026 at 07:13:18PM +0100, Boris Brezillon wrote:
> On Sat, 21 Feb 2026 09:09:23 +0000
> Alice Ryhl <aliceryhl@google.com> wrote:
> 
> > On Wed, Feb 11, 2026 at 05:37:06PM -0800, Deborah Brouwer wrote:
> > > From: Boris Brezillon <boris.brezillon@collabora.com>
> > > 
> > > Add register definitions and constants for managing MMU address space,
> > > including:
> > >   - Address space translation configuration (page table format, attributes)
> > >   - Memory attributes (cacheability, shareability)
> > >   - Address space commands (update, lock, flush)
> > >   - AsRegister helper for per-AS register access
> > > 
> > > These will be used by the MMU/VM manager to configure page tables and
> > > control address space operations.
> > > 
> > > Signed-off-by: Boris Brezillon <boris.brezillon@collabora.com>
> > > Co-developed-by: Deborah Brouwer <deborah.brouwer@collabora.com>
> > > Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>  
> > 
> > Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> > 
> > > +/// Maximum number of hardware address space slots.
> > > +/// The actual number of slots available is usually much lower.
> > > +pub(crate) const MAX_AS_REGISTERS: usize = 32;  
> > 
> > Not necessarily a problem, but this constant is not present in Panthor's
> > header file.
> 
> BTW, I think the max is 16 not 32.

Yeah, I double checked the architectural limit in the spec and it says the
Maximum number of address spaces is 16, so I will change this in v2.

