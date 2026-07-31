Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com [209.85.218.71])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 02EC33D5C2A
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 12:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.71
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785502350; cv=none; b=YfseyrZq4/IgAjcfqsXTG901hG9F7QfKemVggTCy+Sktwb/4iUdXsJwxRbYbT3k5YKwPDEPJAMSAs4DY4v4tJxUHLoDJu+j0mdRxqMLnncacQWvIVJMT73iXVDrV4p5x+SbP9ZRy+XeLC3kySFutGPUImoYciAvaWCelQd4dzHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785502350; c=relaxed/simple;
	bh=It7kZwaRx0Ep9+u4doLaOtpLhDjb1kbYQ4dRYkS+gjE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=n/D8SnakilM9f89fdHbdGR6JBA2fXJ9MvgA6uSvPiLjRzKP41xoXwzskQbxUCkv9gO0BBmvalGAyF7c/S8aYZNwpfgDBaMkDaExfowpfKCMiBfjXoZWGPXCeN1jyJgH52pbwUvvyW+lzE5T78ZSFxXTNI2ZeyKPuyuc8iXdN6YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V3m77j6q; arc=none smtp.client-ip=209.85.218.71
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V3m77j6q"
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-c15e82278cbso80292566b.2
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Jul 2026 05:52:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1785502347; x=1786107147; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=l9F+eXGUPJ1CqPpVTZLneozqshrotXXIxuj3EVO2s6o=;
        b=V3m77j6qEVlpVZIB7mSWb+RSZ5jlxVc7nYZ8GuXk7egJcy2OEGtUZo9X1E5CZlZnwx
         WtG0eH3VBrE8hPuxfj2urBE9JnWTI5za0zROZnWUVEgEkWfxUzj7caiKK9rsAxtGZAiz
         59VcTBizjDexs2rVVEMBsujrmheeHoCx+RDbUrTucz11c4pdCrYpp617xiTARW3a5rRx
         C94U7R6dbTd+fp1zKO6Qnxrs+5bo6MITffgR8sk14w3EA6y5J4qOL5xJu2LggaHasc5i
         OBmtkEh2JAz1riW631QBlNgDcdZF0I7pFk08Zn3s7M2tgP9wxAVRAY/00DAG/dfnoXiK
         Lf2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785502347; x=1786107147;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l9F+eXGUPJ1CqPpVTZLneozqshrotXXIxuj3EVO2s6o=;
        b=IUdK3RyKEuWm5RenWpSG+/kktYtvzZC6qg2OwQpEfyl432ekb7msCkTFyg7pYW56/f
         SGGw+8zpcor9X4WjpEhpYkLsd7xeo8O+ucu2Fac7zj18DA1uHNkiB8Jf6uclIiz0Gq5J
         KNq4I4zL4wYcJBieBhob7kNyr6AQDXaKoxzn+e2XdNNzToRXuNYeSbE4EeFYnEFYg1y5
         rbDSlwCdosJ54Zh8RdVj/ntfzovBwXfDlvIK13lcbfJCcm6q0YpgTMZ8+38+KS9qrV6h
         DYDtyo62kIdF4ZVZ2o1B+2SCIO4unJRrFkyEmOFrGwXHfvft04D3ddwyHm/10Vb+e2tg
         SgcA==
X-Forwarded-Encrypted: i=1; AHgh+RqhD9zxm6+AB4CRiNuR3WHTwiyt4+VY+GgV/ZUYqYLL9eE8e4TR+6a8MdtIiys9FqNCBiOJ6xDAJTnQRUUFaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YytxZge8hbykaxkaLLGKkVS2zikKwWxyYFbWlcJwjrvM6NEYNb8
	dlCurKF0AtMj8fQGH3SQOUPjFIgvXDgUoV/vOv50bOZS0M0TZq2GKU77RXOKXWLWglKUN+OkyqY
	J/5i6ffOsvX1Gbw4W8g==
X-Received: from wmhn21.prod.google.com ([2002:a05:600c:3055:b0:493:dccc:9e0c])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a17:907:c0f:b0:c19:5a94:4121 with SMTP id a640c23a62f3a-c1fd1e12753mr109416966b.6.1785502346913;
 Fri, 31 Jul 2026 05:52:26 -0700 (PDT)
Date: Fri, 31 Jul 2026 12:52:26 +0000
In-Reply-To: <DKBZLF7RMQE8.2KQJKLGIE0X6N@nvidia.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260722-setonce-populate-v1-0-fa7455c26c42@google.com>
 <20260722-setonce-populate-v1-2-fa7455c26c42@google.com> <DKB42GHIZ8VZ.17ASJME0HTP5A@nvidia.com>
 <amsVU-1o_zNOIOts@google.com> <DKBZLF7RMQE8.2KQJKLGIE0X6N@nvidia.com>
Message-ID: <amyailSp5MzQQZUY@google.com>
Subject: Re: [PATCH 2/3] rust: sync: add SetOnce::try_get_or_populate()
From: Alice Ryhl <aliceryhl@google.com>
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Lyude Paul <lyude@redhat.com>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Daniel Almeida <daniel.almeida@collabora.com>, 
	"Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Carlos Llamas <cmllamas@google.com>, Luis Chamberlain <mcgrof@kernel.org>, 
	Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Miguel Ojeda <ojeda@kernel.org>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@kernel.org>, linux-modules@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Thu, Jul 30, 2026 at 11:48:15PM +0900, Alexandre Courbot wrote:
> On Thu Jul 30, 2026 at 6:11 PM JST, Alice Ryhl wrote:
> > On Wed, Jul 29, 2026 at 11:05:55PM +0900, Alexandre Courbot wrote:
> >> On Wed Jul 22, 2026 at 6:16 PM JST, Alice Ryhl wrote:
> >> > +    where
> >> > +        B: lock::Backend,
> >> > +        F: FnOnce() -> Result<T, E>,
> >> > +    {
> >> > +        if let Some(value) = self.as_ref() {
> >> > +            return Ok(value);
> >> > +        }
> >> > +
> >> > +        let mut to_insert = f()?;
> >> 
> >> This means that `f` can run more than once for a given `SetOnce`, which
> >> can lead to problems depending on `f`'s' side-effects.
> >> 
> >> In the GEM shmem case, we would create a second `SGTableMap`, and since
> >> `SGTableMap` assumes it is the sole owner, the last instance to drop
> >> would create a use-after-free.
> >> 
> >> Now this sounds more like a problem with `SGTableMap`, but if we cannot
> >> avoid calling `f` at least twice then I think it would help if this was
> >> documented.
> >
> > Hmm ... this is the behavior I want in Binder. Actually creating the
> > value is an allocation, but my lock is a spinlock so I cannot invoke f()
> > under the lock. This means that each caller will make their own
> > allocation, and then we throw away any extras if there are concurrent
> > callers.
> >
> > If GEM shmem wants f() invoked under the lock, then that's just a
> > different operation than the one Binder wants.
> >
> > Do you think we should add both?
> 
> Possibly... but this would introduce a potential footgun that sleeps
> while holding a spinlock, unless we limit the run-f-under-lock version
> to work only with mutexes.
> 
> Maybe the proper solution is to fix `SGTableMap` so it supports multiple
> instantiations. It is, after all, a bit footgunny on its own.
> 
> In any case, the current versions should warn users about the fact that
> `f` can be called more than once imho.

We could extend the naming scheme:

* try_get_or_populate_once() only invokes f() once, under lock
* try_get_or_populate_racy() may invoke f() multiple times

Though the _once naming isn't amazing since it still may invoke f()
multiple times if it fails. On failure, the next initializer gets to try
again.

Thoughts?

Alice
