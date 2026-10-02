Received: from mail-dl2-f40.google.com (mail-dl2-f40.google.com [74.125.229.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A41A448388
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 20:45:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.168
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790973936; cv=pass; b=QIb+RqhayivOaLLzxDw96+YEXdKyHWFZixnrNM005SnX/GyyJm12CMVX9OiUuGlyu7B2mopM46RktvIv2JPLEC17X64/ZXazAkCwxpXKuG2Cd5cNbGDTtVh+W8aEzR9LaQxtBQLYuATnyq7RkBVdTpKP4nTt/TgN/OoWN/U7cmA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790973936; c=relaxed/simple;
	bh=zELhr+oZUDjleiCo8ANEHIHumDtDPnYDcPH0ibrH6/0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uKH971lfbYXae5gSJ5q0wd5VBYSdXfOnHYa7as8eLulpunvBkBJMXFg3aeS5h2B+b/Qvafy/kxjpAod2ZEGvh956VYqNcv5KB44RJbP8mGjVlGHYe7G+mUFxKYFlIEMEajl3aSyhujLRkiMuT1ymR425by/lh5IMI/em503k/nk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZHPDzCiB; arc=pass smtp.client-ip=74.125.229.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZHPDzCiB"
Received: by mail-dl2-f40.google.com with SMTP id a92af1059eb24-14c96a4b7c7so611c88.2
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Oct 2026 13:45:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790973931; cv=none;
        d=google.com; s=arc-20260327;
        b=CaPTOhOuS0CjHv9vNh3e41lokCGMMixHLvnypZTpO1H/t3UPm2DgjKe4Fagvcq7rrm
         kKs9wU7c73ntrW+oY40E+eiDlDiYUPyzZ3L1bNjdaxkjGWIRBGPJ1/bzSYX1Dgf3bPUN
         FXm1cGmVrXpFb0l2VsaeQAFAK0mo6ki4piKfZ4+WdT+ylekWtxNr2zDRTvPKXuVk1Act
         EGHMvFd+yiobyLVDQaFyykod9qGIO72qf28qf1gBMITB104kEy6jJf82tifA8nfCKsdC
         1yCUL1qx83/Sefjpfv6BW5LiVYBO30JboGVR+hPC/lDHHnoICBpObPNv0MPoVXr15G0/
         wq2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=zELhr+oZUDjleiCo8ANEHIHumDtDPnYDcPH0ibrH6/0=;
        fh=RRAd+PPfx6AK/I8d8RG1WM1oC857mqw+2ZnzMj4+Rns=;
        b=E3XlWQ3R00CF/B5zBbYyr16DjArYNp1ok7YSojtPWA4kJU/xJm/aUajJMttdTGL/5K
         898n4Ko4Z/HSJWxXo40MdiN9jLUefguxRFIPPhDgAJzM9m255Xl6rDoO0FJbIEAFzM8J
         z7e2g3KXO22sWzXtxVt5wo11XHvEJNYRTWiX04edYbYrvOOLUb0Y0UfupNtQFiGilDq8
         SO9G1WWqRjcNbvy63s206VCNMKEiZG84a0yEBFOgWazrLgXl1T240GjAfESbeprM7rVm
         LIepeECvJ/JUCHAqpdeO1UzG7jOzdj1Zx10wRHaz4wLn8EHGV6Fy2GGNXxCUSdYo2y/4
         +WMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790973931; x=1791578731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=zELhr+oZUDjleiCo8ANEHIHumDtDPnYDcPH0ibrH6/0=;
        b=ZHPDzCiBY3f/9obRoMghT8FlkrwhfaK9UHMT+XyuiDaXLD0TlFYCr2jZuiqk6mb1Lk
         huaGCJT+i6WNA0O+/zXgTpG95zbZ6tNCY/TnakYgJs+xdNh1487nWKVBfeRN27zOiPxc
         vArh7T3xZMbLaFXUUt5/1t75p+kx537M88N0ilIe3ocIcLA+CIPyf/M4TtIbgCHTfkk6
         nYGoxZlAt26RByalH+yhNtjAdEavm1aPw0k+YtmBLFSTPVs+erX/N1QfIxeUTt22Fq6c
         mPCEkCJ9biMlwz0g9H2UDsnfHG0if7//Vq8F1A2n+UcmoonN7aWOhHlKZQ+Ki+6IP7Tf
         8t/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790973931; x=1791578731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zELhr+oZUDjleiCo8ANEHIHumDtDPnYDcPH0ibrH6/0=;
        b=ZF4iqx4mCFApeUJH18s+cicQ0/cSRPklMmFtwEvt7FInzNGWDFwNf3xPn/K/hd8hmk
         5a5AHnd8MLhjCbITNIlcuSmILD7Gzixlc6D186RHg+hg27JjkZ3ksqCGCpstUQkYn3KI
         JomheUv50hayNnIdZUqLuEh8xFoIZ81L1WbWTHbRhFlsNB/K7Ejl9x8SekJCZJ3H/mGt
         S5DCdHhLomiArJcl7Ip6qoWSP86u8HS0yo/H/6GgkoELatn0zjSvXIFqn6+INgX689+F
         XJXN6LAR53SgBzPS1wl/qW3kLyvPzvPGnnJ7e8MMaNteYtVGu2RFmgB3nDs1U+FLks0W
         Uckw==
X-Forwarded-Encrypted: i=1; AKwUvBxQgQVTkGPXFDbvpoKPy4ttPkPCFBRGdbIw5XIQPjKatZixOgNNEiuptoL9H4MEnyNbrOXlUaH5OUz0tf9J3Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYKkW7PodxOdy+cvWFR3BlSDGhF6p/sZHdbe4Bdh29Qd0lZtYxyl
	H0Q+0wMS5wfsYjtllZheVgiF9yLAArKOAhqRy/QcVW+CxUpFhgQmHXN/zYsqJGVgwSuDi0EKp/6
	nWqVqMZZySy2njDZNz6Cy6hSvV+FGR4k=
X-Gm-Gg: AYBFou249uWjNzgz5/+pkSHedqyaPVQk+fm27X+AHWd42dn3vbwd1gvZb2DdwCgvEJ8
	cZfKXWNYL2sK2x1YVUX2dK+NInP2hmjLc341X+/kn51bskOzvH6RwinR4bkhbzfKDtyJgBLePJ/
	qm7fG9NuTU0oQGt1kbAC1B9DFx1Ng+UgQYo8ERFlnGMbI8jnJgaNELDWNkAW4WMaZsEvq5w8QOh
	TVqMfXUCASTJmD/5U6i3rxA4iIPI/RHBHCoHg7h1LRML7D4VAY1KTfhl7VTJDK90XOI1Suf7FIH
	v8nzW8EB23nBy73xT4Q2oSO55tPoCui6GbF4cYKS5XCHzcOzwQXnHtaEm9bobVzx11GrVFGrjJv
	YN8pvfiNoqV/yIIzFATC/VpPo8TSmaw3/Cd3EgxlbTw1r2drdFmoe71j8p2iM41PmpBD95sUDTB
	BlL5da/Ia5LgPhl+uPu5gw8kuFLHL2rqS9OLTJ6lBDbcmOR0VegjM=
X-Received: by 2002:a05:7300:4f1c:b0:34b:101f:cdaf with SMTP id
 5a478bee46e88-34f1501d239mr5898632eec.1.1790973930826; Fri, 02 Oct 2026
 13:45:30 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260803-pr-ratelimited-v5-0-a77d456de974@google.com> <20260803-pr-ratelimited-v5-4-a77d456de974@google.com>
In-Reply-To: <20260803-pr-ratelimited-v5-4-a77d456de974@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 22:45:17 +0200
X-Gm-Features: AclHuK-hB0_7YuVtXpqZQmgKgjJYoetZN0PNcDz-U1GV6LJ_paxcOVA0JW8kIpI
Message-ID: <CANiq72kHcnTxRhDWKrCZPp6Ah-8RKp494CR-6KZ_f+zFroENWw@mail.gmail.com>
Subject: Re: [PATCH v5 4/5] rust_binder: consolidate transaction failure prints
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Ingo Molnar <mingo@redhat.com>, Lyude Paul <lyude@redhat.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Trevor Gross <tmgross@umich.edu>, 
	Waiman Long <longman@redhat.com>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 3, 2026 at 9:30=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> wr=
ote:
>
> When a transaction fails, it currently hits multiple print statements
> meaning that a single failure can result in several lines in the kernel
> log. This is unnecessary, so consolidate them into one print used for
> all transaction failures.

Just in case: did you see what Sashiko found about `info.errno`?

Cheers,
Miguel
