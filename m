Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 314661D95A3
	for <rust-for-linux@vger.kernel.org>; Thu,  1 May 2025 11:10:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746097851; cv=none; b=Bm2lR5GGlqp3yckCJTJxFjBKPmlZ2+ZrZposgDMvjxPL+f1nocMh1+Sy/68xfxU/dJcE3vNlSnMbi74kiXmc476NWEU3PM24nIiLU5mjm5I2PnygDh3L23bRhZ+iOWgs7uFir57M12x+dPSairxJQWzDSon0QJWLQEpasQ9M5aI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746097851; c=relaxed/simple;
	bh=rbwKAH8dMlpAriFzYiD3zSnY5ZUG0t7nJtgppr8nEF4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=Pk4ytqu/pibEmvVwKdNUykuURBcZf17V2Mbpf+v8QFgTNocEONJOfq6w4h3RWAmP3sMJvpk60zwezGncSA5tSFbqhD3t2u2MD+90KLvTQKyLM/G3U7sbK9gOfUyAYocBktmexdpCgzS/r3xmQ+hwoerEnJKDhRRuFF3l6moqIq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A4kYNpSN; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A4kYNpSN"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43eed325461so3546235e9.3
        for <rust-for-linux@vger.kernel.org>; Thu, 01 May 2025 04:10:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746097848; x=1746702648; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=/BKnRM4zOokKcTQV5AyCVLc33hV8q0G64hQvW9LarDk=;
        b=A4kYNpSNnVaLOpBO90dF9Wj4ZgZHHVpHNvkb/i/5KooSrNsj3SEskkfG78b893NGVo
         e23knVyw+eztCYditsNZvuY+CWp596MFEpwJrN/Y6vIqdTqD35nZ0mvWloSB8b3MVuP4
         1n0UP1DVd5jcahIb1FVzKwU8WSF3Nhr8e4xjxp5d7QmPfc6KzFNJjNS5DoHUebzOP/ZK
         3YgiH8MufFNtZFCU7fK0+R9+EnYzWCy8PdL8bUVKCJalFPLOkk2oH/dAjvETQfszsmKk
         PSnOjjYwieJ+rzNwyt2HTKOJQ98TDz6dB2QKqyYGWWgWEU+xYtxODFugtV4OS1JCqGyq
         0AfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746097848; x=1746702648;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/BKnRM4zOokKcTQV5AyCVLc33hV8q0G64hQvW9LarDk=;
        b=tY62bb3aheQBMqxU9Kdczx0kHFqVAtDpF7v4nVyDby1+YPcn/dDS27etR6RjYrgcvt
         eCpOAkQTFCA2gjDY/tMEtEHkFWqwLFkgxsZyHNyX6V9DdBW+VbMZX9njSgPV7EflpYFL
         YAX9UX1jz7TNmx95KtOJlFSZ9qpcyCPUC1mR+mO++c47eHmiYw6df2tg9pXbapJhiEI8
         WfA+7V+IsZA1ylCOg6gjQNYredgHgYuszDoSXILOfTkqk3ygd9zESJO7kSp4DqqH+q8C
         PsqgtZ8dejg2uqbIwdew/fnpaknjDY3cQqA6lOKIc29CpbvVeejgbEUbyljy98MJIkdD
         KbFg==
X-Forwarded-Encrypted: i=1; AJvYcCUa19+0i/gLQ6/QfaCypGN0oXq9ttvo2KMur1D4TGMVnLrPmevL4RzdBzHTWmqz9rG/O53SzgrPBNwIhtdNXQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+hcl8AzMdJr7XeBxTrnZa+vybo1dkUfxuKHzoyXoAc1jyRIZH
	hcG1RQrTUrsj+0fd74ADSiceZyAA5Y7Er1j7MQvRDl8Xjx1rFlFRqaQF7LAzFMqcpvFCVv7+Bwy
	QnTE7JkiMoc5+oA==
X-Google-Smtp-Source: AGHT+IHJkzKwPwQswtiD6x5ERkptX5A92T4t7odemPxusWLtceHasypw3uznORK7ezML4XRg0nHBJZtH5fhpHcA=
X-Received: from wmrn9.prod.google.com ([2002:a05:600c:5009:b0:440:68cb:bd4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:a56:b0:43c:f513:9591 with SMTP id 5b1f17b1804b1-441b263a649mr60285705e9.14.1746097848640;
 Thu, 01 May 2025 04:10:48 -0700 (PDT)
Date: Thu, 1 May 2025 11:10:46 +0000
In-Reply-To: <aBJPwKeJy1ixtwg2@pollux>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250429-vec-methods-v4-0-dad4436ff82d@google.com>
 <20250429-vec-methods-v4-6-dad4436ff82d@google.com> <aBJPwKeJy1ixtwg2@pollux>
Message-ID: <aBNWts7wijlN8FGy@google.com>
Subject: Re: [PATCH v4 6/7] rust: alloc: add Vec::remove
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>
Cc: Matthew Maurer <mmaurer@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Wed, Apr 30, 2025 at 06:28:48PM +0200, Danilo Krummrich wrote:
> On Tue, Apr 29, 2025 at 02:44:26PM +0000, Alice Ryhl wrote:
> > This is needed by Rust Binder in the range allocator, and by upcoming
> > GPU drivers during firmware initialization.
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> >  rust/kernel/alloc/kvec.rs | 36 ++++++++++++++++++++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> > 
> > diff --git a/rust/kernel/alloc/kvec.rs b/rust/kernel/alloc/kvec.rs
> > index 357f5a37c7b1d15b709a10c162292841eed0e376..0682108951675cbee05faa130e5a9ce72fc343ba 100644
> > --- a/rust/kernel/alloc/kvec.rs
> > +++ b/rust/kernel/alloc/kvec.rs
> > @@ -386,6 +386,42 @@ pub fn pop(&mut self) -> Option<T> {
> >          Some(unsafe { removed.read() })
> >      }
> >  
> > +    /// Removes the element at the given index.
> > +    ///
> > +    /// # Panics
> > +    ///
> > +    /// Panics if the index is out of bounds.
> 
> Let's check for the index and return an error instead. I know we also can't
> prevent OOB index access panics for e.g. slices, but here we can control it.

Okay, I will return an `Option<T>`.

Alice
