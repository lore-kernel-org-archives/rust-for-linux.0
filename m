Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6DAAC2D0605
	for <rust-for-linux@vger.kernel.org>; Mon, 27 Apr 2026 04:08:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777262915; cv=none; b=QEEdw6rBti5WQsy6wepcA/eJsua+oubXMLnfHIzhB1u1X8Y71ZAYxRcHhD6vQwQ8J3zauehJfl2qR2P2Vyi4LGRTDEkGxWlKF+nltFe6UzRuS/Wc0m39gJy7bDHjUdj2QehfNqTuvjlGMcxFZy/w/S+jSCitFwSjoUiI8itWU7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777262915; c=relaxed/simple;
	bh=2nn2UlU9x/sAeT1dZanqC4by/vKAlCUGFVE8Q3gAeEY=;
	h=Message-ID:Date:From:To:Cc:Subject:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g4X/gyS0ZNd7eJqfWZimPHD/hV5hD04iC2enp7BtblFLdAKPNb98KtEWMl6fqZDv2a81h6r4x4iBx6xVtYyv+8QuCiAqgsQk1gRk9qswrZcuh8IKWjAPQVRTAu21YqNWXUtjVH01Md/oO/eo6WPGarU2gWYNau+OaP9bLQzO0/Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YcAuqV3o; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YcAuqV3o"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-35d90833cacso5989769a91.2
        for <rust-for-linux@vger.kernel.org>; Sun, 26 Apr 2026 21:08:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777262914; x=1777867714; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:subject:cc:to:from:date
         :message-id:from:to:cc:subject:date:message-id:reply-to;
        bh=2nn2UlU9x/sAeT1dZanqC4by/vKAlCUGFVE8Q3gAeEY=;
        b=YcAuqV3oNwoflkc7/zAgGF3LY42dHntOsHkU/P5HNkD2kRT1aTfQyB5Y+xpnEj95Nb
         MyUUM6SoYVkyLS67/ii+9tgXy3uhuvVkpTB3+k+yaLm9AIluzZGx4iMKKwV8pHn8REdj
         +nYGu0VUB5WuC/F+JgtcQZ16VtTaXmVC9yrZqLy4dqM2LkjqmEXaktmibidkG3q7l9W7
         1VHjMPbINvyqb5aHExHL1UMOPjHW3rc3OFmPt0l/g2AqoTwBTgVda7250FeScnFw1TK7
         9cAUkSv14VR6zp3ehneF72LqOQ7nb+bY8L1yWXQLjt3lKezTjaAMFyZdoirwgwzg/Lsl
         bgcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777262914; x=1777867714;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:mail-followup-to:subject:cc:to:from:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=2nn2UlU9x/sAeT1dZanqC4by/vKAlCUGFVE8Q3gAeEY=;
        b=CwpO5CUzKzXuELUNXVbWsg4cQBGf4u8OSue1Z1m7aQzBC/Fc2EDXpLybXZMkJpN4Rl
         reKK66+ppC/b/kvs/RjFRFGrFZGo/ybhXZOqV6FLJ32Hxj7kvnNM+Udegk5ENVVuRHtF
         /99h1FScrapl5CfBCOcxg63r4uToloDWp3YsDHdkMljAxWNIU0EXWs5ZTGEv6NAG652x
         A9qcRj3LdJZighO3EStsMRO3vMrBGYqJu+4o5dRvjYGkUwj63/6yVYdHvR7AiwLKcbVB
         sqiaq9EP5+dfy8878nOTpGZQnmoT/Jyniu4GmC45X33XzC6CLiWQE/nJSp78Api2GHPG
         qcnw==
X-Forwarded-Encrypted: i=1; AFNElJ82ooToBY2L/ZlPVYzAlGfuIy6RTq5F17on4J9asETzkhS755zQnHoFYJLTQq8a5rSbkld4FCPmRXMdJARYgg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzuq/QpuZE1VzONymXkXGlcn6oYDO6VbLzjP22B9SyRaAPEk8JE
	/MMF0N0pNbx4L4xwZ+qH2nfhqX7gLNmwMC5bXo1SZofxC6YP6LBEXBfc
X-Gm-Gg: AeBDiesTc+FTxeUhpxkwtkrvG3x1UEd2Jdl9lSxKvzxrr6CwBKIRB4IdaZc6LahHU6N
	RBu8+CckKCiiPRbUgv7z5eLYf16MY/kF2t9PnPZO4W9vNZ075kW2pTl2yZctIfqIljLr+pltS19
	wZNH/6bwgL6ziEcnWBjP6yYOiBk7i0+Fors9A2o4xl3WRuP005oAPnuBvk/ea7dXoFQv6+ijbm/
	F5GF/MYKtWD3L9RYxaZ6GztZ1IQnDr6YK7Ti+txYkXsF9k7hsep/bzShyc557mHoMjHLWLq3lGF
	UtLFuMzrf/RkWyx2Bu9l4JKwlbFbcbz0flb7BYq4Oqn3aeSPYKgTI/lVJ/JgKhV5mOni15vD+bk
	bfOWxsFQw6l0Ykz1tD/EnM/7vZc2HHMX30bi4zwTeyBO0vpWVLKO9ItM4CSwkgzLGiBGUXf+yVg
	IVT9gAPRwo744I+3xd4jPoOUjNQ49VHGcNQP6TZf6NA/d5Rpw=
X-Received: by 2002:a17:90b:5288:b0:35e:5051:fb18 with SMTP id 98e67ed59e1d1-361404a2830mr41550968a91.26.1777262913772;
        Sun, 26 Apr 2026 21:08:33 -0700 (PDT)
Received: from yuwhisper-pc. ([49.213.140.88])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b5fa9ff90dsm291338235ad.11.2026.04.26.21.08.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Apr 2026 21:08:33 -0700 (PDT)
Message-ID: <69eee141.170a0220.269ea4.eb23@mx.google.com>
X-Google-Original-Message-ID: <ae7hPrf0urSQcGXw@yuwhisper-pc.>
Date: Mon, 27 Apr 2026 12:08:30 +0800
From: Hsiu Che Yu <yu.whisper.personal@gmail.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Hsiu Che Yu <yu.whisper.personal@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rust: alloc: add doc test for `Vec::from_elem`
Mail-Followup-To: Alexandre Courbot <acourbot@nvidia.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Vlastimil Babka <vbabka@kernel.org>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>,
	Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260426-doctest-alloc-kvec-from_elem-v1-1-e364341a759b@gmail.com>
 <DI2SFMAZZBUI.3W0BML3IG81Y8@nvidia.com>
 <69ed9422.a70a0220.2a0a5f.f624@mx.google.com>
 <DI3417MXPI5F.1DMTUFZULXTUF@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <DI3417MXPI5F.1DMTUFZULXTUF@nvidia.com>

On Sun, Apr 26, 2026 at 10:11:01PM +0900, Alexandre Courbot wrote:
>I don't think there is any hard rule, but usually a patch series implies
>a dependency between the patches, i.e. patch 2 cannot build without
>patch 1. For what you sent so far this is not the case, so separate
>patches is fine and maybe even preferable as they can be applied
>individually whereas maintainers tend to consider series as "all or
>nothing" (there are exceptions of course).

I think I now understand the distinction between a patch series and
individual patches. For independent changes, I'll just send them as
separate patches.

On Sun, Apr 26, 2026 at 10:11:01PM +0900, Alexandre Courbot wrote:
>No worries. If I may recommend b4 [1] for managing your patch series, it
>ususally just does the right thing for you.
>
>[1] https://b4.docs.kernel.org/en/latest/

I've just started using b4, and it has been really helpful — it takes
care of a lot of things that previously required juggling multiple tools.

Thanks,
Hsiu
