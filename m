Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12DE42FF158
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 12:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770293778; cv=none; b=YW1mi98Ghq7HHfCOex3VmKjZMCy1h6RmZlkDBDwE+IdkazM9e+7fIw/5KBBtLUvMBLhDK+Wqi/aXxBJwMFs/CasfhrUaAzDBzK9Kr/KIXSteDUPtiZSGj84mGC060RWfbAkzfc63PGXqSx7Y+xOCUC9K9PT4pCj/DsvFnlmVwOw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770293778; c=relaxed/simple;
	bh=SCC9gcflVmHPLxH69mVXvB5x+dS9TvC1HJdxJ8s16mI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=GUiCxWAOyyjL6qrHzykyOMMg144gT6JhpIso15vmO1iGzY7J25MTSDYVmpZWrlzCUbU+0xb/+zuIMzYCPHbSkTuMN6mZ/x1Ppp4mBHam8dzAreHCgKW1aCfZCI096NnDX01eRMXkE4Q1I3Vg7vy25CLmO8irXgtHrjtg1hX15D8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=xtGdXVsj; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="xtGdXVsj"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-483129eb5ccso11558105e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 04:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770293776; x=1770898576; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=WdEiyr8bJGKSEjsYG8EiNog6mpVV3VC2+HUaeWq0qZc=;
        b=xtGdXVsjE6yI2ayRYQXB4v956OTVpnBo87y0lUWmiF+QgG9CjTDUDwozvzFLqkSQPs
         r4iMJFsBg6NYzXDnb0r8K893eEbQNbBSIYfl2RraJUAfbETd+nJ+v/0jd/vAiqs3TrW2
         iTPMlRZCF1yWhD5OzJjMHXt/FyLYX71yTEJph98jbcymnSTasyQJjtJH2YOhpktDDt4t
         NcBuuZ8ob/CdxPeb+1yvZSCKvLOYnhBmhjsZfgFG5pIA2ICmm88RUfTqMq5DFzsznCYL
         RcXyPYmLdLE3uGThXlXtUUtoHQyKkq9CYS+vZh/LWliArIXafL4cZ9Q8iLV482+PXbG0
         q6dA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770293776; x=1770898576;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=WdEiyr8bJGKSEjsYG8EiNog6mpVV3VC2+HUaeWq0qZc=;
        b=t7vBYkK+lwAmntwIREMz+sYKOmO00bIhvi3NNl8w0RB9Wkx0sR67q7TZCLsTv2znn5
         9AsMh1fDE0T/eXGOtfMVqpjFl5vWvvzzlkzLN+iSjUryRElc9FnFfKllm7v9RAx0Vnb7
         Jcj1a/P5KnlsOwcFN+H9h3WGezAjYlMOoObPXf9zpgAkU/YgUkn+S2OT3e3DoNtrsfpW
         vMniuX6XGvKlSxYTmoQ7MpSaCV43JppniN89F11WSsvReagJZGJsQ+OCGU/ZklaAIfFj
         DxxaioDXdyfwnHLQZMSe4QHKJrXqYjx6WvUr3/80JGyv1b72O4XJUlSXht0hhF1J3/32
         POQA==
X-Forwarded-Encrypted: i=1; AJvYcCX2HNLoI8XxPlAXn2r81rmHg+UoU2V2fSfSxFFlKeolu6BjiHffbNP+gZ2OpqL2q9BBe/Fhd8sHjB9/eSlQXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVSIT1jXtb+aY+0On7av+PGwELxEeIAbwAnSDc5ad/6Hysibx8
	vA5vVXq6VbxnjLOUPgu4FLTG3oK7WwjWHP609naVPwSuGuFcXmshY22G4M8TKLSeaFkzk1oErfF
	Z5fCrP1+YSnaRTHqGXQ==
X-Received: from wmrc21.prod.google.com ([2002:a05:600c:ad5:b0:47a:7fdc:6925])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:6748:b0:46e:761b:e7ff with SMTP id 5b1f17b1804b1-4830e99b49fmr79210445e9.28.1770293776335;
 Thu, 05 Feb 2026 04:16:16 -0800 (PST)
Date: Thu, 5 Feb 2026 12:16:15 +0000
In-Reply-To: <e7247f3e-8a88-4b46-91ba-cb73cce1346a@lucifer.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205-binder-tristate-v1-0-dfc947c35d35@google.com>
 <20260205-binder-tristate-v1-3-dfc947c35d35@google.com> <02801464-f4cb-4e38-8269-f8b9cf0a5965@lucifer.local>
 <21d90844-1cb1-46ab-a2bb-62f2478b7dfb@kernel.org> <aYSFyH-1kkW92M2N@google.com>
 <e7247f3e-8a88-4b46-91ba-cb73cce1346a@lucifer.local>
Message-ID: <aYSKD7RQQGuFFkqx@google.com>
Subject: Re: [PATCH 3/5] mm: export zap_page_range_single and list_lru_add/del
From: Alice Ryhl <aliceryhl@google.com>
To: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
Cc: "David Hildenbrand (arm)" <david@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Carlos Llamas <cmllamas@google.com>, Alexander Viro <viro@zeniv.linux.org.uk>, 
	Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, Paul Moore <paul@paul-moore.com>, 
	James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Dave Chinner <david@fromorbit.com>, 
	Qi Zheng <zhengqi.arch@bytedance.com>, Roman Gushchin <roman.gushchin@linux.dev>, 
	Muchun Song <muchun.song@linux.dev>, "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
	Vlastimil Babka <vbabka@suse.cz>, Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, kernel-team@android.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Feb 05, 2026 at 12:10:38PM +0000, Lorenzo Stoakes wrote:
> On Thu, Feb 05, 2026 at 11:58:00AM +0000, Alice Ryhl wrote:
> > On Thu, Feb 05, 2026 at 12:43:03PM +0100, David Hildenbrand (arm) wrote:
> > > On 2/5/26 12:29, Lorenzo Stoakes wrote:
> > > > On Thu, Feb 05, 2026 at 10:51:28AM +0000, Alice Ryhl wrote:
> > > > >   bool list_lru_del_obj(struct list_lru *lru, struct list_head *item)
> > > > >   {
> > > > > diff --git a/mm/memory.c b/mm/memory.c
> > > > > index da360a6eb8a48e29293430d0c577fb4b6ec58099..64083ace239a2caf58e1645dd5d91a41d61492c4 100644
> > > > > --- a/mm/memory.c
> > > > > +++ b/mm/memory.c
> > > > > @@ -2168,6 +2168,7 @@ void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
> > > > >   	zap_page_range_single_batched(&tlb, vma, address, size, details);
> > > > >   	tlb_finish_mmu(&tlb);
> > > > >   }
> > > > > +EXPORT_SYMBOL(zap_page_range_single);
> > > >
> > > > Sorry but I don't want this exported at all.
> > > >
> > > > This is an internal implementation detail which allows fine-grained control of
> > > > behaviour via struct zap_details (which binder doesn't use, of course :)
> > >
> > > I don't expect anybody to set zap_details, but yeah, it could be abused.
> > > It could be abused right now from anywhere else in the kernel
> > > where we don't build as a module :)
> > >
> > > Apparently we export a similar function in rust where we just removed the last parameter.
> >
> > To clarify, said Rust function gets inlined into Rust Binder, so Rust
> > Binder calls the zap_page_range_single() symbol directly.
> 
> Presumably only for things compiled into the kernel right?

No, building Rust Binder with =m triggers this error for me:

ERROR: modpost: "zap_page_range_single" [drivers/android/binder/rust_binder.ko] undefined!

Alice
