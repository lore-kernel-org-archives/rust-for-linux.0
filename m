Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1926E3A9624
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Feb 2026 12:19:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770293965; cv=none; b=Sz4P3EB5UCfGq2BpYO+0ngZYFwNBTfhvtdwsE05mcr21jhi8M5DhgPYB46XcG705xJ6/Mz6rKRMMwHXPAApfsYJOK7SdY4rcaVZQo/N0lhqPlmmrxNq4eNvIHNGwqOxEI02uK83JUI2jkrdZnRZMrFVMkizc3/h8PP9H0sT73MQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770293965; c=relaxed/simple;
	bh=jTOOlJM9SM62Nbi8NEcvFMVTGFfdGPEdNCXAy/8F3qY=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=ofJHQ2r5fLD4UDkk88Atfu/3N9Lt5+/brtCUPkjivATinbmOPLnHhgVr1nSLorVXKz1a3yIaWh7KXvUhNuQidY1H0cq/2m3CWw5rK3IRB6V1PVPHT1Qnd6peCx5Nn11VAq+QawKzW9cOiUvQ9ppx0m3iX0g2PTxPaoDeE0mDjEk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=JkNTiBNF; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="JkNTiBNF"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-47edf8ba319so15936105e9.2
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Feb 2026 04:19:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1770293963; x=1770898763; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=P8VHEdoXvHCSSaRGXtsdIdrKYHnRM+3rTei5HgbDzfs=;
        b=JkNTiBNFP0NFHqPYYcMXgk0uuWV5/J+ofqckOWsz4+E4ei9Uve4MZU276BLHV43qjh
         ElA+JWwKPMxbVdymu1gPlFQXT3J7HM0wZoUoISGrujvbObwR7X2XOpSiFRMBizSteOS4
         j/Z0Ei0GdW1xk4BsHZWs/42Ra7Y83bFUBFmAXBy3e5x+/zL5qz0M0upF/PJFlL8/yryZ
         RjqFQjewbYpvRNgll+M35BM4/43M2ivnwar6q7BkGby9ugQ9Jo3o995Q0FKlyQrdU35S
         MIiMYTfzMuAwZju3YDMSmD4cHkzPLzJUWy0uHa/IRM373Di+Y3l+DBeeNlhVGU3hhqqR
         lzTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770293963; x=1770898763;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=P8VHEdoXvHCSSaRGXtsdIdrKYHnRM+3rTei5HgbDzfs=;
        b=ZfLJcIpncd/JI4D7nlxyA2hg5wfjfXSYQ6yA9wsI3QaS8o2yrurVyQxxMTW0+qgt0g
         kMO2fr8dEI85ZieU9Txg+wqRdlfI6SqNahmW+tmvtbN915pG9kXds4Vh2BDqNGlCXD74
         fCoKB+BYJsn1Hxd0lv6xQN7q3nJdgtOWkCWgMHKfHga47/YKsqIVdtm/9M8G216YRQzB
         tND+U1cabAdRjZSTcgEZqWzYLfYtZM0h5WPLlIZQ0NZL+ebRVAgTMvAlgKAebbEEPD99
         /1+92qfBGcTJU743maYxbGJdfCbacw7Kyd2NzmqhCGz/2L2kQWbMx2pSYeKtCkLHPcwh
         OokQ==
X-Forwarded-Encrypted: i=1; AJvYcCXdfXRg2FmxYP76mpSbhPbCremCw5gvlUJAJMCt/4gge/LwEkVEazX1hC9ESaIum+IToG+szChP9Vrl5ObOTw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxlO93i9hICZfaZkTIgxJvuAWvfwwm3WYUoj7OVJY58JwtYHsjv
	KM/jLb9SGMgY4iOAPpFSrMIzeaV17pTZZaY4SRs7FQV5fH72isArHDPJjY0TiVAWuD6jgvlWm6p
	pJCvgQelkl1jyu5qjTA==
X-Received: from wmbgy21.prod.google.com ([2002:a05:600c:8815:b0:480:4a03:7b5a])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4513:b0:47d:18b0:bb9a with SMTP id 5b1f17b1804b1-4830e97a05bmr85132145e9.33.1770293963417;
 Thu, 05 Feb 2026 04:19:23 -0800 (PST)
Date: Thu, 5 Feb 2026 12:19:22 +0000
In-Reply-To: <8856c839-1a94-4e4d-9ded-d3b1627cd2cc@kernel.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260205-binder-tristate-v1-0-dfc947c35d35@google.com>
 <20260205-binder-tristate-v1-3-dfc947c35d35@google.com> <02801464-f4cb-4e38-8269-f8b9cf0a5965@lucifer.local>
 <21d90844-1cb1-46ab-a2bb-62f2478b7dfb@kernel.org> <aYSFyH-1kkW92M2N@google.com>
 <e7247f3e-8a88-4b46-91ba-cb73cce1346a@lucifer.local> <8856c839-1a94-4e4d-9ded-d3b1627cd2cc@kernel.org>
Message-ID: <aYSKyr7StGpGKNqW@google.com>
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

On Thu, Feb 05, 2026 at 01:13:57PM +0100, David Hildenbrand (arm) wrote:
> On 2/5/26 13:10, Lorenzo Stoakes wrote:
> > On Thu, Feb 05, 2026 at 11:58:00AM +0000, Alice Ryhl wrote:
> > > On Thu, Feb 05, 2026 at 12:43:03PM +0100, David Hildenbrand (arm) wrote:
> > > > 
> > > > I don't expect anybody to set zap_details, but yeah, it could be abused.
> > > > It could be abused right now from anywhere else in the kernel
> > > > where we don't build as a module :)
> > > > 
> > > > Apparently we export a similar function in rust where we just removed the last parameter.
> > > 
> > > To clarify, said Rust function gets inlined into Rust Binder, so Rust
> > > Binder calls the zap_page_range_single() symbol directly.
> > 
> > Presumably only for things compiled into the kernel right?
> 
> Could Rust just use zap_vma_ptes() or does it want to zap things in VMAs
> that are not VM_PFNMAP?

The VMA is VM_MIXEDMAP, not VM_PFNMAP.

Alice
