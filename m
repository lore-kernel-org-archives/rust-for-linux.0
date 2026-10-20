Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792483967;
	b=ce7YUBWa35qWIKwqoUmiPvCBJ+SmfXsFx7trqZd6jjTJqlHeqXuPt/kWFBimG1e7gAKd
	 CKLVlJt5xgAw0RjdhX7d3nTOR4LfEzLH5ltoOGetRcNYuKRF1rm0AwQGYqhngbrd0z27o
	 Q2cjKrpoSRUjRaKI0ejppo6gG81lyuSVkqtsnHx++MRPFdC3uxrPhqOP613eTKd1PKaPq
	 2HONr0SzS4nW9w1TA8FRVPPz7bF7qEla+E1IpvCVWdOPbCsnHg/V/0SVUyQg+b9cyOrY+
	 JiuKo8SfxIU41r9gF2vq6/ll9E/dXHaBSRFwEXusZ5RcJ/B4iPh9gSxfStlUGONZ5Lw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792483967;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=k2rmoy9HDSiKDp3Ez25S7rh7RAY7znXw3hMbNjmmj3M=;
	b=jxppVnwrW5iy1QuwTvqs4hktM1T+DH1a6cExAi6mdhWVjbUMzn50kEwiw7jdJQLU9RFd
	 kdQeK5FK2h1HgKym0JfhZ1vSj9tUOIMpa2ancZqabdCmuhOoh+0tXRWV8aYoZJLdCC0oS
	 2vJ7x1oWwh17omSNAoV3qc2Q5Iy0M+60HkoFKnmjzQMb7v7p4RaSvMkquXhXpM1EIyZEj
	 avTptYgICFabkkf/XgU1Mulbge/JY6vukYI0NaAYsRU+5vZ9HYu+GyGKEJ+mtqpWdCeDg
	 jKu+PRgNGfPn5UYvwnlDrkvMQqwVIcoZaVi4KyDqW/3t/3p55Z6hQiJWE+Dvrxy6POw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=BTrWJCfe;
	arc=none smtp.remote-ip=209.85.208.72
Received: from mail-ed1-f72.google.com (mail-ed1-f72.google.com [209.85.208.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD4D606A338
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 08:12:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BDD4D606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=BTrWJCfe
Received: by mail-ed1-f72.google.com with SMTP id 4fb4d7f45d1cf-6b1bc2e62d5so3381671a12.2
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Oct 2026 01:12:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792483965; x=1793088765; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=k2rmoy9HDSiKDp3Ez25S7rh7RAY7znXw3hMbNjmmj3M=;
        b=BTrWJCfe4vtpLX9/tBT8Omu7n5z6WJ7BgaGAwnDcycshXzIGqXU0l/7MavafAWaMhe
         r+q4tClOg4XlppqbBhJP71NZlm4zqBVvyLmjIS2iBqH7E2hN0d6nU5IzFApXEBF1U1In
         vjn6cPCDuC50O8t0rv2zKyps6x5AVEO1TBlrh27IcefltwI/ddVxIZr6XJCocDk7IIuG
         m+p2HTLxYMNv6NoVi29Ti6ebdGJEaPLkycX0dlQrPYeu2v2HuZ0/WB0FU0U9f9gf90MH
         qpZqTnKI20XCtZNVLp63Z6SXKjlghwmgFRC0ScT1vI2h5OS6xdUap1ZBL5R/K/LhfeB4
         1Krw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792483965; x=1793088765;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k2rmoy9HDSiKDp3Ez25S7rh7RAY7znXw3hMbNjmmj3M=;
        b=HYYzZxYurhW61mMiWowu7n48J6IjX6Rg/Ua8091QpeCXMbYKaBNj7XYkJ2hY6bV4aA
         XXkrrmJ5K5DXwuVY+8g+KnWcBhXtPdICtGRDNm+SmcOBR185JpVNEDQ8IbW3B3Z9tpjX
         L688OgjT0S0qOAadY2oIOx/IR/I0sYoKA6zrAB1kpAdocLYVIUjmDPfteU5lsQDzZEYt
         gmHw259Hhkn0f/Ajqou16KSa3ZfCJjZzHLbwHM294nNNyw4ROBfnpWes4G4QfMxjmfdv
         m/lrVTBkThyS9JFWHo69edp2gEUl/IXjNt+xY0FA/gh2EqMoOZ7rd2F1FljfxGv1E/oQ
         v8wA==
X-Forwarded-Encrypted: i=1; AKwUvBwha+z84/c7VTTr/tFZpdOgVNFEJ7U9sX8w+gADjo2NKsU1zycb2mDid8Cb6sPyQmVO0US/UASusSYdrTxvhQ==@vger.kernel.org
X-Gm-Message-State: AFq9FYL3VgLgX1nDZahd0TEuU7KXjqfx2YcSSlhjlY2ScHldRkH5tiAP
	OKVLB8xXDZo1XjvxJrvu0obY5vfzdzaILtKZMaNLFWJBnjXGpwojCikzjfxGM4+nW//PDfRO9CZ
	wqthkfOamhl6EDRmYJA==
X-Received: from eduf17.prod.google.com ([2002:a05:6402:51:b0:6ac:c627:c778])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:4344:b0:6b1:8818:1090 with SMTP id 4fb4d7f45d1cf-6b3a815d5admr6666189a12.22.1792483963442;
 Tue, 20 Oct 2026 01:12:43 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:12:34 +0000
In-Reply-To: <20261019-rust-cfi-fixes-v1-1-9503472ba738@google.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261019-rust-cfi-fixes-v1-0-9503472ba738@google.com> <20261019-rust-cfi-fixes-v1-1-9503472ba738@google.com>
X-Mailer: git-send-email 2.56.0.212.g129ede20d9-goog
Message-ID: <20261020081236.1760816-1-aliceryhl@google.com>
Subject: Re: [PATCH 1/3] rust: irq: declare cfi_encoding for irqreturn
From: Alice Ryhl <aliceryhl@google.com>
To: Sami Tolvanen <samitolvanen@google.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Thomas Gleixner <tglx@kernel.org>, Anna-Maria Behnsen <anna-maria@linutronix.de>, 
	John Stultz <jstultz@google.com>, Stephen Boyd <sboyd@kernel.org>, 
	Abdiel Janulgue <abdiel.janulgue@gmail.com>, Robin Murphy <robin.murphy@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 19, 2026 at 11:34:37PM +0000, Sami Tolvanen wrote:
> The IRQ callbacks return c_uint. C calls them through irq_handler_t,
> which returns enum irqreturn. kCFI encodes enum types by name even with
> integer normalization, so the type ids never match and every call fails
> the CFI check.
> 
> Generate irqreturn as a newtype with a cfi_encoding, as is done for
> lru_status, and return bindings::irqreturn_t from the callbacks.
> 
> Fixes: 0851d34a8cc3 ("rust: irq: add support for non-threaded IRQs and handlers")
> Fixes: 135d40523244 ("rust: irq: add support for threaded IRQs and handlers")
> Signed-off-by: Sami Tolvanen <samitolvanen@google.com>

Missing

	Cc: stable@vger.kernel.org

otherwise LGTM:

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
