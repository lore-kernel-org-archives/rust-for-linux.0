Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.72
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792756413;
	b=q2jDLLm/tiDxlNXYYmAZvEl9rUYFa1jopzMxL+umkPzt6aNXTg0+QPGEw8ECE7kNIJn8
	 /S2oe8r+pyAlbWmR5NJFIqz1j8yK03nBx6aGF5IFdR966PWA2iWsnL+NsfcT3YNp8w2nU
	 I7Egk41zJwDq7ZwiX8tYJUBlm1hBixFP+wXm6eryS5vZ5TxGNVHHCCnECDIVRNUpnD2b5
	 g2W3AP+6qQiGIkZT4vZSw6ccM+oy2VrrRIahGv3QnXRX+0wjY9gS7M8QBCRjAXUqSQ28n
	 s6nqhVzWw7dxCFfyWqHq34ZS3yyvyedfabYSprqdkZyvumSPQz4trUISqjoBtgLhB7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792756413;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:X-Mailer:Message-ID:Subject:From:To:Cc:
	 Content-Type;
	bh=uLj6FN5zzpYaXQgmzegMg+GrSB746kgYZ/YLy03P7lg=;
	b=luIyBSyrEJDy710ZauvDl7t/ucAk1SBMG1TMt+nXFoivfsSQz7sFW+akVqcdJ0O/1i+x
	 G1IWCKLmIjZ3iWGp1raXoi8YB5hdskshtjts7Kcf5203DV/CTR6pI1iBOz+KmZK0lympw
	 q8iMQ5A+Ys9vlQS0970mEfUdkEyfRn4vjlMp4wBv21pbRQC23WbCmzf+xVB4isz7OcKDR
	 qEvM0KayeZf5H1F51FqS/+Y1dAdVFF5wz3/xMF6ftzd9SYTxRmMiA2Cm1+XoFO20W1E+e
	 sPL0ClZj/4jg9AXRJhKMpKyCpywG9op9+UoG1HXIMCE7E385TZJ/OOUx1KdzsLRU6iw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QWU5f+ED;
	arc=none smtp.remote-ip=209.85.128.72
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com [209.85.128.72])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF317606A31A
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Oct 2026 11:53:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AF317606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20251104 header.b=QWU5f+ED
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4a204f135ffso4452385e9.1
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Oct 2026 04:53:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1792756411; x=1793361211; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uLj6FN5zzpYaXQgmzegMg+GrSB746kgYZ/YLy03P7lg=;
        b=QWU5f+EDJNbdlgHnTd8YuzV6uiPohjbj3JxCxOniJovIm4LNH4ZNqKwgl7mbkqk2mh
         T1klAOhq1340biDup5vOzhXop9oXcydP12rLp2LHVJ/IGrpHQ2DdVZDr7YAYuixNPZdC
         Y8EyQjJmRKeIQ5vrnNFw/o/Qw1X9byv2MQkq/I/KAb81p7E8R/xgfFeIpwEglwaAAEvy
         SoCSHtGC+GoZCm8+p2EbZL101cgiFCCSpuL+1UvpH/ofXWb+4ZlY/vW+r9lIfGRJ0FSY
         OVrqyRL40+wltOuYWfP/o2Px2t4SBLk/5iMzpcw95cfYNt8rbrWgbGunEoHMecHiuNfr
         ZE9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792756411; x=1793361211;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=uLj6FN5zzpYaXQgmzegMg+GrSB746kgYZ/YLy03P7lg=;
        b=FT9oqi6wfbeM9UZl9OC4xnEahPO3y3ua+j5m11qsl98xo0dCKMprAQD/YrKzF31z9+
         kgjXE3eJK7omlye19t5BeEpx+1OHx3gCXjjZxZZw5Q9b4mqVGx/I9TmQmKVGEvCQamcY
         cqmco9a8gdNvZAUyS88Ydxe58oU2czdFXICKiOWAAUzcn2nnHS7VniGTcG8Xq7iATETV
         N/2mThqgWXO1TW8IoyS5aOyjUkWSDO5tUtjhKTKZ+FAP4X+CXswcUZ4mdUjN9iEewngF
         We1VydcFNLaktOigdilTggh9ToPGV9Wt7NZWVv09Rul4PoruK6SedBe2lHvT0RB7j076
         Z3DQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9GY4OmnX8FDdSdQLspCJWEHrYBC/sYcjIa9zvqDNeB1kMIuLNGf+vXSEWwYsTkdKnrRJdyCDuu/7jHvD28g==@vger.kernel.org
X-Gm-Message-State: AFq9FYLPCRywXyZdfnqzzVlxR37x4VymutDcKjyl2fK8r3D2j/oYjrzY
	zSZag7B5B9XPcf95jg3QjTl7YNNQYZS9Zr1ZBEzyq3rb5wxAFYCbZN6FTWRSBHoLZPZZzGBy+HR
	UWUlk80zMiGRmnkhjGQ==
X-Received: from wmoh19.prod.google.com ([2002:a05:600c:3153:b0:4a1:8915:6ed2])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4e8a:b0:49f:fe39:5bc8 with SMTP id 5b1f17b1804b1-4a211ee9b8amr34064815e9.12.1792756410725;
 Fri, 23 Oct 2026 04:53:30 -0700 (PDT)
Date: Fri, 23 Oct 2026 11:53:26 +0000
In-Reply-To: <atqh41vrlC4xVtaj@um790>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <20261020-tyr-ioctls-v4-0-704de77da223@kylinos.cn>
 <20261020-tyr-ioctls-v4-2-704de77da223@kylinos.cn> <atqh41vrlC4xVtaj@um790>
X-Mailer: git-send-email 2.56.0.257.gf7497c7d27-goog
Message-ID: <20261023115327.1776353-1-aliceryhl@google.com>
Subject: Re: [PATCH v4 02/11] rust: mm: add `task_size` helper
From: Alice Ryhl <aliceryhl@google.com>
To: Deborah Brouwer <deborah.brouwer@collabora.com>, Ke Sun <sunke@kylinos.cn>
Cc: Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	"=?UTF-8?q?Bj=C3=B6rn=20Roy=20Baron?=" <bjorn3_gh@protonmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	"=?UTF-8?q?Onur=20=C3=96zkan?=" <work@onurozkan.dev>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Lyude Paul <lyude@redhat.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	rust-for-linux@vger.kernel.org, linux-mm@kvack.org, 
	dri-devel@lists.freedesktop.org, driver-core@lists.linux.dev, 
	linux-kernel@vger.kernel.org, Alvin Sun <alvin.sun@linux.dev>
Content-Type: text/plain; charset="UTF-8"

On Thu, Oct 22, 2026 at 04:53:07PM -0700, Deborah Brouwer wrote:
> On Tue, Oct 20, 2026 at 04:25:19PM +0800, Ke Sun wrote:
> > From: Alvin Sun <alvin.sun@linux.dev>
> 
> I was testing Tyr's auto allocation for the user va range,
> and was surprised to see that mm.task_size() is always returning 0.
> It seems like it should work since it uses the task_size from
> struct mm_struct, but it doesn't, at least for me. 
> 
> If you look at tyr-dev, I think it would be better to use Sami's approach:
>   428d71932b6f rust: task: add task_size()
> 
> Sami creates a task_size() method for CurrentTask which is our equivalent
> to the `current` global and then you can see that task_size becomes much
> more clearly the equivalent of "TASK_SIZE_OF" used by panthor.
> 
> This approach also correctly returns a user va range when Tyr has to
> assign it in my tests, so let's switch over.

+1 to switching to CurrentTask::task_size(&self) backed by a C helper
calling TASK_SIZE_OF(current). Please also include `<linux/mm.h>` in
`rust/helpers/task.c`, as on some architectures (e.g. riscv) `TASK_SIZE` is
defined in `<asm/pgtable.h>` rather than `<linux/sched/task.h>`.

Alice
