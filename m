Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2C9024A069
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Dec 2025 01:21:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765416097; cv=none; b=PUUqxIAHFqBXc+nQpPMa4Ivcy12pTehpmt1X53U9oktQXjoSP28U2chKxjuho8UFhue31MkjV3eAODjMJQBFtdz9lgMz9jsk85GNqqiL5Ovvb8bOqEHWSQWLVvJSwlGuu0L99Q4wX+bSHOLuLWQBVB9VFzRmxJ6thnoNBIRHQrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765416097; c=relaxed/simple;
	bh=0a7e+oTzNpAw5XpSS3EZgOGDkx9mAsYyfurWVyJHWBE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FrUcOpQFpZPaJ8y0d7qCsdPHB5NOk/4WBMdfvTPwwLjtgqWvKMtxYGDl9GsIVkD4jDR3x8wTdfnLlOsKsbTnwKJNTWnEt6JfA2uRuW/q5W692O+hWy7qbgKsJrc2BYNMdGz0g/UvD+f1ATIms/CVi6MNjdnU7UaXmq9y8WZJCNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fowSkTtg; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fowSkTtg"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47910af0c8bso2268055e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 10 Dec 2025 17:21:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765416094; x=1766020894; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=o7xFGJFC2OPlPtlFX/3YLVgyGi635Qjm2qw++qLP0iw=;
        b=fowSkTtga9NSE67ARyF9gzn/Vr/VIYyXb/uHsGtjWRodmjztZFmrgUVN1vjsie5HQ5
         nLSACRyUSxzVL7Ivjvetb5sKnsx47dZNDAW2LOh/JGRqajEsKCHUZOmbEz+OsD/NM+L0
         LnjiNwgfSeaFZUc1sNtFQuNJNkpX3PAjGIjgIMBkaQLBAa3yzstCImRktSUq6isWx+xL
         kA1iRbE2V4hAcJy6XzfIWsNOo/pP1baGsp5Kd0wxEqPFF7sGfEA0AzH5k3188+sNaqv6
         voh1LMDc12cqCeYqZnXZ8nktbwaSsbX6YDwzsVJZgNsE0LlYKUBBDUVfjSSaD+kWa0Yv
         IT1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765416094; x=1766020894;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=o7xFGJFC2OPlPtlFX/3YLVgyGi635Qjm2qw++qLP0iw=;
        b=T1T7L4RI7yb5WR9+94BRADyGWSGECwGeIy3yNRr/tJXhGltv9A8wloN7Zlh5xntSpf
         vWfl0wdieDHYkF7A+UT8SX53h8scH9TyiPYsOzJ4IGje+FapIbdpA+SaKCnszeFrTmhd
         pqxW0zMg7UmfiyTsQAo6oSvFjgc+XA1mDOBn8CsG97ft8rJboK9Sf60XrzNp40aUdQq+
         7w8D/xwzZ4RrePrPKD23+dpghKLSjeeC2YX7BGxq0DVIKfyyHzRMQUnQ79KyltQQ6WXK
         dfPdgdsJ2j6T5UWv8k2t0x0PDmPWa3N4v9I2dw4kJQVJzQVh5sj1jiXs63msJi/xiLCr
         9FtQ==
X-Forwarded-Encrypted: i=1; AJvYcCU9rLBDKmiflg+kQ1dO5OOUnI83wJ6LY9Q4T8lL3t2TSsUz+6ycZn/hczL7g2v8QL0/MIH1/R4e9c9A7WD7EQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyWW8v1dwiQQsidU+kawddysr1otVPhc+fjN97JRIqiy/ShjJql
	mUQVp/sDO6FsEW3NlHm7AI85q5ynGwr3TvgaMpJQDaAUOv2wmwluV0Zi+UzoIKQwasK6jC/07n2
	hVOnyp/BWmI3ia4uR+A==
X-Google-Smtp-Source: AGHT+IFtFWUUzpkF86P5ETw0RFmegagMnjG4lFL6iORMMelpm8ChDh1ncoMX+kPNRnack1lNVlzOSNNzzRxAG/I=
X-Received: from wmxb6-n2.prod.google.com ([2002:a05:600d:8446:20b0:477:100b:1033])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:198f:b0:45d:d8d6:7fcc with SMTP id 5b1f17b1804b1-47a8384cf91mr43407335e9.27.1765416094013;
 Wed, 10 Dec 2025 17:21:34 -0800 (PST)
Date: Thu, 11 Dec 2025 01:21:33 +0000
In-Reply-To: <DETOEHE7WBR8.2440Z49KZTAY@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251209-transmute_unit-v3-0-819fe584ba06@nvidia.com>
 <20251209-transmute_unit-v3-1-819fe584ba06@nvidia.com> <DETOEHE7WBR8.2440Z49KZTAY@kernel.org>
Message-ID: <aTocnf23EBdU3tFV@google.com>
Subject: Re: [PATCH v3 1/2] rust: transmute: implement FromBytes and AsBytes
 for inhabited ZSTs
From: Alice Ryhl <aliceryhl@google.com>
To: Benno Lossin <lossin@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Dec 09, 2025 at 01:14:08PM +0100, Benno Lossin wrote:
> On Tue Dec 9, 2025 at 3:57 AM CET, Alexandre Courbot wrote:
> > This is useful when using types that may or may not be empty in generic
> > code relying on these traits. It is also safe because technically a
> > no-op.
> >
> > Reviewed-by: Alistair Popple <apopple@nvidia.com>
> > Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> > ---
> >  rust/kernel/transmute.rs | 8 ++++++++
> >  1 file changed, 8 insertions(+)
> >
> > diff --git a/rust/kernel/transmute.rs b/rust/kernel/transmute.rs
> > index be5dbf3829e2..a888a312e7ff 100644
> > --- a/rust/kernel/transmute.rs
> > +++ b/rust/kernel/transmute.rs
> > @@ -170,6 +170,10 @@ macro_rules! impl_frombytes {
> >  }
> >  
> >  impl_frombytes! {
> > +    // SAFETY: Inhabited ZSTs only have one possible bit pattern.
> 
> Even inhabited ZSTs cannot just be conjured out of thin air, since there
> might be safety invariants on the creation of such a type. Now these
> two concrete ones do not have any, so this is fine, but should still be
> mentioned in the comment IMO.

I think we can say "it has no invariants".

Alice
