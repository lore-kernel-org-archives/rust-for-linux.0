Received: from mail-ej1-f73.google.com (mail-ej1-f73.google.com [209.85.218.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C3B4408624
	for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 12:38:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783687136; cv=none; b=Vc8w0YvN5w4QlPROYi81RzUOXhpBwuSt4+KItymzmIUanZWQOV9MunRCKOtdtV1mE6Ou66lmQTQpfZldkO8SHeQ0W/nA4Scf5Ls8qBEH2bn+SrTIMx7iB2iOS7sjLY3ffgxoMUm+sNM7SGzAmYvPwjwDHPomkQNElsZMGhmyei4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783687136; c=relaxed/simple;
	bh=U0pCIOkkBwcHPALV8ZW+SpRSj0YYtvouOLJIjpCNEnM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=M1j1m0p2VnOSVhx0vrNJiio3uVvuGZs5BjeEI2MNaj3qewb6JtkS3BDWbhCGBwomoU9HgeEcwU4XhVS/V3IAZQAkEfZd3guuKssM9aBfV3Q/0u+MN5r69ZCX4P65mH3E0TH/wYgRCYVXctf3xIySeUl8EFpNxPkYbJjzl414Za8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=I+OWaKso; arc=none smtp.client-ip=209.85.218.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="I+OWaKso"
Received: by mail-ej1-f73.google.com with SMTP id a640c23a62f3a-c127ff955c7so80159666b.1
        for <rust-for-linux@vger.kernel.org>; Fri, 10 Jul 2026 05:38:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783687133; x=1784291933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=U0pCIOkkBwcHPALV8ZW+SpRSj0YYtvouOLJIjpCNEnM=;
        b=I+OWaKsoFJJ1GdR53vLLRV0lOD0rtJKoUVSLlySSNTHo650/iA7WggUQaxXVB4OYjG
         HTzZikV1JD8NzBT224DpcdjKSM5dRCtdZc7terJ4SOOglKKpveGp6ibb+Xho2SjBGiM4
         LN2Zj8QHPgl7mSqnseA6D3Yt1vOQCRRc77hYVya4Xxidx1X36Xy2AcYxZYIKhV78kZJC
         wbnPZZJlUXFWCIHbJ5VLxLh598nmxovudxY/F85h188rZT7OQyVaUcdnWazYURARLvPu
         fesmURachxa89DtCfW4gGFerqeJPi44rPJf0jP4uIc7Y6hLk3uvjWko64qqjdgSZ/Y/V
         IC4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783687133; x=1784291933;
        h=content-transfer-encoding:content-type:cc:to:from:subject
         :message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U0pCIOkkBwcHPALV8ZW+SpRSj0YYtvouOLJIjpCNEnM=;
        b=RxEdcZmlwcAyduEEGhdErfQUDA1E/gk1SoLRpSB9N4mRIq7h2hPytAwxXHnhPW2ci2
         7y7pUY8nZaCGN4kFJ/9612gHsO9GPRBSUT/e399sUmEan2wD2wVpCuodCAC99LTqd6A3
         Z7/XC5bmhLENM7YBbnTr6bZQBhRypN5HxX/zFtgEISJz0R248+U0Rzc7/N77MhA8Fdm9
         SEeSqxRljooHSuh5XQlqRoFXWXW5JJ+LQEfAHNyJnet18a4oy8E5lKhWy3F27O0rkISv
         0OHhQWJpXir52dAgtSaGwFW2v17lznu31bdzzys0tBTIhkz8A7rjkjzTb8uJ0xGpIu1D
         2y5g==
X-Forwarded-Encrypted: i=1; AHgh+RrLpDFBlYzf75EQBAa5/bM9Cx/m+M60QvA3RoPOE4nNN2ieK8O32S3pqvZL+Zlv8P/WnYirvcGbmIl+MdtWoA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7lWDd90R9qYodVRkctghcZE/6R1H0hrqowyxxhQ59SI6sBc0a
	4t2kOvnD26iZm8gKyBkXFDbSHiX0QpK/iwcNbDAOJChm8mYJXl/J4t6S3NdM4Q8MrYGRZUhoMCv
	wkaSus21wBb9dio+C6g==
X-Received: from edt16.prod.google.com ([2002:a05:6402:4550:b0:69a:bfa3:e91d])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:380c:b0:69a:44e0:7455 with SMTP id 4fb4d7f45d1cf-69ab449f3b2mr3957223a12.30.1783687133242;
 Fri, 10 Jul 2026 05:38:53 -0700 (PDT)
Date: Fri, 10 Jul 2026 12:38:52 +0000
In-Reply-To: <20260613065348.96750-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20260613065348.96750-1-work@onurozkan.dev>
Message-ID: <alDn3IIAVWK87YZy@google.com>
Subject: Re: [PATCH v10 0/5] rust: add SRCU abstraction
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: rcu@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, ojeda@kernel.org, boqun@kernel.org, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	peterz@infradead.org, fujita.tomonori@gmail.com, tamird@kernel.org, 
	jiangshanlai@gmail.com, paulmck@kernel.org, josh@joshtriplett.org, 
	rostedt@goodmis.org, mathieu.desnoyers@efficios.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Jun 13, 2026 at 09:40:06AM +0300, Onur =C3=96zkan wrote:
> The immediate motivation is the Tyr reset infrastructure [1] which needs
> to serialize reset sensitive hardware access against reset and teardown
> paths. That reset series started to require many independent dependencies
> so this SRCU support is split out as a standalone Rust API to keep the
> reset series focused on the reset logic and easier to review, rebase and
> land.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
