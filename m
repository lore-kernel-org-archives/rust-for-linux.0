Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D4B6158D79
	for <rust-for-linux@vger.kernel.org>; Thu, 21 Nov 2024 09:19:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732180760; cv=none; b=MFL9HZZB8+RUERMyEHGrMvkeN7yxK8tXLyjJ3Vffvq0ZY6JKXKUP8rIE4X5z2CJwIwlOx70PNRMRKX5MxkA2GHc9vHMkkOsb76RyjywCjQjvy3DN7FiajOWxVWxWBNbuP9+E8Ih998jgPQmctQNikrlTDZZ9OLna93oezvIy93A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732180760; c=relaxed/simple;
	bh=i7xmK3YVlKL/O5yIbMRtZZ8LGVkx9HsSeFqjmyzHI0s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FaoT3REYYZ+n+UeYmF5iODA47n68jAXKPxcuCt3PNJSGQfjAOCvs4fG/LRtWWJzt99Dny2ATVnCi6R48HGZiXcluydr/o9XJVOYNVbX9LRsptnebChWbCtJsim8YrqSQvvFoiwZO9NJSOsDftaczmFAFSs8TLLOxjU8hSchN2MM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ab6846RP; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ab6846RP"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-382325b0508so468927f8f.3
        for <rust-for-linux@vger.kernel.org>; Thu, 21 Nov 2024 01:19:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732180756; x=1732785556; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xWnOXVmJjdtAdRRd+DO279ItwAu/YGVGHFICEKvN/5c=;
        b=ab6846RPA1Ik76vX1IkeJB48ruJOivNt1y8ej3LlDj4TID2+i7QO1I3EAtgBk4Pjmc
         kDjeGykvxX1/MIxC/BsmjHwLH9K/UjhvFlI3Y3Sue+lyK4b/2ls4fI7Cv553Gbib+8ef
         qM4eIaQlTAOwYqnHmO1Hbn2lItkXKgDeNI3/rv+PyVEVf7nJ8rET2i3s4K+aMZsdQclQ
         KsDUOeqM9M21/c4CTb40PTgoiqqvtHU+Wk4S70q6v8ay1XZzwYYAq7MYeKB6PLSW9yR0
         42l5pFqXGEYaUIMko2Y/wDrsZ+N6ttU93jN0ESl/I/882BBMY3FT3rOvc+fiam9KuY02
         hiKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732180756; x=1732785556;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xWnOXVmJjdtAdRRd+DO279ItwAu/YGVGHFICEKvN/5c=;
        b=EN+W3JnGM1m38W38vvVVHwD+OizDbj6qnhnbiH7Z1U7aW3z45ADw8wLzJ1CqWExqYE
         TJ/NJO4zHbgnrj8pZ1uvQAkO5VLP6vba/BuDw4G5hcBDlXXVU0qNwOj1G4/a8vRJY0yj
         cOKSI0wkIIyd7lw9EXPxHCViXuM4XeSwUvcaSx6ZeNKfZS5MJYDbyH1Nb6PyaqAcdJAC
         zL5cWIZJRuEMskBGgYcBDyR5LLhohCwPAcX+52rN8uH52YJsuYjRfqbfiTGLhh64k+Cm
         a45HOVkK4RwYFyu4YWeqvaCseBiRMVqTr2FrrT8tTK1fkHbZ+MGTGtYucBIHS7+zxx75
         aFCg==
X-Forwarded-Encrypted: i=1; AJvYcCXKgnuLtra3Ed4RSEQ+2WXRPmpGbVQi5mCYo83h4EyX7qPlPkwYyllbCqT+6NrHCaPE1auFAocS+JlfhrlGCg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyvpMsHyJPYAty8mUXInwlYp20BdBZhkcQpNKRo3KHb/UIFn36W
	trPJVb7SvLlu3PFG1uL81EeQ6INwDvT18/wCc2qzuTWpFOViWf7Cv9hjZ2scOWcAS1P2VjRgeWX
	7csuy8WXjrCgXYYclQLYncEbwkKGY4QNj5UyfRgxp5ohDXA5rs5H5
X-Google-Smtp-Source: AGHT+IGzd0rr0615sN3eclq4wC/2Zg2K1p0YgkP6NPZCIYdaXry1agGbeX7Pz8cePL2TH0N3TNUhjrZNX0mcB4nCfWA=
X-Received: by 2002:a05:6000:2105:b0:381:f08b:71a4 with SMTP id
 ffacd0b85a97d-38254b162f8mr3581284f8f.45.1732180756342; Thu, 21 Nov 2024
 01:19:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119112408.779243-1-abdiel.janulgue@gmail.com>
 <Zz1sHZLruF5sv7JT@casper.infradead.org> <CAH5fLgiyHGQJxLxigvZDHPJ84s1fw_OXtdhGTd0pv_X3bCZUgA@mail.gmail.com>
 <Zz4MQO79vVFhgfJZ@tardis.local> <Zz4WFnyTWUDPsH4m@casper.infradead.org>
 <Zz4boXyYpdx4q35I@tardis.local> <98a46b27-c4bb-4540-8f75-f176c3f2fae1@gmail.com>
 <Zz59qgqKruqnouTl@tardis.local>
In-Reply-To: <Zz59qgqKruqnouTl@tardis.local>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 21 Nov 2024 10:19:04 +0100
Message-ID: <CAH5fLgiyeU9KUFqqjFDG_aouMLdRwW+hh3v6kxGoMm09B=nTTQ@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] rust: page: Add support for existing struct page mappings
To: Boqun Feng <boqun.feng@gmail.com>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, Matthew Wilcox <willy@infradead.org>, 
	rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, airlied@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 21, 2024 at 1:24=E2=80=AFAM Boqun Feng <boqun.feng@gmail.com> w=
rote:
>
> On Thu, Nov 21, 2024 at 12:56:38AM +0200, Abdiel Janulgue wrote:
> > On 20/11/2024 19:25, Boqun Feng wrote:
> > > On Wed, Nov 20, 2024 at 05:02:14PM +0000, Matthew Wilcox wrote:
> > > > On Wed, Nov 20, 2024 at 08:20:16AM -0800, Boqun Feng wrote:
> > > > > On Wed, Nov 20, 2024 at 10:10:44AM +0100, Alice Ryhl wrote:
> > > > > > On Wed, Nov 20, 2024 at 5:57=E2=80=AFAM Matthew Wilcox <willy@i=
nfradead.org> wrote:
> > > > > > >
> > > > > > > On Tue, Nov 19, 2024 at 01:24:01PM +0200, Abdiel Janulgue wro=
te:
> > > > > > > > This series aims to add support for pages that are not cons=
tructed by an
> > > > > > > > instance of the rust Page abstraction, for example those re=
turned by
> > > > > > > > vmalloc_to_page() or virt_to_page().
> > > > > > > >
> > > > > > > > Changes sinve v3:
> > > > > > > > - Use the struct page's reference count to decide when to f=
ree the
> > > > > > > >    allocation (Alice Ryhl, Boqun Feng).
> > > > > > >
> > > > > > > Bleh, this is going to be "exciting".  We're in the middle of=
 a multi-year
> > > > > > > project to remove refcounts from struct page.  The lifetime o=
f a page
> > > > > > > will be controlled by the memdesc that it belongs to.  Some o=
f those
> > > > > > > memdescs will have refcounts, but others will not.
> > > > > > >
> > > > >
> > > > > One question: will the page that doesn't have refcounts has an ex=
clusive
> > > > > owner? I.e. there is one owner that's responsible to free the pag=
e and
> > > > > make sure other references to the page get properly invalidated (=
maybe
> > > > > via RCU?)
> > > >
> > > > It's up to the owner of the page how they want to manage freeing it=
.
> > > > They can use a refcount (folios will still have a refcount, for exa=
mple),
> > > > or they can know when there are no more users of the page (eg slab =
knows
> > > > when all objects in a slab are freed).  RCU is a possibility, but w=
ould
> > > > be quite unusual I would think.  The model I'm looking for here is =
that
> > > > 'page' is too low-level an object to have its own lifecycle; it's a=
lways
> > > > defined by a higher level object.
> > > >
> > >
> > > Ok, that makes sense. That's actually aligned with the direction we a=
re
> > > heading in this patch: make `struct Page` itself independent on how t=
he
> > > lifetime is maintained. Conceptually, say we can define folio in pure
> > > Rust, it could be:
> > >
> > >      struct Folio {
> > >          head: Page, /* or a union of page */
> > >     ...
> > >      }
> > >
> > > and we can `impl AlwaysRefcounted for Folio`, which implies there is =
a
> > > refcount inside. And we can also have a `Foo` being:
> > >
> > >      struct Foo {
> > >          inner: Page,
> > >      }
> > >
> > > which doesn't implement `AlwaysRefcounted`, and that suggests a
> > > different way the page lifetime will be maintained.
> > >
> > > > > > > We don't have a fully formed destination yet, so I can't give=
 you a
> > > > > > > definite answer to a lot of questions.  Obviously I don't wan=
t to hold
> > > > > > > up the Rust project in any way, but I need to know that what =
we're trying
> > > > > > > to do will be expressible in Rust.
> > > > > > >
> > > > > > > Can we avoid referring to a page's refcount?
> > > > > >
> > > > > > I don't think this patch needs the refcount at all, and the pre=
vious
> > > > > > version did not expose it. This came out of the advice to use p=
ut_page
> > > > > > over free_page. Does this mean that we should switch to put_pag=
e but
> > > > > > not use get_page?
> > > >
> > > > Did I advise using put_page() over free_page()?  I hope I didn't sa=
y
> > >
> > > We have some off-list discussion about free_page() doesn't always fre=
e
> > > the page if you could remember.
> > >
> > > > that.  I don't see a reason why binder needs to refcount its pages =
(nor
> > > > use a mapcount on them), but I don't fully understand binder so may=
be
> > > > it does need a refcount.
> > >
> > > I don't think binder needs it either, but I think Abdiel here has a
> > > different usage than binder.
> > >
> > > >
> > > > > I think the point is finding the exact lifetime model for pages, =
if it's
> > > > > not a simple refcounting, then what it is? Besides, we can still
> > > > > represent refcounting pages with `struct Page` and other pages wi=
th a
> > > > > different type name. So as far as I can see, this patch is OK for=
 now.
> > > >
> > > > I don't want Page to have a refcount.  If you need something with a
> > > > refcount, it needs to be called something else.
> > >
> > > So if I understand correctly, what Abdiel needs here is a way to conv=
ert
> > > a virtual address to the corresponding page, would it make sense to j=
ust
> > > use folio in this case? Abdiel, what's the operation you are going to
> > > call on the page you get?
> >
> > Yes that's basically it. The goal here is represent those existing stru=
ct
> > page within this rust Page abstraction but at the same time to avoid ta=
king
> > over its ownership.
> >
> > Boqun, Alice, should we reconsider Ownable and Owned trait again? :)
> >
>
> Could you use folio in your case? If so, we can provide a simple binding
> for folio which should be `AlwaysRefcounted`, and re-investigate how
> page should be wrapped.

Well, regardless of that, I do think it sounds like Owned / Ownable is
the right way forward for Page.

Alice
