Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A27E037F75E
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 08:42:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768380158; cv=none; b=mp9ESfM0Oot9F1oI0sImelqFjGiDZTGUVf3xpxlf9+e386kHBq6TXD2+DqpVMq72sIk33EbJFuxOJ7v86ugKqTDP68/8SGDtNOxpjnmJoT00Cajdb05yaiYcj/Di3hwtIVlwjsq+JeWtQEaN7ZdZ/vCGae1OmK+rfjLoSVaNb0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768380158; c=relaxed/simple;
	bh=IylMYC1rn3qdbtBA1+7QdATVBJ9fBDdBhG86YMJLkF8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XmwqDLSVDDudTCzZNEDFokNGPVgj8rMZVvh5HsVXKmhvEt1bthEkZ823qj2ZskltRkpZW/78d4SOs2ueDB+usxaKhaSle1Lqa6A2s7aM0qMfz8qu67o70JUXui8XexWNl7IarwK99o/F38MeBMuU8IhzWE+dy3KAnKVrIrhM/cU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Q2J4omnq; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Q2J4omnq"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-47ee0291921so8947935e9.3
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 00:42:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768380149; x=1768984949; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SGIbMoIGukZwgQ04tnO6SPLAePwxVHW3krCKo+yvDZs=;
        b=Q2J4omnqvjJMYaAqpJSMiYIqYxz4Uc2VwWjeFHv1SDD8ssIdK/qKvA14TOWqRVvMd/
         g3sMeXRtf/3W/TeJr2A4vADnkzSINwqZkJFemRXOZrrT8C7yGVfG2iuO1JXqJO8JcrH4
         aEjPn/nKOQpbAZ/3qgxtekxxPjrsBnKVa2I2w4E22ZcgobjfdaX654pzytt0j3K2tFt+
         i8qBLSiQW80z2ANcrNXZ9S4bWzkDeQ7IPGbap8MHw0vWQIRIRkAM69qVRL+Sp02hR2Wm
         IBTGHj/HwVpE967A3PZjElf2wh2ZF4Khr21TfEbjJFTkqn02LoXZwLru/g/txBidCjkP
         b2pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768380149; x=1768984949;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SGIbMoIGukZwgQ04tnO6SPLAePwxVHW3krCKo+yvDZs=;
        b=IAFmejTOuO02aWeidxbaSrSS7uDnRdz5Tv5FbImSjG04fSSWsu9OLYAq+W0ziNKjqK
         dyNsOd4DhITXyfu575Au/zo2zhQH6Ob1XpjdUesuD1r0rosojdhnA1118AShkf924OFz
         43uA6Dar+0h2J+5A21imWsODqDyKV/J66IHM1ub2sZgtV/7sdDpE2F2nLXulXkQKQTVq
         OHJheti6am16gYpeR5I5Ix4URQ5ssguu3h1+kAc72/bqoGJAMvIVeQapaxmpXKukCRhu
         l3+sJAWhCNKz661jERv1ZPvrTSxlykuyNeKhgmFC+1eRd2vh3T8pntAS6nOekuIXeMgv
         p2PA==
X-Gm-Message-State: AOJu0Yx9lI1zt9hB/RysVjCmAPpRe4VPfMUbe7z6mtHWxjnGXlMjJzyj
	0A/alLdzRge2WenIjdeXjeF6vMVZl2vzhrVNP0TleiU8dpXaW6dqFiohPPK4US1woYd8OwaEUvp
	MRqEKtxUTLuBEnskj/Sjs9cODbFybfL0KCPjr++a0BqiXdow5/0K8WCGx
X-Gm-Gg: AY/fxX7+rdyEBNKShEWbUJ6hRMD5RnBzKEmcniE6KVgu91mZLm1ENwfS2npiGktwpVc
	2WLkNGL9LNM6f9y4LIWidD9RQZQl6qFS5nInMDfHLf8OcUimd3hPwUiXFwRMd7dWqt3HyIyQ0pi
	Tq9BrDO2LIUgQIdDi3fE+ktxplcY/u9PZcQ5uPznZ1NHFkMjDGNFqKQqOUF2D39EAFe7xlIJvNw
	+f6M1LLnVoN9ettrCiqZ3AlQHmaFJAaA5ioZQ2TR03ZxUeIy0YXDZb09XVGsrrHrrYjRK90hzzB
	Q7CGKyDNfx+IvRK/v03rVQAU/3ELPaPdWRhbkx5Xa2oJExaT9fzOZJs0pJVRVVcDVks=
X-Received: by 2002:a05:6000:1a8b:b0:430:fd60:93fb with SMTP id
 ffacd0b85a97d-4342c549ad8mr1860429f8f.32.1768380149026; Wed, 14 Jan 2026
 00:42:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113144547.502-1-work@onurozkan.dev>
In-Reply-To: <20251113144547.502-1-work@onurozkan.dev>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 14 Jan 2026 09:42:15 +0100
X-Gm-Features: AZwV_QhKo8wY7uneGgPO5KPVq9W49NFaMHaciQXss5mFI5jyoY8s4OeqXhfF3jM
Message-ID: <CAH5fLgi_1H2otP-Ha2OZO+h7_7c0kHfF49aWi8fNZLb0q5FSYQ@mail.gmail.com>
Subject: Re: [PATCH v1] rbtree: reduce unsafe blocks on pointer derefs
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, tmgross@umich.edu, dakr@kernel.org, 
	yutaro.ono.418@gmail.com, charmitro@posteo.net, borys.tyran@protonmail.com, 
	daniel@sedlak.dev, tamird@gmail.com, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Nov 13, 2025 at 3:46=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> Refactors parts of the get() and cursor_lower_bound()
> traversal logic to minimize the scope of unsafe blocks
> and avoid duplicating same safety comments.
>
> One of the removed comments was also misleading:
>
>     // SAFETY: `node` is a non-null node...
>     Ordering::Equal =3D> return Some(unsafe { &(*this).value }),
>
> as `node` should have been `this`.
>
> No functional changes intended; this is purely a safety
> improvement that reduces the amount of unsafe blocks
> while keeping all invariants intact.
>
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

One consequence of creating a &_ to the bindings::rb_node struct means
that we assert immutability for the entire struct and not just the
rb_left/rb_right fields, but I have verified that this is ok.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
