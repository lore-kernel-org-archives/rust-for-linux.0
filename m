Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E8BB1F37C3
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Apr 2025 09:21:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744708914; cv=none; b=LgYUfXHu290wnK4SBdlGcpQayQduoLZBU4nVzeTvHDUsq6aCmF6VycwQUpWOUrt4IZ+TgfeOcParBcnvCkMf7+Gq//J9qSzIsfcH8HjPgIFMzFhzTlY6MMlTBZ0YEjKEimbgacJ7V63mxXlXpfk+Sm8R9XHDtFgdQYxWN6hz/HQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744708914; c=relaxed/simple;
	bh=+yOgWRw3uvx1BqDbM0dE8P/uGNyvZzC8BkIpRI9L2y4=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=CzetmKUCircARlUxnamTzT0S2Ceylqum74jg8msC/6SsT00j4q4MgZ0Mmp10RTCBbxrRFxrN4W8HTK4Og7WJ0+28xnsjAU053P9ulMtTpBO0rLMW6Q7Zjb8qlbu8huVbX7dJZVtNro1lOkARPhYA3lyPpYfaLvAafuxsM8M1JbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FMC964Sg; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FMC964Sg"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43e9b0fd00cso26506825e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Apr 2025 02:21:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744708911; x=1745313711; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lQYLM5MPeJ7pBPciZLXP19wi0JXlYOv2HtY4ZImtR8U=;
        b=FMC964Sg1gF/wQ4cHtzhmW/oui/3XREaN/JAwnre953UHMtIk4WGZC87uAg9G1FPVp
         MgYtt0M/oHDbH/Z3GlVCx8q3b86f9CyPs6wTwLKCn9kdAK5f5A+2fz+WQ36wytvgh0+7
         PXqD8990XlL+ft98SK4NZiRB9fKlhzDL/WScUBfYSvSBLrRXIcubRariuVp3xt1h3Ij8
         25nESYP6IJWQrZpq6fRaV5E9cH8JwFfmBXBgKZBIrkokEbYmahye7Xmj8fJD+78f6zNc
         zGnXqIGsjGi1UyFQiunFA/PJutD6Eb5iVYKpx9xsWjMsQrv1hH0q/2QWOWDdPGLl9zmW
         FpSA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744708911; x=1745313711;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lQYLM5MPeJ7pBPciZLXP19wi0JXlYOv2HtY4ZImtR8U=;
        b=KX1yc0GXe3fRKvzZHR19bnsSfKMAxNjlwz7Y7am8CMkKbfrRH66vA393PeiVZNjpFy
         UPEBZ9bb+XgA3mKjYcXm0Qsq4F7FMYO0ku5Re2luYoJRuzflGvRFCRwLs52FW+EqtfFZ
         pg2WkFVqP+V0qO4DlJTjUP4wmnqaJ5fUvTL2A80Zwmjyl9Iz4xnU1rAXMGMPGsPTpfNQ
         HQ2iixbNm513t/TIaq5ufmqfAzzJWlZx4pXj6VbdbtGK3W2DdGEo1EcGpV4xplhf0eCI
         D5OlsNAg7BNcyphA+6Q1nClNKS3m2y5Kkrh3T5EWyoUrSRkAszByEG2k6CE43jlA8Z64
         eqtg==
X-Forwarded-Encrypted: i=1; AJvYcCWT+fm0exw2PI3hfArA9SFG3jVfzxIi6L37sHq/2jR5R9/SndJ3bU2A6ddZS8GHmWaTzmEqFLojeJ6FchM69Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyyuv4OaffGiB9vHfYNn7d3naqgR7mvofTgTTawUPVHh2HshgzW
	lnkISSf8A4HPYr5Arc1R7KltVY53+1aKCmO2Lq9Y2YF0UaeBLSmJHRd6/Y1unQXD9CXn6tOsZe+
	Z+liqKsqMghpE6Q==
X-Google-Smtp-Source: AGHT+IE++y4l2+SOKTm/ba4RBqWahO7dM+xuUIWSBv+zaQNUdrGck4nuQOj0QinRrlx7d7Z9v+cPlDIM1Wp0pxo=
X-Received: from wmqe16.prod.google.com ([2002:a05:600c:4e50:b0:43d:47b9:bedd])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:cc8:b0:439:8878:5029 with SMTP id 5b1f17b1804b1-43fd3916ab2mr18708075e9.2.1744708910972;
 Tue, 15 Apr 2025 02:21:50 -0700 (PDT)
Date: Tue, 15 Apr 2025 09:21:48 +0000
In-Reply-To: <Z_1KJ98k7WL5qWfS@slm.duckdns.org>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250411-workqueue-delay-v1-1-26b9427b1054@google.com> <Z_1KJ98k7WL5qWfS@slm.duckdns.org>
Message-ID: <Z_4lLEFjobzEWT77@google.com>
Subject: Re: [PATCH] workqueue: rust: add delayed work items
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@gmail.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 14, 2025 at 07:47:19AM -1000, Tejun Heo wrote:
> On Fri, Apr 11, 2025 at 11:12:29AM +0000, Alice Ryhl wrote:
> > This patch is being sent for use in the various Rust GPU drivers that
> > are under development. It provides the additional feature of work items
> > that are executed after a delay.
> > 
> > The design of the existing workqueue is rather extensible, as most of
> > the logic is reused for delayed work items even though a different work
> > item type is required. The new logic consists of:
> > 
> > * A new DelayedWork struct that wraps struct delayed_work.
> > * A new impl_has_delayed_work! macro that provides adjusted versions of
> >   the container_of logic, that is suitable with delayed work items.
> > * A `enqueue_delayed` method that can enqueue a delayed work item.
> > 
> > This patch does *not* rely on the fact that `struct delayed_work`
> > contains `struct work_struct` at offset zero. It will continue to work
> > even if the layout is changed to hold the `work` field at a different
> > offset.
> > 
> > Please see the example introduced at the top of the file for example
> > usage of delayed work items.
> > 
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> 
> FWIW, looks fine to me on the first glance. Please let me know how you want
> to route it. If you want it to be through the wq tree, please let me know
> what to do about the dependencies (I just applied the "remove
> HasWork::OFFSET" patch to wq/for-6.16 but don't have the other one).

Normally I think it is most natural for workqueue patches to go through
your tree, but it may be easier to take it through Miguel's tree with
your ack as an exception this merge window since the container_of change
will probably also affect other work.

It sounds like this is also the conclusion you and Miguel came to in the
thread on the HasWork::OFFSET patch.

(If you're planning to change the default workqueue configuration from
PERCPU to UNBOUNDED this merge window, then please let me know because
it might change the calculus here.)

Alice
