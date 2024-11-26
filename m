Received: from mail-ed1-f41.google.com (mail-ed1-f41.google.com [209.85.208.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C9EA71D63F6
	for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 20:44:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732653844; cv=none; b=rv2JGgKU8WnnpqhS7LjltDDVSDrFwBMeuJr7aInH2zTq8wJnF8wQ7VxpFxeocn5IbNBj59tMKfd/7mB5Fd8Ybo6Zkr8T9gIqxsBDZnx03Wiy90ErYIVs8Y1iUvY8G8X8oGsXLEV1AwTOmVdSDGP3uaj34uvEI8uGoJbBRzuS7bQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732653844; c=relaxed/simple;
	bh=eUMuQ9gASBpqqRZLzUIvbphLbyhWIfaPRCa8oZFZqbw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ths6jOaGQQtnUFTD/HWqKlOUz6XEeR0DOMM4ZrErexHommjTdwOVnxPA7jnBPl3gsl2BvLL4k3aLr0MfE2XeceSJUxEola7Zt7wNbYGf3yQKmfY8+jXjdUwlfw0jtrgwRb9PVDR6ceQbGh1QQU6dEXBxH3Fd15xom580MPZVUM0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=f+K6b2/u; arc=none smtp.client-ip=209.85.208.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="f+K6b2/u"
Received: by mail-ed1-f41.google.com with SMTP id 4fb4d7f45d1cf-5cfc264b8b6so53a12.0
        for <rust-for-linux@vger.kernel.org>; Tue, 26 Nov 2024 12:44:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732653841; x=1733258641; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Knumxb+ipa3/QWPd1lEfjlfQFOTdrGiNogqlwZ9Cmps=;
        b=f+K6b2/us9NIa8jFHAYhSxzpIu1dSgGnkwhG54PAu1WQz/xim8+wB7MuWMPFednuqb
         xPFwK4SvaljWSKO46GR6RlOd4n/lrWQ4BFDrqWi9ejLGp76LbD10DnXoHQ94pualFh7q
         3fgynEZUTRzK85GnJTacGNFkNk515miDdz8ZxwuqlKHEUL3+mooOqrRTizG9rBZ490en
         xAPq5GD02jIrOOKECMUMuf/5WKC1BgdjKJ91mwRhzU3d04/cnjj06yzzGv51FUaoQji8
         RI9c4hpm5SXvXQg5GfzY+lZFVjuswu0SauFW/83aGOej3UslsTp+Ad3HUjHocjjHJxJ5
         884Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732653841; x=1733258641;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Knumxb+ipa3/QWPd1lEfjlfQFOTdrGiNogqlwZ9Cmps=;
        b=YLbk89PWJCKwAExepxpsqoZJQe1aEO4xM2x7MKWp0RaO0+aEAc6NMLjS/YanTWXol+
         cQ+RlBlA4fwJi9qc7rztRz3cHIw2T2CEvJlc5fr+VI1GnB0UNs8RPieSkxRfa1iV1qBN
         xQsARj0ng5gxcIbUqOHOfXMHO19fJNKpRxZufjAtMDwT0/Wx89qmkN15EjhOVcublg99
         1z1S9Iw28/NoV0eDgkkakhn32vWrDcuUSSSptbEPYuwz4HHjr708mc4DVlqn0eSjXjns
         GCzcNwAj8+lHPxhh6yhkryhaatD48fD8ZKzLNIEIaHLh8ek+F77XX4/w8XKcg1ODsWrS
         rTLA==
X-Forwarded-Encrypted: i=1; AJvYcCWxODymXom6RJtEmSn110GDjXdKp7tm2Kdb1xRTPQPYWLmt13xpAGGwxWozj02//2w9h4JRIr3TUywWzwLQlQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD3YJUDHJ+2RxUNSSPg66OAoj/N9n58054Z9MCQnz36LiUs55q
	I7R1Npv9HKgjS9gFhf4I1oNr6EHZDGh9WZQ58jhE9hYNxDculRmsdw0UijMn98UHYiZqDzcAmOU
	YS8cCQxWY2pB5I7IQhqsxzqRFg62/uZjwBW2l
X-Gm-Gg: ASbGncsUPzuimwzWK3XDX4boo8MiDqfWlfGMclnovxwUd7Gj9mVyaXu8qiLKrJ/5TL5
	RMUtYwrMwwhgZEotW6xAJ5MplztVaSJ9e0TSF/CCzhOi3DyG/MwngAbOMkYQ=
X-Google-Smtp-Source: AGHT+IGWR89iYFiAgSPZ12ezMJJKqp8c3+6xErZv5QF6yYfwDocCF/qoTNo0Vi8c1TDce/+jAUrcLpa9cJl3TwT6E6g=
X-Received: by 2002:a05:6402:1c91:b0:5d0:3bfb:c479 with SMTP id
 4fb4d7f45d1cf-5d081abf56cmr8356a12.3.1732653840751; Tue, 26 Nov 2024 12:44:00
 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119112408.779243-1-abdiel.janulgue@gmail.com>
 <Zz1sHZLruF5sv7JT@casper.infradead.org> <CAH5fLgiyHGQJxLxigvZDHPJ84s1fw_OXtdhGTd0pv_X3bCZUgA@mail.gmail.com>
 <Zz4MQO79vVFhgfJZ@tardis.local> <Zz4WFnyTWUDPsH4m@casper.infradead.org> <CAG48ez3YBvSQ0zHY-t8NK2RWthR-GsEv6O5pVwA44LGJaEGeSQ@mail.gmail.com>
In-Reply-To: <CAG48ez3YBvSQ0zHY-t8NK2RWthR-GsEv6O5pVwA44LGJaEGeSQ@mail.gmail.com>
From: Jann Horn <jannh@google.com>
Date: Tue, 26 Nov 2024 21:43:24 +0100
Message-ID: <CAG48ez2Sn=w=e9AoNC6giMHP=ndRa0aYNn5oO3VeYBFC8Pg60A@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] rust: page: Add support for existing struct page mappings
To: Matthew Wilcox <willy@infradead.org>
Cc: Boqun Feng <boqun.feng@gmail.com>, Alice Ryhl <aliceryhl@google.com>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, airlied@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 26, 2024 at 9:31=E2=80=AFPM Jann Horn <jannh@google.com> wrote:
> On Wed, Nov 20, 2024 at 6:02=E2=80=AFPM Matthew Wilcox <willy@infradead.o=
rg> wrote:
> > On Wed, Nov 20, 2024 at 08:20:16AM -0800, Boqun Feng wrote:
> > > On Wed, Nov 20, 2024 at 10:10:44AM +0100, Alice Ryhl wrote:
> > > > On Wed, Nov 20, 2024 at 5:57=E2=80=AFAM Matthew Wilcox <willy@infra=
dead.org> wrote:
> > > > > We don't have a fully formed destination yet, so I can't give you=
 a
> > > > > definite answer to a lot of questions.  Obviously I don't want to=
 hold
> > > > > up the Rust project in any way, but I need to know that what we'r=
e trying
> > > > > to do will be expressible in Rust.
> > > > >
> > > > > Can we avoid referring to a page's refcount?
> > > >
> > > > I don't think this patch needs the refcount at all, and the previou=
s
> > > > version did not expose it. This came out of the advice to use put_p=
age
> > > > over free_page. Does this mean that we should switch to put_page bu=
t
> > > > not use get_page?
> >
> > Did I advise using put_page() over free_page()?  I hope I didn't say
> > that.  I don't see a reason why binder needs to refcount its pages (nor
> > use a mapcount on them), but I don't fully understand binder so maybe
> > it does need a refcount.
>
> I think that was me, at
> <https://lore.kernel.org/all/CAG48ez32zWt4mcfA+y2FnzzNmFe-0ns9XQgp=3DQYeF=
pRsdiCAnw@mail.gmail.com/>.
> Looking at the C binder version, binder_install_single_page() installs
> pages into userspace page tables in a VM_MIXEDMAP mapping using
> vm_insert_page(), and when you do that with pages from the page
> allocator, userspace can grab references to them through GUP-fast (and
> I think also through GUP). (See how vm_insert_page() and
> vm_get_page_prot() don't use pte_mkspecial(), which is pretty much the
> only thing that can stop GUP-fast on most architectures.)
>
> My understanding is that the combination VM_IO|VM_MIXEDMAP would stop
> normal GUP, but currently the only way to block GUP-fast is to use
> VM_PFNMAP. (Which, as far as I understand, is also why GPU drivers use
> VM_PFNMAP so much.) Maybe we should change that, so that VM_IO and/or
> VM_MIXEDMAP blocks GUP in the region and causes installed PTEs to be
> marked with pte_mkspecial()?
>
> I am not entirely sure about this stuff, but I was recently looking at
> net/packet/af_packet.c, and I tested that vmsplice() can grab
> references to the high-order compound pages that
> alloc_one_pg_vec_page() allocates with __get_free_pages(GFP_KERNEL |
> __GFP_COMP | __GFP_ZERO | __GFP_NOWARN | __GFP_NORETRY, order),
> packet_mmap() inserts with vm_insert_page(), and free_pg_vec() drops
> with free_pages(). (But that all happens to actually work fine,
> free_pages() actually handles refcounted compound pages properly.)

And also, the C binder driver wants to free pages in its shrinker
callback, but those pages might still be mapped into userspace. Binder
tries to zap such userspace mappings, but it does that by absolute
virtual address instead of going through the rmap (see
binder_alloc_free_page()), so it will miss page mappings in VMAs that
have been mremap()'d (though legitimate userspace never does that with
binder VMAs) or are concurrently being torn down by munmap(); so
currently the thing that keeps this from falling apart is that if page
mappings are left over somewhere, the page refcount ensures that this
userspace-mapped page doesn't get freed.

(I think the C binder code does its job, but is not exactly a great
model for how to write a clean driver that integrates nicely with the
rest of the kernel.)
