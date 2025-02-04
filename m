Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9686020A5DA
	for <rust-for-linux@vger.kernel.org>; Tue,  4 Feb 2025 20:26:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738700820; cv=none; b=aj9ajVkE1AMiwoTWcjOkBXqYgkaQ0lxgna95iki1R6KhUqKV/2zkYlbcSMOGRlF0HV8lrxkp6DocL17JQk7XQSb7ol7JtiXyWIbxRIi+Iqy3B68xCt5DX15D7RT/kMWPtrEECd2paTFVYYQIewnKvXJbZ8QK40j5TS3FHTLPQV4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738700820; c=relaxed/simple;
	bh=4OVHg9lS9y7hgZNNmxGr15YLES80pi29+1rMKHfcSfY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bVknUATvaxkvS7gvuQGWs+FcA5DD/TnK6pubwmdM0eK/YWZ2J5Ojt5cm1Vfzw1GtWgZkdn8zG14+awTGCAxFHDJBHVOLkXte5UGJq8XNeUPB0i0F9bTKCwbTWTevuhOFttmvxYw5JQzjy1Kqa1gy3MxcGuMeXKDi0FGen+T5zF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca; spf=pass smtp.mailfrom=ziepe.ca; dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b=g2p76Jfu; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ziepe.ca
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ziepe.ca header.i=@ziepe.ca header.b="g2p76Jfu"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-46fa7678ef3so55964981cf.1
        for <rust-for-linux@vger.kernel.org>; Tue, 04 Feb 2025 12:26:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google; t=1738700817; x=1739305617; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=XKfHXyy6Lxo2g0AOAumrKv9sTaQK4qw2WswIObaTPeM=;
        b=g2p76Jfu1UnbM/BBJBbfV6/1PDs+k/oPdt/5zx7a8b/Hear0c9e9IGiyrwk53NpfTj
         Fwo/jnhIMO8lHl2gnZ0900jBbea2oYGPihmOFfx0nJR3C4NHxFn8v3bTYsRn4Rl9/hox
         fdiZ6d+C8wkPaPTugeZHzDgND2txEoKGaeWYQ/EjZkgPBBG+LNG1c4tjVeEiRLb5BEUu
         haoi6nsAv+w5rVvjq5eNfV6nA1sPTls7hKTGgtHxIYkzKOfmnLN+GOFhCwnzts6U0/5Q
         +4R9yvhDZbeTJukZZikFIMdI0mWIIMJxbqbd4ZyzoNFGOGVCt5XzKdw7uwJqxfeJ0H86
         Vq/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738700817; x=1739305617;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XKfHXyy6Lxo2g0AOAumrKv9sTaQK4qw2WswIObaTPeM=;
        b=Kxxp+HkbI0irS0fOSfl+HDRlNheSPgJg4BVGEwIL3iQCcigT4kYTk38YADcUvPjMGY
         aNhXOE5vSzc3oXtloalgjWGA3jtUc4mAoQGB7tSI1WqadObnJwv22ZDKpRucIP4XLY1p
         3pPX9vTct5Livjl/qQUUJOTAtjpl679fxrOhY1blB3j2CX3KGIYLNfSGbslc2wZfLGmH
         roaWVwmp1PHf8qiRZi4gtUR1r8e/VwrYNkILmjHp9hm8HOIjFbW+emjkB9RVss8yOGBu
         49X8x4OvUUJyvFIlEx0PrznPdhYC0eAckU/5aWeZJCeXomwQiABpGmWLsauK+0OOzXif
         GDSA==
X-Forwarded-Encrypted: i=1; AJvYcCUAGoFfWYC1np6VEqhEl4eheB1U74EWGAh46UVJw0GrB6kqj0u9+pgTQOZ5eUfM8SLwpK+KClG6h9vekzJ46g==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWz57uJYrqC3SiDrK5NjEkvjlrpVzJXaJ0z719nPkugUZeveYV
	3SqLCOc7HthkGKe5YyXNfe/yPOyI6LO0T2lh7gOjJdIjE/ZjfvYjVciiSlkVrGc=
X-Gm-Gg: ASbGncszkqcu8xGljf0n50oP2ODOVGeW6+FpeUV94otwB3ME1LZu9UBdwzGbYj3iWSD
	Xjdpo1HnwHG/2xUzbzy4VWwFykCneh/i6CPPMIj+RkdHRUe2AEmUT93soQ1gQ8/e+uOL/VYnulh
	euCbeesG3lHX7iya/zfdtUFWtY7gFxX/WSmjZ4aykdxp2uDxDdSQ0VY/yZTViUveJf7jWjzt5n1
	21/SMev0MsP/RLnyOzdmNtDxXUV1CBV2TGlroelyR1/r+0kslhA90cc+NAQyUDlvA7IBSHa1o9T
	e2+TY7bIrsmHArsYPnKDdMS8tN3dVi6HZgDhdqWHf8XeaU1KNndxK+I7Mr2eGigd
X-Google-Smtp-Source: AGHT+IEsHxW8JLcluvuP8S+KAnuCNS+p1UBsZQIkGSJDtHpddXcm+6eR6EfbSxlm/LewurR5/XZ3Xg==
X-Received: by 2002:ad4:5c46:0:b0:6d8:af2d:2a44 with SMTP id 6a1803df08f44-6e42fc54742mr2065826d6.32.1738700817497;
        Tue, 04 Feb 2025 12:26:57 -0800 (PST)
Received: from ziepe.ca (hlfxns017vw-142-68-128-5.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.68.128.5])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6e254922538sm65650296d6.84.2025.02.04.12.26.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 12:26:56 -0800 (PST)
Received: from jgg by wakko with local (Exim 4.97)
	(envelope-from <jgg@ziepe.ca>)
	id 1tfPVY-0000000CYY9-1RWN;
	Tue, 04 Feb 2025 16:26:56 -0400
Date: Tue, 4 Feb 2025 16:26:56 -0400
From: Jason Gunthorpe <jgg@ziepe.ca>
To: David Hildenbrand <david@redhat.com>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>,
	Alex Gaynor <alex.gaynor@gmail.com>,
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>,
	=?utf-8?B?QmrDtnJu?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Jann Horn <jannh@google.com>, Matthew Wilcox <willy@infradead.org>,
	Paolo Bonzini <pbonzini@redhat.com>,
	Danilo Krummrich <dakr@kernel.org>,
	Wedson Almeida Filho <wedsonaf@gmail.com>,
	Valentin Obst <kernel@valentinobst.de>,
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org,
	airlied@redhat.com, Abdiel Janulgue <abdiel.janulgue@gmail.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH 0/6] rust: page: Support borrowing `struct page` and
 physaddr conversion
Message-ID: <20250204202656.GL2296753@ziepe.ca>
References: <20250202-rust-page-v1-0-e3170d7fe55e@asahilina.net>
 <Z6CTLB2NggwYafi9@phenom.ffwll.local>
 <1eaf66ba-b2d3-448f-938b-913f17ca98a4@redhat.com>
 <20250204183933.GJ2296753@ziepe.ca>
 <1d379007-97c3-4bb9-93da-1a828f955fc4@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1d379007-97c3-4bb9-93da-1a828f955fc4@redhat.com>

On Tue, Feb 04, 2025 at 09:05:47PM +0100, David Hildenbrand wrote:
> Fully agreed, this is going into the right direction. Dumping what's mapped
> is a different story. Maybe that dumping logic could simply be written in C
> for the time being?

?

Isn't dumping just a
  decode pte -> phys_to_virt() -> for_each_u64(virt) -> printk?

If you can populate the page table in rust you have to be able to dump
it, surely.

Or do you mean trying to decode the leaf entires into some struct page
detail? Does a GPU need to do that? Agree that would be better as some
C function to take in a KVA instead of a struct page and populate a
string with details about that KVA from the struct page.

Jason
