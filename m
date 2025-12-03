Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A46322D6E70
	for <rust-for-linux@vger.kernel.org>; Wed,  3 Dec 2025 09:03:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764752592; cv=none; b=GwJSJEnD7myPqGlDoztxjZeGI/sKy+zF5NssCKFcy+gU+t9ffXIZfw+4FgIi1o7dCsK2WN3Bz7Hr9AkLTCz7bcAworI+uAa3Sc63QxF7oWcyDqi1UwXc9jr6CwkvmFB+RenNEktFMpwVJBMa9q0PM5oAw1IcIfBbs+u4s2x5vus=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764752592; c=relaxed/simple;
	bh=sHRw72ir0jtF6UYhga3oGsB6lNlF4iMvtGvPuLIuIqk=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=LC3Z9eDkUOdTouH3HS/TdxLueoguABd1/wK4Qh4GlF0hsSYoQ6jV0VbuH7N3QTyf626ahNY7zo3WlUDOlg0r1Kob0KuR/ylBmjEWhpyqxDM9//lYtF4H6ZaaWcDbjJfKMwkxaHSLayWIyVcPh2b5IJklaP3PXCaTOBdB4J0ktHQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=4tJWNBVN; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="4tJWNBVN"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-42e2d5e833fso1960765f8f.1
        for <rust-for-linux@vger.kernel.org>; Wed, 03 Dec 2025 01:03:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764752589; x=1765357389; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=Kfr+2vX4Q9tVYLgU8VtQjWCWyeZdN7Hd9t3ZToxEDh8=;
        b=4tJWNBVNjpzb0aL05cePe6HDtxflXUBdnCQ2tKaQ5th6uxs5SHZ1kTwcJHAwVSDPjx
         1wSK5gHHK1IKeM75ySQ4zH5HLoPZ7EW5F5sV5IBgSO6R2P4a1FNgd8pqa9YPiLHFFxCL
         cUIoMX802hYKiOqziV+1nZxLEiNlxJlwtNH0Httj9d8RJHvyvcqXJWqhJYYuQ/DlZ5Fx
         vnbl0xegVduVdtrJV82HqC/qGq1BlJHFXC27kg7R0nJ/nmXgNmTju4ZhE/Wp2uaFEJTW
         s2HRtkn8MalzTOVYmAunlslVH869mGhIIHCg8DICn6iMM4kK1o0Pe1wO7BaOfS8gq0cw
         Em6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764752589; x=1765357389;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Kfr+2vX4Q9tVYLgU8VtQjWCWyeZdN7Hd9t3ZToxEDh8=;
        b=WsOa0ka6qYr9sMq+hUL2tns6JzVh7/g2pjTPXW7GCK33IrpP7E6Ploe+RbERDz4T+i
         aiSq/SCOL7zmsQFJwUBJ75912sZQ0Y7MT0hbZP0OS9YwEp2E8ysoohEII48tKhMsk/Ob
         zkSg7dliVy93qsE/olVdejF0aK7j5bkjwC1WCtYTcOj+0JH9BbdN2aeKSCv7+BaVi7Ug
         LFIZ0oVGRb1gtO5/PWTTzoZjdXvX+0N575iMqsH5RVgaw3pTkOVLN5BQX60gImKz1qBR
         Vbs4bfJvlCSFZGUJyh+GRgjwd4rMlOH4okMPNlG3YG2ZrFgX3s9jeJgMzwWm+uUjXRH3
         fjcA==
X-Gm-Message-State: AOJu0Yyw5U3sQIrsavvCuEb67Ty5Hsea7ShrmuS9f08ASaazPDeZFh5y
	Dg8dITKgOuQWCcEpkiGXeXxNkMCeChRNG4EXz9/GTsqkVyTPDYTuEnKWLUcYw8dGXabYIBYnAr7
	vE4o9BljoGZwajvNfLg==
X-Google-Smtp-Source: AGHT+IFg5XueCO7iaVE54su6fSNrUy2hUT+JlKzlcb+hn4Wyg421uEEc8o4czxMlxykexPiBxK1dQhFnGN4+EkQ=
X-Received: from wmkz15.prod.google.com ([2002:a7b:c7cf:0:b0:477:988a:7675])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:46c6:b0:477:a21c:2066 with SMTP id 5b1f17b1804b1-4792aedec5dmr13878395e9.5.1764752588948;
 Wed, 03 Dec 2025 01:03:08 -0800 (PST)
Date: Wed, 3 Dec 2025 09:03:08 +0000
In-Reply-To: <aS-WPmuwgvzbI0AA@tardis.local>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251202-define-rust-helper-v1-0-a2e13cbc17a6@google.com>
 <20251202-define-rust-helper-v1-38-a2e13cbc17a6@google.com> <aS-WPmuwgvzbI0AA@tardis.local>
Message-ID: <aS_8zI1Od2Yl-BpK@google.com>
Subject: Re: [PATCH 38/46] rust: slab: add __rust_helper to helpers
From: Alice Ryhl <aliceryhl@google.com>
To: Boqun Feng <boqun.feng@gmail.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Vlastimil Babka <vbabka@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, 
	Christoph Lameter <cl@gentwo.org>, David Rientjes <rientjes@google.com>, 
	Vitaly Wool <vitaly.wool@konsulko.se>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Tue, Dec 02, 2025 at 05:45:34PM -0800, Boqun Feng wrote:
> On Tue, Dec 02, 2025 at 07:38:02PM +0000, Alice Ryhl wrote:
> > This is needed to inline these helpers into Rust code.
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> > Cc: Vlastimil Babka <vbabka@suse.cz>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: Christoph Lameter <cl@gentwo.org>
> > Cc: David Rientjes <rientjes@google.com>
> > Cc: Vitaly Wool <vitaly.wool@konsulko.se>
> > Cc: Danilo Krummrich <dakr@kernel.org>
> > ---
> >  rust/helpers/slab.c | 14 ++++++++------
> >  1 file changed, 8 insertions(+), 6 deletions(-)
> > 
> > diff --git a/rust/helpers/slab.c b/rust/helpers/slab.c
> > index 7fac958907b0a7cbb28ef3a8a56e0cc10d39288f..970161023d8885935f2116fe81949d0ed622f9e9 100644
> > --- a/rust/helpers/slab.c
> > +++ b/rust/helpers/slab.c
> > @@ -2,16 +2,18 @@
> >  
> >  #include <linux/slab.h>
> >  
> > -void * __must_check __realloc_size(2)
> > -rust_helper_krealloc_node_align(const void *objp, size_t new_size, unsigned long align,
> > -				gfp_t flags, int node)
> > +__rust_helper void *__must_check __realloc_size(2)
> > +	rust_helper_krealloc_node_align(const void *objp, size_t new_size,
> 
> Similar here, shouldn't it be:
> 
> 
> __rust_helper void *__must_check __realloc_size(2)
> rust_helper_krealloc_node_align(const void *objp, size_t new_size,
> 				unsigned long align, gfp_t flags,
> 				int node)

This is what I got from ClangFormat, but your suggestion does look
better, so I'll update it.

Alice
