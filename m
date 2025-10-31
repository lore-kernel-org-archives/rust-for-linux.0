Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21D1320F067
	for <rust-for-linux@vger.kernel.org>; Fri, 31 Oct 2025 10:24:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761906283; cv=none; b=C4HZPOVuLukOHiudgwTkmjdLf/PxNAhmAaFiWXrot2CbFL4FkP9mDBYYqcvZFGgrbUBr9n34ffmFFgB4sjDmywaPx1fkrLEE44AF8Q5S9q5fVgUSyCf9OMc660SQwGDZhcI+prm+8Y4YyyOEzJzWa8VoqBhqqLbZjsrMFOhyfJw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761906283; c=relaxed/simple;
	bh=KieV0O7byC8e0nnu0XsmTnOJPcll1gsJYOjgt6OjyY0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=t0Gr36gwymK/eCW8lsIfi4zlP2ao3WBa58ii+141hvnbpxlguJk9r12kNBHOiIE5dFMJaDLaeVbvgT6SstOCZnwg/vaJSowBGXqy1sFRyV0YNW0qNBWppzWE1w0BF8dboJty7+lJ3+0UWK44f2sBKMmPQyR6Q+LROKzAkdJCKn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rgZr/ZlB; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rgZr/ZlB"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-47106720618so18712125e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 31 Oct 2025 03:24:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761906279; x=1762511079; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0CRyUBEdYzTfHD7NFKEMLRCGWmiMvGoOUHzXVYzcwM8=;
        b=rgZr/ZlBaT03thp9K4M9q3mxJ8HMcIDcCv+GH+b+9y4TUnC93vuN3Hdf+qBoNGtqwI
         ZGmJCAAhVp7vcuP1In/Khz3rKdo/PeOWsFT0bDAmAQroZmyu/ObBmr9YZsB8RdH4UXEI
         YJSyFbo8DIdfgR8zHKQatTHSHiHne8v6KtQKQCqfhHd/uEw1bYJu6qRfPiKYyEap2H6l
         R19rN+NkMatdwD5tUv9rRlvmz4RfeBaCk0qizSroVMwUZafF35GhqEkwNCMnamz7w5CX
         eNg1Gg1M8blIQGGmVUtNmBGuM3g61N347gDA/qArTIAuQWxGGzp8Yn7kARbEZJVcYCZ2
         83Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761906279; x=1762511079;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0CRyUBEdYzTfHD7NFKEMLRCGWmiMvGoOUHzXVYzcwM8=;
        b=Y5QQbUnB5yiQobIlT0ug6WNBZ7P85J5BUhVFgeGSn11lHdj+mA++hCLFg9UQx5VMa+
         BSmApqNntFj1XdKJYf8dFmzh5+hb6I4YJNGz+BpQKt18jZkC3XoIgUC2zBvRYrBb6AAZ
         h9fVKRxjEgm1Jh+OlJqPHBxS0HldP/fXLG3G9E3Nmrs1CfbsrpBcdomB2R7QXe85xsBK
         ABuxffynI7goLmCsbZopTvctmcgb7LbqT29luh53QXvf0Afa0e+huts4jY1jIi0mh9WE
         1T9dzfBJgYI3P/NsP7F+GEedkS7K/KjcA3BwTUnyqDtJACs/G/coaU24VAfzPjThCoVB
         oLcg==
X-Forwarded-Encrypted: i=1; AJvYcCV3+RDD/E0RtGiAKHUYQQRxxETtgR1KYfRz1pyWgAhPhRjPD35rmkwmKjM2du6gs9cEzfNG5IUTdfSfVXqt6w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx8G6+F2Sfqrhu6srRI1qfXb4RuQnDzbUmzwPyJlhd5iKPIhR4K
	7qWte7+YYZWorQa/rzM5HvtHNaLmudwhuAJj1ChJKPHaUUvIK0WF0L9iWoQj1FKXODOtDaosTh3
	kcFhv1eiDz7rf4bW0oQ==
X-Google-Smtp-Source: AGHT+IFJiNqrAFjhTH0j1IQrWmuNfO9ezr7CBAv4dYvxjJD8RXOTsTwsexS+6DU3D3HPKTldT7mYPQwVt4lzjww=
X-Received: from wmaz8.prod.google.com ([2002:a05:600c:6d88:b0:46f:aa50:d711])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3146:b0:46f:c55a:5a8d with SMTP id 5b1f17b1804b1-47730802df6mr26133065e9.4.1761906279576;
 Fri, 31 Oct 2025 03:24:39 -0700 (PDT)
Date: Fri, 31 Oct 2025 10:24:38 +0000
In-Reply-To: <288ba4d2-b7db-46cf-b979-341a58613fc0@redhat.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20251029183538.226257-1-lyude@redhat.com> <c1ff48ea-53ca-40ea-9541-85abd1a528d0@redhat.com>
 <e0112480a6786c64fa65888b5ce8befbba72a230.camel@redhat.com>
 <CAH5fLgiWceOs-VtDnFkx5EBxCbAnJ3cLkRwp9adQC7x9oJCDFQ@mail.gmail.com> <288ba4d2-b7db-46cf-b979-341a58613fc0@redhat.com>
Message-ID: <aQSOZu7nN56Uqj6V@google.com>
Subject: Re: [PATCH v4] rust: lock: Export Guard::do_unlocked()
From: Alice Ryhl <aliceryhl@google.com>
To: Paolo Bonzini <pbonzini@redhat.com>
Cc: Lyude Paul <lyude@redhat.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Benno Lossin <lossin@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Waiman Long <longman@redhat.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="utf-8"

On Fri, Oct 31, 2025 at 10:38:32AM +0100, Paolo Bonzini wrote:
> On 10/31/25 10:31, Alice Ryhl wrote:
> > I do agree that this behavior has a lot of potential to surprise
> > users, but I don't think it's incorrect per se. It was done
> > intentionally for Condvar, and it's not unsound. Just surprising.
> 
> Yes, I agree that it is not unsound.`
> 
> For conditional variables, wait() is clearly going to release the mutex to
> wait for someone else so the surprise factor is much less.  Having it return
> a new guard would be closer to std::sync::Condvar::wait, but it'd add churn
> and I'm not sure how much you all care about consistency with std.  std has
> the extra constraint of poisoned locks so it doesn't really have a choice.

I mean, it's not that much different.

	my_method(&mut guard);

might still call Condvar::wait internally, so it can release the lock
today.

Alice
