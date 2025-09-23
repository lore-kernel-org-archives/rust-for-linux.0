Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BA013275B19
	for <rust-for-linux@vger.kernel.org>; Tue, 23 Sep 2025 21:59:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758664777; cv=none; b=nWVZDIRhltfhqO1LiC7UL1oIgLik48RCqzqHHBgS0qYKMWRngyHQ+y+FyA8/D1uXIoINtjIofH62z6DLMNWECIuUCZG7UuCK6l8h6aAWtkzPDQf451AXiy812pjPbSOoXrRYAagrjMAc4gNXMWCvr/exeEGHzNWtp5i7HQLhxAY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758664777; c=relaxed/simple;
	bh=n+Tna5yctFylnOzzw6gjcQZXM40ohuoeFQZ83Y8tx9Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ulhyccoz6CL2/0700enWa4f8o7d3XUEdpcEx5glBt7QG46dCdYD/DRQrkEcYqv0MOL0vcsa0BDgzVkIk81DZ/s0AX7IBjehBzm+SC4SMW9b7Q6nDgJB1n751hBoCAOLHWuBV1JxKUNhSUhs5VrXk9GBfXiFcwaoRr1Bd3eTeG5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=J535gKJn; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="J535gKJn"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-4d41154079aso7785531cf.0
        for <rust-for-linux@vger.kernel.org>; Tue, 23 Sep 2025 14:59:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1758664774; x=1759269574; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=BX3qHs7drl3tKastKD1b5d2t8SLGFfBbCJAz2/e6rWo=;
        b=J535gKJnABWs48sJs/MOp8H1tCxj8SysIjQ94ftPyZ6XArrXibq6ihiOS3Za6hfYsI
         Q+Wk5cKla0Jl/ScRGWYRJQxdEuUnW512k72diF37wUgnkauITgW8GUPPaOYywcoFlr32
         7QU+A8C2Z/ueLS9iVsWLeFKUbCVD0w47YUnaJcY/NbiQjE9n7Uv2WbZOn8AJ9jXf6ckc
         cdQilJrmWFdaY6BeI7bTayP4zumjNfQdJW/aFUT01nuCPIunabAkHMFJOmpHvp/uwVNW
         rX85/EN+jZUQDHUp2tl4fvl6T2yA7rOtZ09N2xRT892OpPolWKc3K/uaiejAslviSYAs
         AG7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758664774; x=1759269574;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BX3qHs7drl3tKastKD1b5d2t8SLGFfBbCJAz2/e6rWo=;
        b=g8YEqRA4bH2DKY3iiLvETdq4q1Vpr4GCB9PzKgX1WvSTIEuAyHpugxlSWY925FOVYb
         jGQ8KThge+3sb+mF4jStTSyZhCKDCIKelZuHF7jrppUNnyX/x/EiQjMVLMuJ6IRm4F2L
         RYlF3cjz/4ZZjiWuCZyHItOQAjEal4A8/NBhiarEp26xZrekFN/sV2RASxUbmfOEBMWB
         4M69H4af5Vr9o/AuOIiQEY0RjElh4jVOTCmucX9QisCpGIDZHqHJTKI0G0BprJ0eGDt8
         tBjq1XanYcTAs//3nLCw+6WQsJIXVyxbvT0xI9HH5pqZf33yT3490aiszU58mHzfwSgN
         Ek8A==
X-Forwarded-Encrypted: i=1; AJvYcCUDjGBX2ywYIYHnIs+T4tSmIMgspFRSUdBftayMvPiuroxBBQnhqMDHqCE66eQizZGXs40a7mDZUY8z7Mrd9g==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIC8e5BvAx5rk3yf4EF+mQ15KhZcSrEz/XQvPq6LFuP2zdmUPK
	d2CU97cfWgEXAaDMyA4YJfxLcr9rOP0JTb2Q9uburhFacfMhVZEzqw6nhr/pFAiv9z4=
X-Gm-Gg: ASbGncvuLPfp58IqbKK4F3mHAMgyX+4NPGdobV8n+tiIvNotQ1u1/Z+fAf32KyJNXzb
	dkTDOX/0D8UUvqIrwPp2WzAfrmDs/FJN70csMRZJngEK93w7laItaBsBvXrBsXQSiWu8BZb3F7l
	rT9e7uXZ3+2HA23p6eNkZKpaicEW+On2P8Lk9cwEf3UbzPhmFsxs5TCzGk5GqwUJuHZXmyhq1Qe
	SnxHz/dPPyQlc/6HZN8/jJQAzLpmfHUdN4gPRgaum0YGCH9iO+WnmxVV58x9kGQa+C+VECJuOqS
	J+1nqSDAiOHzFP9xRfXikdXcgJZ0UquqGhuBLT0Irbp2LMpEpWQjPfnzhK02O3RArhOEAlQyJbo
	tC/MY8cie8CHOXVIesDaRiTZQ8GpiWCkb
X-Google-Smtp-Source: AGHT+IGJK4Ixs84ITmfl21mhtnUIvulA36FWyfmqNajQjBuONg+Bop3F7SJyTIF2oLRK+xYnNqb3Tw==
X-Received: by 2002:a05:622a:a15:b0:4ca:e5df:f266 with SMTP id d75a77b69052e-4d369510c3fmr47797661cf.37.1758664774448;
        Tue, 23 Sep 2025 14:59:34 -0700 (PDT)
Received: from localhost ([2603:7000:c01:2716:929a:4aff:fe16:c778])
        by smtp.gmail.com with UTF8SMTPSA id d75a77b69052e-4bda2c6d0c5sm93805981cf.21.2025.09.23.14.59.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 23 Sep 2025 14:59:33 -0700 (PDT)
Date: Tue, 23 Sep 2025 17:59:29 -0400
From: Johannes Weiner <hannes@cmpxchg.org>
To: syzbot ci <syzbot+cica6a1c285444b25f@syzkaller.appspotmail.com>
Cc: a.hindborg@kernel.org, akpm@linux-foundation.org, alex.gaynor@gmail.com,
	aliceryhl@google.com, bjorn3_gh@protonmail.com,
	boqun.feng@gmail.com, chengming.zhou@linux.dev, dakr@kernel.org,
	david@redhat.com, gary@garyguo.net, gregkh@linuxfoundation.org,
	liam.howlett@oracle.com, linux-kernel@vger.kernel.org,
	linux-mm@kvack.org, lorenzo.stoakes@oracle.com, lossin@kernel.org,
	mhocko@suse.com, minchan@kernel.org, nphamcs@gmail.com,
	ojeda@kernel.org, rppt@kernel.org, rust-for-linux@vger.kernel.org,
	senozhatsky@chromium.org, surenb@google.com, tmgross@umich.edu,
	vbabka@suse.cz, vitaly.wool@konsulko.se, yosry.ahmed@linux.dev,
	syzbot@lists.linux.dev, syzkaller-bugs@googlegroups.com
Subject: Re: [syzbot ci] Re: rust: zpool: add API for C and Rust
Message-ID: <20250923215929.GA1122379@cmpxchg.org>
References: <20250923102547.2545992-1-vitaly.wool@konsulko.se>
 <68d2cfc2.a70a0220.4f78.000a.GAE@google.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <68d2cfc2.a70a0220.4f78.000a.GAE@google.com>

On Tue, Sep 23, 2025 at 09:50:10AM -0700, syzbot ci wrote:
> syzbot ci has tested the following series
> 
> [v6] rust: zpool: add API for C and Rust
> https://lore.kernel.org/all/20250923102547.2545992-1-vitaly.wool@konsulko.se
> * [PATCH v6 1/2] mm: reinstate zpool as a thin API
> * [PATCH v6 2/2] rust: zpool: add abstraction for zpool drivers
> 
> and found the following issues:
> * BUG: unable to handle kernel NULL pointer dereference in zswap_store
> * KASAN: slab-out-of-bounds Read in zpool_get_total_pages
> * KASAN: slab-out-of-bounds Read in zswap_store
> * KASAN: slab-use-after-free Read in zpool_get_total_pages
> * KASAN: use-after-free Read in zpool_get_total_pages
> 
> Full report is available here:
> https://ci.syzbot.org/series/e8b22352-ae56-4d7c-9113-75573acf2b64
> 
> ***
> 
> BUG: unable to handle kernel NULL pointer dereference in zswap_store

struct zpool {
	void *pool;
};

struct zpool *zpool_create_pool(const char *name) \
{ \
	return (struct zpool *) prefix ## _create_pool(name); \
} \

u64 zpool_get_total_pages(struct zpool *zpool) \
{ \
	return prefix ## _get_total_pages(zpool->pool); \
}

You create the zpool by simply casting the backend pool, but then you
deref it twice as if it were an actual container for the backend pool.

I'm guessing you didn't test this even superficially?

This also still proposes an API with no in-kernel user.

NAK
