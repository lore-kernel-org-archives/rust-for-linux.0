Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794060150;
	b=LNhBplfdigcGldtnWUcZqllC60gaLoR/d8qbCuCrtAKzTL2S68biimF2ohsOQjZHWt3i
	 M/9/BhLkEAAaUlQhIPns+GT4xvIz6bsYgVO7uoBoks3EgXiYa+95wzPZyKLzdBN4EwtGI
	 B74QTI8NkwlDy3Tc3F7xlqLrGtS5ufIWc4C+PIV3FYdZr81HtTjrBcBK30d9YoQcnc1ns
	 q7ipzisMUD8hdcwPAnEoNioqWzdZElV/cInQMy2BFjcv+SrTyd89Puc3hApeGu1zXqCb4
	 23uNlOnu1GuTS58aus7JsTDV4i4vskHlZMUnVydzjmTWCaydvwaeuZsVkYQxHt1EquQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794060150;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=UBWRI6sRCnfwJdsXfR8+DTAMw8Nima0Z6iOYhkxws+E=;
	b=y0QiMP8SZ58HOA7akRpCmyEIK7bJUSGQ4bMhWvRPBxnmu+ID7ajGuWA67TsDp3cRAGOO
	 xKeUlt7YN5lcQv/obpMGiJAU2IgujzfKPOm+AIjICEEvQ93ENgyiI4vPdr672KclwVcNo
	 s5KRxniGJ4KUJhOpt6zvA8vkl2dsA4R4/Lyd0LkH7i9taMtBlyYyaf5zaxRrgz2NrH9Zf
	 419avK6tWS7gwo+3TwFOf/cPcTQPK5ZHnsn5F8jbtbOTpYNKlJaHd4SADKcTumi7MAwjk
	 9LtXTAt6f7AwayDqy8uGyTuFSpHYdXBKix7MLJz2llfLfUCSRXVjXi07XKe6Y4erQ6w==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N3VbZ2J2;
	arc=pass header.oldest-pass=0 smtp.remote-ip=74.125.82.177
Received: from mail-dy1-f177.google.com (mail-dy1-f177.google.com [74.125.82.177])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB58C606A32C
	for <rust-for-linux@vger.kernel.org>; Sat,  7 Nov 2026 14:02:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB58C606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=N3VbZ2J2
Received: by mail-dy1-f177.google.com with SMTP id 5a478bee46e88-36dbde64409so2140010eec.0
        for <rust-for-linux@vger.kernel.org>; Sat, 07 Nov 2026 06:02:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794060149; cv=none;
        d=google.com; s=arc-20260327;
        b=dbPxwlDiQmj4wgj4ogHxZCkh14F1daCLfq8/QGLJAM7XFpMSR+trN05VPJYswshET4
         YbxJfTZvvkBi5Fw//+7reSfiNJ0v763fBFDa1pDXK5oRPy7i7Rb3YC+voQk7X+Mtx7Qt
         1IazyFFBu1612i7yxbqZANT3HmxZDltQYEx9Q4jvk+mDoUf+qjdC8qgNyZsK2BtWZ3g+
         oT1yJBnSuKIyHPHGgtwK9U6p3IWm0alt8IBa0KahWQy1pIxcbyihxR0rliFcH7SgmUp5
         Cf53hZyOCrNyRyBHjft5tVHYVdC66o8XNqJf1mYKIEv8//AY4ubOkgPLtAduVAczCOaC
         qvFA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UBWRI6sRCnfwJdsXfR8+DTAMw8Nima0Z6iOYhkxws+E=;
        fh=v8vltI0QMUAEF9T6Mlg6QmgvjQpMnxcbc/P4/yods80=;
        b=PVYFEJgRyfWDTwITlwHWtxgMSFZzR1PThbdz0jpGRcuYM//CF6SiqGWutx/18730Bm
         xORpFBCFCuvskFltVfYKEVZibzxUHylKMAzgC9a9+HXj72bX2RxbZobgXpUzMABbjl42
         9/d4pwv9sYKNLTUcEdTyB7bv9tHRimF6n+PTxZG7iLeq9HF5lhR+larrAlapPqiWpz0u
         hp+jFhc1JO21HP9SNvByYylUD9H3FB19zOSaJUUpWUkRz+JQuB/0MhOMg0r8YQC9rRp5
         eDP2n+EEt4L6JI4Ir1wuJRGQ1ifK/5SKaGl0fS0S5wob1P1SFJye6ruTZmTrMLLfO7vx
         WPSA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794060149; x=1794664949; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UBWRI6sRCnfwJdsXfR8+DTAMw8Nima0Z6iOYhkxws+E=;
        b=N3VbZ2J2KMaS5xTWGi7UY2L8BS/0hUs7gKgP3i7BjaacqxlFvZ4iVWi7MJGE1Apq20
         UQv27C2+rc1oEiXL1uReY2CycGLbqBBli+9YWx5aBVrqBDu/vff9CzpsCMo0lkZsuAYp
         mwiZS6J7ZCbc2N6A7RDA/Vq9c6KbUfsiHXHCGCxuEF/BQEAvlWGLGQTm0DYb3xWVzlKz
         2LM7uRZ8TZZxYDGqBvmnlL6+ptEWv1IAvW+Tw9NP6iqKj+SrbgY5pifF70xx3e6Hr+uw
         6f6zCgQD2CLwD3Z8/MtWPfDKg9IuF258vGx9tBzVzzaKeSFoE56/JT6SNoHIYU4/FtpS
         9dDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794060149; x=1794664949;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UBWRI6sRCnfwJdsXfR8+DTAMw8Nima0Z6iOYhkxws+E=;
        b=GTqMWKhEqoUbGCOMFtoI8COyLVVEuc4P4kbk71HSKFjyuZCQZtXLzh2YKGWf0lVXgE
         lyh1S8A4tiLC9DjCl/1gdCTOf+oIGLEyf4vbqvZYei/4FN49tzIzZhggEp1WgznbSgmR
         s0mM07PJLeAcBE+JV27DKc2ZjSFpc7qypOZAY/ONkgwjWC4LRtjMO9SiWOZPn0OJI2Uz
         b/uzk1KogDyyPBUXj9sndlRctOdyks4WkLpW0AhpVAHkI3txBh/z1Pu6omfV8LHBfj4D
         DQasFGiAEottJwpc9w76m17fjSPAkifBy3arP2+Imlwic6cX0UEeKEa7o4DW7E9WOQIN
         O8YA==
X-Forwarded-Encrypted: i=1; AL+hErE9Dt6lws1ZYAJzYxhAqkDYDuNTeJ37cQbuDAMqhzbGtmBaizXtsa8NbsXiWnDG5pWvkRO/QGAm4zz2qPEQwQ==@vger.kernel.org
X-Gm-Message-State: APuU4Z82r9bb+AAz4WpjiP7kl9qGb0vLjC5F8e0qb5ft+uR2Hu3hzRd1
	ZeG4xeHGjAcqtmYXCpWygv5NWjdFIKxeZ0O3wwpmArVms6xLausPUHG8zbYd/F2kBCI9lkHRZd4
	IWUTYp4lopdn6kP5Nk5zhsTltt+6EgFk=
X-Gm-Gg: AYBFou0X+ASKaeOlQTY7K/p0oTaAWPviQn6sL0FM4sGJr6pYbhj3CSjgxJEqSpW2kLM
	/TS8gl8v1T5P95c9fV/7MWNboWc75lYsddMFYVkwV9LxmMZ1cYq6wN6hYbmYOqrY+s7pekaftyx
	p9i4wxUHHZitbLwHc55+ZtlXav/MVBlGM1i7ey4jK3fgMlFsVV6s67OKan+KMq5JvJeGkniOf0+
	Y/6iMSCNpXBTixvyq6gcULvFiQAQ9u4roKKGqnfXSoDblKfmrA67A74I8zRfKDhtuZO1cX9DHlM
	tou5my7xozhS9lV/KCCxhZ0+v1ljM7HSwFxrZb6a/tVF7jSPiQcp3majjTACJyKyNsWivY9WamI
	AK3h0FhtFtAA1Hr0WIRbFoJoOSVBjqwdIknpqDlqpCRZn2USHLPQ7H92x3GwYynupTFJRZObLjE
	I0jyWnyNTSxtSMZzbdcYQFkXu1todmQvQ07eqz4Ri393vlwepPlQXGNYskB30tH8rI55S6WKo=
X-Received: by 2002:a05:693c:68c3:b0:358:8f02:e0ca with SMTP id
 5a478bee46e88-36f754414a0mr8478739eec.9.1794060148890; Sat, 07 Nov 2026
 06:02:28 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261019-chid-v10-0-67de9180b4ed@nvidia.com> <20261019-chid-v10-2-67de9180b4ed@nvidia.com>
 <DMOZVVGB0O5E.1XLZHZVLFYBAJ@nvidia.com>
In-Reply-To: <DMOZVVGB0O5E.1XLZHZVLFYBAJ@nvidia.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Sat, 7 Nov 2026 15:02:12 +0100
X-Gm-Features: AclHuK-j_BUOtjpwGmqXWoxYJLK8ze9j6ufmkDg9fB821Uo8UGX-BRotwpA_pnA
Message-ID: <CABwQupO1Tp2EM=iNq24_9_krZ+6vhvXxQ2TxJ7LUC30oSXJ66g@mail.gmail.com>
Subject: Re: [PATCH v10 2/3] rust: id_pool: do not round capacity up to BitmapVec::MAX_INLINE_LEN
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	nova-gpu@lists.linux.dev, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Nov 7, 2026 at 1:58=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
> On Mon Oct 19, 2026 at 1:29 PM JST, Eliot Courtney wrote:
> > Current code in IdPool::with_capacity rounds the capacity up to
> > BitmapVec::MAX_INLINE_LEN, but BitmapVec::new works fine with values
> > smaller than this and still uses an inline representation. Remove this
> > behaviour.
> >
> > This allows specifying a real capacity of 0, which was not previously
> > possible. This breaks `grow_request` in this case, so change it to grow
> > to at least `BitmapVec::MAX_INLINE_LEN`, mirroring the capacity floor i=
n
> > `shrink_request`.
> >
> > Signed-off-by: Eliot Courtney <ecourtney@nvidia.com>
> > ---
> >  rust/kernel/id_pool.rs | 38 ++++++++++++++++++++++++++++++++------
> >  1 file changed, 32 insertions(+), 6 deletions(-)
>
> Alice, Burak, Yury: I would like to get this series out of its current
> limbo. AFAICT, Alice and Burak are ok with the current design [1][2],
> and Yury's request to change stop using a zero-sized pool in the example
> has been fulfilled by this patch [3].
>
> This series would need to go through drm-rust-next as we have
> dependencies on it for the 4.5 cycle. May I ask for an ack on this patch
> to push it through drm-rust-next?

Reviewed-by: Burak Emir <burak.emir@gmail.com>

For me, yes, it is good.

In particular, the thing that Sashiko finds the panic of using 0 size
with find_unused_id and CONFIG_RUST_BITMAP_HARDENED=3Dy was explicitly
discussed before and is intended behavior.

cheers,
Burak
