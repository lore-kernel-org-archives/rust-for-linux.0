Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E01A21E5018;
	Mon, 20 Jan 2025 13:59:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737381558; cv=none; b=hkqSkH7CBiSwpAobAM5EbGw7Tyo6veBs8eHbaIOFHbCuLqQUnhqXYB3e4XCLxdj4wf/mPzKyRZDzoFllSFNSScqsmLGtNxYiKEU+1XxaMDXKqBllp+QxI+o1oAzBMDGyQ7g73eG+Ht3tBegmFb4dkdyyCkW4GxdZ7EaQpHO2X+U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737381558; c=relaxed/simple;
	bh=NnJHWqc836htAMLqNshYDjUgHCCwRFok7VNFc0+RsyI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=uIYdHiTpK45g9vnyEGzsb9/VYXhxZ9DqnwjkRSML4Tf8kCVr93XYIsioK7U1cdNW6/kIYf3a3kCLlqjGtrKG3hCjT08kgxKpILuu7tQPLju9r5VDk+W272tsEJQ9gITYeFyu2KMrDZiXkH/do8vEahio8V4q3T5cKeGhg0l33rk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Dnz0ePfI; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Dnz0ePfI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C4735C4CEE3;
	Mon, 20 Jan 2025 13:59:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737381557;
	bh=NnJHWqc836htAMLqNshYDjUgHCCwRFok7VNFc0+RsyI=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=Dnz0ePfI9vbYDSrFbb9nO++MV9votFxaGbLeQUOpldzOW/US2/9TdG2YhcizKnUN0
	 DdMBKZvN1LoaLCTJrdauZHFgLeNSumM9/stWLpJRA575P9pFM4/l89XOnIh+ZNO7oY
	 345wggWZNMlD2s+fVGx9GT0rq9nCTITuAaP8I+BjoY/vVLmQNV5cXpYkpXy68Ery/E
	 2XSxtok4Ywx9ggH75wMgZMrGLO6AWtrUoS+dy98bHd9tWfR4pL/zP7lgFGLYstvP4o
	 pQw3enJHP5efVaELeN19FbaIQAoZMdGbFbrncCndwZQEQNx7XzhukFFxu2sOxJZF3E
	 j4E8kCf2pRy0Q==
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
Subject: Re: [PATCH v12 2/8] mm: rust: add vm_area_struct methods that
 require read access
In-Reply-To: <20250115-vma-v12-2-375099ae017a@google.com> (Alice Ryhl's
	message of "Wed, 15 Jan 2025 13:35:05 +0000")
References: <20250115-vma-v12-0-375099ae017a@google.com>
	<ZEVNmEs2ZcVdqLJZ2dVYLSga7UupG6gkOkqpzj0-zQojQLn6UfvI3eyXmV2FL0h7k2O5o9c0YjpI1VJ-8CRU3Q==@protonmail.internalid>
	<20250115-vma-v12-2-375099ae017a@google.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 20 Jan 2025 13:40:17 +0100
Message-ID: <875xm9ek0e.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> This adds a type called VmAreaRef which is used when referencing a vma
> that you have read access to. Here, read access means that you hold
> either the mmap read lock or the vma read lock (or stronger).
>
> Additionally, a vma_lookup method is added to the mmap read guard, which
> enables you to obtain a &VmAreaRef in safe Rust code.
>
> This patch only provides a way to lock the mmap read lock, but a
> follow-up patch also provides a way to just lock the vma read lock.
>
> Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> Reviewed-by: Jann Horn <jannh@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


