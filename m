Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E7CF278753
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 08:56:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771232213; cv=none; b=qBKmkB582TXWS3xN79rR2fDTmKd2eu9VDwh1M6AZnjkmu/ar/kfVXy7AIWsgruLayaVlbe1AV282IRliJYfCiyJllwz5HdCkb9qCh7dmtEQScVGttEVKypUd4FVIhW+RoDRJM6XFLAawg0uEj4abygpFXLCxwBS3nIy/c1NK52g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771232213; c=relaxed/simple;
	bh=RRworO0e0jB2L++N8t+MaRtV5KDsytl9rjBp2wDeAQ0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jXgCH8BF3QPDegrHXARiX16VB/7o45CDA7HhTsD8PB8taU8jdrDNumny8Paw7Ofi7Txk6O9zFIvgvjDk5CpyhkgaNMwViRN/5EXOLH64UOmtwphgeEVs4Q1IxtKlPGoA3vsqBnt/mmsZ1sNgXPbYsKJRLYco+ysHp5N+1WmzpUg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=YCnDzinu; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="YCnDzinu"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-4837107e0a9so25897575e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 00:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771232210; x=1771837010; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/g4FBr0hx+U1hrupB09478t2hk2gU/mPpH49qC+dJe0=;
        b=YCnDzinuapXPS7/JjZzst5cUB8vkI9G4nv+6zH2CI8jkGeKsCQekswlMqsgYXObtDw
         ZFALackEriP7bkXqc8jW0oolr3t7NQZsy8LGQxzQRlB9B0x3Tt/ulBNcLBnJDMOpXMCc
         7+XlFdAZaLa4gQj47fThujX4VFI0Ki/Fotj2LsjgMnLNVW7+Of28nF4TrdMfqjSlxE4T
         WNs68f+TCVnSkDwZ9yaM9Rp5QSXBlqywCbpovA1FMOlcV7Y6cNmelSGj6HUoQSlPH0vJ
         JORdvGX//s322vgh2fTRf5GjETg1r43HsJ9cG4F7So5w8fRoJIWvn8g5a3AD8XiY/GV/
         UrOA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771232210; x=1771837010;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/g4FBr0hx+U1hrupB09478t2hk2gU/mPpH49qC+dJe0=;
        b=qN/XujOLvF34WAQtU5n4R/k75EDpHtyAXpZ/rIIUJGtKzOGREGXDy9XLf3KILgFXRW
         DbzmtPpsjTCfVnpZowHmAjYJM2qyjXc0O1yuk/Xygg4G5xodO+v6DN3JcNHNDmk0tZVl
         hFxCecIRwTDn+S1JZirL9RTt4YTo7TFtqirDqWmqbel80oYtULqVOji3+1o9zwJ1ExUj
         NeugDGYTpegF+Z9PiZcCm327BbeURtnZ7pukUq2JJ45zTJ/rd6qCcszW2nKtDGk0Qh7F
         16pLiX+ozBrhEJ1JFYv+OgsVteOXnFDXXWkcCpiMbIXZR7abw2k7WSjfcPHq21UkJH77
         /f8w==
X-Forwarded-Encrypted: i=1; AJvYcCXfVYsSc49EHewe7oizXsoWFxEy+VjuaF/A18ddLHStmNIEIassmvx0EneJRcxD0xWRJjCNBgtXLjZ40gn0XA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzve2mpzKpUU6r7xseu02ymQg6r057UfUmDBux0VrAFKAfOAZAT
	4fsyLbiAWsUqcdrYG26zr43D3GLkAfP3bQ7Pt3VN0unVI3VY0vi/BmtmTEoFyDUh5N8GrRvbXZT
	4afbnKCGB+MmoMGlMmA==
X-Received: from wmqy18.prod.google.com ([2002:a05:600c:3652:b0:483:6e28:c1a5])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:c172:b0:480:3a72:524a with SMTP id 5b1f17b1804b1-48373a5d591mr154526285e9.19.1771232210394;
 Mon, 16 Feb 2026 00:56:50 -0800 (PST)
Date: Mon, 16 Feb 2026 08:56:49 +0000
In-Reply-To: <20260216-register-v6-4-eec9a4de9e9e@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260216-register-v6-0-eec9a4de9e9e@nvidia.com> <20260216-register-v6-4-eec9a4de9e9e@nvidia.com>
Message-ID: <aZLb0VcA3oZLfYvr@google.com>
Subject: Re: [PATCH v6 4/9] rust: num: make Bounded::get const
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, Boqun Feng <boqun@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Dirk Behme <dirk.behme@de.bosch.com>, 
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Feb 16, 2026 at 05:04:40PM +0900, Alexandre Courbot wrote:
> There is a need to access the inner value of a `Bounded` in const
> context, notably for bitfields and registers. Remove the invariant check
> of `Bounded::get`, which allows us to make it const.
> 
> Signed-off-by: Alexandre Courbot <acourbot@nvidia.com>
> ---
>  rust/kernel/num/bounded.rs | 7 +++++--
>  1 file changed, 5 insertions(+), 2 deletions(-)
> 
> diff --git a/rust/kernel/num/bounded.rs b/rust/kernel/num/bounded.rs
> index 8e4c08924d96..b09b93cd0c5c 100644
> --- a/rust/kernel/num/bounded.rs
> +++ b/rust/kernel/num/bounded.rs
> @@ -379,6 +379,9 @@ pub fn from_expr(expr: T) -> Self {
>  
>      /// Returns the wrapped value as the backing type.
>      ///
> +    /// This is similar to the [`Deref`] implementation, but doesn't enforce the size invariant of
> +    /// the [`Bounded`], which might produce slightly less optimal code.

The unreachable_unchecked() hint is const, so I see no reason you
couldn't add the same call in `fn get`.

Alice
