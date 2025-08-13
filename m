Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F6AD2E7BD3
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 07:52:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755071564; cv=none; b=LzeHIMKm3hOmF5KNj8tK9jfc5NvAge060aSWp2+e93MtTHMrOtrYUUXpWloXIJ8gsv0tHkeWHdCQ4e0ApPFE7qLcn/xIUdt1g5pMQMl1t99jmUQL/U/BVkWVNxUoDmqVNccfWddhAio8P28gt9DrJWF3KeUiRL2SpIadT7D2piY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755071564; c=relaxed/simple;
	bh=wTHkbolkWVsr/NVVpXeCQCswoJSODOIqqyaUV2Gnosc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=uKXumEohratoouXvtdmt19snU4b2V2r5LeGxjlL2MuPmVH36AZDKuXtqBGBz7fTFSCenLWBPJE5U3zlWRzr2VWjspIaJPQkKTzsY/xTiPZB9cxQuluC0U9t4+gd/fOJ4Sga8VjPxFnu5Ltxwk7X9JOuSbZm2PmSjOZWEvH5jDBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z6rea7jY; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z6rea7jY"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3b78a034d25so3233581f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 00:52:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755071561; x=1755676361; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=02qDuB/EcGaJVS8+Q8TL27euIcDkVRhwVcM5c3itE0g=;
        b=Z6rea7jYeCtyCSFwOyVUAQIaHXdyS0VCOlSr3MtzNu9Ypcd4ywiMu6dsxcp0n5pOgZ
         nXpKZ4I1T/ERUEBULOdifeV3JwtOTnXLKRyar86NkCfW2q2Pk3ZNKvxaCaFUNnaWmxgp
         2IQLbW28wSCax7DqjUwyF48ZuAlsm3+kSGs/+szAZpfB57PIEPOwk7re6nrX52rdC2Sn
         82EIr2hLkGVnVIWkqgmhCHG1iz3OA5C/HhOaggfDlHfkjkEuecEW1247fROHZdIAaxQd
         KS4dewOSWkS0VcTdyjTJK+xkNcNVRqpN/A9XQCeHiBKgZMRd17j+hP2ApmtsTZzUP9z1
         fjng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755071561; x=1755676361;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=02qDuB/EcGaJVS8+Q8TL27euIcDkVRhwVcM5c3itE0g=;
        b=WNK5JRgeTSya/fSNcTFp67gjXr46qe7tsLmmr2XjLE6EFGfLug/ET75hNrxYXE9KyQ
         tjOr/Ew3DRAdgxA2gSzICBY7BfSiQUsQq4P36+i2fG6WVMEJShxA6fcdNLRN/zolJhmS
         gSwz4lgAytlHVY9lwwOH6cSZ/qjFsXASJ/nR7M32wT3tIdemY1USLodbvRvg+zsXAtQ1
         UfLnP96xBonNMPB++bl2NN5OPs9xhOWxUnSE+8D/KUgDvKu+OFUyseSrVhaoWafYInPJ
         nk0PUlwGxtXGUxFkwIbM2PmWe6yuPmSaPopAHY7OZk3WPWP/65FwDD8s8AqzcTkN0PX4
         W5nQ==
X-Forwarded-Encrypted: i=1; AJvYcCVTUcdW/cJ70mSj8tvyLAMZhHlER/qKJMAl9kheYsg9sG5kKjfIGeJweV1kGx7WhR01NPsmrtJzbxe5wyPg7g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyfxdRgyaeHMDP/K2HI8UhiaEc5CaeYTEEqgKJiz1iJe0olIIBY
	GJ5MW0DC0sVJEZ+JCYQMSyJSY7QZnKDLoWyuifp4w75j/ntuFigG9HnfgC2Ci2oqfwFjHkOnc34
	+qwRkeLteBfl7tRiw0g==
X-Google-Smtp-Source: AGHT+IFQOnB3WTKhyHtvWJmH83iA6/rYttG73Tf1N82jwPFXufEqb0tOp/a1EyEQXFyeHLXn1qK53ixfr0QTKsU=
X-Received: from wmbjg12.prod.google.com ([2002:a05:600c:a00c:b0:458:a7ae:4acf])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:5d85:0:b0:3b7:61e5:a8a5 with SMTP id ffacd0b85a97d-3b917eb5b43mr1445076f8f.47.1755071560984;
 Wed, 13 Aug 2025 00:52:40 -0700 (PDT)
Date: Wed, 13 Aug 2025 07:52:40 +0000
In-Reply-To: <DC0N2SBVHIS7.2P91EJSTIT1FM@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250811-align-min-allocator-v2-0-3386cc94f4fc@google.com>
 <20250811-align-min-allocator-v2-1-3386cc94f4fc@google.com> <DC0N2SBVHIS7.2P91EJSTIT1FM@kernel.org>
Message-ID: <aJxESG0l4-kyUHXg@google.com>
Subject: Re: [PATCH v2 1/2] rust: alloc: specify the minimum alignment of each allocator
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	Tamir Duberstein <tamird@gmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Aug 12, 2025 at 07:52:35PM +0200, Danilo Krummrich wrote:
> On Mon Aug 11, 2025 at 2:31 PM CEST, Alice Ryhl wrote:
> > diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
> > index aa2dfa9dca4c309e5a9eafc7da6a8a9bd7b54b11..25fc9f9ae3b4e471a08d77130b374bd1397f7384 100644
> > --- a/rust/kernel/alloc/allocator.rs
> > +++ b/rust/kernel/alloc/allocator.rs
> > @@ -17,6 +17,8 @@
> >  use crate::bindings;
> >  use crate::pr_warn;
> >  
> > +const ARCH_KMALLOC_MINALIGN: usize = bindings::ARCH_KMALLOC_MINALIGN as usize;
> 
> I think this needs the following diff:
> 
> diff --git a/rust/bindings/bindings_helper.h b/rust/bindings/bindings_helper.h
> index 84d60635e8a9..4ad9add117ea 100644
> --- a/rust/bindings/bindings_helper.h
> +++ b/rust/bindings/bindings_helper.h
> @@ -84,6 +84,7 @@
> 
>  /* `bindgen` gets confused at certain things. */
>  const size_t RUST_CONST_HELPER_ARCH_SLAB_MINALIGN = ARCH_SLAB_MINALIGN;
> +const size_t RUST_CONST_HELPER_ARCH_KMALLOC_MINALIGN = ARCH_KMALLOC_MINALIGN;
>  const size_t RUST_CONST_HELPER_PAGE_SIZE = PAGE_SIZE;
>  const gfp_t RUST_CONST_HELPER_GFP_ATOMIC = GFP_ATOMIC;
>  const gfp_t RUST_CONST_HELPER_GFP_KERNEL = GFP_KERNEL;
> diff --git a/rust/kernel/alloc/allocator.rs b/rust/kernel/alloc/allocator.rs
> index 25fc9f9ae3b4..5003907f0240 100644
> --- a/rust/kernel/alloc/allocator.rs
> +++ b/rust/kernel/alloc/allocator.rs
> @@ -17,7 +17,7 @@
>  use crate::bindings;
>  use crate::pr_warn;
> 
> -const ARCH_KMALLOC_MINALIGN: usize = bindings::ARCH_KMALLOC_MINALIGN as usize;
> +const ARCH_KMALLOC_MINALIGN: usize = bindings::ARCH_KMALLOC_MINALIGN;
> 
>  /// The contiguous kernel allocator.
>  ///
> 
> 
> No need to resend I can fix it up when applying the patch.

Hmm. Maybe that depends on the configuration? The constant was generated
for me. Either way, happy with the suggested change.

Alice
