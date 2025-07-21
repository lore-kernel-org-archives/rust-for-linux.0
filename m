Received: from mail-ed1-f74.google.com (mail-ed1-f74.google.com [209.85.208.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A2641F3FF4
	for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 11:31:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1753097515; cv=none; b=q25OU+RiOPPGfEv14PNvE8nO0TQHK0CTOkG6p/laRSdYl7KsMcr5KnZQdnn8jm4ckN7gYPw0EJAMTcEeEol5OgTm3IJMNIQDKo3vOIl/7QwV81E1VeExTlZr4K4zQQzIGACfHx0UQG8Us1NVe7Myei2ctecl7KPyFd0be4Scvbk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1753097515; c=relaxed/simple;
	bh=pqgHKupXxYc9eGoaZsvZu/Hhepe/bvqmRLMAf9J/Ln0=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=mM7dhAlyxpU22f3u4J70gN4aiSfxfPzX/jqMfaofjoZ1vCOR3otBrJSthZUZSjBpIuJkv4gOoKI0tw9wr1IjmPcm6lcMiPCNgq5hD7HzZfZAW0fPHQ75kCFRVRyJxG9FYsUSHfBt8aLJU10Q+n08Vkboj1iolN+ixGYm0jcWHuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=svVAO455; arc=none smtp.client-ip=209.85.208.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--aliceryhl.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="svVAO455"
Received: by mail-ed1-f74.google.com with SMTP id 4fb4d7f45d1cf-6097b1faec9so3785962a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 21 Jul 2025 04:31:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1753097512; x=1753702312; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jnCR6M7w8QHFyZar2EB3KK8z/WHsnwV8/M11NVYn6EY=;
        b=svVAO455VitbYjO2IuqO0LkzMwJRlSp86Jd8Y6Kvc3lKUZNJ3lwL02OMSDi7u/hq5S
         wRQAVuAgDIQisTYiNTA7FB29b5Cy3JYL1uzZUXNeHcKruSRlD6ik5ZOeQbNOZFjA2s/x
         ubXdvY1O0s0Fp9fmwQ0t30eSzDkxJf1EEO/ld/uMejB/q+YUZchX/I3o0CZIsndcGzcg
         Ccq2z3S1tGf52fY7M6uIJuhTSyWmJfgADns8RruXoQw+E/8kwhFqNmIipiVcGEUhxru2
         J386hsJYIBJBjZn0dne5pfA1l13KJTJe81IvgJoLoX4FeXhI0PNgO2d+8dop0vDIwaQS
         X10g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1753097512; x=1753702312;
        h=content-transfer-encoding:cc:to:from:subject:message-id:references
         :mime-version:in-reply-to:date:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=jnCR6M7w8QHFyZar2EB3KK8z/WHsnwV8/M11NVYn6EY=;
        b=iqu+dfQMW/vODSSHoP7NBf2n4ViClKsRr+NJH0KIa07L3wpKmOa6Sa9JVHw1QFyleB
         H2Vdj0WkBJsDgJOy9gPYSTxcyjEHrUbO3stiP831NbzPNUH4HF81OFpKCZoUllCz56S7
         +K7V1lGXwNWKBlVHLGEzd4jRA7Ll3rwbOUs9mDlxoan2J62zn5bxju8rpvjuoAC/ANbn
         z3t5DlVc6+1Cuia/diekGrO8E7sazZGBfv+65stAnwveuhO1hgBNza0VuCy4KhylAEgj
         3Upf1mAmjtYolQZPaqdcOoGs0lobg/SAJPi9Vg2Wt8kkhxskaxDGOEiQjwLRReNYF9CE
         23/Q==
X-Gm-Message-State: AOJu0YxIobIdmcRTZqhP7eQi3o7vLl92DsHZiYncMSl/C69L/4xkcChu
	huwRpHpbf8iAXXPsmJg8T4iYeQAXoG39dY0rhdsfr13JcMQ1c1u9d8+JzdcwpZ8YSn3rMurmkOO
	9ArWkWArqlxGpxU+ZdQ==
X-Google-Smtp-Source: AGHT+IG/c8OapuqkABauV5jrGztrxDeWojuNOWyE5PTSR+KhXio6zVHDuob8s26egoJA+WT8enXIOiJYuOISkXs=
X-Received: from edrf26.prod.google.com ([2002:a50:ee9a:0:b0:612:b678:ec24])
 (user=aliceryhl job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:d66:b0:612:9e3b:ff99 with SMTP id 4fb4d7f45d1cf-6129e3c0e08mr9912527a12.9.1753097511951;
 Mon, 21 Jul 2025 04:31:51 -0700 (PDT)
Date: Mon, 21 Jul 2025 11:31:50 +0000
In-Reply-To: <20250720094838.29530-1-work@onurozkan.dev>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250720094838.29530-1-work@onurozkan.dev>
Message-ID: <aH4lJjzZx66BqN60@google.com>
Subject: Re: [PATCH v1 0/3] rust: make various `alloc` functions `const fn`
From: Alice Ryhl <aliceryhl@google.com>
To: "Onur =?utf-8?B?w5Z6a2Fu?=" <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, dakr@kernel.org, ojeda@kernel.org, 
	alex.gaynor@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jul 20, 2025 at 12:48:35PM +0300, Onur =C3=96zkan wrote:
> This patch series makes various functions in the
> `alloc` crate const fn.
>=20
> Each patch corresponds to a different module within
> the same `alloc` crate.
>=20
> Onur =C3=96zkan (3):
>   rust: make `allocator::aligned_size` a `const fn`
>   rust: make `ArrayLayout::new_unchecked` a `const fn`
>   rust: make `kvec::Vec` functions `const fn`
>=20
>  rust/kernel/alloc/allocator.rs |  2 +-
>  rust/kernel/alloc/kvec.rs      | 10 +++++-----
>  rust/kernel/alloc/layout.rs    |  2 +-
>  3 files changed, 7 insertions(+), 7 deletions(-)
>=20
> --
> 2.50.0

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
