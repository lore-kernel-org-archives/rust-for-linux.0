Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DE573DC4D5
	for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 11:10:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781176209; cv=none; b=F4OYu4AH9pn6aIRXRSqTgL/cYkyKNocfvQClJ9mdTmaxuYucOTs2L8vx4TtGUS7O4he4E6fBD8YGQAXipOgTSrjhLtkoAmbIwKGSs9cad1SVOz+0C7woj3aNVAg3/YvJT5Uhxa4BW/HBGvBp6PWwySSi/oCb4m1dzb/GGHmlmi0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781176209; c=relaxed/simple;
	bh=TEOPeQRDcTO8ZT8oB50G4bbjCXtdEl0gblwbnGjfT1A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=hMWcr/Tjfbl2Ut3oPI17CMeE66WUtIAKoSYrvEAWTIvAPcjZAt/Fm7RVnco3QN2hQX5uutXGRuHa+6VFz9Dlm3WHbpyuc3WlV3OqUvEkg1yHV5PjgA6GpDLXpT99vOF+ggULnUK1iY5nt+por1aDt36FSEBN8e/4Z7m5Pq1gbko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AMtgwrNv; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AMtgwrNv"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-490e547f3cfso5217315e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 11 Jun 2026 04:10:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781176206; x=1781781006; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=YpGjHsDNrecPmydKZbz+npt4P/d2PQgzeW5pneBmX4A=;
        b=AMtgwrNvOy8NQbNMuY4JuWKsOzKBrE0K2E47go40gdE4ci3xMnu7z0AnKLVHnpV8RI
         /UDizTt/ni/+fPk3B+eQiCixKyVZYw8Y+/762G74AvPCDotyPS8sBkz2MUZTzXO6NBts
         q6541BAmHawAyGFLsjf/vpNZK9PddPhuN9r9fDOs7VHZjACq8m/p7HgacXDkPQ3o7v6W
         LpNnEd95uE4BZoDF/mp5M+yZLq7rfTeE4XOeifpAtzgaqlQVrBxg0X8Q5IZPNbCM7YHw
         W7EQPl02j4LYgannHqXkxgeFePoTQQzzeKsCkxahN6usxGTGoWcuQRrka8LArhaCbu4/
         9WIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781176206; x=1781781006;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=YpGjHsDNrecPmydKZbz+npt4P/d2PQgzeW5pneBmX4A=;
        b=IVFh4qiRZuNAS34n0t4gjYrP56rgkakrwJeLqFswFzQ01TDHeJIGcluDoeCtt0KnXk
         k1PDt2ZDEw3ezSXrdicPOhRsJQxmrdLE/SAbrnqpKbI2d8jOA1DaJuRquu00XgDjKnCB
         q+gbKietDmrOowD/2w743cXmsxX1oyuiHYCGC8rH5uNhgyWUMquIHTXc8UTGwRtt06TH
         a8U9ZA/SP3cPexo1+Gy7K92OtggNXVjGm9Nu7czOpPJVmvMuHukRoQZR0XBK5YiQOMY9
         Me55+C6mpMPGkT7jDFbPwmiXIh/cCtlEfaarvgOMFqq+LkQA1WBh0pmb1Fpqr0jA0Z/l
         qUkQ==
X-Forwarded-Encrypted: i=1; AFNElJ9GkQYB16kaPaM6evzJS9Wv0SrJtPV3gkG37bRPpQHxmAxzRRfpi8y5UJtf7PvTXdd+fuFSg+9dCjFi9rKnuw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw48G3Gq72VxYNCn+ffPyr8df+AlGe2qsHPbrS20R6bSDkeuELS
	fii+oKxVbDjzSv+Izg1MAllkB/yxTN3u2StiOkTnmAT4bl2EryUQMCDtiSkxXVQBeCfnMIaoKe4
	SmU2rSiE336068VTRzA==
X-Received: from wmqe21.prod.google.com ([2002:a05:600c:4e55:b0:490:b058:c623])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a7b:ca59:0:b0:490:9782:3eb8 with SMTP id 5b1f17b1804b1-490e561ee97mr20621955e9.25.1781176205567;
 Thu, 11 Jun 2026 04:10:05 -0700 (PDT)
Date: Thu, 11 Jun 2026 11:10:04 +0000
In-Reply-To: <20260610162433.923550-3-lyude@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260610162433.923550-1-lyude@redhat.com> <20260610162433.923550-3-lyude@redhat.com>
Message-ID: <aiqXjAPQCQ7POxWS@google.com>
Subject: Re: [PATCH v20 2/4] rust: drm: gem: shmem: Add vmap functions
From: Alice Ryhl <aliceryhl@google.com>
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	nouveau@lists.freedesktop.org, Alexandre Courbot <acourbot@nvidia.com>, 
	Gary Guo <gary@garyguo.net>, 
	"Christian =?utf-8?B?S8O2bmln?=" <christian.koenig@amd.com>, driver-core@lists.linux.dev, 
	Miguel Ojeda <ojeda@kernel.org>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	Sumit Semwal <sumit.semwal@linaro.org>, linux-media@vger.kernel.org, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Maxime Ripard <mripard@kernel.org>, David Airlie <airlied@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	linaro-mm-sig@lists.linaro.org, Danilo Krummrich <dakr@kernel.org>, 
	Mukesh Kumar Chaurasiya <mkchauras@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="utf-8"

On Wed, Jun 10, 2026 at 12:21:29PM -0400, Lyude Paul wrote:
> One of the more obvious use cases for gem shmem objects is the ability to
> create mappings into their contents. So, let's hook this up in our rust
> bindings.
> 
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Reviewed-by: Alexandre Courbot <acourbot@nvidia.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
