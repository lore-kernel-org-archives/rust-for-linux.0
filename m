Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6B59234964
	for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 23:34:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762817661; cv=none; b=P4SVlQCO/UNcrFZBSXM12MtwpyqMDgyVg8aQ5mLq6/DKTKemcQdstBPf5M+3BlITuiz5NJUwa/bn1DfV7jrrNsTAtQYQ9yS7B70V7ceJKOwJmeYnUVE3HaTAz0dkW68Md/ZgCiQ9UpBON50U7IRr6KSjO3G1oQ7+lqxQZ0p/qCw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762817661; c=relaxed/simple;
	bh=K/cQ2C7Ez8KzP7o1OrB0lJTjPYc31Lv7MkdeLsPQ4ZI=;
	h=Date:Message-Id:To:Cc:Subject:From:In-Reply-To:References:
	 Mime-Version:Content-Type; b=EmF9Dd6x7cLBha56AOwI7FcDnDL8IovPeibCQJXMX5o5oAwDNmOzwHuxtYXqWU6EHm3nFDzdMcnyuQjtEzizlDVadIJjQLK7ppkGULkCKQhQYPgFo1IUXddhYHVyJSYiq1rl0/Pq74JGvfXPF/b9ivLL5fHe+A9trFseycJmuZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eUwjJA9W; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eUwjJA9W"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-29516a36affso34567125ad.3
        for <rust-for-linux@vger.kernel.org>; Mon, 10 Nov 2025 15:34:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762817659; x=1763422459; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Oy2n9G+dRBzJRRG/yf89aQd7NFJbeGk8QhHqO60fK/U=;
        b=eUwjJA9WWkc3CC8fxK/auzx2NRB21PokVYsBR7I3j74Qyjbiv2MmeRsMhkacCtWcxi
         tmFDeH3p1bva3gGWTVzMVBrHgvO2GrSvj/4qLnaJUKt9V64zddR+eLpaeTYsT4bC5aRn
         vWyQvVYP3tPAi23J/8VhN5OuC4EHmYzKfwyQBiWhbu5ZStTWbEaLucouODXpJQ85Y403
         aGX4Il4oeewRgnRfSEnxvq9blPtAd8nge6FTqCJznwEH99cjSe7Pj7MeC6sQBeXXBAKF
         flpq1RIOC6Y4flNpa/oNitWzDFuWULR+YhRvy9p35a2vxCH32e040ZU26UBnS3uJZOBW
         mYZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762817659; x=1763422459;
        h=content-transfer-encoding:mime-version:references:in-reply-to:from
         :subject:cc:to:message-id:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oy2n9G+dRBzJRRG/yf89aQd7NFJbeGk8QhHqO60fK/U=;
        b=W4g2I3s+2RTvHhkHBb+a4B1iaQ/svaPBXFBx60gvEKSvQ8zR1/nxNW4PvU5qq37Rmv
         r6nyujAWnABBTmVKkwapWmlZop6Z899nTCzEChIQ+O8GjOz52GBuvpQHQDUzEzrzLUj8
         C1sg04BploTF7yXEPtIj9JTlgYUQRr+kgm9N8DuAPBt7Rm4T0Sr6AN01RpBdrkj/nbvV
         dglscnFbbTSd8yx5vSByIa3hasoK8N6WcU5iA1BMZ7lys1XrRxraC+7MkzgHsBH34y2x
         M8CfExQ3NKJRq5LAvh3pu3OtQlPVVblpRGq5gvAtZSA7zYWUivA8S7mrC6Haa1XegxyS
         VW6w==
X-Forwarded-Encrypted: i=1; AJvYcCWtnGYycnM5XknZ6/ZIuVgTRqR9wWTeVz8iSdH23pxTqvcm3l/z0L+lshtws06YheSRaKh2GAt49viYjsfR5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyVsNTzNePDWF3Gaxy/3VAZmrf1HwOcpwTV7rDr//j5Ge7gczb9
	BuCN3ZUbQRVm9ugc/aLHETx1ZRlgSqRJ/AsLFHhjA+MPB+8JEzZIgCe1
X-Gm-Gg: ASbGncs5+iQUASQK/bsIAVvgp+SeNFYyt6HVUuUa7EbgjlI/2qEIx7lRQOzW6KBYO/s
	v/TkZJXgfaulgCQ91RrfhZACcmS0cgG2H5WuncR2EkeoEEQn2uwb9mTQfvIB1O3c2n6QNxoJ9EJ
	T6NwYZ4G4y+Q/6QvfPYvszbgkicMJVjGRHQuQr2n4Dpb4AQpceZ1d+pxc4DISccMpUaRNKHdFTR
	LHoSDNZXYInllzZ4VtxdQqRys45lwkT9SsYD6bbeQgzoLkAlsJtFJKGliQ/ak1aLCJXcZ6DlwBX
	FGbFfE47NnUbjcpIFOcRMtkH0yBAWKNQOrl1xKi/CYopT4vyRpd7BesvgIKI8arez8ecoa/EKOi
	e8LAxFqDDCgHpjv47z51Lzvf1pUke/vOk7SxK5kHl1DGN6BIcGvblukGE4mYaegvxP309e2X7ne
	KoEEk7R6vylIqavgxAgOsFj/6ZwY8KEFoj73MMUeWDqcFfxj2GTVdA9KzRWiAW8u3oIwNLMJqgD
	OY=
X-Google-Smtp-Source: AGHT+IFfD56UHqe8xJ4zib+kMNCisvMUrImAWMr08SYb4N1rj4ajxA2f4+9t3KbkudcD1BAlAqplWg==
X-Received: by 2002:a17:902:fc46:b0:269:4759:904b with SMTP id d9443c01a7336-297e570bf23mr118686635ad.58.1762817658918;
        Mon, 10 Nov 2025 15:34:18 -0800 (PST)
Received: from localhost (p5332007-ipxg23901hodogaya.kanagawa.ocn.ne.jp. [180.34.120.7])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-297d4c54be0sm108297385ad.103.2025.11.10.15.34.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 10 Nov 2025 15:34:18 -0800 (PST)
Date: Tue, 11 Nov 2025 08:34:13 +0900 (JST)
Message-Id: <20251111.083413.2270464617525340597.fujita.tomonori@gmail.com>
To: ojeda@kernel.org
Cc: fujita.tomonori@gmail.com, alex.gaynor@gmail.com, tmgross@umich.edu,
 netdev@vger.kernel.org, rust-for-linux@vger.kernel.org,
 boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com,
 lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com,
 dakr@kernel.org, linux-kernel@vger.kernel.org, patches@lists.linux.dev
Subject: Re: [PATCH 2/3] rust: net: phy: make example buildable
From: FUJITA Tomonori <fujita.tomonori@gmail.com>
In-Reply-To: <20251110122223.1677654-2-ojeda@kernel.org>
References: <20251110122223.1677654-1-ojeda@kernel.org>
	<20251110122223.1677654-2-ojeda@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

On Mon, 10 Nov 2025 13:22:22 +0100
Miguel Ojeda <ojeda@kernel.org> wrote:

> This example can easily be made buildable, thus do so.
> 
> Making examples buildable prevents issues like the one fixed in the
> previous commit.
> 
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>
> ---
>  rust/kernel/net/phy/reg.rs | 11 ++++++++++-
>  1 file changed, 10 insertions(+), 1 deletion(-)
> 
> diff --git a/rust/kernel/net/phy/reg.rs b/rust/kernel/net/phy/reg.rs
> index 4e8b58711bae..165bbff93e53 100644
> --- a/rust/kernel/net/phy/reg.rs
> +++ b/rust/kernel/net/phy/reg.rs
> @@ -25,7 +25,16 @@ pub trait Sealed {}
>  ///
>  /// # Examples
>  ///
> -/// ```ignore
> +/// ```
> +/// # use kernel::net::phy::{
> +/// #     self,
> +/// #     Device,
> +/// #     reg::{
> +/// #         C22,
> +/// #         C45,
> +/// #         Mmd, //
> +/// #     }, //
> +/// # };
>  /// fn link_change_notify(dev: &mut Device) {
>  ///     // read C22 BMCR register
>  ///     dev.read(C22::BMCR);

I think that some code begin lines with # for use lines in a "#
Examples" section, while others do not. Which style is recommended?
