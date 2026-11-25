Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.70
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795630675;
	b=nfLZV/iQ2Tm2VH74oatlLIHK5FxK74LlQbArAv/pr7Ac+e9zxDRoI3WBuRg9HoTrDvBX
	 osrMtrr7Z2Q/cwcQhW5NrJvuq6wPeBy52ZlMEU1bitd9QNwCd+7yiSMyPtMkTrqHpCxum
	 +5Flab+Wr0paHeTCsisrZNgTjA67OexL7v7DwvC6SMHHs/ivIXADLFUklyC2fy/QxUL7I
	 c794nFKMg33SlzgOHmO03AKkEkN52fMarqmaL7NINDEDs3q9JBsUiBTeI81nI/7XWoATj
	 AJoZ9rv34igYQ2TXXn7DFkE5yg7lX1LuKlzTEx5nN7M123pXxcGjcZd7w20JF16hePQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795630675;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=YHLhVtA0M0YnoXZFl+g5SRgT14ajH+S/lGw2ZTmdV94=;
	b=0Jzt3U3Rt9eW1kvxmaaV62DgBVrbcolJAzkMJbVpRuGixZfoijB2vWzvPoA7jQV/cKun
	 jxuL6zwdriq71vzKW0B/q2uSN5bGArD/JA/cFiQB2IGV4T1srckBMTlVmqPjEbJgJNVW/
	 9WahGbwtJOAOIqI4WVZQZBLYpuN1PZIitJwNUuRmElbsr01unwwg12K1TTEDLBqnQSZii
	 Rp7XpNhQHLKXgwK25pVFHOeV5vSZfS5hB2QwHG52V0j3edol8/dGBeIiRLhcJ16WCn6pR
	 cjzTgbb4tZyI3YvA/T9sbg51Rh/7oTdmKrLzM95CXtlDOWjeGXBqNqsa4gO8wE7dVwg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KkOMrl45;
	arc=none smtp.remote-ip=209.85.128.70
Received: from mail-wm1-f70.google.com (mail-wm1-f70.google.com [209.85.128.70])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27545606A334
	for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 18:17:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 27545606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=KkOMrl45
Received: by mail-wm1-f70.google.com with SMTP id 5b1f17b1804b1-4a204ac318aso29034645e9.2
        for <rust-for-linux@vger.kernel.org>; Wed, 25 Nov 2026 10:17:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1795630673; x=1796235473; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YHLhVtA0M0YnoXZFl+g5SRgT14ajH+S/lGw2ZTmdV94=;
        b=KkOMrl45Ovpk14ILpt4BJIXO9BYTFs2IWZ90yK0DGtWNNYu8P+XeP5IhTdQaDnYALu
         nKXAKJZZ0o5C8JDLoLO8V+wDqklxfhBilI6wHnL8FNSGhw5m9wKFLT0bdKjHof8+qE0z
         BcYdB+SrLvQHXgFiTWdeNAACD9TrHqo2xqucID5I4BWeSUYyslXTGcRmkO1EUooKgNVB
         k6O5TPDSlsT8mOoPm+tOba6uoAmy5lZm2pjGZgOWhrCgjtPpBaNrStoXR0s7TbJNTlYm
         cl+LWH8/0qqoYG0wpHUBeYI6XO82s/B0pyqPU06h31wpa8GpAYR+HQo5cQKGmhROYu6h
         mlMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795630673; x=1796235473;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YHLhVtA0M0YnoXZFl+g5SRgT14ajH+S/lGw2ZTmdV94=;
        b=GBZS1c5sdJDCZX2lJyzUqr/r+psB1+KUNiLLQF2835oev8ROhfhxT281CV1eEG6fJt
         gakAUqY45Br0oP7sfva4qKkPk2chA3HIzMy/d9uxsT3BrMJaPm6t1nhgAJzpmekxGkh8
         SGT3I91MR7ZuS5/X5crN45QMi1QFMK4rwA3i0Utx1neO1cME0HbyYp78m7+UiKqLQhoq
         Sn/ddkwLJVLT+AfOFPbw/xEIhf5mmVySb0qK5QDQ7tXMN3z5YSwYyJ+oWrQPbHZXhFzB
         mE79WxbR6sBDsyJg/1yiEFA0xvEbtjmfJfXHgOMrSw7EyXdPCviYmLOWQPrOe87THOOj
         wOlA==
X-Forwarded-Encrypted: i=1; AL+hErF7E3CVt27iP8TywB8qMw2DYgCATm6M85ptjoil4wG73wyk/kkYc0Ey39MxQt+TuRXj5XA3sycETPtyg7McAg==@vger.kernel.org
X-Gm-Message-State: APuU4Z/wraWWicaOd+xnpClOGShjg+avEy0sYRjVJnUHOYPbpK7Iu/BZ
	dugkjjnC2y5fpfFspqBjX+a62lytuVEec1SSFMGJqWIRDFJogdGXW4kBOxsXkWgBaXW20asF2iq
	dDL1MnNDKQIj7g4Z9yg==
X-Received: from wmbz25.prod.google.com ([2002:a05:600c:c099:b0:4a1:e676:5ad4])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3508:b0:4b2:3c81:d1 with SMTP id 5b1f17b1804b1-4bb88826921mr365854635e9.5.1795630673419;
 Wed, 25 Nov 2026 10:17:53 -0800 (PST)
Date: Wed, 25 Nov 2026 18:17:52 +0000
In-Reply-To: <5eec17370f67438e43bb1c82b1d6a16b@kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261119-rust-workqueue-v4-0-707c68994940@google.com>
 <20261119-rust-workqueue-v4-5-707c68994940@google.com> <5eec17370f67438e43bb1c82b1d6a16b@kernel.org>
X-Mailer: git-send-email 2.56.1.839.g22a8290db9-goog
Message-ID: <20261125181752.2027207-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 5/5] rust: workqueue: add ScopedWork for non-'static
 work items
From: Alice Ryhl <aliceryhl@google.com>
To: Tejun Heo <tj@kernel.org>
Cc: Lai Jiangshan <jiangshanlai@gmail.com>, Danilo Krummrich <dakr@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, "=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, 
	John Hubbard <jhubbard@nvidia.com>, Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Wed, Nov 25, 2026 at 06:44:05AM -1000, Tejun Heo wrote:
> Hello, Alice.
> 
> On Thu, Nov 19, 2026 at 02:12:46PM +0000, Alice Ryhl wrote:
> > Because the cancellation guarantee only holds if the destructor runs
> > before the bound Queue or any lifetime in T expires, ScopedWork::new()
> > (and thus new_scoped_work!) is unsafe and requires that the resulting
> > value is never forgotten and is dropped before 'wq or T's lifetimes end.
> 
> I'm no Rust expert, so maybe this is me thinking too much in C, but
> requiring the compiler to understand and enforce that a workqueue outlives
> its scoped work items doesn't seem very convenient to use. Wouldn't it be
> easier to package e.g. a percpu refcnt with the workqueue, have each scoped
> work item hold a reference from creation to destruction, and make
> destroy_workqueue() keep draining until the count reaches zero?

What I'd say is that this isn't the only way to spawn work on the
workqueue. This utility is intended for use-cases where it's convenient
to do it like that (e.g. because the queue is defined before the work
item in the same struct). We already have another way of spawning work
that uses different ownership rules (e.g. self-freeing work) and that
mechanism would not go through ScopedWork.

Alice
