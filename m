Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F0E3184540
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Aug 2025 12:45:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756212308; cv=none; b=pkoylHRZC3QuZrHvNrDPG8UBFHZ1m1SpUzpBduZGzpiLGPEKSAqphT1k1uy4AVbhlaQExtTFle9Q2vEc+I6JOwvE3J5ZAXuamXt5+NVthrjQ4bvS/Hy/oN8iWA0aOG5U8gq2RuhbP2h3Z46MAAkSGMR631sYBe6bgRnb6v8FBqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756212308; c=relaxed/simple;
	bh=kHskFBa2oIcEMKYovfY+fi3L1IR64RfvAYRX9xZO5xI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Nxqv0SqtmaGm0ZkmPOG35YTOoruR85VV52fIeHxY0+qjTSprnPXQYoxA6qA2fuRPw0mP+gEVun9KxvxwTg9Z4cDRu1qKfZbF3OLz36sbQDWyd1u/B679a3x2wHwWSodPA2R/1O5NjphyuU9lifFx3khG4KXVrjXGJjXlZwsTGFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org; spf=pass smtp.mailfrom=cmpxchg.org; dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b=YbdKvJb9; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmpxchg.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20230601.gappssmtp.com header.i=@cmpxchg-org.20230601.gappssmtp.com header.b="YbdKvJb9"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-45a286135c8so33291825e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Aug 2025 05:45:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20230601.gappssmtp.com; s=20230601; t=1756212304; x=1756817104; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=G2JcBs+CganwEkX4OprqHJ8amoc/Ho1q+lauapGtfgE=;
        b=YbdKvJb9kdo4HGFDLjUv9uEgtJAwSzzK08EOwJ1stZaA6hi2VdfabkSJP+Ed3yNz0p
         kTzacvmmaSp9hgRBOrPz8vk5M7EB7f53qE506XbBsVtDMEOt0A5oobdBAKxVblvlegpl
         0K/C3EFRQE7Wd5Vs53J20cQABeouvaFHa8CKtl0yyQ60NcdFawOCAtmPkbQi71U9nRIQ
         d6qZDd9wiqfTfwnkNofmbe/KWoVwq09f17L67oNDugqCfAr0kVf1/rm2FdbSGr32z5BY
         ssnMBltX4kXXyGaR7G1itHkCL0LBErRC2oz9/uvGUF+KuDkLPGqIb8e6LdGWbpGM5jH0
         xsvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756212304; x=1756817104;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=G2JcBs+CganwEkX4OprqHJ8amoc/Ho1q+lauapGtfgE=;
        b=qO5Iu+iUeLBZH8Qgs1JlZDBaGOi3hrmj9RjjV7ZVdZTy7kyTvh8ChQsyOo1ktbkB67
         rYxqdpZbF64c6hhOGIwmUqlHf5BZf3nnLva8qZ4H7T9naw8hO+rS0HKqZ87xbLKNYmdD
         GL1SQkq41LXpjNNqJ/8sCc0o1EisLUneKko4OFI2EqZsLwFp9oYGgVCssJuOH/xvnBKW
         zes2YBcJcHrxD0OcQ56DqO8nUyr8/H8a3bxSFKqAl0pje7VvonuqztVkJcz4DwQN3pJv
         /LSrncpPHB9E0YMukZySdpHihycyc3yLyHtS48WHF+RT38dIv0FcINbBxrpsrd8EfVzp
         EBig==
X-Gm-Message-State: AOJu0YxAKXWC2HSHQa96+G5SCxymr+Z6ronS7qbAA/0EDoNTCVOmrrXM
	k8u1A7GPTXL8fQ40p1k2Lsf3Mgv+2bRr8Ysx6KQKffjz9D8kvJnNzTppQGX6FwxjNa8=
X-Gm-Gg: ASbGncsHdzwzvfvkkVxpGNR0uMAUdgMogv/1fVugLx6Ur2glwLgW9SuDBmuLGVjw8x4
	7wbzQ3laOSfJCCZ0+s6gec1MnEVTvcKufiFGtmPCcqDfE6ly8hVgb4fYJZsf+iqPKkrEDAxbWM5
	HzTHKSIKqXsZm8bqyU1m5eaWMAqA25rzXAG1Z8RHO3qlB5v6NVg5QSvXaSC6+Vvks/rRFCAxOo2
	2y9OZeakQhq/uOH9xDsbAUwEmgLuKfUfhOhw0OiNpTthgFSWcGf4zXPRn/gfgbSIGlHUFgcvTHd
	Q+X0O9GrOT0g9dQ+yvGq18HZWcNsEndXHeKqcUn3xLHicOfmH73fEKMvaAPbmCd7Tmm/gnJ3kcJ
	Pzjf0
X-Google-Smtp-Source: AGHT+IFW3ZA3OI4upIPp4NoeCf9FPmFZqJS7Agu5/RUEZiautDlaOmJQu85kPRquLo9rwsyVAOkzbQ==
X-Received: by 2002:a05:600c:c0d9:b0:459:dbc2:201e with SMTP id 5b1f17b1804b1-45b6870dda4mr7526655e9.9.1756212304089;
        Tue, 26 Aug 2025 05:45:04 -0700 (PDT)
Received: from localhost ([2620:10d:c092:600::1:a584])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-3c70b634943sm15982302f8f.0.2025.08.26.05.45.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 26 Aug 2025 05:45:03 -0700 (PDT)
Date: Tue, 26 Aug 2025 14:44:54 +0200
From: Johannes Weiner <hannes@cmpxchg.org>
To: Vitaly Wool <vitaly.wool@konsulko.se>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	Uladzislau Rezki <urezki@gmail.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	"Liam R . Howlett" <Liam.Howlett@oracle.com>,
	Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	Bjorn Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <lossin@kernel.org>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Trevor Gross <tmgross@umich.edu>,
	Yosry Ahmed <yosry.ahmed@linux.dev>, Nhat Pham <nphamcs@gmail.com>,
	linux-mm@kvack.org
Subject: Re: [PATCH v4 0/2] rust: zpool: add abstraction for zpool drivers
Message-ID: <20250826124454.GA1502@cmpxchg.org>
References: <20250823130420.867133-1-vitaly.wool@konsulko.se>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250823130420.867133-1-vitaly.wool@konsulko.se>

On Sat, Aug 23, 2025 at 03:04:19PM +0200, Vitaly Wool wrote:
> Zpool is a common frontend for memory storage pool implementations.
> These pools are typically used to store compressed memory objects,
> e. g. for Zswap, the lightweight compressed cache for swap pages.
> 
> This patch provides the interface to use Zpool in Rust kernel code,
> thus enabling Rust implementations of Zpool allocators for Zswap.

The zpool indirection is on its way out.

When you submitted an alternate allocator backend recently, the
resounding feedback from the zswap maintainers was that improvements
should happen to zsmalloc incrementally. It is a lot of code and has a
lot of features that go beyond allocation strategy. We do not want to
fork it and fragment this space again with niche, incomplete backends.

It's frustrating that you not only ignored this, but then went ahead
and made other people invest their time and effort into this as well.
