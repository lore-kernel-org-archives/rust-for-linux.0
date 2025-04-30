Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 469CF21C17B
	for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 09:18:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1746004737; cv=none; b=nXSOFtzW1ZlfjRMo8tplmXj/sPRevMSD0yt6QvcfvQ2pU+1NRIZvyhrQFr1oqYcNjp8isGZ/EV3+cARk3PZSsViybZP8McTrdo3XuIHsEZIB7bW4is6aZ/3CRDe4O/hlhuQNUtSSsFSZ76dFFbzHCgRzfC89YN3EcYIwNbXUeFk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1746004737; c=relaxed/simple;
	bh=NKCY1jl0KT9vsr0ecCU3ILbHGc8pGJC7LEcgGj2VJ7A=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=KC0aMYi+TimitwLKzZ1oAbSZIN1nZzdHUR4lqBTYxfzClLqgyESvXybrRX58us5OToLUzv/1+aDUPIbqGuLFyV2bc/ibHqC9vUhSIMUb9lVxTH1nTTNaDwN6CUCW4iFZ1DY5koJvn4BWkzjozKdrrBvmdCplQeh5zE73GcA4XEQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=QuepOqeG; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QuepOqeG"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-3913aaf1e32so3011619f8f.0
        for <rust-for-linux@vger.kernel.org>; Wed, 30 Apr 2025 02:18:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1746004734; x=1746609534; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NKCY1jl0KT9vsr0ecCU3ILbHGc8pGJC7LEcgGj2VJ7A=;
        b=QuepOqeGwLo+Ya8z442uVdrsXb0/dp0HLYvVHRqHdmOm+dDXxCEhYc489CVgoxqmTF
         yWk4DH6Dl2cGcdluLyEdqEyZdFG1ruUALIjmuNOTZWDwObqI3rCPPV+l6ao8dCXduW0f
         dhtZB9iGdEKanbliLaa6mslvpJTtP/NjKUrnIy1Jm89K9REhFqCClPBZYWeMUEjT0aCn
         /0JMItcBi8R13mRdVbDUKkzsk+H2M16E1CWGP6PoezDhHcXPeNNbspoQJ8bSDOx2oXEW
         aubI0gJHFVS25z09+0ZlAfmU61VeAUxFP2O4HgG652EGqhUPeanxD4iGHea8+AZrAv2u
         Ax6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1746004734; x=1746609534;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=NKCY1jl0KT9vsr0ecCU3ILbHGc8pGJC7LEcgGj2VJ7A=;
        b=FTnT021VDY23drSix4U5R1MNNaLaL0+U3VgpLJ2mB/Q+4aPfBUw6CR1cNtLuqygNhq
         9Gh2pUxNGn0LwJqLGDKnnZ6M+LrY/h1RJUvRDwuuYpadJ4cM/0NP1n2ogUmc0cF3SM8/
         Jfpitk1SMg6lfjdjxwbXqsqp7vQ2r9kNJWdLb7k8KQ8DvxIjNw5dh4a0z++ybrfyTLzr
         DSTZ5C1uzLT0c033i9Esg52XT4p8yjEIlBD1FtAnrViMbf7etcC45qkczzo2qRgU1I3n
         WM6knvt0Q4Iky7aWscndPnM0l7MO1FE0aipXnr57WyRWkHdeUeyMtlLTnrqGcLRg583/
         5IOw==
X-Forwarded-Encrypted: i=1; AJvYcCWOEMIn5eN/jSmAweedJ4VO3D2MRKaNTMTIR8VB9dlNHmJkyMcmSiXj82GBzEI/DYeyIlLLk4j4cIQ9yhx4WA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyRsJ+A2osB83c2EBQ06zNeWi9fcmt4QPS0Pm+imi1gqL1qS6B3
	Rz+r725eI2yDpgXN9QRBd1LLS7AmYbjgKofFU/yWaeCfu5FMt3LzOSTVSCIep0yBwKBrxONliux
	knklCWbxj8r2EWA==
X-Google-Smtp-Source: AGHT+IGiPLL7kGi6zaOx8QyruoYjmD+DMhhfxRRYesYlhnkukz5u2Qr6TNl1WPBIq3Hae8b8Drh9lqsR8cBNP5M=
X-Received: from wrp15.prod.google.com ([2002:a05:6000:41ef:b0:391:3d79:3021])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:47c6:0:b0:3a0:83b1:b3c1 with SMTP id ffacd0b85a97d-3a08f7611d7mr2055656f8f.15.1746004734724;
 Wed, 30 Apr 2025 02:18:54 -0700 (PDT)
Date: Wed, 30 Apr 2025 09:18:52 +0000
In-Reply-To: <20250430-rust_unsafe_pinned-v2-3-fc8617a74024@gmail.com>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250430-rust_unsafe_pinned-v2-0-fc8617a74024@gmail.com> <20250430-rust_unsafe_pinned-v2-3-fc8617a74024@gmail.com>
Message-ID: <aBHq_I8FZ-s22M3W@google.com>
Subject: Re: [PATCH v2 3/3] rust: use `UnsafePinned` in the implementation of `Opaque`
From: Alice Ryhl <aliceryhl@google.com>
To: Christian Schrefl <chrisi.schrefl@gmail.com>
Cc: Sky <sky@sky9.dev>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	"=?utf-8?B?QmrDtnJu?= Roy Baron" <bjorn3_gh@protonmail.com>, Benno Lossin <benno.lossin@proton.me>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, 
	"Gerald =?utf-8?Q?Wisb=C3=B6ck?=" <gerald.wisboeck@feather.ink>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Apr 30, 2025 at 10:36:13AM +0200, Christian Schrefl wrote:
> This change makes the semantics of the `Opaque` implementation
> clearer and prepares for the switch to the upstream rust UnsafePinned`
> type in the future.
>=20
> `Opaque` still uses `UnsafeCell` even though the kernel implementation
> of `UnsafePinned` already includes it, since the current upstream
> version does not.
>=20
> Reviewed-by: Gerald Wisb=C3=B6ck <gerald.wisboeck@feather.ink>
> Signed-off-by: Christian Schrefl <chrisi.schrefl@gmail.com>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
