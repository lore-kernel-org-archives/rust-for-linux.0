Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B11FE32BF3D
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 13:09:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771333787; cv=none; b=qSTcxKFh3FMxuPqaakbu38w5hiAMFDbeBPczVTxjx25a89/V+kRyQ1htG5fZE6HBWxwUUldEQnhatLI+FxkbQO99AvcqA0ljWTYQKEAagD9RDgf7K9Fiw6kO0dqskYRuNS65bx/1p4e0THo4xifza6t/CtkgUEiaKxovY3q1Zaw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771333787; c=relaxed/simple;
	bh=xFh372ZnaYRSmvCNpDP8pXHkkm4GIdgHlkxuTdRrRWE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=p0bcY+uXJ7SyPdolIVdQG3bPB04dJhrYZsGUwTu9YisZO2nwXgwmxWD5zz4fvdHsYMMr3bAmH7FWjiKb+Y4f/w2HbYCkfbZEgWSYCmYvP2llPOY8Z30P8JOASfb8I/lIoObK1DFkcn2WYGlADWTiiL9TUlFL7yelh4pN9HxdoEc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=em9qsVnA; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="em9qsVnA"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-43771113b3bso3264844f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Feb 2026 05:09:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1771333781; x=1771938581; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bk/cFXLoYLqrj4sg1yVxZO5NjYHyns1konO/B0ZPP6Y=;
        b=em9qsVnA9vxUa0HRYL0pqVYywwqj4ivrXIxr5jRNNH57jwtG9bTeu8Cf+3z2s1/XL8
         K1ghv/nCIeKRtPcgzskTDxJK794GQcp8/XUujCH6lTckxkIk/T0aEog4rATMXToNdVMP
         C6kktpvtUWpCzyq6Z/HBZwqMurNAnA+75DXQEhKz0TkaEco/L94LauusqI49+RdUxdha
         FL67C60GJFfZdt0QIR3Qm/qa4cjZ4kvocgVadLrwXiKTiBcx2QZjLvuzEnNUceOsZPeC
         DWs049w5C9soQMlDgesh73l2bmSiEzGAUSa2bUrmntTdNr8E/Ky7eHgcit2Kymp4Wgy5
         rX8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771333781; x=1771938581;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bk/cFXLoYLqrj4sg1yVxZO5NjYHyns1konO/B0ZPP6Y=;
        b=KRohI/M7r5Pk5p1VbBKUsxQEavZ1f84JFGmn1KPl/O5ZDXaLIhRinjkNuyMIe72zuF
         YvekGTDwShX7N6JE2ZY9Te2XJ/IZqfEAiCsrDUsUqEL1wbvYlTrd/+11aNlq/PbHPiSe
         Hr95LInhX2+gx44PV9JQk1tfQC75X/DS7rlNFs3hTAU+D2vjiuAq+u69dN9b1GQiZZcV
         8RaOBZYU2nyYciy/EqaMBU85cUWiNBRYsJ99DjlrU7waW8f5ebA9gFPMlmdrV4kmhigm
         degHmqWp4GMaY+RpwUjm3/cE27WC4lwtSM0ig/wnJhATpyJhxbenVKNP4y1e81TXZWol
         SwPA==
X-Forwarded-Encrypted: i=1; AJvYcCWpuI860gQz/DcQoMYbByKvY6g/KG1v38FNTYfDiKTuzB+mRsnEpQc0B65GumNq66viUKXvC5SrqvxA6qBB1g==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywj89gQgKTTTC6IoevC0XmCYlM17ljLoqUNonftfo4pFKshteHp
	zyuemyd0kIi3wKRZtjMNkLYqHVa1szZmCSs8LANEoFWxW0/k7Ud3Y3XDc9XoYv2/uJE3FVnhICW
	Dz+7rCjfoqq2599fp1g==
X-Received: from wrwj6.prod.google.com ([2002:a5d:5646:0:b0:436:284a:139b])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:4305:b0:431:8f8:7f1e with SMTP id ffacd0b85a97d-43797918f32mr27847831f8f.48.1771333780501;
 Tue, 17 Feb 2026 05:09:40 -0800 (PST)
Date: Tue, 17 Feb 2026 13:09:39 +0000
In-Reply-To: <20260217120920.GZ1395266@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <aY9PBfx3RRV7rXZ5@tardis.local> <20260217091348.GT1395266@noisy.programming.kicks-ass.net>
 <aZQ19FEeGgigdwz9@google.com> <20260217094515.GV1395266@noisy.programming.kicks-ass.net>
 <aZQ8lJJ-U_8j03Z4@google.com> <20260217102557.GX1395266@noisy.programming.kicks-ass.net>
 <aZRHJ7pSzOHruPA2@google.com> <20260217110911.GY1395266@noisy.programming.kicks-ass.net>
 <aZRWOIPThLfIZ1Ph@google.com> <20260217120920.GZ1395266@noisy.programming.kicks-ass.net>
Message-ID: <aZRokyTqsd_RwdkK@google.com>
Subject: Re: [PATCH v2] rust: page: add byte-wise atomic memory copy methods
From: Alice Ryhl <aliceryhl@google.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Boqun Feng <boqun@kernel.org>, Greg KH <gregkh@linuxfoundation.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, linux-mm@kvack.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Tue, Feb 17, 2026 at 01:09:20PM +0100, Peter Zijlstra wrote:
> On Tue, Feb 17, 2026 at 11:51:20AM +0000, Alice Ryhl wrote:
> 
> > In my experience with dealing with `struct page` that is mapped into a
> > vma, you need memcpy because the struct might be split across two
> > different pages in the vma. The pages are adjacent in userspace's
> > address space, but not necessarily adjacent from the kernel's POV.
> > 
> > So you might end up with something that looks like this:
> > 
> > struct foo val;
> > void *ptr1 = kmap_local_page(p1);
> > void *ptr2 = kmap_local_page(p2);
> > memcpy(ptr1 + offset, val, PAGE_SIZE - offset);
> > memcpy(ptr2, val + offset, sizeof(struct foo) - (PAGE_SIZE - offset));
> > kunmap_local(ptr2);
> > kunmap_local(ptr1);
> 
>   barrier();
> 
> > if (is_valid(&val)) {
> >     // use val
> > }
> > 
> > This exact thing happens in Binder. It has to be a memcpy.
> 
> Sure, but then stick that one barrier() in and you're good.

Are we really good? Consider this code:

	bool is_valid(struct foo *val)
	{
		// for the sake of example
		return val->my_field != 0;
	}

	struct foo val;

	void *ptr = kmap_local_page(p1);
	memcpy(ptr, val, sizeof(struct foo));
	kunmap_local(p);
	barrier();
	if (is_valid(&val)) {
	    // use val
	}

optimize it into this first:

	struct foo val;
	int my_field_copy;

	void *ptr = kmap_local_page(p1);
	memcpy(ptr, val, sizeof(struct foo));
	my_field_copy = val->my_field;
	kunmap_local(p);
	barrier();
	if (my_field_copy != 0) {
	    // use val
	}

then optimize it into:

	struct foo val;
	int my_field_copy;

	void *ptr = kmap_local_page(p1);
	memcpy(ptr, val, sizeof(struct foo));
	my_field_copy = ((struct foo *) ptr)->my_field;
	kunmap_local(p);
	barrier();
	if (my_field_copy != 0) {
	    // use val
	}

oops!

