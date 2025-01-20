Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C620D1E25F4;
	Mon, 20 Jan 2025 13:58:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737381535; cv=none; b=dyp78EVWDZyCf/mWZu4Moj9C2XQgfCyzvkgzXTffNb5lLEEyjWVIXDalixdNZK5XViaxii1TUg7LJ9wXEVCW71Hr3iMOV6jK7I8ri1lyEORSrScvePsMIIZXDBDwsjmEemQwO7/7+1bsnLB+/S8Fd/uL1zbiCWJn6Qfj60YBMNI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737381535; c=relaxed/simple;
	bh=iGCzI1XYV3W8ZPDs3utlyJdmI7e0wBzptGQh8W8V9lQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:Message-ID:
	 MIME-Version:Content-Type; b=B88x8264ipLQC7TyMqS4gXEYTInDIDI7vX5q6ngz+JjEESn2WWN6e6Bhi6ar6fuOrRpmMExwDT1W0+Nuf621buFXXfLyYMqrL/mg8V9EDLyWjEIHqcYfHIk4dFVKt+RDps/nWuXRt1CPZIoEng0pkxTO0zewGwhU0UEbC7fD5sk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GRj+KPDq; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GRj+KPDq"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 30D65C4CEE1;
	Mon, 20 Jan 2025 13:58:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737381535;
	bh=iGCzI1XYV3W8ZPDs3utlyJdmI7e0wBzptGQh8W8V9lQ=;
	h=From:To:Cc:Subject:In-Reply-To:References:Date:From;
	b=GRj+KPDqT1yo6bs4Yhuxa7BD+LXfGmkrDmmiKK4Gu0F3LQCjbQqa5oOYL9FpdoBIe
	 +B43DhbMjkGmxFvbQUYIbC3aSC+Hf64f/Z9+WVAfMKH6v0ptvilqCFhJsC633n+DLZ
	 nydL1QN7fVA/6gi9VyYiKgDRg1hc9aEq0cQKEP1VCERYF7ou/FJH/+dXlo2BIk7otW
	 z/MquNaKstk9TkxqhibO5XVGA2LWdaydzJ6TYszUSHudo3n0b4ctrw1U7YOSIPf7Xf
	 RwV3wIY53DZyRcUN6/eAPbKETOsidPGMg3ytRFaJAFtcWPZqo6bvzZX4ITrEvT+YTL
	 wFSqLu3MDleSA==
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
Subject: Re: [PATCH v12 1/8] mm: rust: add abstraction for struct mm_struct
In-Reply-To: <20250115-vma-v12-1-375099ae017a@google.com> (Alice Ryhl's
	message of "Wed, 15 Jan 2025 13:35:04 +0000")
References: <20250115-vma-v12-0-375099ae017a@google.com>
	<EJniO_7zKE5oLRie5q2G7ogmzUJOuTyEV7aUjZVZGLsjK02-xeNeJXYuIQKhPy0Td0r55g3DMmSRGVnsoYfDuQ==@protonmail.internalid>
	<20250115-vma-v12-1-375099ae017a@google.com>
User-Agent: mu4e 1.12.7; emacs 29.4
Date: Mon, 20 Jan 2025 13:33:13 +0100
Message-ID: <87bjw1ekc6.fsf@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain

"Alice Ryhl" <aliceryhl@google.com> writes:

> These abstractions allow you to reference a `struct mm_struct` using
> both mmgrab and mmget refcounts. This is done using two Rust types:
>
> * Mm - represents an mm_struct where you don't know anything about the
>   value of mm_users.
> * MmWithUser - represents an mm_struct where you know at compile time
>   that mm_users is non-zero.
>
> This allows us to encode in the type system whether a method requires
> that mm_users is non-zero or not. For instance, you can always call
> `mmget_not_zero` but you can only call `mmap_read_lock` when mm_users is
> non-zero.
>
> The struct is called Mm to keep consistency with the C side.
>
> The ability to obtain `current->mm` is added later in this series.
>
> Acked-by: Lorenzo Stoakes <lorenzo.stoakes@oracle.com> (for mm bits)
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>


Reviewed-by: Andreas Hindborg <a.hindborg@kernel.org>


Best regards,
Andreas Hindborg


