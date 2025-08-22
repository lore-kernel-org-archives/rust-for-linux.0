Received: from mail-ed1-f73.google.com (mail-ed1-f73.google.com [209.85.208.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9581F26AA83
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 11:52:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755863551; cv=none; b=Vp7Axzf2eGaAnUbEe+jG39TXfFl/PLwe10s3qYEvSJrzMcNIgbhgsYAyK0D+c7Encl2aWoSu5bkuqe+xxbJlSycA7qGLDXrMvhQGNaEkqS5kP+x1+8MFCNVNpq4ur/bKUaKG/BGSx0n2rpgKCnIzdtLvgDECSvYksSvBBTSG+u0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755863551; c=relaxed/simple;
	bh=NYWk5SfWOfQAb6AMBv49qjcUp+Ysp7H89dXQyPpUYtc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=W9UOdy9QhOEPP7m9rYQki0mdUm4KVKKo+LxA+3o8hU/vEVoI2A1cD788fc6LlgIb0DkfK5oaIxIR0Y+7kEPP6thMUm6MtckEF/OEFoYh4jsEsjsxZVXeP8S6UjagnF5c2B1QMo0k4+eJYPKc8BUOEbxilhsAgorTChKyZ1ir7ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=iUB/yLo5; arc=none smtp.client-ip=209.85.208.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="iUB/yLo5"
Received: by mail-ed1-f73.google.com with SMTP id 4fb4d7f45d1cf-618b3c750baso1588489a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Aug 2025 04:52:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755863548; x=1756468348; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=vWE2u+V4DHsHDV1hUcE542M/RK8uRUyoG7ZrTnqEVZc=;
        b=iUB/yLo5utypmvMW7+TNihjq5/urW7W5iLIKGfDGA/yvFQPRNfMute07XjdwR3a/x/
         1q9E/GE+7DF+0kpkreJ7CV809+RrT1rpAiehFMqRSFmje/16TBBoYDQMzijrNZbjXTQd
         3eVvmxMXRtKnnUhyqvk1kqjCfsNbMcbZjKld2pAPPT6gW8gFepvc/IiOdOo4C6XWeYm/
         GS+8JCJI1hdkBzvIBVOvCV4TByQDZQoqpo3BWRHmPq+asqQlxT3+FTaHVnb+OFQw8LgC
         T/UsTs1LXuga5EWC9xraUtllm4VUTsM7hg+sJtjkObBBivPFEVf42Fhwi6iKlc+jTJq7
         dQjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755863548; x=1756468348;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=vWE2u+V4DHsHDV1hUcE542M/RK8uRUyoG7ZrTnqEVZc=;
        b=ZEfVUWm+1RhibBGsFRQFGBi8NnPX790OsC5qpeLJZm6wbtrr+0Q+8wTy59+bU996yf
         eXvV79vZ5kHHPhnn7kMoRZ60saNzNc2jvoJ4r4J6RuHn/h8BrSJAJjt8KX/zZRKVX1Eu
         Hnftm4Bh98rZm0eZMiQPPoJRkwcxRG8sp17fHIfyjSPoTjWItdfhbQH+SrPvS5oKnwSw
         IpE8epHql3EOfITWhDXW7hSDjF5ePHC6f9Xpe3YEVwLmDsgL8satvkFQHbNaWHi5pSrP
         u7Ghe1HNzxiywus8Mk6G+ZFZwAOEyqYzYhUP2nO7uFPDMDUeK9ZmyfZTZHjmOX+NRHec
         DhNQ==
X-Forwarded-Encrypted: i=1; AJvYcCWYNxo3ORevmeOgVBRh1ibd4vU95eD0a3sfZgQFzVy+H7tMNmCt5XSuN4UPeigP8APKJ3ZpAAnTVcU9irkmmw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+bbLvRwrYNaz4jkBaGrsxYPza0+NBxIQ5NEPKlxIG9BNm5lez
	qGEytlIQAwNogABb+ZhS432AVRgEo4EuITDhcGWk6qTFmvXdFeO3uhCzc8YElseFrXAOkFw0Ju8
	xe83X8XvUU2q02JTYDw==
X-Google-Smtp-Source: AGHT+IGDJ6gPmpwLZbTPQqbylfkKv8yf9Kn7ERiTzNBo46ivNRLyyUa3U5N3GV6j0VP102lLjPtn7S3NennpbNg=
X-Received: from ede27.prod.google.com ([2002:a05:6402:20db:b0:61c:467:142d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:1d4b:b0:618:1250:ac5e with SMTP id 4fb4d7f45d1cf-61c1b6f982amr2086418a12.19.1755863543632;
 Fri, 22 Aug 2025 04:52:23 -0700 (PDT)
Date: Fri, 22 Aug 2025 11:52:22 +0000
In-Reply-To: <DC8XLP6C3E5I.10QJQVI4LORSF@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250820165431.170195-1-dakr@kernel.org> <20250820165431.170195-4-dakr@kernel.org>
 <aKhYCf6wgSztcdXU@google.com> <DC8XLP6C3E5I.10QJQVI4LORSF@kernel.org>
Message-ID: <aKhZ9jdiNS2SAZv2@google.com>
Subject: Re: [PATCH v2 3/5] rust: scatterlist: Add type-state abstraction for sg_table
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: akpm@linux-foundation.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, 
	abdiel.janulgue@gmail.com, acourbot@nvidia.com, jgg@ziepe.ca, 
	lyude@redhat.com, robin.murphy@arm.com, daniel.almeida@collabora.com, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Fri, Aug 22, 2025 at 01:48:47PM +0200, Danilo Krummrich wrote:
> On Fri Aug 22, 2025 at 1:44 PM CEST, Alice Ryhl wrote:
> >> +impl<P> Owned<P>
> >> +where
> >> +    for<'a> P: page::AsPageIter<Iter<'a> = VmallocPageIter<'a>> + 'static,
> >> +{
> >> +    fn new(
> >> +        dev: &Device<Bound>,
> >> +        mut pages: P,
> >> +        dir: dma::DataDirection,
> >> +        flags: alloc::Flags,
> >> +    ) -> Result<impl PinInit<Self, Error> + '_> {
> >> +        let page_iter = pages.page_iter();
> >> +        let size = page_iter.size();
> >
> > Variable naming here is confusing. There's another variable called size
> > in an inner scope, and then afterwards in RawSGTable you use *this* size
> > variable again.
> 
> I can change the size in the assignment block of max_segment to max_size, or do
> you have other suggestions?

How about just this?

let max_segment = {
    // SAFETY: `dev.as_raw()` is a valid pointer to a `struct device`.
    let max_segment = unsafe { bindings::dma_max_mapping_size(dev.as_raw()) };
    if max_segment == 0 {
        u32::MAX
    } else {
        u32::try_from(max_segment).unwrap_or(u32::MAX)
    }
};

Alice
