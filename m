Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27338242D86
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 08:21:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810881; cv=pass; b=pkjCkMRR7i5C4nrK6YloCyfeVWMwrCaQL9eV3AgluK0YuZzL+F5tTxIILk26yOWoQzwD3w3559xnX0NWmR9HkqMDwnLwnTB3s3zCqSlCZOoH+NbjZmV78IYZAA+5pAxQ7JtVeHlDOlYmLQvZEjcvfGg60dtdy329EeZvE4QkMts=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810881; c=relaxed/simple;
	bh=6Jw6O2Y8FEIAsQYZlCicJ0FGIIzSyPIibDTscb9fo+c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Wu88/09FPn4pXPES7h1NVgbE82zXaYJd4GjT4+OM+ylRTFYa6aeUXql1GjY7Zs2pofiddTTQyg8p1wmRg5psn8RyT8sEWt280+UtSopPszuwdq9+3CiROtP/gkC+vfPP9eGav4mlKfxcnJmV9LFLFACrN8e38DrRpIESKG/EuXs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ap6wZb8g; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ap6wZb8g"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2b1769fda0eso414783eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 00:21:19 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768810879; cv=none;
        d=google.com; s=arc-20240605;
        b=Sa6mV3Qff2MTmPpxfT1KX5QCidu8ES9NtrFAAHA1rkTK+As7yoo/lBcMNehXK3kU06
         M49jZdBl8iQ84I+oIn/7n87T+rXCeUGhySKMVff6EOeD8uVobGL45Asv0IqRcObp2fsb
         O0smcaLjBk3svbrUaOL9uNz2UXJPvWh5oerpFY2qveCMX2CPnv2wxPuyhq3duPmII8rb
         StUkp+xw3WrVx1BtgVI8iytrShHSMXJ2384MUCMr+HTDO7NnkH7y3kpWWCkqdPosD89s
         L8cESJMSafRbNex0Obo4Y+YBV6Fe3XTzk3AKpgKBlb0ZrI+IQRVSAH9Yz3HrXmY6Nbfa
         tX2A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5PjDqNjfT6R7tnQfbmNwD124LgByEAWqlI+mO3DXaVI=;
        fh=68dwsI2Q+H8uyCs2GSZcnqp9X+F1YJeK29xlHfQqm+Q=;
        b=UHpRTDzcbQBKIrve6ot8ZcUQI8LsyUC1fa+bhw1cR2YiE5hiMkAz9YPf5kB8+C3t/5
         HSEvMaspKe6BiyPtTULxSWdtZBIjfP4oZrXoimN7XI68yXtPtcd5K4+2yduELpLT9HDV
         SHvERtKBE5lMorKbwlq6if/HUPA5/cP6/8/b2B2UVDDyupvqEEUCE/awE47mGHQnvfcG
         Hg8XGWtxheimr7D5P8OwylTLUjD0NvbxlkaX09oPg/SV/NnQ0gZhs1mpknBnHyzUZMff
         hRFd/NT1zRUUTKyP5P4BrlgcE7tSOoS5SUtxKIy6RbMKfiJwQ6cVYvzlnFJsIiWEizSq
         EStA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768810879; x=1769415679; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5PjDqNjfT6R7tnQfbmNwD124LgByEAWqlI+mO3DXaVI=;
        b=ap6wZb8gAg4XXLmSxbOF7kQZOLHCEUrSsEQDjfV6QKHKIOkvfhu408us49jGe3O5fa
         heCzbbTdiwiFtHNC0oONk9w/1yhzaWcq7S+1AqwFhqxnFNMDtQ5Ipv0lHo9ku13n3Jz5
         VTRM36NHOUDtvE3rMZgTnUirzeV6iAMeXX9ey5AWmI2T2rWyvpuk4huKxCMdX4xKts3E
         Cjt6+vg61B6/ybPaU5DYlcH+uOh/ogqPEYFmVuijo0HDk5RN/kNDGGqwu2Z1T3pXXHcj
         GvigoWQib1GjIHBfOXV73Nca9oT3IGib7v3UeYYQk1etyZBSRljJQmGNDSb+G3nDUbCH
         R31A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810879; x=1769415679;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5PjDqNjfT6R7tnQfbmNwD124LgByEAWqlI+mO3DXaVI=;
        b=toagcGeRdYPODmA2WCFBCEWohJ0Beqkl6CKALNahFgRMFgnfMXNQfeYqVuikXMfzXs
         Dl6kAa46cyvl/hEkpGeczdUwpcbAtROL1eRrprakXZP2C9pjn4BTuoCyzgZ7c9sTCNUY
         kTe2cr9Cnw/GBNixrl2ttpeDH3aXSEHtPhmYBAb+5l+BPBvNaqigPh+s8EasHxTB26o9
         9WwevqG8SDUmh5iDv2WAji8HiN73lRNAhGlQ5lR1BQsgHGtVSDCvLvXr4vNppIDBSuQj
         +iACONjdn4BqN7SQPHbJYfzEg0KOwchDr3AYnn8z4X6A0V+ENMxiDa5/E6B9aNe6Qcvy
         soyw==
X-Gm-Message-State: AOJu0YxTyZGYdjOneB+4bBdxU3bxuDFN8CGbAHlShjPj4gDfeiwsRKdl
	YuRqWGLHy5ixwIDHe3kSSegc9BL+AiFhEBTpyTeZwS9fk8cXUk9lctypdHW6KVWOavwASOLJH3Q
	WklZBWDI/28XSRZiAULSkjnB08MKtaeA=
X-Gm-Gg: AY/fxX7GBGxxlibN4o0REwnzb6zlF8TsPFyHcQAwmyEE2Alk2JeIjuDdbrJ+/j+6eRW
	pEW8g7eGV2SYDYi0ZpdG4FPqAwjkNb9pW5dcdJR4v0MO343K5xiPUMLMQvfKq1UN/JeyFfBBBuC
	L+Y8YIvOne47+AqlaaEuD9JtEH7x7mZB3FmlUduDKo7uAFI7GAyMcuRy/6SrnWOhVBj9iY/kI8O
	nmZ1PEx5ixlxYKLvClVgF39o8Sd9hsAUrtuoYdf2B9x5paOmTscHXIpcxxi4eBIdxq5rBamSkgs
	Pm6eQ3acx8b9oin9g7x+0WF7g+9WPS0GXvANawOgVkvgzyGTpIYncd94V8rDar1Fc4cqZi4Gkuu
	TbVorMfQG6EL4
X-Received: by 2002:a05:7300:cc0a:b0:2ae:598e:abea with SMTP id
 5a478bee46e88-2b6b40ad7efmr3396432eec.5.1768810878971; Mon, 19 Jan 2026
 00:21:18 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251113144547.502-1-work@onurozkan.dev>
In-Reply-To: <20251113144547.502-1-work@onurozkan.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 09:21:06 +0100
X-Gm-Features: AZwV_QhQTN8SkZbPl9mnO9cfsET0HKZBWfwkZJS4jMIQxLMKpXTp5Ju2T4hOQ7k
Message-ID: <CANiq72kZzU5gUnj=Li1UdS0qCbroDXr9-mnNhvTBs88rYVai_g@mail.gmail.com>
Subject: Re: [PATCH v1] rbtree: reduce unsafe blocks on pointer derefs
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, alex.gaynor@gmail.com, 
	boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, 
	lossin@kernel.org, a.hindborg@kernel.org, aliceryhl@google.com, 
	tmgross@umich.edu, dakr@kernel.org, yutaro.ono.418@gmail.com, 
	charmitro@posteo.net, borys.tyran@protonmail.com, daniel@sedlak.dev, 
	tamird@gmail.com, linux-kernel@vger.kernel.org
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

Applied to `rust-next` -- thanks everyone!

    [ Alice writes:

        "One consequence of creating a &_ to the bindings::rb_node struct m=
eans
        that we assert immutability for the entire struct and not just the
        rb_left/rb_right fields, but I have verified that this is ok."

          - Miguel ]

    [ Reworded title and replaced `cursor_lower_bound()` with
      `find_best_match()` in message. - Miguel ]

Cheers,
Miguel
