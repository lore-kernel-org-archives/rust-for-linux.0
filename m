Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 98DA13A872A
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 19:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774986269; cv=pass; b=OLTI/9CNNr1Xbr7zVPnauY0HOX+vJvrVYVXiQo9NpmTP2q3iQkvBd2PPw6rZo9CvZYhrvfh3XWegiofsKO8aXIVl9gl42nJOD6jIGagaSjzrlJxYJvN9JOn6ZG3nlsOE5E6qHGX8g4UgGo4GaMO1gdJF06YtDc29TDM3ZDowUYk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774986269; c=relaxed/simple;
	bh=u4JKju0acB+SXsrHFzjnXFd0ov4WfH+9UZNblDT68Fw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m+tvkVjIsJeQ4bx7HxJyoYku57zOHrzuW7A51pEtOiyABekVZPOo+7Vjf7XLMD3VSOtKIWewAzy7PRyrY24gR0iLB0PI9NuOT9VhJ10oIcgjKNv3unO/mzr0ILthfxNyHNZeoBmT76DCg6dRCi/OX+jVLTeQFJH3KT1IheU9apA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=tJS7rkDF; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="tJS7rkDF"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-124a7216c9cso391789c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 12:44:28 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774986268; cv=none;
        d=google.com; s=arc-20240605;
        b=J8Ad11/quaVDcKz02sfipd1kVCY2A1FGRXxgeMKt9jSyIrPfR/Z89mOL6sLPKTZvOD
         7yWiOLHOpaAmCcjVnMqHRRO7rESjQYSviTTkPKE6rmuAhmyAs0xiOLKMFu576nzfSUWT
         FzDHNvIEmVzbWMZXGhdUMy45jvXy4PjUPiSVO6F+ydEz0BE3OcK/x1ZPsLKnKlzZLWQ/
         ThooVJ5wnWArtUFeeFTCXBhj/ahqJ+hEG4hiFCXtC19qQ40fVtmkqnp+lxNc+fSSvrkq
         2ldwPErww0o1SIeDYQpBtYfKRUo29zOVj/8vYODvosbhKYe7QpyGWJG/3YNch3NU1sx4
         t2DQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=u4JKju0acB+SXsrHFzjnXFd0ov4WfH+9UZNblDT68Fw=;
        fh=atPvNl+Mbn/INBNZFxEQwlkJiMVtmQQAbNfkhpcgbLg=;
        b=Vs72g3M3sDCneSCMK4T/XbVDvWwISE9lkeBJceD6ZHO5qzhhEK/+TFx98jYL3xoX+C
         hj0cqr/Y7DbEgiWJcvh/Fb7Y2V9YuNANgjMH7dyGVCrJuGrnRGuZoZZOuPGe7Ltw7ccy
         bPxhx2DhWSA+Uk94CYMl3rt9zWyGsiNJ2CtLf7j7OtBaZKHFi+cAK38bYtt9tJBJvW3H
         JpsWbLGO9PxKP/lcu7fNHgQz7W6a0e6Aod0PtEOx1cwV139WZpmX0Q1EkfhIo8myXq+O
         orLT+oKJrATCo+eJlm1PqxgyRcxIr8+8g0gIWJ3nyFheYV3pfoDF9+AafOEoNzNU9RAD
         3zFg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774986268; x=1775591068; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=u4JKju0acB+SXsrHFzjnXFd0ov4WfH+9UZNblDT68Fw=;
        b=tJS7rkDF8XO+tQDDFvZB/HhdbCPzzFFKC2LNxra2CoZ4UPkf6ROauKYOj0aEqZOPlD
         78wB7HWGd9IUXBc/qrYsw+3mPQkohXxeElU9+Pok4fkICvyCLYNjbU4Dy/bCam+GfvgZ
         512MbnU8fIF285Cu/T3Fdymenyul0GgVia5qwKersASEgFPRnmIJR8yaQYLnqcfC9viB
         FJZYdQXONK1TSKwicfSJt7WIjg1auOk3r3GRYn98gJgmcjreNuVPDzQDZ7E8L8zwr9iV
         k/rTFLv75VhxOH5lK5BzSXu7dOG8xBN1BdSSBOek2ceHSj61VhINobHhcZGbyM0DJCGK
         Z+cA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774986268; x=1775591068;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=u4JKju0acB+SXsrHFzjnXFd0ov4WfH+9UZNblDT68Fw=;
        b=Ikwa6hrvoIuexPo+bsJJMok6hvkTdul0T9+RW0ZqyDGRgNGXjodmpfCGjWgIOXgiQw
         8bEwzi/IzLrpFBLB+ABe9NhvLKXXksCbGrzF77wWoCGOoRffuM7NYipRwDsmN7mebbED
         +TUduNgomcWtl5L4FrNRwFUXKTFUy6ferz9fkQzsrFrCQ7lpUWWRSdVCDrz3xR10zXRO
         vmB7BxOVDMtlh/mPYRaTnogpgZrHidxJIWAOSJePcp7XYAXWNdGLdtuyPo1gg9lzHoiF
         eld4AN8Bg7hXKrQKD8YzZaDRCfswP/EnZFImkLh3TVwMmEGa8PArTCRmAIGDSVQpj9hh
         d/VQ==
X-Gm-Message-State: AOJu0YxdDg6lztPeFqo3zmfZ+Veo1lzpOravlZ+/jMjRB9HssS/bv6Ea
	SnqzyCoSACQD+xlcHhQaVjDY2nGgVSgocW39piAfkibMq701bxNSRWOaZewYaOl7JIKv/1WTgG7
	jMsr9JdAsXHAjNJGl0OI6WJl1d+4yAbg=
X-Gm-Gg: ATEYQzyuVze0BTRx7/WIMOs4Fe17UaTc84np+tcVR0ZAfQr7NWQil0/iZyl0pO5NRaE
	h/AB2PCwAqkhc97n2v9IeAtRVMaRqpHD/a4SPWFw/LNqc18FVyj0yYAkrQZVOsFEWsf0IbsNpEN
	tUZ4Fhev+nsuYjS8liU+A9+dNZTumaUXCzuzOw/KdBebT6Lg+RCFvT4l7emNIe4zAQ88/RoRcNF
	Qxh1nDxWRFCE9tZsihEbgrkuuy5YBLB0y5XF7FCuYG+lWnUiI9fFIB3pg/aVT2ff/6fRNuBceFm
	n2fYiFIU2VavfOaQiisI1VbGk9zJ+wNQHeCq19bSInHpsTrYiR7pxB+4DUQRxW2niRkkVouy/on
	dN1Z51QQ046bMWki4BaKsVVQ=
X-Received: by 2002:a05:693c:2c97:b0:2c7:2cac:8162 with SMTP id
 5a478bee46e88-2c9326aa500mr136898eec.5.1774986267671; Tue, 31 Mar 2026
 12:44:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331190308.141622-1-david@readahead.eu> <20260331190308.141622-11-david@readahead.eu>
In-Reply-To: <20260331190308.141622-11-david@readahead.eu>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 21:44:14 +0200
X-Gm-Features: AQROBzDra5Ol7KfVTw8AKyid2Am3zxHICOSBmEP1M_M294ESl6iLWj3k55SgDeA
Message-ID: <CANiq72nYv5X135eOOdTnM_iKY1gJe2gJ+FRd21FKMaYZYaPhFg@mail.gmail.com>
Subject: Re: [RFC 10/16] bus1/util: add IntoDeref/FromDeref
To: David Rheinsberg <david@readahead.eu>
Cc: rust-for-linux@vger.kernel.org, teg@jklm.no, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 9:06=E2=80=AFPM David Rheinsberg <david@readahead.e=
u> wrote:
>
> Introduce two new utility traits: IntoDeref and FromDeref.
>
> The traits are an abstraction for `Box::into_raw()` and
> `Box::from_raw()`, as well as their equivalents in `Arc`. At the same
> time, the traits can be implemented for plain references as no-ops.
>
> The traits will be used by intrusive collections to generalize over the
> data-type stored in a collection, without moving the actual data into
> the collection.
>
> Signed-off-by: David Rheinsberg <david@readahead.eu>

Cc'ing "RUST".

Cheers,
Miguel
