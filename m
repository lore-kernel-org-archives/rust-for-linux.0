Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BD2F253B7B
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 12:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742385985; cv=none; b=uyXRQvoqXgEvN9iuhoJRHlIUB9P+SKv9XLwYX0iXcS3gUVWpGSV+jwxq7QzR8PafT6G7SnqtwGJPo/3UbLoZZ3deg+aFMhiCvbetxbFiCh1Q5rsRe1eIAGfiBT2++ohybsNkCdm/ee1ti2F42iV+0D9Mam6STJ84QiSfWHdJ2UM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742385985; c=relaxed/simple;
	bh=O29GWBbnGpDP3vt5LO38+vNeYxjy8uY5wGxT+fv2A64=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=FWLfmzHLRBggv0G8o6mSv0Tnb9S4JRQk9023jkxdkIgxCwGkc17b16iWIf+8TKce77qpZHk3cy4POIoXGoOw7Ctc4uUjDoCuGHBvS/Daa4pnseZfzX1vez8WU2DqiwzWAPzq/YRGoxhNJoXGPr9Q0TqtVZpYrl4fTMNcyCjXpfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=MgKuMLG7; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MgKuMLG7"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43bd0586a73so27240005e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Mar 2025 05:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1742385982; x=1742990782; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=uIznqglTZy019YwLgXF2t7sJ9J4X12Fp4umldfnnkg8=;
        b=MgKuMLG7Awe1MMUCGHrxdLfqZ/1fJXKBPQtCYX6Ope7MRUcFWDDr/AEYNIC9Hz+1US
         1uMAFdj/2wpdOzve/0cVJKnazJDhhjqKE5zXOXnTRrl8BqdqqRH4ra9GYBwNuVtLoVlh
         4m3Wfq6An+n30fvSsxSQzA+VWkeETf8JPVEXjzLR5FaMzPr8GtJxOxkYc++ACB0CqRk0
         HmNDxOlMOb0RE8SnN6sCxAvcaq+TP6SKNsNsR0OJx+ZXnivGW5dXHCQWC29EhRFdbVYV
         //6GQHSRsL3E5gDVWCwoK4eLFyvoCin2jF9dSJ4pa9NbhRQw0oNh3leTYc4dcBNx905P
         AHcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742385982; x=1742990782;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uIznqglTZy019YwLgXF2t7sJ9J4X12Fp4umldfnnkg8=;
        b=MG0wAOvi4+wP6b31dP5GWQOvpOqOQRs+xxSBR9yddC3F1EgQeTfKdfXpFxwzs42t9G
         /aIwMximQziz/EtRKf6yoE59TPf66T5lwTLXbs2PYRV10tt5+0lA2sBOHQ0J6DXcPIf5
         spPu+KhImxmz+KTxQRX49J3UXY15GvUfOatD2t4FqxFO/vw94mMJGVS6wHWpCQWRhHUj
         Wb1RHibJqhGBxl9e1KLRCYIBmz6NYWLoQJBlfJPtOvfC5MMifbbZjCU2uBJjdI2vnX97
         oMczkM7vapGvpdQUtR0nvjL3TX9O5swc9FfSGdhVSmALcnUAHndSd0fZnEaS6+1Xmeje
         mYgw==
X-Forwarded-Encrypted: i=1; AJvYcCWNq1Qo+3t0BFvSUivJautMGIujzFfC8omas5YXglVXU82tFGFjBUsSaUm3STCY7o7a4qTyw2xee9jSMWx58g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzhShpiFiH7uX2GhbBd1y/jygJmeYmMZF1luA+HQJReQ+UFB3Lg
	N+VMIbHimfmeEqlHCBIPTvp5XekrWayBSe9FCj41dLh5ihXxycq6tkqLVomvR4gIAt3lT8RBTzV
	yWnBOlSpHeLfuaw==
X-Google-Smtp-Source: AGHT+IGqauryNOQLYRTywgLEJywGQ+qmcp6L37Fmu8lttjDSEdhKi0R/yUZe6VREubsHAspkFyKKzK3KaQqYByU=
X-Received: from wmgg15.prod.google.com ([2002:a05:600d:f:b0:43b:c450:ea70])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b92:b0:439:9a40:aa0b with SMTP id 5b1f17b1804b1-43d43882ebcmr19110095e9.25.1742385982576;
 Wed, 19 Mar 2025 05:06:22 -0700 (PDT)
Date: Wed, 19 Mar 2025 12:06:20 +0000
In-Reply-To: <20250318231815.917621-2-samitolvanen@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250318231815.917621-2-samitolvanen@google.com>
Message-ID: <Z9qzPGVYaDD-UC5p@google.com>
Subject: Re: [PATCH] rust: kbuild: Don't export __pfx symbols
From: Alice Ryhl <aliceryhl@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Mar 18, 2025 at 11:18:16PM +0000, Sami Tolvanen wrote:
> With CONFIG_PREFIX_SYMBOLS, objtool adds __pfx prefix symbols
> to claim the compiler emitted call padding bytes. When
> CONFIG_X86_KERNEL_IBT is not selected, the symbols are added to
> individual object files and for Rust objects, they end up being
> exported, resulting in warnings with CONFIG_GENDWARFKSYMS as the
> symbols have no debugging information:
> 
> warning: gendwarfksyms: symbol_print_versions: no information for symbol __pfx_rust_helper_put_task_struct
> warning: gendwarfksyms: symbol_print_versions: no information for symbol __pfx_rust_helper_task_euid
> warning: gendwarfksyms: symbol_print_versions: no information for symbol __pfx_rust_helper_readq_relaxed
> ...
> 
> Filter out the __pfx prefix from exported symbols similarly to
> the existing __cfi and __odr_asan prefixes.
> 
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
