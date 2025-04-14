Received: from out-176.mta1.migadu.com (out-176.mta1.migadu.com [95.215.58.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17A20288CBB
	for <rust-for-linux@vger.kernel.org>; Mon, 14 Apr 2025 14:11:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744639908; cv=none; b=NVkzC6nvDYocqN0U2cXG6MDM48pCBk1MmQyYiz5VB7yni67e5P7dhmYwlbND/5nYdhyubaIYplgRlbwGtBydV7L+awJMdgDMqJJBb3bFJBDvzmPxy6dKFFqWmNUTNMhYONy5g8Ugbn5Pfsla6ckc+eWy8kJ7UzPx3X2VL5Sxi7I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744639908; c=relaxed/simple;
	bh=7FqzQMbtN46MspgzRLzfkBpN56u2tDVXmIle8ZV/dB4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OTDHPVzRbsAa9k0aRiXdHwvxrS8nWuNY7RQx8VNLDmEAwN0eqqBWH3HSQ0d76zcd4DzpNyBIt59uMjP1Rd6LU/Xulpx8w1ueYvYflwk4G9bWeb8aCUUt5VsG8txVcQACm4uwLXO3TyfANiSjesCldItTTVMWIc9sxLcl5n28DIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io; spf=pass smtp.mailfrom=rosenzweig.io; dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b=vhrVMe9/; arc=none smtp.client-ip=95.215.58.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rosenzweig.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rosenzweig.io header.i=@rosenzweig.io header.b="vhrVMe9/"
Date: Mon, 14 Apr 2025 10:11:34 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=rosenzweig.io;
	s=key1; t=1744639903;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=7FqzQMbtN46MspgzRLzfkBpN56u2tDVXmIle8ZV/dB4=;
	b=vhrVMe9/l6Zp4NGvWtsd98JNl5b9LcyUs0kNxhmBLXVUiw/TSTassaMNnecdvnZTeYrioY
	0LXTHm7Pg6kFvlnAlDZO8wIHTONqdwQCOHrPzzmsXgzNefqJMcMTAy1TGXKL9S8rXCmcwU
	pUarpuuj19L4P1kaNXwW5xfbtcHHY/kwVeiaZXlGlSy9bNgcdljYSsfXsQomkS3a9zK1qJ
	XJyNttrPKjBd64ILaw442ek5uhc6qrTsKnP1MKtug4pkAochL5s9IbVvbgKCaAGv+mOkl0
	h+ltgQRdmiF4LNxpg2JpjhTa8rB1iPv3jPqexKo4Zub4Y5Txpx4DmaAfZ4nQBw==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Alyssa Rosenzweig <alyssa@rosenzweig.io>
To: Danilo Krummrich <dakr@kernel.org>
Cc: airlied@gmail.com, simona@ffwll.ch, maarten.lankhorst@linux.intel.com,
	mripard@kernel.org, tzimmermann@suse.de, lyude@redhat.com,
	lina@asahilina.net, daniel.almeida@collabora.com, j@jannau.net,
	ojeda@kernel.org, alex.gaynor@gmail.com, boqun.feng@gmail.com,
	gary@garyguo.net, bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org
Subject: Re: [PATCH v2 5/8] rust: drm: add DRM driver registration
Message-ID: <Z_0Xli5G5wkRk3Z7@blossom>
References: <20250410235546.43736-1-dakr@kernel.org>
 <20250410235546.43736-6-dakr@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250410235546.43736-6-dakr@kernel.org>
X-Migadu-Flow: FLOW_OUT

Reviewed-by: Alyssa Rosenzweig <alyssa@rosenzweig.io>
