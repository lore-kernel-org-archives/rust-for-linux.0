Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D16E9226CFE
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Dec 2025 01:43:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764726195; cv=none; b=V+6xzOTeMAG6lgZfeXBxrfGEfIucYyRAqXDxjWkcTOASvpQ+RMGUYu1vSOZcY7MdkL6x3ggRrPjIR3E6uwaL3tLAzDC5x+KJoATwLr/6hhNajP3jmIqIx2IKneUcQXE+KN6AbAGt25MqXiiwlP/KqhFySWIgtfV0By/t/5xez3I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764726195; c=relaxed/simple;
	bh=Q8+2zS5+cicXVMjuH8jbhzmv0gnvbn7XApU+gkAOxC8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SZII1BU/sbqyaQClApJpnox2kHQr/oDhj77nPhUj78FWwC5bNMH1lAJP77erMlFo/8pi8fm+TyWmTAqmMYOXiugwFmG/yH8knJasCYP7qkHW1f5zN1J2kJ/BpR/YTXtojhqrq6ihZgBFfqn+8fefO4G3U6wRT3RfApKFVA4eWC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y4bRRTgx; arc=none smtp.client-ip=209.85.222.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y4bRRTgx"
Received: by mail-qk1-f182.google.com with SMTP id af79cd13be357-8b1bfd4b3deso468583885a.2
        for <rust-for-linux@vger.kernel.org>; Tue, 02 Dec 2025 17:43:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764726193; x=1765330993; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ETjbU+fLGhGDfzxgTnDMenSPqcjRJRRAX4hkVQevMtY=;
        b=Y4bRRTgx/2Ahey753OSHvrvKKjzwHjSCDrjK3QNfUEzWh3t5z/5zeMR9xqsJi7kELE
         4LREawRvoDdLBi/E9zqc7GjRlb6HX1JskOGTcANz5rcCbii5kwrJ2FSJKaHOlptrWaad
         aAYnNyPSMB+7c11KV2UGAYzaubn7/uSNo85QHS4+Rh3uiiy5N9Q5GaSjB0Z5tAiOd4iI
         j4jz4KJZudSJKGFAIoQq/TBsK7cbLoMrgF4H7H/M1STLkmuvHOPKTauMG7hqzH30nyU7
         fXRkOp4yeWqe+ClZQx95ttCDRllYbNvXECeFGXIql01MzCQJLtJLOMLi/pvLr5q5HH6P
         VImA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764726193; x=1765330993;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ETjbU+fLGhGDfzxgTnDMenSPqcjRJRRAX4hkVQevMtY=;
        b=JwCboEEcbvjgFOEojXDji4m06r7Z9zYSK0lEtO925ZGWmzpIkjIw4dyyq/9FTLNWIy
         dCN8SGQ3goJy2c68mJ1U1pNravQFp4KnjLKakNoprjvuToKf5a/PFrzFPjXZQ3SZZekg
         Ad4FfON13BPg+thRfzNssBry1cALUhuVcOyyEurRsK49sybRFcV/7BPgG08X0SYmWjuk
         FxNL9+lhJ5CwGounyxoMJvjUdg2p81r4sKfKEfx7icqNRkREXgAR8FdyeXz65XHPJijj
         Iqo2mYbSeGSk0JXj/5EPRffT5Uz8f+59zSu+KzGiYDbgiADGvR/GQ3t3Np8sRAn+2lvK
         Izpw==
X-Gm-Message-State: AOJu0YwnypqBGQefNPUPjaRQR8DBoJ/n0UhAINJM1Z0ldZoK0h7H1t7x
	Q8reaQZuUaZst9jZ6bqZk2tGgKcC3f/09buKVxknrYenXOKzryqW4/Peg7OT9w==
X-Gm-Gg: ASbGncvQV5lBGEe4FMKCpgzu9Fr0HYCQ6gzhaAOZlDRzAtEEmBerJ52974btsrw5Zhg
	1CItUrarYUrwAfauDa5b+7FQcXsZWNZXvzTZ19a+xKGfJKyHNSmbwWinSHRL70bTf9IcvXQ8cU2
	qjqZVUilhmYqtOcPp3A6NjWo+mQt1Tfa7G9En7GfYuiqylQt1tiZll57On8jMbHM/Dm0w6k1xS9
	zQkA166/S+KIB1py/WKq9fCA7JWt3nzHOk4w7xcrWAoo+RxsXyEdcG6R5j32JGLoCGbMN6jijC4
	/hFgVuj1TEvGTWZ1OJ6MHinEbIjBbNNhzlx0VwwKV9stuaGL6R/oLnW3/UXzLQnLG3DCNJYjovI
	Zth1nyU+lnwNjXu8cQ3ByfdUro3dnePd1I59ZaqVX7XwLNthJEHESSYapz6wtE3qCFCOIqjvTgB
	G3B+cd7b8vAVFCtaF4gBmE2CQxc68SzrD7sABVVwAOGNmPnvFqz7E732Uiawj7MdVxJiK2R7Rzd
	/Z2OuZYGfRpgGVlxZ429jeYfg==
X-Google-Smtp-Source: AGHT+IHEy4Q54AuHhgpVA54+15RACthkHURALKVHD4XscXZnJiegxklSCLv18fakX1t0x2ItohbFLg==
X-Received: by 2002:a05:620a:280d:b0:8b2:f29e:3b00 with SMTP id af79cd13be357-8b5e6a905e1mr82884385a.51.1764726192746;
        Tue, 02 Dec 2025 17:43:12 -0800 (PST)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-88652b6d32csm116059906d6.43.2025.12.02.17.43.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 17:43:12 -0800 (PST)
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id AF9EFF40077;
	Tue,  2 Dec 2025 20:43:11 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-05.internal (MEProxy); Tue, 02 Dec 2025 20:43:11 -0500
X-ME-Sender: <xms:r5UvaX8kRjw9Za8VOV-mDwKl3o5m_0sOG-_0gY2DzhaXqFs1WB-4NQ>
    <xme:r5UvaWylMKb71xPmCEtNGlalZWQBaRdN0N5DrHUkCyJXg4F7rM_GTZCeQ3zRmj75F
    q60IiluxBUUzsaRkN2rcFKnsAu-L6qyc7p3tvEi7IoSBGLBs02RwA>
X-ME-Received: <xmr:r5UvafpOA_vo5dBFjZMzxKysd5miLLkD5HFhhr77YhSXq1iYQ2Lh1gVB230fzzFQF3wSA3D4LbB5Jaw-or3tKD5fN-t8Ydvi>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduheelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepuehoqhhunhcuhfgv
    nhhguceosghoqhhunhdrfhgvnhhgsehgmhgrihhlrdgtohhmqeenucggtffrrghtthgvrh
    hnpeehudfgudffffetuedtvdehueevledvhfelleeivedtgeeuhfegueevieduffeivden
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquh
    hnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdeiledvgeehtdeigedqudej
    jeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhlrdgtohhmsehfihigmhgvrd
    hnrghmvgdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehruhhsth
    dqfhhorhdqlhhinhhugiesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhopehl
    ihhnuhigqdhkvghrnhgvlhesvhhgvghrrdhkvghrnhgvlhdrohhrghdprhgtphhtthhope
    grkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtoheplhho
    rhgvnhiiohdrshhtohgrkhgvshesohhrrggtlhgvrdgtohhmpdhrtghpthhtoheplhhirg
    hmrdhhohiflhgvthhtsehorhgrtghlvgdrtghomhdprhgtphhtthhopehurhgviihkihes
    ghhmrghilhdrtghomhdprhgtphhtthhopehvihhtrghlhidrfihoohhlsehkohhnshhulh
    hkohdrshgvpdhrtghpthhtoheplhhinhhugidqmhhmsehkvhgrtghkrdhorhhg
X-ME-Proxy: <xmx:r5Uvafqz10y4zTuITFREwYLLR4rXPfVo0QZUQTq-dmXsQIoyXt3DEA>
    <xmx:r5UvaXCmws2k4wKYaj8Yk8tuPB9NGZ5yGFiMF7ZfgoVl8LsEBmlI6Q>
    <xmx:r5UvaVuOG89TuwnIhsuUIS07NgQcJIh4b-iTGA29NHJZOeeMtKNVkA>
    <xmx:r5UvaeIgAKCeYGenBcAZ-OjK8X0JFRC6Fx8OUpqH_lgdaLwVpsBaag>
    <xmx:r5UvaUaSaex5G1iDvNoOzsD3PtBz07z-14zzyZ0yCQyAK0Kic_s8cU8g>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 2 Dec 2025 20:43:11 -0500 (EST)
Date: Tue, 2 Dec 2025 17:43:10 -0800
From: Boqun Feng <boqun.feng@gmail.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Andrew Morton <akpm@linux-foundation.org>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R. Howlett" <Liam.Howlett@oracle.com>,
	Uladzislau Rezki <urezki@gmail.com>,
	Vitaly Wool <vitaly.wool@konsulko.se>, linux-mm@kvack.org
Subject: Re: [PATCH 24/46] rust: mm: add __rust_helper to helpers
Message-ID: <aS-VrkRdQc0H6nSs@tardis.local>
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
 <20251202-define-rust-helper-v1-24-a2e13cbc17a6@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202-define-rust-helper-v1-24-a2e13cbc17a6@google.com>

On Tue, Dec 02, 2025 at 07:37:48PM +0000, Alice Ryhl wrote:
> This is needed to inline these helpers into Rust code.
> 
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> ---
[...]
> --- a/rust/helpers/vmalloc.c
> +++ b/rust/helpers/vmalloc.c
> @@ -2,9 +2,10 @@
>  
>  #include <linux/vmalloc.h>
>  
> -void * __must_check __realloc_size(2)
> -rust_helper_vrealloc_node_align(const void *p, size_t size, unsigned long align,
> -				gfp_t flags, int node)
> +__rust_helper void *__must_check __realloc_size(2)
> +	rust_helper_vrealloc_node_align(const void *p, size_t size,

The indent here seems to be incorrect?

Regards,
Boqun

> +					unsigned long align, gfp_t flags,
> +					int node)
>  {
>  	return vrealloc_node_align(p, size, align, flags, node);
>  }
> 
> -- 
> 2.52.0.158.g65b55ccf14-goog
> 
> 
