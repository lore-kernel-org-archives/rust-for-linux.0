Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74BF6421EE2
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 12:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912701; cv=none; b=XaiAzcZ+9nGngcRNjYxfAW3mKOFr1i7ZcqdmEHNVCsN705yi75azWnqegiDgPkE3naEYXA4N+l64H0SivRVX2KKc5kOq/wjhtavHQ/48zJY6f5EzLUXFoi3AuOHpaSDb/9MNMrnZKjF71ECN5gMt0hPfh1CS8YTy1mm+UlNGoT0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912701; c=relaxed/simple;
	bh=TXFVFSzZ/jVdUgcfun/l6Z+4x2xn58VmCP/XffLA3eo=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jBIGK31vBfJJ0hTiH8W5HXYArZMTTtboV0zy7p4CaHfhq1rlCeQaqk077LOLIsY/5adSnw2VNqlhtNFPLDio8opRJaE04V7xcHIPl9TIE8H+GL7mcWyMKxHudXWrxp4wr1tpPloDKjB6YNaMCDjR9uQvT/0010tSUoc6r2YoShM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=aGoD4RTU; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="aGoD4RTU"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-6580e793380so148647a12.3
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 04:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768912698; x=1769517498; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=kRu3uxT5l6ryH7K1x56GRVdKqVKTOQ0aBzImZoC0pQU=;
        b=aGoD4RTU+L6HsoAjns/mR9MWP+FQL8S/Whr5WksEviwbQBAa5TkcGZZHS4NcGbkqr6
         lQ3LAomAcLGsFfxVgjmMb/Sz+JmY1XFQIPNm2Wq9AvUTCveqyfUCBwz41l0bAOv92ekk
         9ZRBFjC0d6Sva8hLWWgmA2FW37PMQPdebfaHSrTJ8uwqM1FMVRrGbM/2vzw+Waxxcj9s
         sKGm0P6sSDz35WXRAhNnZtCsXdEsJuh7nnzY64UUyGludCt0ncq78kQV+2VmEzuMdVA0
         fGLcClZqZhbo+v8YfyF/dMp08qO8dkHIxjv2yVdkTFGkCXefZyL00p627piK5mAajwFk
         2oFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768912698; x=1769517498;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kRu3uxT5l6ryH7K1x56GRVdKqVKTOQ0aBzImZoC0pQU=;
        b=Bw3BBw5sqRQTuvr4JWPjZ9feF9jqCEirw5Jrf7vgSSiBJro06WCOfenKaGzZHwKTbL
         gdSKx2nmLZfa0rQEuJ6WW0YvWTWlETrQZdlom4PVq4wVbChjeqF6ozBJJ1u2UCC+rfBH
         X2pEiWI8PoFLaLfOjas+NrPLZ6P6RlDW/UBUFDcACWvRgrsJbiEyvSueCAtJ3VpFIMoj
         x8PAz8pjSvX1qj4pJHC4N7Pu4Dg6MoYXekDJiQKHWiHQpXoyYwssGItmFt1YTYQBUeT1
         2MgtHOvVZAqZ6ssYdMreKmzfV+exkokYEpgRR0UcQMgD7W0bgN6fX2J/rvH821LIqpgB
         DZww==
X-Forwarded-Encrypted: i=1; AJvYcCXJm8h84ZKBZx6i/FVRRbpLOphmWaWBksF07CSJeH/ymgGR3Pdk3ogpkWIW1/xghVLTc3WlZalXtSUDxaS9mQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YybkYTPT2adBMq7HXFZqkiM/G4vYP+3w9qwkZT6ozMEG2SAOt6K
	CJadbuM0BOGACOMzTF46TKL+EioV3usBmorZV4KHFJOEoY7VNG2FY0MFR0sEmy+xmCPr58A7+Ah
	sFukcCuwaYAaRJbX50Q==
X-Received: from wmbgx18.prod.google.com ([2002:a05:600c:8592:b0:477:5a4b:d57f])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:8b78:b0:47e:e8c2:905f with SMTP id 5b1f17b1804b1-4801e30a790mr205228475e9.8.1768912686463;
 Tue, 20 Jan 2026 04:38:06 -0800 (PST)
Date: Tue, 20 Jan 2026 12:38:05 +0000
In-Reply-To: <aW9mTHedRc32izbh@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260119202250.870588-1-zhiw@nvidia.com> <20260119202250.870588-3-zhiw@nvidia.com>
 <aW83HV4lVR5MQlDd@google.com> <DFTC434Z6XRK.2RTE2DFC16TDA@kernel.org> <aW9mTHedRc32izbh@google.com>
Message-ID: <aW93LS71i01F8FLA@google.com>
Subject: Re: [PATCH v10 2/5] rust: io: separate generic I/O helpers from MMIO implementation
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Zhi Wang <zhiw@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-pci@vger.kernel.org, linux-kernel@vger.kernel.org, bhelgaas@google.com, 
	kwilczynski@kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	markus.probst@posteo.de, helgaas@kernel.org, cjia@nvidia.com, 
	smitra@nvidia.com, ankita@nvidia.com, aniketa@nvidia.com, 
	kwankhede@nvidia.com, targupta@nvidia.com, acourbot@nvidia.com, 
	joelagnelf@nvidia.com, jhubbard@nvidia.com, zhiwang@kernel.org, 
	daniel.almeida@collabora.com
Content-Type: text/plain; charset="utf-8"

On Tue, Jan 20, 2026 at 11:26:04AM +0000, Alice Ryhl wrote:
> On Tue, Jan 20, 2026 at 11:12:18AM +0100, Danilo Krummrich wrote:
> > On Tue Jan 20, 2026 at 9:04 AM CET, Alice Ryhl wrote:
> > > On Mon, Jan 19, 2026 at 10:22:44PM +0200, Zhi Wang wrote:
> > > Overall looks good to me. Some comments below:
> > >
> > > I still think it would make sense to have `IoCapable<T>: IoTryCapable<T>`,
> > > but it's not a big deal.
> > 
> > I think with this approach it's not necessary to have this requirement. In
> > practice, most impls will have both, but I think it's a good thing that we don't
> > have to have an impl even if not used by any driver, i.e. it helps avoiding dead
> > code.
> > 
> > >> +    /// Infallible 64-bit read with compile-time bounds check.
> > >> +    #[cfg(CONFIG_64BIT)]
> > >> +    fn read64(&self, offset: usize) -> u64
> > >> +    #[cfg(CONFIG_64BIT)]
> > >> +    fn try_read64(&self, offset: usize) -> Result<u64>
> > >
> > > These don't really need cfg(CONFIG_64BIT). You can place that cfg on
> > > impl blocks of IoCapable<u64>.
> > 
> > If you agree with the above, I can fix this up when applying the series.
> 
> Ok with me.

with cfg(CONFIG_64BIT) adjusted:
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
