Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 405A9233956
	for <rust-for-linux@vger.kernel.org>; Sat,  5 Sep 2026 19:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788635932; cv=pass; b=C7hEN51n9DndVyG3lXVD7dZjGq/gYyEuZijH2Q8m2NFgNRdg1Rd+Werkam8GfGTDIxXLL+c2lKmSeEViS74YgR4XwlQyblmSodnTamUcgbOOHSl/K1bY+dQJquz6D06f2qeXOFHbxZjG0hgJNX0vcQ35ssUDLrJBeHhy0xVwIrE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788635932; c=relaxed/simple;
	bh=1A9tdM4UxvEUDadWxG3NZidYXbKcok5wvUqTQR6GVlk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RvKO0+GTxpd8S8gcUhAQcrVLJTg2wtSkf+qruVJKnSuGUwm6Hq9QKHUqiXWxFvyMCZeCOkwF6kgCc/W+86/e2jV4Pu5aGPpkJWC0+mA72qcnc7SZwnMqBlfbKL6VJ4SKo1Ji8IZh8izv/c5cxPazgVXqMTf+yY5gkRtyOWxNgd8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Q22iKF8/; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Q22iKF8/"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-396673bd281so266449a91.1
        for <rust-for-linux@vger.kernel.org>; Sat, 05 Sep 2026 12:18:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788635931; cv=none;
        d=google.com; s=arc-20260327;
        b=odKxB6QGZtPcl+PrAgRSQUUyNkV590dO2T8ZbjEtoC18YNHGAaqlD+BAvHMHp5clC8
         jIC3+ZHQbKKwM/AjJ+ihbJ4RdLqa90ldEGq3c2MGUjgOTQQllsJh3XQ+bk100M4akS9m
         dYqiuw9AoONH81wIcVSILZL6ZVL7ilL6qm43mp74U1o7GTkKfJF+0wJT30XEi15CwwYS
         3heKrAe0cX5U9OfQEPRyignBajScDVwae0LQacvKqWPRa8Wbh5c4QLrm8YULyTkg50eF
         9DQ1eJevVE9PEkmppIFYKRMJgK79nTiGFIh/I0MrZqm3e85x04Pzlm00zWHXY4Ric9k4
         QdfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=UrMnI4RvZpvC5+h4ZWEpWSIko85Oy8yeuJXFlCAJ2Is=;
        fh=1Tfs4iJg0DqurUA9Ax1qCnDTG+mtedqfbnCTnqi4PLs=;
        b=ArrOgEJd6ga20B/R64Lkgz1gLd3NMPNwjXxyR/sbY2+gEKL7k4xcB9TE0hdftCwwE4
         4XCkVV1FybkUSLluB9kN+mknNhJPixdzyrs8ABjujvq8RdF+TD4F1jsWXziNEiAJ/npG
         CA5oEGOYZRu8DkytPIYey6pUzzpq682qcSG1JgMWNVYCUrT4hV406FA51FpNQE/UBrms
         nxk/E+X/yn30Ir3M6INKwU7h1OFTE0/bAYoIkiC6M5+PTZX+7A6vfA6Ce0AwFxXeamyt
         U3RhSwhDUCsxaRHLhU7QdyWOgyl/AKQoxbqqKMz9xUHi+eoe/maZ/rrytar8FdOct2Y6
         OPfg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788635931; x=1789240731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=UrMnI4RvZpvC5+h4ZWEpWSIko85Oy8yeuJXFlCAJ2Is=;
        b=Q22iKF8/xfqiNmykx9EcWT6bQCxt0wnOrocFLh0rF8/8QAW9Cc+PHcJwgKc0mLMmhl
         PtC38ZHD+LoU+zk9b+aaUPO9zykq9K3Du44XY8BY4BNBu2zHRfbEthKB1xe2Xh3s4lWz
         DD3Shmn/YW72vnBl5qWet0Jlnqs48Lw0NGnmpsOmLdJ++PQw5tueLoXvQ36cZSA2I3Ey
         6Z4Z2Y67L11LKmY+zrvmw/3M0qs/3ka9Rfl+DSWFQE08V9ww3e+P0nnbNnp9FecT7lDV
         99c9dZh55BC6D9QeSuX5hwzyGtq9xoxy7VwGT/fTKflffpW3BrLLDcFzvd/dFULqvs06
         ukKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788635931; x=1789240731;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UrMnI4RvZpvC5+h4ZWEpWSIko85Oy8yeuJXFlCAJ2Is=;
        b=J4hv+B7APwGvRCwIzpd41bBtZapWKOC73juETgY9iRQb35ziiragfkwUmZQ7sE1JuO
         Oi6rbTH3tC0E3XvI8Ik7XR9uVLiH3iYuKcv2wJOkb8XpEdoRiwI4TdNWeWIeyaEIOm28
         jinpu3N/a+2BkLMK5ZvibywzxRVDFThsxWPDQVkouhDpqBZ7dHfxWHmwSEDnFDQV+0m5
         o3oPeR1I4HZTIX7vt3KtqQ2WRGi0bc13iLk7AgFEMmrpih6xalCBQfedUCEdGh9FhQVw
         D3ZzYL7jUyME3P56Xhvd8ynGeuCJB1oibJnbSgPj9vAE1jxUKFUPYH8I91VDL5wQUFuJ
         +z2Q==
X-Forwarded-Encrypted: i=1; AKwUvBy6cGSi1k3FdoEqrn+x8HjRbtLcI0gz/KGzuYovgYeEwLnwVw4w6c0kuQNeUC4AUMxpPdMK1KfnajV/EUAyYA==@vger.kernel.org
X-Gm-Message-State: AFuF++kJmiQi8BzL9IFbLmu6kRCvudw0qG4ELWmdLn0Os7jqEFFDphgO
	fsX1iotfHjTxhuqgad21bFi4H8u12/o8wwVBVW2r40nNY+mxb8zNhGZosFpKr9fGNiBXDhxYP0b
	HEy1z7kfONQjDvvuZozRRqkvc8bvjvHs=
X-Gm-Gg: AYBFou27nwXvFd5tVwRGUTDHZbwRoFKwMQlngNMO49bk/8RUOIh4woCIvwXQHdQHEkJ
	ffdgL+MkU2dHxgKZMXgaA5YqutxY+8Fvy+V8HNb+gUJJfA2cyGZwMGlNxNQNmwJeZXIwIJz0yEn
	kOqr5YaiTttmEVriwXtKqYLegIVt6PqY4ewWvpjZZkyVvZbP/l0qGWsVh94ltzfVPONw3woFL5c
	u9YVsVt42OjqzIsaLosIBvUnfWSK8XHQdVHStrK0BuE+YRt2Arc6SUGL1gmPNFXgp3Cjq6MyYXw
	2++7uiCrzFNirgMzb9s+l1kEww63L4KE1GMBV84jMddR1sz7p7AMekVt2JjEmAqwL3Ga6UsIcHG
	a9lAUt4zjYX47r6vz+AwqTR9aEyWcGZi99vl3P1mq+DpW2hHgWUvZ17njiP9E
X-Received: by 2002:a17:90b:3843:b0:390:3936:8760 with SMTP id
 98e67ed59e1d1-39b3d3db82emr6481594a91.0.1788635930630; Sat, 05 Sep 2026
 12:18:50 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260901-typed_register-v4-0-5552b1d59525@garyguo.net> <20260901-typed_register-v4-2-5552b1d59525@garyguo.net>
In-Reply-To: <20260901-typed_register-v4-2-5552b1d59525@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 5 Sep 2026 21:18:37 +0200
X-Gm-Features: AcwNN1W_ZpD7BnW-6N9vI0Wb1kb0jyPzchOyBf701rQL7ntZoTH7GyzL5sIHsSA
Message-ID: <CANiq72k4NQ6yJByyb73Sy+iwqVc=i5CuZy2b5uRVksA+gkr9qA@mail.gmail.com>
Subject: Re: [PATCH v4 02/16] rust: mem: add `transmute` with deferred size check
To: Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	driver-core@lists.linux.dev, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, nova-gpu@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 1, 2026 at 6:50=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> +/// This can be used when types are known to have the same size, but onl=
y at runtime.
> +/// ```no_run

Newline between them.

> +///     // SAFETY: We've checked that `T` is u32!

`u32`

> +/// This is typically used in generic code where it's known that type wi=
ll have the same size, but
> +/// the compiler cannot prove it generically.
> +/// ```no_run

Same.

> +    // SAFETY: transmute is safe with `IntoBytes` and `FromBytes` bounds=
.

`transmute`

I think we could also link to the intrinsic and the `_neo` one,
perhaps with a permalink to avoid drift if they go away, but not a big
deal of course.

Cheers,
Miguel
