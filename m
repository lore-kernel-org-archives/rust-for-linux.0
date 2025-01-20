Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3940E1DF98B;
	Mon, 20 Jan 2025 13:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737381531; cv=none; b=LvJyUIINmnqWSOwHiB1Vzzrw6GPHWTk+A28I+iCNCUYL7CvWwrcc1b49ZdLZAG3s8La6559M648MN5vUlrP9gtqowp4XPMaZHTYW2nwCk31JhKkslwhj292gNyN2nLtYiRQwIYRn5sMv5u6NQXCqbSz8QTIeBqxZPr9C98pdZHE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737381531; c=relaxed/simple;
	bh=Rq/Zh4HrSYiOy2a9qe9YB2c5G+mEXAXTXQbwokMpDGA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=WnD8EWgoqkj4rPoDDZat+9/tVztEPJRxemYEbHXCfWxD7kVM3UuaDJiBHqZtmcjDeALSq7AdF1emEuKmmE5yo/IR12kmNMiyCh6zAKdAbRN+X9ga9kWH28tQc2LbLtCuJOdZ7Cq/qoTgGSAx3wWVoCeA7r5nFA24dlsXMlo0wcM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=U86szpEy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="U86szpEy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A1EC4CEDD;
	Mon, 20 Jan 2025 13:58:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737381530;
	bh=Rq/Zh4HrSYiOy2a9qe9YB2c5G+mEXAXTXQbwokMpDGA=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=U86szpEycl+brF3mrXmF6DDQcK6dx4pedsJxYXuehpc39LUqgqaQogyXbsj6FAfXl
	 kJLQE5ncmreMdaHOFnnRCWe2zLtxcSuI7J7r2GGke6iF89551g3lopd6+v4xDL2HZQ
	 k4MIqLOKw4/KYzGDMGuLQ8nMLXIOdKo/6DVB722VJiMAAhl9S2AKd728u3He6faktZ
	 84LAANm79QeQblha43cZl0fMVZYZNFs6RIBOl0Lch9jVJlJbghe/qhDkXHWDNsoBc4
	 Z6xyJw00NtNO475V3cyv06ffqyh1yTM7x2aH7cSdhXRmStSoDYzPO2ZSHe9dBHzQc5
	 rRB+5+VvT9oUg==
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
Subject: Re: [PATCH v12 3/8] mm: rust: add vm_insert_page
In-Reply-To: <20250115-vma-v12-3-375099ae017a@google.com> (Alice Ryhl's
	message of "Wed, 15 Jan 2025 13:35:06 +0000")
References: <20250115-vma-v12-0-375099ae017a@google.com>
	<RHa486lri6gVPZepeO3i6n9J8DbHUSSpiOMKAWgSPDISjkaKrC7dia_FRNP9MclSNUJyA2cfFuMh-EHMouZVIA==@protonmail.internalid>
	<20250115-vma-v12-3-375099ae017a@google.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 20 Jan 2025 13:47:01 +0100
Message-ID: <87zfjld54q.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> The vm_insert_page method is only usable on vmas with the VM_MIXEDMAP
> flag, so we introduce a new type to keep track of such vmas.
>
> The approach used in this patch assumes that we will not need to encode
> many flag combinations in the type. I don't think we need to encode more
> than VM_MIXEDMAP and VM_PFNMAP as things are now. However, if that
> becomes necessary, using generic parameters in a single type would scale
> better as the number of flags increases.
>
> Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg



