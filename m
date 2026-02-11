Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF12731A04D
	for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 18:30:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770834624; cv=none; b=sA66Ckcq3XiOzU9A2lgIXN4b0utN5pWf1guRoEBpmv1RTB4P4yAtqIPpBAKm4dEciBIYQcm6fGSyNgoc8WiHtJvUdvDHe+8ZvRZSbKn1JKbbzUdXwEIMhDoPQjdUTpELXhcRl3xP0Kl2jTQ4/7EVNhx2cfyiGAKmyiOo5UzgBVk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770834624; c=relaxed/simple;
	bh=lMFuyqntAt1v3axmi9V0ZEgncJ5gBZRry9IXBe1tA/I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SHljRlluIy/5H2GmWbXzgzdfFSXxag+8lmrjoSfns8CHVdle8VFM1536I16LWWZnugqnvYghya1+GgCZ+CZY0DZ6cGSBqBkweyIwvPn8FNzjozjdbqpAWR4rDrT3c7Q6NU444/hXLTm4wlopahrFQdpAssRtGkz3JuMqAui1ZZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=evc/dW+O; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="evc/dW+O"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-8217f2ad01eso5892172b3a.2
        for <rust-for-linux@vger.kernel.org>; Wed, 11 Feb 2026 10:30:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770834623; x=1771439423; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=YN82cp9Kv7HhSvnFdzWBPH1jHCDlC2a71VyAWReHMLQ=;
        b=evc/dW+OVNqGhsO5AloUyfz+Cw3lX3JSbFxnI859eXT/TZGnwcrdWRbRT2XqfjReU5
         e/Rd+4kcvaiD0GSAX0M7zFr7gfOIXjLUE5tC3pWUlRZGqLP0K4JZ58i4EuaeolOHdn0M
         IIIv/CSuWLA9e9kPjVsX+CHmaz9cxkJB7ie//tNqI12yzMAcBeI0qqY6vPClbwMMfFVh
         gy/fQ0QE2vmh8ot10yn7vOlxnWjfdBWlbd+XHaq0qYvjcJGRB6qy11sSZJbZXOqXl4fH
         uiVFO2qpO5397uPJNNRlX+LhrNwQu5SR6ojaCP1kJb+is+ilmAJxU7ux9X7ULRWxIZjY
         6Tdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770834623; x=1771439423;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YN82cp9Kv7HhSvnFdzWBPH1jHCDlC2a71VyAWReHMLQ=;
        b=PK7frgUBPoKdiRSaT3v8E1eKcgDMLIRoKLBj/SnDnRgDZ/vg+Q36jp+GOfg4/LzB8R
         6im0T+juZeQBrVNqiqjNqubzHeKvolQZU3GfhbdH64T5uCbGsXRFQLo08rcgy5mG4iIJ
         AqrHIwFWPCMxRisYBw+F+SBm2h5rqtBvmKkQvT/zV1FsbtRSZRARhu/OVlGdq57L41hk
         LyqWz/484a+CfHp8W9M+6QQ1Db4pFwx07PsJ1S98+/kLD63VoTzy0Y2Rx8YLkO5d2zyh
         pIrq0UcBJBTdqlgZekRbvRmGNl6ZgNGm4iPrfUxm0B0uZoqRR/VqPiOi4QPXf6uMD7hF
         BucA==
X-Forwarded-Encrypted: i=1; AJvYcCUD4sksKHSgVO5e/caZFMGb7NXcMp+mwKqaABlO2NF8rmm9RR3r1OfeBVXrhj9GFl/BXd8glA5DVEVTlKn7SQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzKVOv9gf5NltIu4VMvaQEhdvOWYmBW0UNan0XSa4HGJqqoY6R3
	Z0nUWVdJiYwpFZPxMY72bQzSr8xx7bgwpIbpfdYCR4a40CP5f4/1/Zdf
X-Gm-Gg: AZuq6aIA+bduwPymwGLIAaQX/N3w7izJKQBmVvPcs1Ra3vQ2yahuJmb6oO/pAjL7y8g
	O/zsZJ0tGH0ol7wQ1QINES9eBrmnyVZ9OsAD9YJUe/3NhIXfCPpMgrRZzVGAhD7wG6F1TQ37xMY
	el1BPLuQFzbQ5kzTUpY0/0AQ9xTYw9B1tdkNG9++B422o8pBrrYa+Xynh94tzIksu93YH3CZ62X
	KVznxk0EPlTvGvEFKoT85PJSPQYscHmjjIBC9L4NdUsK208q+tsJa5weDOWEAnHYdnjVfW/kpM/
	TCGu3s4Fc1CZR7LHQvhtBp4NSoXFgi4VzvK1DZyIBKtakfojUTSBJT9kniWhaB1G4o9r8cnXT9h
	Q6loLSg1lXXSqhX6wIde6zj/KmD4Y46jK7nya5eTErslGo3EBJwAbhx0ofz169VvkhBzraHh/s8
	BKpet+C5EMWN1sUcKBFFtjtlqIkh+QNdn4uF3RFt6RpSqj9c9tx1Zpo5AtdHQavpKhw2tc9gU=
X-Received: by 2002:a05:6a00:ac89:b0:81f:9a5c:5b95 with SMTP id d2e1a72fcca58-824b062018cmr10429b3a.68.1770834622846;
        Wed, 11 Feb 2026 10:30:22 -0800 (PST)
Received: from li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com ([106.51.162.165])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8249e84d679sm2828110b3a.59.2026.02.11.10.30.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Feb 2026 10:30:22 -0800 (PST)
Date: Thu, 12 Feb 2026 00:00:12 +0530
From: Mukesh Kumar Chaurasiya <mkchauras@gmail.com>
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Tamir Duberstein <tamird@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Christoph Lameter <cl@gentwo.org>, 
	David Rientjes <rientjes@google.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Harry Yoo <harry.yoo@oracle.com>, Daniel Gomez <da.gomez@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH v3 01/12] rust: xarray: minor formatting fixes
Message-ID: <aYzKjwHW2J9cE4kl@li-1a3e774c-28e4-11b2-a85c-acc9f2883e29.ibm.com>
References: <20260209-xarray-entry-send-v3-0-f777c65b8ae2@kernel.org>
 <20260209-xarray-entry-send-v3-1-f777c65b8ae2@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209-xarray-entry-send-v3-1-f777c65b8ae2@kernel.org>

On Mon, Feb 09, 2026 at 03:38:06PM +0100, Andreas Hindborg wrote:
> Fix formatting in xarray module to comply with kernel coding
> guidelines:
> 
> - Update use clauses to use vertical layout with each import on its
>   own line.
> - Add trailing empty comments to preserve formatting and prevent
>   rustfmt from collapsing imports.
> - Break long assert_eq! statement in documentation across multiple
>   lines for better readability.
> 
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Reviewed-by: Tamir Duberstein <tamird@gmail.com>
> Acked-by: Tamir Duberstein <tamird@gmail.com>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> ---
>  rust/kernel/xarray.rs | 36 +++++++++++++++++++++++++++++-------
>  1 file changed, 29 insertions(+), 7 deletions(-)
> 
> diff --git a/rust/kernel/xarray.rs b/rust/kernel/xarray.rs
> index a49d6db288458..88625c9abf4ef 100644
> --- a/rust/kernel/xarray.rs
> +++ b/rust/kernel/xarray.rs
> @@ -4,14 +4,33 @@
>  //!
>  //! C header: [`include/linux/xarray.h`](srctree/include/linux/xarray.h)
>  
> -use crate::{
> -    alloc, bindings, build_assert,
> -    error::{Error, Result},
> +use core::{
> +    iter,
> +    marker::PhantomData,
> +    pin::Pin,
> +    ptr::NonNull, //
> +};
> +use kernel::{
> +    alloc,
> +    bindings,
> +    build_assert, //
> +    error::{
> +        Error,
> +        Result, //
> +    },
>      ffi::c_void,
> -    types::{ForeignOwnable, NotThreadSafe, Opaque},
> +    types::{
> +        ForeignOwnable,
> +        NotThreadSafe,
> +        Opaque, //
> +    },
> +};
> +use pin_init::{
> +    pin_data,
> +    pin_init,
> +    pinned_drop,
> +    PinInit, //
>  };
> -use core::{iter, marker::PhantomData, pin::Pin, ptr::NonNull};
> -use pin_init::{pin_data, pin_init, pinned_drop, PinInit};
>  
>  /// An array which efficiently maps sparse integer indices to owned objects.
>  ///
> @@ -44,7 +63,10 @@
>  /// *guard.get_mut(0).unwrap() = 0xffff;
>  /// assert_eq!(guard.get(0).copied(), Some(0xffff));
>  ///
> -/// assert_eq!(guard.store(0, beef, GFP_KERNEL)?.as_deref().copied(), Some(0xffff));
> +/// assert_eq!(
> +///     guard.store(0, beef, GFP_KERNEL)?.as_deref().copied(),
> +///     Some(0xffff)
> +/// );
>  /// assert_eq!(guard.get(0).copied(), Some(0xbeef));
>  ///
>  /// guard.remove(0);
> 
> -- 
> 2.51.2
> 
LGTM

Reviewed-by: Mukesh Kumar Chaurasiya (IBM) <mkchauras@gmail.com>
> 
