Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CC06D1CF5C0
	for <rust-for-linux@vger.kernel.org>; Tue, 15 Apr 2025 09:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744707701; cv=none; b=ca8u8yrijfxVcPAgWqfyh0cEilf6ptwLrRKuL0NZtyQajNf8WfRW8yUzqEFxFU/iVGYBeR0HN13wv8ytGmdz0gR71El/P+joLnZOGLehJBUGw5qR4Kx1GqaIl6321r9a/BMt+fZcvfkHp4Y+sFPnpz7kETSp0BwW0xNL3xL00/I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744707701; c=relaxed/simple;
	bh=fQ7T/qUhM3lDIvKK1VLf3X6MBV4DNYEWZWyZsblYqH8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=i3NEf864Mov7+g5N5dHirWTfiEDw/cXrDBwn+0GhKzw67ar+BHTvodBoBsol1bIaspJ041ebTAmbHxFh+lZ9GIkU0IJRDbTw5CvUtFry7GycCXABjOVaLxibIijfQiaOPUVZfXggKUhzfy4+gRyZMm5ou8jTiMhmk4D31FYqBRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rKgWT49b; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rKgWT49b"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43efa869b19so36658805e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 15 Apr 2025 02:01:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744707698; x=1745312498; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=ATQ2WAeqp0anILpiDAuFRK6bq5Jh77B0cEqGlrXYkoY=;
        b=rKgWT49bM4AyxpnOnD5JudJ4pidZxOQ1PLF1AfmqMXTzHEgkwMt3xe9Tj8rX5o2i+P
         3/OmbWsjbHNmzuaDZrKQDc7XjRB8ko9EGf/ibgyR3Z7R6XrpGrnRLDfpHEg9vl07+o0l
         JSkJ25skgVoUBGVTwJeJMhQEwWlgnLnamyU81D86AAIXfM1nlwMOoOdr3m2NM6p5mOzs
         5WYO2a5+w2deGOsibBJxYRvGuss164TIKzyNKJVqgBUDSTxgifd/UpSXki8/DfXAGuOK
         /ESPhX3uA+ub1yFot50p/GQkxiDWN2MKoHNMMKcStiY02p+mBTfRJQuuSvLJWZFT2lWa
         L7sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744707698; x=1745312498;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ATQ2WAeqp0anILpiDAuFRK6bq5Jh77B0cEqGlrXYkoY=;
        b=V/yXccbawoQiKvHJULQblZtVfPSIJbmYYK9zyz1UjMmYyskvzfpyceUpsN2XBnyMOr
         1CtFhgX1Hi7oLbbW0XbFWAZa3LLqHuUm8NwcdvN4NVwITEhl67Ky52OdO+js5Gnxt7qy
         h/cehSLef937JjvW1E5gJbjOitS1qdim1PywlsdU0tYbBy6BGsVcbQeBqoXinUu1tmLE
         BkWO1R1HtOBScGkbkaSLB6CjDvhSWXoIk2jH0IJ3cp1FaMIsDV9Ir8Rigf4dpGCgnfnx
         NSxulEcrWvfS22zg1YdkmSrSjVVKrRik/0NPC1m6m0RQsJxU6r+fpbmJO2XMiWfF7UFH
         ZRPA==
X-Forwarded-Encrypted: i=1; AJvYcCUcntU0I+XZ7sTu3Utim6JwT2wl44drWuKdhe7I30qo2L2FFPKOCi4vIMEKITZh3DIpR0Nc8qeAvXtqdDkO+A==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywo3VzGKDaav4MitM4VbdrvXE31WEjCZh67RgnUoKRY+cpm8pzQ
	ahRNWCQ5ygTa0splpFkeKpzvivVicyd8ftNkdvE317+CtPT3ZZqag+twAi9SPI05ks8dW1NnEcY
	jWvZGRFyx+AMpIA==
X-Google-Smtp-Source: AGHT+IFmFs/nlsx2QPkRnmhjLHp1bf+lNep9itSd3yUo4cUQIyVWVraBimHdDf8+ne/yfkGfhA9ATJZ9DuVeWog=
X-Received: from wmbgz6.prod.google.com ([2002:a05:600c:8886:b0:43c:f517:ac4e])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1389:b0:43c:f75a:eb54 with SMTP id 5b1f17b1804b1-43f3a93d3e0mr126794805e9.13.1744707698153;
 Tue, 15 Apr 2025 02:01:38 -0700 (PDT)
Date: Tue, 15 Apr 2025 09:01:35 +0000
In-Reply-To: <Z_1QzTdV8mHJYdQ6@cassiopeiae>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250411-create-workqueue-v1-1-f7dbe7f1e05f@google.com> <Z_1QzTdV8mHJYdQ6@cassiopeiae>
Message-ID: <Z_4gb8ZAlbfhobgW@google.com>
Subject: Re: [PATCH] workqueue: rust: add creation of workqueues
From: Alice Ryhl <aliceryhl@google.com>
To: Danilo Krummrich <dakr@kernel.org>, Tejun Heo <tj@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@gmail.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"

On Mon, Apr 14, 2025 at 08:15:41PM +0200, Danilo Krummrich wrote:
> On Fri, Apr 11, 2025 at 03:34:24PM +0000, Alice Ryhl wrote:
> > 
> > +/// An owned kernel work queue.
> 
> I'd suggest to document that dropping an OwnedQueue will wait for pending work.
> 
> Additionally, given that you're about to implement delayed work as well, we
> should also mention that destroy_workqueue() currently does not cover waiting
> for delayed work *before* it is scheduled and hence may cause WARN() splats or
> even UAF bugs.

Ah, that's a problem :(

Can we make destroy_workqueue() wait for delayed items too? And/or have
a variant of it that does so? I'm not sure what is best to do here...

Alice
