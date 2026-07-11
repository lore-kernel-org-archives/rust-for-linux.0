Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1D2413C81B2
	for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 13:25:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783776340; cv=pass; b=JlU6VSmXrHwAO0LRhc+pS6Sh5WA4y7o76GYeu41iry2NkzjBucc6XWEACOkzm3Zs0uttBc9n4eg/DsXQfvzzehamPA+s7vIglup8QwjchKXLLyRWOCL2DzX+vNYIyNToPi3Nd6rkyAeLEQtAvmd+Nm+ryM6BmWALbgtlImmdl6Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783776340; c=relaxed/simple;
	bh=pEkxSRr2EbnFXPQ2EdilqMHjAbry4RBOsxKbRLH+d5w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H6GUXz7VP1kZHQUSpeEQ0RYN2BDapr7M+BzqdKJPXN2HJ4EV5IJKdZ4fkJ3BFpsjD88F/3n8SjXu2IQUcBXN1YU7io/zGheuJjM2qd7nFCyiUOtzzL2EEK+815PRXDMi8XHBFFF74DnsLcKck9WtFOxWxI5QRTp1EByoju5PmD0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sEE27LWo; arc=pass smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sEE27LWo"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-383fff6e8b6so155619a91.0
        for <rust-for-linux@vger.kernel.org>; Sat, 11 Jul 2026 06:25:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783776337; cv=none;
        d=google.com; s=arc-20260327;
        b=S1U2JNfWkqg4XVwXgYns437loqeKtDMgaKoy8NFaVRKfCNs8kCDmGrwjzh9DEmKI9N
         V8j5qLVPHUfhTwCgBdpe1apJIxUz2U6ssT6NTlgtFaJ7SorBBSeVMWc+0XEI4/OUgvap
         vJ2SXvK21lPq+2ridKLgEOXeQoWLeayWDrdpYgBYKnCcNa2KooN9mbhPOOFsmM1JYac/
         ZyQF6RuoN87fSXwgPKBxz1N6mYK9DdR7owXeJs3uCE0MH41C0BOTZ+hTs/5+4BnmNq8o
         wg30F7sB9XCWgiXfCzc24o/TCqRgdF6beqe/upG29PA+RT/0FlaDirVP3hZ+9RTqR0JO
         KP4g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=4MDHjptNq+liZGbFshQct9NdSgvqi1ccC95Z2kUxBDs=;
        fh=DNd/mLdGfMDhstXbE102YcoQgwdA4/L1vq2DsRotaVg=;
        b=Q+WssIIcw6fnOeXw0GgXN1dMmPmA10KHxQAkK4YRPYEek0RrM75E9BZhHogHwofEPt
         QNpd6jaxQMeDg5kT81a7urPNrOHAKS3qnO/AdOA2KIdrW57WlkAUISBHO3mh4zVknhSi
         leLsbdZBtxp6PSFafQ74oQkwOzFKtasw5dvSt4sllCcKPD/j+c0dV0eoTSCSqIv7stSg
         1z+b0ILtvFxGRbKUhhsmcSkk9HkG9Kc7Y1CR1p/Rvn6os3jIC9wH5uSS6fyeeorOFdA1
         zxcJHZyjoUYAt3dErajyBGWxVcD+yA+TyyVLSgLhyC1xgsvECcU41Pmr+52huGyQMxN0
         /ieQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783776337; x=1784381137; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=4MDHjptNq+liZGbFshQct9NdSgvqi1ccC95Z2kUxBDs=;
        b=sEE27LWoduoIxkKrxGY9ueh9AEVZmIQDoRwULLdv/shNpfcC4RG81JiDa/aMOaMHOt
         +IgEUeYtr+t3pugQPAAflPvpnCZupWcbPKipovg2PapZcUwyLlV/AkC/dPfQ/BxCQrAl
         JrTDF5fbAnFp+SB0VY61e3U8LG5MUx9WWFf19fOUtuKYLQSVHoxmiNuj+OxXLX2BDa04
         iI2dYeEC2mdIhft/QJ2+b+87t8LTm4Qb0250fboROvydkqNa/XCPKEfXCmJZNFAIyXt2
         h2Rq6l5fFwdS54WhSv1XsNZZ2dtOpgoRSEzote6ljLozvsrcke8HsmdvCs6+KaBsGbi2
         sZFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783776337; x=1784381137;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=4MDHjptNq+liZGbFshQct9NdSgvqi1ccC95Z2kUxBDs=;
        b=dVT2Wa4UABwMLfP8+hNyjMYyacggeDZzya4W0Oo9a6Tuaw8GmNV+ZAEbMYfI66SWCd
         mccQBs0j/9z0xM/XUp94gCTM+P4NiC9ncPVKV8OKncBUFlvu0vP9UmZjj2aNqWO42oc8
         G3zP+kkmV69C+bVvANLBeAFJVrxm/vfjkLsslcwUqWovaTb49R56y3aZpdHpynHzF03t
         UKaoFFAfpU0eBV/7C9Jal5fZ6vzkNiexxPTlhe7WBucoH4fguQUWXgq4U8cfDJkr0RdB
         1M9o/R64d9nsVG7OhE0wK1TQgyhYHqEM2Be+SXhTH8G4BGSTwuQf1OEjyMyLPQuIEYro
         h2Zw==
X-Forwarded-Encrypted: i=1; AHgh+RrhHQ861Z1BUVM0wriCBsD1hyw8JdxvxNz2j9WFpJqZ0bBLMMN1M7javCUz24GhwsN2DBrpUuy8KMmp49INww==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsgQquiYpfCueFEugSjH8+YWmzuHL3RLuUsDhFTa0om1UOzUD6
	GnCgnI6D2vIIKfLDQw+QkintYGVou8qaxRNwPJ9+UR1B8X9i/K0c8QuL/HtHzLeL81jQcQhpIsE
	FmoXx6TLqTjbJWMUBlR6t7Nd3XWFuoTw=
X-Gm-Gg: AfdE7ckUdhAzpSGU+ZJk9acFLQyAZ1z8RqoB1YBP4X/hYgchBFIX9ojrv//25QmVhSC
	wK8stF/DO4cG9Iw4mh46dU/Wx5t0whH80+wiV7JrknaeJTTeRkXIxdM8ZIu8e/34SUGSAMeBQCE
	P6k+uV4gzstQIars4Ke99fak9Mf14JH00TAByYj6bTq3aeyxljNWj7EeFMjFMMrkfCPxJqE2g4B
	HleNijqKgl/K250KgbY8uiSbwtU81cHbwFqSAM3dbKzC7cuUU7Py1HuxY5yqUUgyHiofA1E7nPz
	qTTbZDNSaSfIs5oaWfm+IXIV9unX1j0GruRE13bY1ljAhZoZBqZGNqTV9Mon4wDZsOhvB2uymQ0
	XRtqzm7OFtqcJ
X-Received: by 2002:a17:90b:3e48:b0:380:7688:fc06 with SMTP id
 98e67ed59e1d1-38dc7849860mr2213763a91.8.1783776337508; Sat, 11 Jul 2026
 06:25:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260710230428.865447-1-ttabi@nvidia.com> <20260710230428.865447-2-ttabi@nvidia.com>
In-Reply-To: <20260710230428.865447-2-ttabi@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 11 Jul 2026 15:25:25 +0200
X-Gm-Features: AUfX_mzK6nA89X8Ey2KmSvtSrtpGimxdsinkTI-BJ3XZkqZKpbmpJcngPawWU44
Message-ID: <CANiq72nENzJejiO3pmV9FhRA+H+zvCtfzWY0=wbTERToceiu3g@mail.gmail.com>
Subject: Re: [PATCH v5 1/8] rust: alloc: add Vec::zeroed method
To: Timur Tabi <ttabi@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Luis Chamberlain <mcgrof@kernel.org>, Russ Weight <russ.weight@linux.dev>, 
	rust-for-linux@vger.kernel.org, driver-core@lists.linux.dev, 
	Gary Guo <gary@garyguo.net>, nova-gpu@lists.linux.dev, 
	Alexandre Courbot <acourbot@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	John Hubbard <jhubbard@nvidia.com>, Zhi Wang <zhiw@nvidia.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jul 11, 2026 at 1:05=E2=80=AFAM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> +    /// Creates a new [`Vec`] with `n` zero-initialized elements.
> +    ///
> +    /// New memory is allocated with `A` and the [`__GFP_ZERO`] flag.

This may be obvious since we pass `flags` and the function only does
this, but the sentence (here and in the commit message) sounds a bit
like only that flag is used.

Cheers,
Miguel
