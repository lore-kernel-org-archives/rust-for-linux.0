Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 443A51E32DA;
	Mon, 20 Jan 2025 13:59:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737381549; cv=none; b=SLkMStb7f8b2eFKf7ivamR1nNinZWr2nNv59mlPoEg2gH9HhnVJiBNZrqG0PpUCkwwgIxIm2pLL3w2riMbgOP4hWYF97GvtKYlwDn1AFpn/jCxD1wjsiz+1mI3I1ZI4wJbFW0eODAj/l4avaIbPCJBjJFbjqUCBkP2A/n+BLfXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737381549; c=relaxed/simple;
	bh=d1tsoLUIvajiEO9W641JPwvevOSM+aDlDfBHK21fuXk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=KdF2gum+xGYj+wCRWG67rayDl8fXp0o6pChdZ11Vvfpp9JbInRBnv06o3VvGUQ0DmNXAxEtRcECabQEcoVtYCpGYM1oQ8AqVa2VkR0Ui8KcGiI7w1QV8kFxzZqENtKdOSca3o+PipSvmW52FA8jiJxlUxQs70+xzRNHRAV1I+A4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QxzGxUNy; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QxzGxUNy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D8747C4CEE3;
	Mon, 20 Jan 2025 13:59:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737381548;
	bh=d1tsoLUIvajiEO9W641JPwvevOSM+aDlDfBHK21fuXk=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=QxzGxUNyAQ6Prb0O1fqrFZHkN4L3/z3rkKqb13mP6fZF8nyMDQLzx0iv6HxCKAJrU
	 /bocLniWyvdXoYuP2agYypFKfpPy3RUqrfZ+DY5gui5hN2DHm469MFC+P9xalijSs6
	 JCFWqIjL2RfqzziSCg+zX5mHsEpB6OxKzksjqMz3eVB5auxmQ2Z5fjuirBPTxJcTRu
	 4ijlhfVFek1I7um75lk98ib3xOBm+vtRSMYB08QUPXPhvOOkouRtiOyUuxSHwC2tmv
	 9iWXsk5q/20PBnxnR/RXsjCpAGftGYD7skEqmmVLrcoDxWvpyH0aIjTIheRtMCRWWc
	 aVpKpSAyn6MMA==
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
Subject: Re: [PATCH v12 7/8] rust: miscdevice: add mmap support
In-Reply-To: <20250115-vma-v12-7-375099ae017a@google.com> (Alice Ryhl's
	message of "Wed, 15 Jan 2025 13:35:10 +0000")
References: <20250115-vma-v12-0-375099ae017a@google.com>
	<aBAHBgpfbiibgirDNrA2Ee9a0ST3qTzbMWXiyuIjWkHDoCClUFEOMpXqZlW2pX2kcDGujpWkbSoSGFaIw2X3gg==@protonmail.internalid>
	<20250115-vma-v12-7-375099ae017a@google.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 20 Jan 2025 14:48:46 +0100
Message-ID: <87ikq9d29t.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> Add the ability to write a file_operations->mmap hook in Rust when using
> the miscdevice abstraction. The `vma` argument to the `mmap` hook uses
> the `VmAreaNew` type from the previous commit; this type provides the
> correct set of operations for a file_operations->mmap hook.
>
> Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


