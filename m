Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B760E4156DA
	for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 18:26:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.216.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784053581; cv=pass; b=q2uZfB04u31ecsawdQ9A/1x5O/x3+6sslBB966Hq7notYDvCXbY/wsTvmTc5DRz7Gfq46E5hce/Wdha7RFqZrD1KUl2NySj+edbwXyC7l27SEUJi5Mnkutap1k8iJ4yC+56DEg/vNLxx47Ro4l/Dv+iYWPlZ0uTB3HFaMsFTVzA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784053581; c=relaxed/simple;
	bh=CWq1ibkcj9NeNh3SlSdPZImkJeUrte+X5SZJ2CDVQ0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rcufGUaM3NI+tl/CkBiE6f8aanIAOu5h4m13YtNadYPj9QRu+WuZjtkVkwmGfTmErLZJRaq29EeE3QvU7JwGkcLbaB3B2W2Zr+AaasQK1lf979V6DdiS/S36khCsn7L4j6nSJAa6rtxyEGo43vXjIelSoy/4MQCa9HPss6zOVGU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QQB1NvnQ; arc=pass smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QQB1NvnQ"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-384c94c9423so449879a91.2
        for <rust-for-linux@vger.kernel.org>; Tue, 14 Jul 2026 11:26:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784053578; cv=none;
        d=google.com; s=arc-20260327;
        b=V4xeJV4AVgM08WO/5iSqpKAptCd+FGX/tBDt4yPpgszrk0RquHjEetOvxwuV8y4w3j
         OMDvvkdiloFUI3OhDjS/VX97Q7zLqy/YrXyjWtS7WBu6tZVuB7nC0gTwYXrHu9snE4pg
         HksA6VrZFQyxDcvIwHsYWGaJ+EH7Ly6ntCZIffajypz8P6lxHmHGaz5p2Frd75xuGEv5
         rBa9vpNCshNjl2ow76wjzGa7FzKQZffr7iSKHQgyLQzsiAEH6QAsi3pvKi6bjWblBKL3
         hYYPEYHLzbQtc84xOmvY/pezn2jMI+jevUy7ZoXhwRC1KLaPMBdlHtM3WBiT2bT0uS6w
         7Z3A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HzKy/eaLdYaHeQ6eLLxXRwAK/vEaoF/CDff/5uZfOBw=;
        fh=OLXAKqAVmnTazXAoiY5JIz6HSnz+zNplvSy/LSFLrIc=;
        b=id5/6x9R/NyPgvxXkQUYxn8upd45mW7xqeIPpCKxy8vXeNq4TuCHPhI8HBjLVF7LZ/
         /jAHqYjqWUht8spb5PztNZHBspQearlYe6sdG2AFmwbo2dNdFQUvF3aXi1TzfUKNlKr/
         UZqmSxKbl4p8MOJDrO5Rpb+kxJzvosY9AXmVxUk7FtMw7Cy8mGHmllMeL1glPMcB8HqT
         MoGXAEFOAwl7mmwVXjxPmL4CJ9gZ3k7YcnPZLXIzrX5GpMChhzh+D/Gc6QPa1XN+GFTd
         OQHBaoKEA8Tsr4acbvUCuFYuqFWTv78Bk5OfF5PGJlEI5+ykxBvBgrlFL5cve8+aR500
         h5mw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784053578; x=1784658378; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HzKy/eaLdYaHeQ6eLLxXRwAK/vEaoF/CDff/5uZfOBw=;
        b=QQB1NvnQWvdbgi0UvEE7cRhOhcNhdmTpbpPaPej1CMzbRBCApW9+vuZYpTIgnuoLpm
         ZXf68huGVIIlynGNN1f7ddRhhTu2NwH6yvwRbe3EllcBkpFXVGR/QrPj7FhFAg/wHNl0
         /9LGWKzytVSm+6zhnkhldnMNsIW7/LB08YaFA2JrskCgp/ePqVLSq61f4XTpAmlAl1ey
         LPqmBEHSUwpSq/c/H8z1soR/AR0xy+nRkaGxqj23r1CSLQyDI/i3eh/ChGSlrFz88iuT
         XQ6VhVppO3zlMkgRsoT582J28buRblJGemfiCRLRlm5o0gvEKiSYH5w9W16qelSTFCbH
         4hew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784053578; x=1784658378;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HzKy/eaLdYaHeQ6eLLxXRwAK/vEaoF/CDff/5uZfOBw=;
        b=b/KPE1imvO7XwgOkMMIYTyYEvg4DZa4cnI/s7PJFjY6TJc3mhJMOmWLqGN0iMapiq3
         oU5Aazlt9D3/8q9g/SsB28Cnbdf6rchTh977xtEuZkD2qQRmHN6ayK+iBVBRY34TI6V8
         r76h+y8tcJ8tPlMdyloAVKQI7yF4YSnZn3WYGU7QcYxiMzg5/66tkYOQ+0PKeWFIkLm1
         lO8M4aHGbRnmKxrjF2VAJLCBvs3KLCS9oew1wWmEdmoCHZ8/tM0YbgFO3ReWx2MJYiR+
         viDBR0ITr8aRs+6Z099W/6PEHSY3zHst6gO5WnYSfqqkVGpUs31BBRHOsEt3PUr7fXMQ
         DoZw==
X-Forwarded-Encrypted: i=1; AHgh+Rr9X8Ozh/rwqwknIKd3LWpqqftiES8fs7OVOnKkhOc+OVtxbqjd79htLGGJpHx5HUpooVpd5en/5YfRxPzxlA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxoCJtyxVmpXLWHzIrPchg9i0S7zk1Dn+jrguris3/tLdbIVM7i
	Wr8QA8Waq7GhXDwNSJSJJ3QYe5JL4i3bhKRSeEBQkBuAcam/6scLDAD3MYNCJNfsHSYaq9N7zEO
	8wrjI8lSDS5xGEcI531O1dekcqOiyz/0=
X-Gm-Gg: AfdE7clFiDXDUSncSKFrhcAZs+Nk1ENu/ePDyWe4YjFaMLbPis9ExeUdITLa9++H6XA
	Ume7Q3bMkrXqFjpWshbLCEdnMi7Fbr5PUOJ5i5jh0sDpuZSVkR1lEroE4NdmOrOtTtqhZ3D+yIb
	SU+2Dwv9UJ+soCsl9rOZvRgEP+pI4PX6Gf3o95f3tm3+UES5nLDyS0HICFtmSqKk2wlmVf6BYHm
	qB0OB0scbB3SxtUJuKBITMQEI3kIlEVr2Db46Z3dD8Z89XIFLh7qDZP7xmZl2lLKe3L1WcMrY9I
	Ly8icyYfP53WmGclscZV5cvas72fKbssXdWxJwYiB4mf13oqJRIEmYb4eJRLfav792XdhUCnqie
	B4ReQFxcThGWo
X-Received: by 2002:a17:90a:d408:b0:381:2d9a:447b with SMTP id
 98e67ed59e1d1-38dc7b31c40mr11110380a91.4.1784053577592; Tue, 14 Jul 2026
 11:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260712-urb-abstraction-v1-v1-0-9fa011634ead@gmail.com>
 <20260712-urb-abstraction-v1-v1-2-9fa011634ead@gmail.com> <DJXH4JLX4CES.11S3IZ1V2FTHF@kernel.org>
 <alVEUR0JrF1ga3S8@pendragon> <DJXPS0HY54SU.3JEDTA04V8HJ0@kernel.org>
 <7e6ebb5b-8ce0-4114-85d6-98cd11a3ad81@suse.com> <DJYBDUMUQ43T.3Q4ZG0FL76QH3@kernel.org>
 <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
In-Reply-To: <fe12ec76-0f2a-48bd-8fd5-9b94b2600718@rowland.harvard.edu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 14 Jul 2026 20:26:03 +0200
X-Gm-Features: AUfX_mz_aRz7cY4MbeNoQZxVf8UF06_0oMEjEGVSK_wjJBa5PsYJvfIZ139w0Fw
Message-ID: <CANiq72khD4Uj69eVd2eGUYnhdEVyka6g7kQgv7-CfMTyv4a9DQ@mail.gmail.com>
Subject: Re: [RFC PATCH 2/4] rust: usb: add usb host interface and endpoint abstractions
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Danilo Krummrich <dakr@kernel.org>, Oliver Neukum <oneukum@suse.com>, 
	Colin Braun <colinbrauncl@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, Mathias Nyman <mathias.nyman@intel.com>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-usb@vger.kernel.org, linux-media@vger.kernel.org, 
	Colin Braun <colin.braun.cl@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 14, 2026 at 6:26=E2=80=AFPM Alan Stern <stern@rowland.harvard.e=
du> wrote:
>
> I'm aware that Rust has separate types for pointers that may be NULL and
> pointers that cannot be NULL.  Putting that into the language helps
> prevent a lot of bugs.  How would making the language be aware of
> whether a device is bound to a driver be similarly useful?

Generally speaking, different types can implement different methods,
which allows one to restrict what functions can be called in certain
cases, which prevents bugs.

Similarly, having different types allow one to put different
invariants on them, like the non-NULL you mention [*]. In turn, that
allows one to design APIs that require callers to pass the proof they
have the right type.

That is, even if something may be exactly the same underlying data
structure, the types being different allows to disambiguate this.

Otherwise, you may need to check or assume those facts, without
compiler support. In some cases, if those facts could lead to UB, then
it means one's API may need to be `unsafe` instead of a safe
abstraction, which make them more cumbersome and "dangerous" to use
for callers.

So, for instance,

  https://rust.docs.kernel.org/kernel/device/struct.Bound.html

says

  Some APIs, such as `dma::Coherent` or `Devres` rely on the `Device`
to be bound, which can be proven with the `Bound` device context.

And indeed there are methods that require such a `&Device<Bound>` like:

  https://rust.docs.kernel.org/kernel/devres/struct.Devres.html#method.new

Then the person implementing a safe abstraction can actually rely on
the fact that it knows those facts to argue certain things -- the
compiler will check it. For instance, that a call to the C side will
not introduce UB. But you can use this to argue for other things,
unrelated to UB, like making correctness arguments.

I hope that clarifies a bit and serves as context for the rest of the
discussion.

[*] By the way, Rust's references guarantee way more than just not
being NULL! Not being NULL is just the "easy case" which ones can
dynamically check in other languages anyway.

Cheers,
Miguel
