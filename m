Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFA0535975
	for <rust-for-linux@vger.kernel.org>; Thu,  9 Jul 2026 15:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783612024; cv=none; b=UDyOQrOOwvfVmUF/J8ETR7ADsOrykjURn7vmYV2/6Ty8AHb2ZQcZy4Dg1ZQGtX0HJGiqL6ZJtWV0JlRLI6Xb6TzM3Fqp/ww7BYxJ74ApXjmnVGPKgBlld0mLmdNNWEJAW8huGB/Sd9VTozTKxespGV9KJhs5Yu18xNe2EA5jwjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783612024; c=relaxed/simple;
	bh=MgPfa4pKGE1SzEFbQCeqHMYKqdAxa7JEG0bUQwYux8M=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mRVRS5Aw0KkzwJ5lQVa4vumLftcO3CzF23/94I78NT8MSyUZskqOMfa61J2G6DPvrbOupCVYos/oSwvBvv1M8l90YGI2wNmehkECmQXp3pcB5AyS6wet4SkZh0tJ0ZU+4fgNRuTJy+xZ1igN0ECgmz/Jx3Ull4GuUeLCaZatiNc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=VtSeojIQ; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="VtSeojIQ"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-473de38dcfaso35896f8f.0
        for <rust-for-linux@vger.kernel.org>; Thu, 09 Jul 2026 08:47:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783612021; x=1784216821; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1ShG0iDDEU7To4XJxO6yX4MTZYqSurnuJSiTMgcIjD0=;
        b=VtSeojIQJgqW0gzFTXVyqVJTks+w6NoJsU9FAUzzfdIOG6DS/E7PIW/dG7POyUBxKq
         7v6ixAGBizqM9xc8SyAIc5iTZirZOjm7d7orYEwqoaB9R4lwdazyFLWrS81xyhDAo0Ks
         NvgVJyGXBFc2wkvew1Vs85TvPUB3+EJJdOAuGil5Nhazfyfhgq21NMvUFM4ruFAHkobw
         kX5BwIdYUlm+TSZED6ESVUd68hlJM8e1GZblftYX6zyT6CmqaVPBEZbJw4YIrx5mBiF5
         HY/MLvzQOJpI4UtAJO8Xl4y149/m4uNMStW+nf6UWc6lzRV1RhRNLy3XqOJZu4pz2Fot
         IrBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783612021; x=1784216821;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=1ShG0iDDEU7To4XJxO6yX4MTZYqSurnuJSiTMgcIjD0=;
        b=jJMwPpK3AFcUc2pJ36eF12wWRgboQzWql820uxYNu9GW4OJrVcae1HeXsXx9NM8bSZ
         Ki8j6b16ARbvrgrAcfQQNrNT9VcWCV8S+XaSgbDlfaL9nma7hS9+21lElV0kw7NwHS7b
         3RgVP8DvabV5rRKd2dGpmEHKYksiQn/ImK4HT5Dcl6G+ltL4H8eKhNDglsquu8Ix1qld
         4Gab7kJWF45HTtIQ1Tq1DOt+fnaUouRt/wJjM9I7BbSB0GnpOprk3kMm8JUkXwD9imWg
         GwQ68RDscNij/+k7i4Lokcd8fD5UeGuyM+PJ2EDfCj6hxoW4u0mgiYLeymtiOVk6BKUH
         4S+w==
X-Forwarded-Encrypted: i=1; AHgh+Roujxf9n8wEWNVkQh2FQkJZ+YZlCht0bVlbRghDb80/Nc4NeiW6IVRugC6lA+a6ONmTTf4h72Wr6udLcNOKKg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+UFpy/bwlxgZlQxkuqmo4vjzsfPAC/CZ+h19EWeeGvgyVSePQ
	JA6sr+KDUMw/lPhMY2mc7kHmOXoo9X3cJCz749bydlYsmiwqKAdIwJVXkZUxI3AcZhnJXDPwpm5
	O4M7eqw1GiZrwN8uaOg==
X-Received: from wrs28.prod.google.com ([2002:a05:6000:65c:b0:44a:cfa:ca21])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:2201:b0:465:ba53:a006 with SMTP id ffacd0b85a97d-47df07394efmr8123926f8f.23.1783612021018;
 Thu, 09 Jul 2026 08:47:01 -0700 (PDT)
Date: Thu, 9 Jul 2026 15:46:59 +0000
In-Reply-To: <20260703-pgtable_lt_b4-v3-1-e738e1f513a4@collabora.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260703-pgtable_lt_b4-v3-1-e738e1f513a4@collabora.com>
Message-ID: <ak_Cc7yylzGM6oEF@google.com>
Subject: Re: [PATCH v3] rust: iommu: add device lifetime to IoPageTable
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>, "Joerg Roedel (AMD)" <joro@8bytes.org>, 
	Will Deacon <will@kernel.org>
Cc: Robin Murphy <robin.murphy@arm.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, iommu@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, samitolvanen@google.com, 
	laura.nao@collabora.com, boris.brezillon@collabora.com, 
	daniel.almeida@collabora.com
Content-Type: text/plain; charset="utf-8"

On Fri, Jul 03, 2026 at 05:28:44PM -0700, Deborah Brouwer wrote:
> Currently, using a raw IoPageTable is unsafe because the returned
> IoPageTable is not tied to the device driver binding lifetime.
> 
> Since device drivers now receive a lifetime parameter <'bound>
> representing the interval during which a device driver is bound to its bus
> device, add a lifetime parameter to IoPageTable. This ensures that
> the returned IoPageTable cannot outlive the bus device binding.
> 
> Also remove the option to create a page table as a device resource since
> currently Devres is not compatible with resources that have a lifetime
> parameter. This option can be restored once the lifetime-aware
> wrapper for devres is available and if a use-case appears for it.
> 
> Suggested-by: Boris Brezillon <boris.brezillon@collabora.com>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Joerg, this patch is a dependency for this other series:
https://lore.kernel.org/rust-for-linux/20260708-fw-boot-b4-v5-0-7792ab68e359@collabora.com

Would it be okay with you if I apply this patch via drm-rust-next
together with the thing it's a dependency of?

It cleanly merges together with 'rust: iommu: replace core::mem::zeroed
with Zeroable::zeroed' that you already picked up, so taking them
through separate trees will not lead to a merge conflict.

Alice
