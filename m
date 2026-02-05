Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 115AA3B8BCD
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 11:58:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770292683; cv=none; b=q9QWQfSf8pecnk1G9bUm4HAIE9hw1DZda8Q/z+kIqCvwob+r8JEeuC3fw3Aq/pXjbqS6+lH5C0mUqXYt6x449QA7wMoXoT4DYh1U1D31ax02ybVvs7q5vT/uECrNWCxh8ksMFKBpcFlNR7gUbjDja1J90tZyHeNbQ/11JGshoew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770292683; c=relaxed/simple;
	bh=owOn4NfEXJPahvyCs1+dVhCw3SUugjqxSNjuCWJTwrI=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=jEsKD2mk42az06NJwR9SFI9xtK504vU2xkhG5yOLknj5BbT3i9VnqpTudU76CHc5HGFECdV0TDVeX2NmiAWVjnkxl28D99SkLmZMtpq3YuTJSQEAhCGhlXcBrj8IvquWb7ax6zgjEy58NkbUhUnluUjVDfkPNkLTWbwP36UC4Ko=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q9h9Uaqq; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q9h9Uaqq"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-4325cc15176so646031f8f.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 03:58:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770292681; x=1770897481; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=30L32YMTRfZh1EnIU9CFZai9EgpumK+W4TFcDn64HBM=;
        b=Q9h9UaqqViZ6pUFabLcnl3jyvzexxzM6mDpU2uCUMFx6LIVO8Ng5lGo7VzVrJ9JSMh
         dRslR85St5+NQ1MuYZcmSjLU7pL0Y3PTmsL5O80GhHJZMaO4ETD6z3U2ibcOJmjnYIKO
         dCjU1yFWFlhrWbgM27K7NP/ggw/W2jQzFSprXShIYfJXCRVRWusRnCXjbrjr5CyjxrFX
         ooWYlDj3ZwuSfPBExNmhUwx48xU3pZ3+znL29+WmFLBuoiWOEVkscCZRrb529yQ8dv4e
         49MQ56vxOsMKCVC0wGDEkDtTakXyYQ6dhUFGiktXrH+UMq1rZBpkc6+F6yEwKbZluQYz
         +ioQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770292681; x=1770897481;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=30L32YMTRfZh1EnIU9CFZai9EgpumK+W4TFcDn64HBM=;
        b=lxG9K/yZ5p1gOeTb99ej2ELDwoq4Rawwh24S9IlgkJhc9HRb52EoF0PMJW18xgGoo7
         uHj7SyxTdEdvZP691IoFfmKZwVIqEfozNxIBel8RXd10gblCSmy31brN6/enUCqxFP2K
         s/8f9/RQGp6V6ZZI/LoNHEQj86LBS1LyFKEKx5To0bBALPG4HHKDrz7vBUkCzjz/XKXx
         O+cLut8OzIOI6F5lY4j/QBidY3iNQ96wdJPcf+n1VOLwmGkDihVc/uWxjBYXBmohouRt
         9iLnP7A0fnT85PjhLxP9QNhohMVDHUg+8DhQVr2rh1KhqS6WNEH8zIG6cCPXsR/EbWW8
         PibA==
X-Forwarded-Encrypted: i=1; AJvYcCX1CIWWy2keR+WFzgmU5CbLnCQjBBNrKiFeo4XTKxQwZMzU6Tf6631l06UHG7i5atZZGGe71pmOTNBImnEpzA==@vger.kernel.org
X-Gm-Message-State: AOJu0YysxjnohWBMawYxjdZjxi99ZsC0HTEBYxtXqQuyheBfFs01uJdY
	Y0VScyBGnLu+FS0YdyrGt+JGMyUfByts5NEWLyuN9WKhhWHxSExdKvGwTYdaEHkSTJ0wqJyRvXO
	e9Wn8ah3WtAv1nJbl1w==
X-Received: from wrqm13.prod.google.com ([2002:a5d:4a0d:0:b0:436:e5d:8f4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:64c3:0:b0:436:d10:a6b0 with SMTP id ffacd0b85a97d-43617e422f7mr9490372f8f.20.1770292681357;
 Thu, 05 Feb 2026 03:58:01 -0800 (PST)
Date: Thu, 5 Feb 2026 11:58:00 +0000
In-Reply-To: <21d90844-1cb1-46ab-a2bb-62f2478b7dfb@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205-binder-tristate-v1-0-dfc947c35d35@google.com>
 <20260205-binder-tristate-v1-3-dfc947c35d35@google.com> <02801464-f4cb-4e38-8269-f8b9cf0a5965@lucifer.local>
 <21d90844-1cb1-46ab-a2bb-62f2478b7dfb@kernel.org>
Message-ID: <aYSFyH-1kkW92M2N@google.com>
Subject: Re: [PATCH 3/5] mm: export zap_page_range_single and list_lru_add/del
From: Alice Ryhl <aliceryhl@google.com>
To: "David Hildenbrand (arm)" <david@kernel.org>
Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Paul Moore <paul@paul-moore.com>, James Morris <jmorris@namei.org>, 
	"Serge E. Hallyn" <serge@hallyn.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Dave Chinner <david@fromorbit.com>, Qi Zheng <zhengqi.arch@bytedance.com>, 
	Roman Gushchin <roman.gushchin@linux.dev>, Muchun Song <muchun.song@linux.dev>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Vlastimil Babka <vbabka@suse.cz>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, kernel-team@android.com, linux-fsdevel@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-security-module@vger.kernel.org, 
	linux-mm@kvack.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Feb 05, 2026 at 12:43:03PM +0100, David Hildenbrand (arm) wrote:
> On 2/5/26 12:29, Lorenzo Stoakes wrote:
> > On Thu, Feb 05, 2026 at 10:51:28AM +0000, Alice Ryhl wrote:
> > >   bool list_lru_del_obj(struct list_lru *lru, struct list_head *item)
> > >   {
> > > diff --git a/mm/memory.c b/mm/memory.c
> > > index da360a6eb8a48e29293430d0c577fb4b6ec58099..64083ace239a2caf58e1645dd5d91a41d61492c4 100644
> > > --- a/mm/memory.c
> > > +++ b/mm/memory.c
> > > @@ -2168,6 +2168,7 @@ void zap_page_range_single(struct vm_area_struct *vma, unsigned long address,
> > >   	zap_page_range_single_batched(&tlb, vma, address, size, details);
> > >   	tlb_finish_mmu(&tlb);
> > >   }
> > > +EXPORT_SYMBOL(zap_page_range_single);
> > 
> > Sorry but I don't want this exported at all.
> > 
> > This is an internal implementation detail which allows fine-grained control of
> > behaviour via struct zap_details (which binder doesn't use, of course :)
> 
> I don't expect anybody to set zap_details, but yeah, it could be abused.
> It could be abused right now from anywhere else in the kernel
> where we don't build as a module :)
> 
> Apparently we export a similar function in rust where we just removed the last parameter.

To clarify, said Rust function gets inlined into Rust Binder, so Rust
Binder calls the zap_page_range_single() symbol directly.

Alice
