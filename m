Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 70DDE149E17
	for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 12:20:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755519622; cv=none; b=DpbH5wHoo2s0714B0sAgak+p2ch4cJtudttiotEemcweR66Hw9I9HcJMIelZZfwzo2hLy267GOQ81wrC+OEDmsZ46oWQ0NwHUcX1EeC0Zpt/TXGzg6ozkHtniNCxD6pogkmye2w9Hi6imF75hgMfg5Cd2ljwxY2nGHrAyHfSMuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755519622; c=relaxed/simple;
	bh=cD8CE/3bhnnbXlx5QfO6l/YUWH5jZa+hBHlWEOFlU4s=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LDZ34nNkbUT5AANHQPJiWS7plKaIkn/+wWDveHz6UnK9lwuDpypEXZi+Tr265qNl4gmsU/witB8SVLgOg/LTQKjTTJau91CAiGVp9JwjC0ocHpI+5DFOrMH0Ze1n1jSlENeZHIgE5d10kS3gIXXyRMV29IKCpH3oYTC3zt7iPcA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4QmiyIlG; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4QmiyIlG"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-3b9e4146aa2so2476573f8f.2
        for <rust-for-linux@vger.kernel.org>; Mon, 18 Aug 2025 05:20:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755519618; x=1756124418; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VXVEWh+UjIimvjXTo07gyoqfE3DCJt1vnCJfigFmAGs=;
        b=4QmiyIlGrIOH1Vrmo4l+2yon7SAemGun/v7p3h5C7Y0e/XE7DprQQsABoe2v+SsQ0x
         qtM1ObCTrn6iFvBmcsezI4bYMb6E0rYcOB5AUHlvr0fRtNUPFUW7NNdOpsTW4ZSq5OhV
         VIpODr0JbhTJkZQbe4inUVoqU9MDFVbpPPrNOm0KadqBbjpyomMBsh8cpceJsCt32CSJ
         znSk3TPvmzHuAmqQRo6FbDAk7+ang/2Fu6Ym5eIcNfGWVQ1fS5a2duVSIGgN8cvPd3UG
         ZcKnGZ7h9zCC0V3oUeeVaxoLf/JkYEuSJdLSokH2uM0U0YkMveuhCAcU57WqpojuxHH5
         HZbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755519618; x=1756124418;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VXVEWh+UjIimvjXTo07gyoqfE3DCJt1vnCJfigFmAGs=;
        b=uk4BVXYuM1Ur0wAjnRb+dYASCvigV/856CMLVUwBnRXpFwRY0pH1OmgUY/+MqBLHQw
         yOVxH+s9yFiWEpkq3NFK+ThdTcKnT0hZH1z0d9OU4y+LFqAIBZ50+RR14r+yv42FoidI
         e0R4K3OgCYpjqVAFJn1I8O9wuP9e2s7FVPNFbwq7/hyyoXmdcGStYPS6HTOmBmqtKKgY
         65ixw2C+9xUC6CgGPine2sjGGnFPnXPJ/S4G2YI5jJ8wBrTNBPCKtjqadXgKQ2sJqEjh
         n53dWgn2B5VzTfyRP1yik1EjH2psTXrkXhjkHv4hWFdTSLa27ekENzqEIM3Sr1lMQcTC
         igfQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTeYZkX5+74bhEjIc+/ckff2+zAacu+bPrMkYwCHdNcFm1X/Lzk8DbnEgux7weN4sOTNO0i7gVc8d5aGAhaw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwrK3LEURX1606VvZewUh+yV+IJ3NW4MEvBTsss7fQbvGSdXumD
	vPgietYY0Q/B405xNIErSGM1IVIxwGANspCUU9EQ8tp8J2fcX8PkLvxpKilp0C3AITKbKty8I/m
	q96sHCLqyLv4B9Uwbrg==
X-Google-Smtp-Source: AGHT+IEsgbrPLrIZ6y0LhI19/RSkSmWScuqCJSGurfxV+xVh2HQWIDNMmSN339uuKUPu69gmGloLDhhGrdmggRk=
X-Received: from wrus6.prod.google.com ([2002:a5d:6a86:0:b0:3b7:9669:4858])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:430e:b0:3ba:d257:b662 with SMTP id ffacd0b85a97d-3bb6710022cmr7713380f8f.18.1755519617861;
 Mon, 18 Aug 2025 05:20:17 -0700 (PDT)
Date: Mon, 18 Aug 2025 12:20:16 +0000
In-Reply-To: <DC5INTQKY0EX.1T4HD6OU8C4PI@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250811213851.65644-1-christiansantoslima21@gmail.com>
 <DC0INEKNZPSE.WLEQH24SLW1I@nvidia.com> <5204b598-7792-460b-bec2-e3a4a4c7e32d@gmail.com>
 <DC5INTQKY0EX.1T4HD6OU8C4PI@nvidia.com>
Message-ID: <aKMagEO9O6WNhIUK@google.com>
Subject: Re: [PATCH v9] rust: transmute: Add methods for FromBytes trait
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Christian <christiansantoslima21@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ~lkcamp/patches@lists.sr.ht, 
	richard120310@gmail.com
Content-Type: text/plain; charset="utf-8"

On Mon, Aug 18, 2025 at 08:28:18PM +0900, Alexandre Courbot wrote:
> On Wed Aug 13, 2025 at 3:00 AM JST, Christian wrote:
> > Hi, Alexandre.
> >
> >> I mentioned it on v8 [1] and v7 [2], but the tests that break due to
> >> this change need to be updated by this patch as well. This includes:
> >>
> >> * The doctests in `rust/kernel/dma.rs`,
> >> * The `samples/rust/rust_dma.rs` sample,
> >> * The example for `FromBytes` introduced by this patch which uses `?` without
> >> defining a function.
> >
> > Sorry for my inattention, I'll fix this in the next version.
> 
> Ah, as it turns out you might not need to.
> 
> We discussed this patch a bit during the DRM sync, and the consensus was
> that it would probably be better to keep things a bit simpler for the
> first version. The `FromBytesSized` trait in particular was not very
> popular; a better long-term way to provide implementations for
> `FromBytes` would be to use a derive macro, but that's out of scope for
> now.
> 
> Instead, we agreed that the following would make a good first version:
> 
> - Make the `FromBytes` trait depend on `Sized`,
> - Provide default implementations for `from_bytes` and `from_bytes_mut`
>   directly in the `FromBytes` trait,

You can put the Sized requirement on the methods, rather than on the
trait.

trait FromBytes {
    fn from_bytes(bytes: &[u8]) -> Option<&Self>
    where
        Self: Sized,
    {
        ...
    }
}

> - No implementation for slices for now,
> - Consequently, no user code will break due to the addition of the
>   methods, which is a big plus.
> 
> The simpler version that would result from this covers all the immediate
> use-cases and would be easier to merge, which will give us some time to
> think about how to handle the non-sized use cases (probably via a derive
> macro).
> 
> Do you think you could write the next version along these lines?
> 
> I feel like I misdirected you with the `FromBytesSized` trait, so please
> accept my apologies for that.
