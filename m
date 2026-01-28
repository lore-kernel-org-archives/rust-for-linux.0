Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43E2B279DCA
	for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 14:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769611571; cv=none; b=Yjv6AJu8V3dZBYXCr70PHcurj2hWzQ4BUINAK0Mv4BsG1BGO9Qdeqely4PQ20EuelCeAtnGXmZZzjVG1SarTWcEdGnI3mf1SW8IZm5inEyHgXI3xcg6m9itbDUl5reFNT8bSMOSuWUYT++4DwCxhpeGxuLApTQIrwdJtTiVnHf4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769611571; c=relaxed/simple;
	bh=x1zRG43LA/EwWbaM3PwU0X+XPRQbFtO8zNYTlFZMNxM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M1b8s7maYH5Q8F6u4yQm69yrsVoy4jNoMI/kjGQ/CQNs8hOOJ4rBscl5SGsKZW4OzFcAqzL4wkPYiUKrpgRW8k6Z9FFvtRIct4634qLfvumnsQlJvpwVPXnIxlxFRN800OdxuHuRd2ZU9lAJCIIXjiyoJBVGAhYsUfFULyCbqVs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=dOdE6vto; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="dOdE6vto"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b844098869cso682202966b.2
        for <rust-for-linux@vger.kernel.org>; Wed, 28 Jan 2026 06:46:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769611569; x=1770216369; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lzzY8deZp2K9s9zfZCJmROn2nWP4BNz5bRVLgnZ6t+0=;
        b=dOdE6vtoSjDgS/LGWtfdI/o8K656flElvLr0N5uLBIrSpMLAmiIPkE0h4GqJgml2vw
         IW3TlVIIxDhsui/4VPkJzNmAu/gi59RiJ6fd65TbLVUB7fVBJfQiW3gSSQ/Hw4aqW2Iy
         k3qyjc0avLvWBWqCCsnN/kgir5EYBXjJEBoXk4q/fEE1esUxoOtP793rStZTWwOBdB1P
         r9eDj7SYBmt80WY5vLMd7kKn5JLXTz92mOVZful7Lx6zcUqfv8FF1Nc/SzfTkeoCdNgj
         nyei6Gq7tiKEpX4wJJRG2dCr3JxyFFI8dKMw0VzDAB9sWfz7eYs1c7qQt24XYqsuTrUW
         mpIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769611569; x=1770216369;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lzzY8deZp2K9s9zfZCJmROn2nWP4BNz5bRVLgnZ6t+0=;
        b=wrA97tTIXjCAKIRESMFemch4ehm4+f6BeCccC4GkwB7vVRZ/MQIx92qCUDpcyKmvD3
         zYXvJHEsAgYKvu43vgGVh4Vxyo6WtPZzdAFt2r4Ahbu7Jk046Gr1zlfMgMULqpUa6j0i
         zZv+XwC4DAp3owSnbokH9G58YvB5L4JqzCZO03fFZwJr7zr7ZCR0k2MRDxmOvZyXFory
         U+IqlCvc4zUMdV4JhFFqZnMD1XHFx9rw+2n/EaMHvMOdXQxP9Y+BcUZEUWyVkzFvBKZz
         1a9mzh78jrD6db5HuAByb7tKIhgIt7SJtcGcIP3F57UCL/459VKlI6Z73IbhPzKxLPZz
         m5Kg==
X-Forwarded-Encrypted: i=1; AJvYcCVf2CE0q4UzXWswkoNocRRJmQie2JLlo/5ww90BXRy7ck0DdjmhEZ50IZ6OBSdUUBX1RQfFJshO+rytUT1fGQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwS65oR1JF1C4hmKrFKGvyFIXaQSogJ5vbu+38VsHfJwNhFdb17
	mq0pGvMd4g/R4KfOz9Dx0jQBIlwvynER8u5oDUSG/ljlMJCnNGceD0DQeeAzKWr/wxzdPnhDuzQ
	99CfkaeDt05YxHudDOQ==
X-Received: from ejye2.prod.google.com ([2002:a17:906:8442:b0:b8d:c324:47d5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:3f1d:b0:b88:4673:68ea with SMTP id a640c23a62f3a-b8dab45b85amr373703566b.45.1769611568636;
 Wed, 28 Jan 2026 06:46:08 -0800 (PST)
Date: Wed, 28 Jan 2026 14:46:07 +0000
In-Reply-To: <DG0AU8J5K0SA.2SJVFWGAI98RZ@garyguo.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260128-cache-aligned-v1-1-a4eb7c3ffd35@kernel.org>
 <DG0AIMJXPP65.1PTB9I0KQS4LI@nvidia.com> <DG0AU8J5K0SA.2SJVFWGAI98RZ@garyguo.net>
Message-ID: <aXohLx77gHe9b_oJ@google.com>
Subject: Re: [PATCH] rust: add `CacheAligned` for easy cache line alignment of values
From: Alice Ryhl <aliceryhl@google.com>
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Jan 28, 2026 at 02:41:05PM +0000, Gary Guo wrote:
> On Wed Jan 28, 2026 at 2:25 PM GMT, Alexandre Courbot wrote:
> > On Wed Jan 28, 2026 at 11:05 PM JST, Andreas Hindborg wrote:
> > While 64 bytes is the most common cache line size, AFAIK this is not
> > a universal value? Can we expose and use `L1_CACHE_BYTES` here?
> 
> On all archs that we do support today, I think the value is always 64. However
> it'd worth putting a FIXME or TODO (or assertion, maybe?) in case new archs gets
> addded where this isn't true.

Are you sure? From Tokio:

> Starting from Intel's Sandy Bridge, spatial prefetcher is now pulling pairs of 64-byte cache
> lines at a time, so we have to align to 128 bytes rather than 64.
>
> Sources:
> - https://www.intel.com/content/dam/www/public/us/en/documents/manuals/64-ia-32-architectures-optimization-manual.pdf
> - https://github.com/facebook/folly/blob/1b5288e6eea6df074758f877c849b6e73bbb9fbb/folly/lang/Align.h#L107
>
> ARM's big.LITTLE architecture has asymmetric cores and "big" cores have 128-byte cache line size.
>
> Sources:
> - https://www.mono-project.com/news/2016/09/12/arm64-icache/
>
> powerpc64 has 128-byte cache line size.
>
> Sources:
> - https://github.com/golang/go/blob/3dd58676054223962cd915bb0934d1f9f489d4d2/src/internal/cpu/cpu_ppc64x.go#L9

https://github.com/tokio-rs/tokio/blob/master/tokio/src/util/cacheline.rs#L85
