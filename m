Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B5AE1DE3A2
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Dec 2024 09:08:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733216917; cv=none; b=kdlmupOhfyFNyHWOOQN+0nAMjjDIhoak0CSDwmSwI0aNa86OPoItrEu8dNrxkD5FwbXQDKs/vmtptWg43Hp7VO3j/TlxLTu3tZIWB0C7A2wCkc8qQKUEGUDS23D1JEd5TkOkXCSKy6nYTnj4faCCTdIbwD/qgaPQF6EOokPyk78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733216917; c=relaxed/simple;
	bh=IK/NZLp7gFIseOlzH1eyJFFhNVM8lpD61ZE4vbOZSvY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KN6BUNSAPGxtNBhfz8KpK+mcEn1DzOx637Vzx4IgmCmSLLaY19fqiP3LFFLn8hYPWexsAUeA08GVPtMWgTX0a5m68LNXMM6DJAXFaOUTeTmw7WNJ7DlCzp1KVWQL9/9183hlAUqb/GLr4ggoK3uB/wXviTtOisPGvMmkndB3KEM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=i1VwqZaf; arc=none smtp.client-ip=209.85.221.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="i1VwqZaf"
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-385eed29d7fso1465649f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Dec 2024 01:08:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1733216913; x=1733821713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cFzvdgxxhPyYuZGDVV6pnwFjLTQZ9Vw8KV9E08J3sjM=;
        b=i1VwqZafGDbrApIQ2kiwsHPSoKqAz3KphDq+Vmd4plF/KiIeHpb/hiLNqXWT79k5a6
         1UWNv/oFAGANHp33BowwAv6dIUJKJOohEik42kq+kKXc0hQ1MTn9gnj0+9wd9m31VSYn
         csE+2dGz+0cmSq59KFrOLn4ypdYFCMXRMwT2ZhQjDEbfXh1OIknOww5ZUciK53KGtgOh
         EiHH1lg9lBqsDJDk5dq6CT9rp5zmy0CncsDh9J9OrwiI0fgWsfOu+sPZ8lAejy3cthWh
         Cn0eqGbdHL98pOXulP1tY6AXqGDgrscfGg+tSeSYW40J77zQ59rsqrBxng3HVzaU/EWj
         5COQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733216913; x=1733821713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFzvdgxxhPyYuZGDVV6pnwFjLTQZ9Vw8KV9E08J3sjM=;
        b=cws9W2+xuLOghCFtRiYhl2matYlxqab3itukWORGbVLLNRliNIUZZlOipN6rKFhpr7
         7RIhU2ZloGHtxRKlNHNGDjBJMZXm8uir/MYHAyMVuc1eBPwdmifFO2AiP9b6qhd6KR/H
         mSy/d61xxCeznV8NPAoO9SFgkF06Ig8Uk42AmyzXoaumnpPCY7eSKfflJT9ROzxBDRJn
         ClHCBDcio6yF3hdFJq98EnNs8NA6Sj/gMo04DnmBX7OM7dpsztSqtXp5XZZr2mwnrNYe
         M9yJ6VXyOL5nVkvsB4P5kJnFcAhJrl4388ZuNphTme5XGOFYvbBTDimjANEjfGfNDwn4
         0X8g==
X-Forwarded-Encrypted: i=1; AJvYcCWm/DcYiRegpxCeKmBHRdncj52elnZlzKTO6L2s5oauyV4/zeW1Snohzav0prL6Y6aBr6sD3qEcqlIKcRsw5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxfRJSN30Ih8uQ9oy2W30B0gHIxAa8iGIa9DuR2d8lusUEWz6AO
	ZPgdh1TXUS81i2ac6yvJtrPyh00f05dBlJvjoB8K0ZPHyo+TlvlRi2W7AgMwZicqT77ODwj1nwU
	eLWv0oBAyrC7tXZgagSPS6mVxJ3aqseHZ+xzj
X-Gm-Gg: ASbGncvJwg7CyZFWZbXmgceYGMN6iZ7rH/OlH2Hlnm91QghF0cWJhU+5Z4PukqUHpnC
	N6yvnKujd5HyirOuNlIbV/uyZniGSR1IW84WWyzOZTj0xhkaAZufbcwU+NnfbwA==
X-Google-Smtp-Source: AGHT+IHhYrDB/wb1xEJctCPoLD5SdDr7fE6pSh9gwJ2FOr50D60Fh2pWUtTRrn/qZKQFAckFbG2l+/EGK8cyVIZsKZI=
X-Received: by 2002:a5d:47a7:0:b0:382:45db:6a1e with SMTP id
 ffacd0b85a97d-385fd97edadmr1314617f8f.14.1733216913503; Tue, 03 Dec 2024
 01:08:33 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119112408.779243-1-abdiel.janulgue@gmail.com> <4c58b3b7-0c2a-441d-9b2c-7be65cb39bf2@asahilina.net>
In-Reply-To: <4c58b3b7-0c2a-441d-9b2c-7be65cb39bf2@asahilina.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 3 Dec 2024 10:08:21 +0100
Message-ID: <CAH5fLggE2Ud=2GdrAxsxC-KUoZVQEOFEpjgpSMq_h6dK=Cq1QA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] rust: page: Add support for existing struct page mappings
To: Asahi Lina <lina@asahilina.net>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, airlied@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 2, 2024 at 1:03=E2=80=AFPM Asahi Lina <lina@asahilina.net> wrot=
e:
>
> On 11/19/24 8:24 PM, Abdiel Janulgue wrote:
> > This series aims to add support for pages that are not constructed by a=
n
> > instance of the rust Page abstraction, for example those returned by
> > vmalloc_to_page() or virt_to_page().
> >
> > Changes sinve v3:
> > - Use the struct page's reference count to decide when to free the
> >   allocation (Alice Ryhl, Boqun Feng).
> > - Make Page::page_slice_to_page handle virt_to_page cases as well
> >   (Danilo Krummrich).
> > - Link to v2: https://lore.kernel.org/lkml/20241022224832.1505432-1-abd=
iel.janulgue@gmail.com/
> >
> > Changes since v2:
> > - Use Owned and Ownable types for constructing Page as suggested in
> >   instad of using ptr::read().
> > - Link to v1: https://lore.kernel.org/rust-for-linux/20241007202752.309=
6472-1-abdiel.janulgue@gmail.com/
> >
> > Abdiel Janulgue (2):
> >   rust: page: use the page's reference count to decide when to free the
> >     allocation
> >   rust: page: Extend support to existing struct page mappings
> >
> >  rust/bindings/bindings_helper.h |   1 +
> >  rust/helpers/page.c             |  20 +++++
> >  rust/kernel/page.rs             | 135 ++++++++++++++++++++++++++++----
> >  3 files changed, 142 insertions(+), 14 deletions(-)
> >
> >
> > base-commit: b2603f8ac8217bc59f5c7f248ac248423b9b99cb
>
> Just wanted to comment on an upcoming use case I have that will need
> this, to make sure we're aligned. I want to use the page allocator to
> manage GPU page tables (currently done via an io-pgtable patch and
> abstraction but that's going away because it turned out to be too
> intrusive to upstream).
>
> Since I'm dealing with page tables which are their own tree ownership
> structure, and I don't want to duplicate management of the page life
> cycles, this means I need to be able to:
>
> - Convert a Rust-allocated and owned page *into* its physical address
> (page_to_phys()).
> - Convert a physical address *into* a Rust-allocated and owned page
> (phys_to_page()).
> - Borrow a Rust Page from a physical address (so I can do read/write
> operations on its data without intending to destroy it).
>
> Conceptually, the first two are like ARef::into_raw() and
> ARef::from_raw() (or Box for that matter), while the third would
> basically return a &Page with an arbitrary lifetime (up to the caller to
> enforce the rules). The latter two would be unsafe functions by nature,
> of course.
>
> I think this would work just as well with some kind of Owned/Ownable
> solution. Basically, I just need to be able to express the two concepts
> of "Page owned and allocated by Rust" and "Page borrowed from a physical
> address".

I actually think the Owned/Ownable solution is even better for what
you need, because having a borrowed reference to the current Page
abstraction is pretty awkward as it assumes that the page is always
owned.

Alice

> This maps to pagetable management like this:
> - On PT allocation, a Page is allocated, cleared, and turned into its
> physical address (to be populated in the parent PTE or top-level TTB)
> - On PT free, a page physical address is converted back to a Page, its
> PTEs are walked to recursively free child PTs or verify they are empty
> entries for leaf PTs (invariant: no leaf PTEs, all mappings should be
> removed before PT free) and dropped.
> - On PT walk/PTE insertion and removal, a physical address is borrowed
> as a Page, then `Page::with_page_mapped()` is used to perform R/W
> operations on the PTEs contained within.
>
> Tying the lifetime of actual leaf data pages mapped into the page table
> to the page table itself is a higher-level concern that isn't relevant
> here, drm_gpuvm handles that part and those pages are not allocated
> directly via the page allocator, but rather as GEM objects which
> ultimately come from shmem)
>
> (Note: this hardware is always 64-bit without highmem so those concerns
> don't apply here.)
>
> ~~ Lina
>
