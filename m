Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C88EE1E32C3;
	Mon, 20 Jan 2025 13:59:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737381544; cv=none; b=DD3fMYr7VqexicQeMgNlqjvIUUop2T2E89t4pqUDEIsl/T9InzcU1i8u2KWVhR33exJihcuoqW+OV/sIqdUJefd6AjdaGTcFCEMHGe9FHZUFFqPBRt5ZczmLHCHZ5seYL/XTVYLZzI7Kc34sK12GY7RdBBuYXZozjt7NqlzkucE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737381544; c=relaxed/simple;
	bh=6uRtkk/jNvzKOVauU8wC20bjjcc2C00m8OjNWM7tFjo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=MGBkPlIb57BW1TSUAHHhtzT6DCMdjNUVjttMISzGUm/Pxxim6QfVLV0iCd8qXOZy4IpS9LemkA/wJe0TBUI5C95VDS6fVvcUWO+WzcyeZayeJRg3BMRIUUZeEd6E10TmmJglgt8kuVLth+Wv6FRXPgumG7A8+AsdOXuBBUe0fgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Tu7cbzt1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Tu7cbzt1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 536D5C4CEE1;
	Mon, 20 Jan 2025 13:59:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737381544;
	bh=6uRtkk/jNvzKOVauU8wC20bjjcc2C00m8OjNWM7tFjo=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Tu7cbzt1EYuVAHA7GxMhtAmbSMfoFckIjtgp+uyQyHh/OaWqjISsRZFOk2Csc6PV+
	 OWKowypmWsZ5nn0XAicZUW4Z91indymLBUoZaS/ZXOfpDU+EhSCtlf/1EGAfe/2gTN
	 iH2Fi2kgTSrjrtJtR+ZJOp8aU7Efaodq3FoGhTiutWu/TKExCcCv4VlyoONEiUrfT+
	 AuadReex7reNrERMSeFkdpeJfU/hSoR7aDyUmCVoyaqfr59LH0m0L70pW6whX06BFQ
	 8brt8PrxGB8tOQAO3D1KtYZUCF5IJ4FP31eKs1cd+NaSkOc4gOXyQmtmZjKrkA6zip
	 5zu17SqiH45JQ==
From: Andreas Hindborg <a.hindborg@kernel.org>
To: "Alice Ryhl" <aliceryhl@google.com>
Cc: "Miguel Ojeda" <ojeda@kernel.org>,  "Matthew Wilcox"
 <willy@infradead.org>,  "Lorenzo Stoakes" <lorenzo.stoakes@oracle.com>,
  "Vlastimil Babka" <vbabka@suse.cz>,  "John Hubbard"
 <jhubbard@nvidia.com>,  "Liam R. Howlett" <Liam.Howlett@oracle.com>,
  "Andrew Morton" <akpm@linux-foundation.org>,  "Greg Kroah-Hartman"
 <gregkh@linuxfoundation.org>,  "Arnd Bergmann" <arnd@arndb.de>,  "Jann
 Horn" <jannh@google.com>,  "Suren Baghdasaryan" <surenb@google.com>,
  "Alex Gaynor" <alex.gaynor@gmail.com>,  "Boqun Feng"
 <boqun.feng@gmail.com>,  "Gary Guo" <gary@garyguo.net>,  =?utf-8?Q?Bj?=
 =?utf-8?Q?=C3=B6rn?= Roy Baron
 <bjorn3_gh@protonmail.com>,  "Benno Lossin" <benno.lossin@proton.me>,
  "Trevor Gross" <tmgross@umich.edu>,  <linux-kernel@vger.kernel.org>,
  <linux-mm@kvack.org>,  <rust-for-linux@vger.kernel.org>
Subject: Re: [PATCH v12 4/8] mm: rust: add lock_vma_under_rcu
In-Reply-To: <20250115-vma-v12-4-375099ae017a@google.com> (Alice Ryhl's
	message of "Wed, 15 Jan 2025 13:35:07 +0000")
References: <20250115-vma-v12-0-375099ae017a@google.com>
	<rhrbn6WVipeiXJDTNLqjxUv2zr1qukElqEK50Bpe1k9dl5HQtD3TBjRFhS31qIKI-gVYbETDvQPE8lPfWcdwxw==@protonmail.internalid>
	<20250115-vma-v12-4-375099ae017a@google.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 20 Jan 2025 13:50:42 +0100
Message-ID: <87tt9td4yl.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> Currently, the binder driver always uses the mmap lock to make changes
> to its vma. Because the mmap lock is global to the process, this can
> involve significant contention. However, the kernel has a feature called
> per-vma locks, which can significantly reduce contention. For example,
> you can take a vma lock in parallel with an mmap write lock. This is
> important because contention on the mmap lock has been a long-term
> recurring challenge for the Binder driver.
>
> This patch introduces support for using `lock_vma_under_rcu` from Rust.
> The Rust Binder driver will be able to use this to reduce contention on
> the mmap lock.
>
> Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> Reviewed-by: Jann Horn <jannh@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



