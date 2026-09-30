Received: from sender5-op-o11.zoho.com (sender5-op-o11.zoho.com [165.173.182.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1A653EA960;
	Wed, 30 Sep 2026 20:26:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=165.173.182.11
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790800014; cv=pass; b=fZrcTRmgvHuKuqoY7VBJtnUO2PRHk0jHQXveNiyYz6UnjkkZw8sXaJPbopPAexuh8G/H5p/bjHBSHQd9h14AKan4RSY6hbXeNG/7ynXLwAeTcMx/vzw2WUVzvxa5djrwqzoKGyhdOEiW6SwkZutqfhWAaNFLBkzWYAXnIIxPFqE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790800014; c=relaxed/simple;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	h=Content-Type:Mime-Version:Subject:From:In-Reply-To:Date:Cc:
	 Message-Id:References:To; b=ongtHBKYxtqK2LWJXuE3x52S2uR0+IZKA5xmwShoEGGrY6HHa5lR4s+Ts/10DpvKoJoXcFAzZ+YwcGXCQ1cMKAfLrD3KdNr+NwhT/8c0ds1Xkb2jb7SVFwOQ055cDle6B0hmfkIJNafbS2iqrsE8B0Kf69ZuAQ0zMbSGo2zpy5c=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b=MkpIP0mL; arc=pass smtp.client-ip=165.173.182.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=daniel.almeida@collabora.com header.b="MkpIP0mL"
ARC-Seal: i=1; a=rsa-sha256; t=1790799989; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=KUV4dCxBo1oowvYi0Jnp2cTD0lekK/aDdmSxxROobT2zxasJ1/3hgXsNg0yWy2faNuOOSc5VRr84gPIASBgrO1W/h8bVHjAOVoLD0CH9rdpIrfMaA8994/vFq6YFczb9aT8THaLSSPdZ+XlXDjVKZt5y2zL3VIL6JZ1NVBBFAxQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1790799989; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=; 
	b=nunr0zTasENsHKsRpR6jKOm7wckkJwcnjrm0Sqx0unrVKA+QxX/A1+MchnU/bx3i+L78TWDOYwVs7Cvk8gcg/TeXQsu+L5PwpPCAqGfQR5fFp4MG1p1lIi+bB/y+dAXeWrKrXqAqikpQdmTc1mnnuYiKJViBzlGsZ/uMVyHcNvI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=daniel.almeida@collabora.com;
	dmarc=pass header.from=<daniel.almeida@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1790799989;
	s=zohomail; d=collabora.com; i=daniel.almeida@collabora.com;
	h=Content-Type:Mime-Version:Subject:Subject:From:From:In-Reply-To:Date:Date:Cc:Cc:Content-Transfer-Encoding:Message-Id:Message-Id:To:To:Reply-To;
	bh=aTrG2U3nnsahZNHEmxNMi33V9p9IP53O5HAC6ElbmRA=;
	b=MkpIP0mL8wmXNr7APUvRG1CV74m/BV3tbIuKpfxXAjN0ic5HwUDeb9Aj03HzLrv3
	EaZmMKwOyNDlcZpCsqR32ZjQnYOLcBU949f3wXKvx8RR8Xm4tNEfQVLoHNfOxdHTG7g
	XccdphviaheglnQz1panhDrDHzvwKJJIgeCyr8o0=
Received: by smtp.zohomail.com with SMTPS id 1790799989046539.6775851455692;
	Wed, 30 Sep 2026 13:26:29 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3901.100.1.1.11\))
Subject: Re: [PATCH v10 2/7] ww_mutex: add ww_class field unconditionally
From: Daniel Almeida <daniel.almeida@collabora.com>
In-Reply-To: <20260103073554.34855-3-work@onurozkan.dev>
Date: Wed, 30 Sep 2026 17:26:12 -0300
Cc: rust-for-linux@vger.kernel.org,
 lossin@kernel.org,
 lyude@redhat.com,
 ojeda@kernel.org,
 alex.gaynor@gmail.com,
 boqun.feng@gmail.com,
 gary@garyguo.net,
 a.hindborg@kernel.org,
 aliceryhl@google.com,
 tmgross@umich.edu,
 dakr@kernel.org,
 peterz@infradead.org,
 mingo@redhat.com,
 will@kernel.org,
 longman@redhat.com,
 felipe_life@live.com,
 daniel@sedlak.dev,
 thomas.hellstrom@linux.intel.com,
 linux-kernel@vger.kernel.org
Content-Transfer-Encoding: 7bit
Message-Id: <24162175-740D-4756-B149-D17A71E7EDE5@collabora.com>
References: <20260103073554.34855-1-work@onurozkan.dev>
 <20260103073554.34855-3-work@onurozkan.dev>
To: =?utf-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
X-Mailer: Apple Mail (2.3901.100.1.1.11)
X-ZohoMailClient: External

Reviewed-by: Daniel Almeida <daniel.almeida@collabora.com>
