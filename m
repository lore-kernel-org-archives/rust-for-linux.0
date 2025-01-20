Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3ADFE1E25F4;
	Mon, 20 Jan 2025 13:58:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737381540; cv=none; b=Uqq2owWDYoY5sG69U818Vzw8E/32yQwH0LqKsjRJvV3sJX70yqi+98QADk1cMoKSUGULFPdAI+zSjXwPBvqtc7cHlhdE+i5JvctI0hf1Nl+YWsaufPNxzGmKXogEQD7gKObXrrkjpNF7axrF2dYL+AbgLeVt4xMbRcdgAmxfvsc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737381540; c=relaxed/simple;
	bh=Igv7LN2+tORLsqtcsQU61uzv3Ya8nttmV+0Uzj1G/2g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=S22/dLvk+h8xiq3BBCqB8U86bh0en8lBd29UlqILQY+eDwZeJrjknNBbpA4CDvI2FWL+AKEMe4oaJDvFQnSzRPpRWO/rZ6U8SGZBJZQCjN4otFjhTnhPnHF/yyt0TfbsTChA9cQI4rqWHReGv9VnQEJ8yAlcwitYkSypeVYQzJY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jbNOUxZE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jbNOUxZE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEF77C4CEDD;
	Mon, 20 Jan 2025 13:58:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737381539;
	bh=Igv7LN2+tORLsqtcsQU61uzv3Ya8nttmV+0Uzj1G/2g=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=jbNOUxZEFF1OuBhzwnnafsAXLIZvFeGgeujAR/aBp7/Kf184cH6Oa6O9LhQcXSbkx
	 XScRKzAxr47yqeVSFeKX9XTowoCLetIXF6A1ax4DJQLVnjTjy67b2XwbYq9g97/J6R
	 SI3+N7mnDaAl0CgvPilylyrTn7pUwPPGUs0tZMRh+G15NICA3N0xEd4h9HspDPWSm8
	 LP+qBRyGFNLjTuseAgykq8ji1v4N7yPVKkH73jur0hmcMMpjeWVcYaKvk/11QPhE+c
	 viKHIPOoT0AEyw946TF9uef9PgIwbscfOHywmvagLOiyDpTRcRVtWgFGTz8/Ijepf3
	 czllVQiNv7iJA==
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
Subject: Re: [PATCH v12 6/8] mm: rust: add VmAreaNew for f_ops->mmap()
In-Reply-To: <20250115-vma-v12-6-375099ae017a@google.com> (Alice Ryhl's
	message of "Wed, 15 Jan 2025 13:35:09 +0000")
References: <20250115-vma-v12-0-375099ae017a@google.com>
	<BlyMgQ8YIRn3FzbgAL0pxsOXkr45sEKwt8hR-aqH_TANIozThAeuKNz6aN9RunuS_ndbkuuAhWLArxACU_NbEA==@protonmail.internalid>
	<20250115-vma-v12-6-375099ae017a@google.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 20 Jan 2025 14:00:02 +0100
Message-ID: <87o701d4j1.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> This type will be used when setting up a new vma in an f_ops->mmap()
> hook. Using a separate type from VmAreaRef allows us to have a separate
> set of operations that you are only able to use during the mmap() hook.
> For example, the VM_MIXEDMAP flag must not be changed after the initial
> setup that happens during the f_ops->mmap() hook.
>
> To avoid setting invalid flag values, the methods for clearing
> VM_MAYWRITE and similar involve a check of VM_WRITE, and return an error
> if VM_WRITE is set. Trying to use `try_clear_maywrite` without checking
> the return value results in a compilation error because the `Result`
> type is marked #[must_use].
>
> For now, there's only a method for VM_MIXEDMAP and not VM_PFNMAP. When
> we add a VM_PFNMAP method, we will need some way to prevent you from
> setting both VM_MIXEDMAP and VM_PFNMAP on the same vma.
>
> Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> Reviewed-by: Jann Horn <jannh@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


