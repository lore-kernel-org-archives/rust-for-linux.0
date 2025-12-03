Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7EC292D0610
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Dec 2025 09:03:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764752609; cv=none; b=nVJXuyFrL8qGzg5Xhf12a+8/7SHymoZI4HcgenO7nBoMUCoY3rY0BFqarmerawy0ci+dsJ5zpauWKtN1U40dx3qv8O3E3pWCfge0C0w/Qe8QP3fqDGH88YZssafNDFiOWLrbM04s5WJHzjj6jonaL63oo+ffkHQ+L8PKqAsXHdY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764752609; c=relaxed/simple;
	bh=yN6NUXVa4Xvx+YapJ0//NMf5J5Gok3vDE0XsZRk+cNQ=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=NwwswpA0h2d5vVL2a840N7+RlwXotbZH0QYrh3YRyxpgJYHZvmbz22qlM7iKtejSnbGH5a3mbEog482FSWU/MfhncStmgZncJO3WiXRBFxRKA/CzGX+aZl2Lufq94W8xuRu1UAWVVOZM9/J/7W11gJmhXbeXILzOZBXCqXI5fbI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Tl5oKtyF; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Tl5oKtyF"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-b735eea0bddso503367066b.2
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Dec 2025 01:03:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764752606; x=1765357406; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=O12gERPToepovtHRRurtFX1amoOWltySW6VLkiynYXU=;
        b=Tl5oKtyF6P1Uc7Cv3M75NX2KLX9PB6XuVQElVFcoFo+FEYjuLMabeiippCiMncQudd
         IjAv981mHaTY2NAccayKQMtcA6lVuo+t+YRPTDGmHasG0IVyaSgV8k4Uid7hSHBMEtXT
         Qo0m/s8ysNLzJAAJqMiN/sxurV2Cr8xddL9jSQwZgQlg4RTpxO6GolAIqfor/B4GfP1o
         NVnL5pOAJ6kMJ+2SW5auT2EpgzXRLAaZH9V5GRfVNHaqXqAuysStQhpdw3MkfYXLisn+
         C/LnNPww3IhUascDGYMDsqmd4nKsvSgyagf+15v3nuUTTWg8Kq1Y2+/dRtT+l7JMwyjp
         Jp7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764752606; x=1765357406;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=O12gERPToepovtHRRurtFX1amoOWltySW6VLkiynYXU=;
        b=L7VUa/A7mm84+qfCYNiwkwiw/4Nrf620XNznICBgGHi+0TEYdIy7O2b+bIhPS5UGMS
         Gc/blpDW6mZGZmzbcUeglLNJSS+4wMza4NHDUkwtUbApUp8novNj3KBf85WGTNpJ9JR7
         W5RNw7DLGxcmG0yfqvwZpmSDdSqq9cqXfBbouZvrFbnXzDgKfvVOc3dNPD8jJPcDBhou
         5aT2jNZXojznAkTSdBIRbJkqwhlThG4eTGZ6uwcQOKrejzk2HAaiIlwPyEmrAGrDqmPH
         Zc1ITOveIavAvHgP2qNcs6gUSkrZRfWCY4nekWEVl0FvSG1Y0OYA8+1e9ZGqIf2371ZE
         EnbQ==
X-Gm-Message-State: AOJu0YzN0/Iosv6MVdWJGVObGXokSjzCdpH/pjPDQDly7vr9XNbwgjoP
	2xcgJ9cX9wFacti7PQrtR68vu/0lY3NnHQyqN2MKuaJmACCGX9Gr4s+kGhElfdX1LJ23awVj3f0
	7kZ6f5OLGvuUOlT8Qnw==
X-Google-Smtp-Source: AGHT+IFmeLftbJQxnwM0KiQ8VG5sVq5t7Zj2O2RL3UaEZeeQUSx14/BQ0KA1rqaJvLEaOjdKPUHmbM+ifOPpjpw=
X-Received: from ejcsl5.prod.google.com ([2002:a17:906:6185:b0:b78:1480:a1ce])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:2d8e:b0:b79:ca25:c11e with SMTP id a640c23a62f3a-b79dbea97e9mr144938766b.26.1764752605720;
 Wed, 03 Dec 2025 01:03:25 -0800 (PST)
Date: Wed, 3 Dec 2025 09:03:24 +0000
In-Reply-To: <aS-VrkRdQc0H6nSs@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
 <20251202-define-rust-helper-v1-24-a2e13cbc17a6@google.com> <aS-VrkRdQc0H6nSs@tardis.local>
Message-ID: <aS_83HjEgLqLm4AR@google.com>
Subject: Re: [PATCH 24/46] rust: mm: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Uladzislau Rezki <urezki@gmail.com>, 
	Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org
Content-Type: text/plain; charset="utf-8"

On Tue, Dec 02, 2025 at 05:43:10PM -0800, Boqun Feng wrote:
> On Tue, Dec 02, 2025 at 07:37:48PM +0000, Alice Ryhl wrote:
> > This is needed to inline these helpers into Rust code.
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> [...]
> > --- a/rust/helpers/vmalloc.c
> > +++ b/rust/helpers/vmalloc.c
> > @@ -2,9 +2,10 @@
> >  
> >  #include <linux/vmalloc.h>
> >  
> > -void * __must_check __realloc_size(2)
> > -rust_helper_vrealloc_node_align(const void *p, size_t size, unsigned long align,
> > -				gfp_t flags, int node)
> > +__rust_helper void *__must_check __realloc_size(2)
> > +	rust_helper_vrealloc_node_align(const void *p, size_t size,
> 
> The indent here seems to be incorrect?

This is what I got from ClangFormat, but your suggestion does look
better, so I'll update it.

Alice
