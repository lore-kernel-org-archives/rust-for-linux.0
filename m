Received: from mail-wr2-f12.google.com (mail-wr2-f12.google.com [74.125.225.76])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3AABB459AE9
	for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 08:09:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.225.76
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790150963; cv=pass; b=qda8MMGbnILTMCnno/OZceLj+yzwhvG/4H62grVCGQGONowhArydW5hlbgZy4C0/3Tk4kzq5pFavfEqqU8J1I69EgQx4TBIG9mcFZOhT1BxFNaeP1PSVPTTuE6dVXxKHlHPtcHbGmdSS6jayUPVNo6xOPXU05ZZKp7nTHUxg+Rw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790150963; c=relaxed/simple;
	bh=dpP91akbaFzZC6rOdZLmE8fjblFHqBWnDu8zdizP00A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RkfjQFC0WPL7b7DeiovrgHfBc29tUey17UtgX5tz+m74M/Iaz8WxGLPlBlA+h+tGLnEBimjsoyD1xjW9MqXUdAPc2+7oklf6LMj5hg127Nm12ubQWf3Wi/mRXK24kseL6EV6MsQuQG8I3G6rLvaQn740p1755LH2yfq/LNXlVO4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=DutcuQVC; arc=pass smtp.client-ip=74.125.225.76
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="DutcuQVC"
Received: by mail-wr2-f12.google.com with SMTP id ffacd0b85a97d-4858bc96fabso550748f8f.3
        for <rust-for-linux@vger.kernel.org>; Wed, 23 Sep 2026 01:09:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790150959; cv=none;
        d=google.com; s=arc-20260327;
        b=AIcNYFvaQZgDs68EStDl+reUD1aLEMOQ8z+45wEh2pIEwdVN9Ny8FkU85xe4YcLTkk
         nVWyGkMZ1lkvtFgXmsYbqsOChbas2GfFf4wY0uwFU9HCwkyYlgs34+11erTylNyo/Hfo
         8RcveTcSHFclq1DwnXaPhtHHsUKUbINJHE5GFk/W5nHA+X4ktjKLaJs8PtcF0D4hwoWt
         mhJB/peOpv0dBobXzy45zXvF8QRqSAS/RppiflSou4xfJR4T3mQIjim3QeefUZXHvTEL
         n9LDZ9PiRqv6sdbCeCEWHK3i8dzQi/NHF6wnjMyRpcGUwfjJsMAoxjQeSUnMMDJwOcrV
         uIJA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dpP91akbaFzZC6rOdZLmE8fjblFHqBWnDu8zdizP00A=;
        fh=oGeoAr1LyYSkEb8qpTRSyh272hrNv4a4gVW+ZsvredM=;
        b=QU1THqYuFPiL+V8cY9jBs/lks0SeSwnwjFVhReGuLP7OPzA2NeHqUxZF6mWLWKZTnM
         k/1fXxExeh6leRcuYPKbOCi9x6xr/7+3oex6NNo/FXT16HNhKkye9K4+Hmx0VNYsy84A
         /iz9avClfh2ggLscv/P30+SqOHibSaJ0Xuw50bV7SlrFAYI4IyeADvpuHY/3zvObuJrj
         rWfyB7BqkBXWTRmR/pwGQVdGmrlxFByQQQ2Rq7KMtpND3fn9HoO8xHSD3tzLFiAmWLI3
         b5QcnKkz3EbT1lTgaUY6wsDeHbyK9Ig1FZuwRHinl9mN0+ThJWAEAX/hK31X9kNc9eQI
         pLmw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790150959; x=1790755759; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dpP91akbaFzZC6rOdZLmE8fjblFHqBWnDu8zdizP00A=;
        b=DutcuQVC/HAYeb+HTdhsoWnZc6MI4nLZzEAsHaQM4jgtTA0H+KZfMkn+d//5qIDp6p
         O7YqcHu14pTs6yWkaks9hNRnoFJSrno/LjB1h54g11UgaNxkCe0Lt6xhmageRX4TuLHz
         /qJY+LhC6TBoGiRKvLQbY0bEnIsFjzTZD4x0j9p7aPaCfUNcu5fB5bdN8wuzQCw2NHe2
         5S5+ckq4zszgtSr1UA87QXPRi6MsQtsZK3DM7V1/gKh5jh/ewq9G0CJoDVpd9wmacL3W
         0e+hofqiV+9fDhK62u2rjMugsGultpU0FM1DKqJnkz4C/5oxJj0L4NNmBLTkO4m4SjOj
         /jMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790150959; x=1790755759;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dpP91akbaFzZC6rOdZLmE8fjblFHqBWnDu8zdizP00A=;
        b=yYpw7AT9yGsx+Vqy9CWkl5n/llrvaTcddN/s1PYdnA0tiVZd9w36n289UpI6GiHDlw
         IryWvhik5t1DrG5yLnIoeyfXmaQzC4E/jgloQ8yYam2/wb9At8WNZqksqkEM4d1Up4Qp
         YF0WL7kPuIHoViDkRAJst4Z9HPLmmkum2Q/z7rOGPEnI4oQL9vCk6ZqTQ9O0SMN4q2L6
         4N7HyP6YZA1qKymm3D48l/7ZDKLKoCrgm5Z1SOZM+ImJS0jF22IxC2voIIRe8A0DgVtH
         usmxxqbELZqrCrXJVbYm/WZ9qjSs8XSiXGa92JEFeG8R5H9gafg8XZ75jtWEH5GYbSFi
         F1IQ==
X-Forwarded-Encrypted: i=1; AKwUvBzih1s1HZP9YrbeAi/OLFUcneYDySQdDEwubPponIHHxMzWa3jK1UB49HxeOklFS0G2hoAHVBA2gWW+QEXxsg==@vger.kernel.org
X-Gm-Message-State: AFuF++kX8lEPTvj1UxQoqkalR3E3yHFwwt2yK+oeff2Z643KS9rJPexB
	6jKDowmYsv51hEbSnMoeK4cs0IJtzSQGFMCkDD20aTTZ9SHbVlFzROJ4CSX46ppsU/e8sDPVAF+
	tkyJvBFmMQ05O5q0ARCl7AT80J8bJ3yfyYVzvYT0C
X-Gm-Gg: AYBFou05CebqJMuL2a8iWWU55R553TqQ5yeUjtdrwV9d7tyCn15lLuj6qvAZD5d8Rcw
	fwcllhyBOpQHVTHL3sHV0aK8SXLgcPVn1VHpA3yXmzVNwdDoV4RYGp2KgoEC1EZIMDNSXQSWeB9
	osRNBWYyLDGt1ccBpl9eQzAne1qdVPW/Dev6nBgoWR74paK2cUoNNMQBgims/KZptf+p8sSLN0h
	R6W/fx1wJGrZeM6ADeCWjDQjR/YH7rqN4GEywHiXQxeAK1M+AHKVLE3KQRWfV9YWwovtDc8p4zm
	4evNlZMYpu9SocG5x9klIbTaIjRFVNcVQOsWS4rBhHfbDHHBIdwfwvfOcpyrGUHemdrsGFEC8qP
	6+J/iItdUsC4M+0lpuEvt
X-Received: by 2002:a5d:6f06:0:b0:487:6ef:86b8 with SMTP id
 ffacd0b85a97d-4886709e09emr2505954f8f.49.1790150958679; Wed, 23 Sep 2026
 01:09:18 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260918100016.100988-1-sagartaunk@proton.me> <KZuCCqRjSSbylbLLVhoUD9-xyBpzD9jUB4vGC16N0_hIra8SNxFeh9lEJ6FIMYMgKqf41J_swYT_HVx3w13k0cSrYYkBljOF56suy3gpgAU=@proton.me>
 <164304b3-3324-45f1-8766-536767e7b9d7@redhat.com> <CAH5fLgjBC7o4wt0WPH6xEkQEkOvsjj0ymLq2xAGXoMwN-fZyBQ@mail.gmail.com>
 <_OvWoTp4DaMWPlCDpP6QCis3vmI9jsT_GeJVq8e-7S_FvY5zurx-iRSvWy-rPwHnRGVixK2i7E_QybBBgX4YZVrXfsFbm6IwjmHpBvkoBuM=@proton.me>
In-Reply-To: <_OvWoTp4DaMWPlCDpP6QCis3vmI9jsT_GeJVq8e-7S_FvY5zurx-iRSvWy-rPwHnRGVixK2i7E_QybBBgX4YZVrXfsFbm6IwjmHpBvkoBuM=@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 23 Sep 2026 10:09:06 +0200
X-Gm-Features: AclHuK9QTi04eiS47c4EvijGQ9s3_RK43h6MRQ9Dlx9YnzrxaDKzZpju_IdOlPg
Message-ID: <CAH5fLgjr5p1XMNGwOzigTW+CxvQpfoH8no46RneTCLinem_WTw@mail.gmail.com>
Subject: Re: [PATCH net v3] rust: net: netlink: validate attribute length
 before casting to `c_int`
To: Sagar Taunk <sagartaunk@proton.me>
Cc: Paolo Abeni <pabeni@redhat.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Matthew Maurer <mmaurer@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Andrew Lunn <andrew@lunn.ch>, netdev@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 10:07=E2=80=AFAM Sagar Taunk <sagartaunk@proton.me>=
 wrote:
>
> Should I resend it after rebasing it or would this be fine as is ?

Please resend targeting 'net-next' instead of 'net' and resend with a
rebase. Thanks!

Also, please read the guidelines on top-posting:
https://docs.kernel.org/process/submitting-patches.html#use-trimmed-interle=
aved-replies-in-email-discussions

> -------- Original Message --------
> On Tuesday, 09/22/26 at 19:12 Alice Ryhl <aliceryhl@google.com> wrote:
> On Tue, Sep 22, 2026 at 3:36=E2=80=AFPM Paolo Abeni <pabeni@redhat.com> w=
rote:
> >
> > On 9/22/26 04:31, Sagar Taunk wrote:
> > > Hello, are there any updates for this?
> > >
> > > Also, I wanted to ask is it fine if I keep fixing stuff pointed out b=
y sashiko for now ? (I.e pre-existing issues pointed out by it in other's p=
atches or should I ask the original authors of it first ?)
> > Does not apply cleanly to net. Since a repost is needed, you must
> > also avoid empty lines in the tag area (i.e. after the fixes tag).
> >
> > WRT sashiko-reported issues, beyond be aware of false-positives,
> > generally speaking net-next is the preferred target tree (i.e. no
> > or very limited impact, very old issue, etc...) with no fixes tag.
> >
> > Focusing on high stakes changes would be appreciated.
>
> From my perspective there's no issue in landing this through net-next
> instead of net, as it's not urgent.
>
> Alice
>
