Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7A51F418F
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 13:51:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.182
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773150679; cv=pass; b=JoTJyFMbi4XyC8V6h3WrlZdo/d9csdhWS6BTLJZp7iH+upmwqrI/Vq5ciWj7kxPXF8bP/yoE0vo46dOKS7qASzTbWirgQ7FCJsbWqqvB69TQv4Xf2FrGGyQApoMni1b09LoxfUog3u5SaEdInGtBNsLzPiHGP0f54zP8NAkGouA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773150679; c=relaxed/simple;
	bh=kq9g3m/12vNty827AWIOzbKm8qUmgB3cA4NKu2DHEos=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=S/oNVhTAgkFs4I6OnK8G4T/MTSf4k6XjUj3fR/AzbhonmyBJLygJOyMPL4gaHWTB05ZMwobjdt5eEIXvDA3kUIMwqdw7TcdQPVzrdA3rec7T7pDPkYBXGBjdXKScreR59l+kvAiqW4WfNx3W42DhUei/y3hZkBWvq0qqZUREaV8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j6DKQIjZ; arc=pass smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j6DKQIjZ"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2bda3b4318dso83782eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Mar 2026 06:51:18 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773150677; cv=none;
        d=google.com; s=arc-20240605;
        b=bA/Xa3MRRPyI1W+uJV+BNjhWP/QcHZV7EsBzXy9LrzmWeFN4ldumvchmQAs16lgajv
         81EmP0rJVKkTukj9kSQ1d61PYXWz7wKHIlD/73pxN438+tK6FOCkBbs9WYGGLYtstWCH
         mnTs9BhtI/ctVqFSxAdA66H/DkFy0QLP/2/kiIcWvt2IRFtNnAPCiSg4xrpskqbKV6jm
         qw2Bh9QmVo4d5iXr62Ru0HIou4JEtoCTN6PNHxQ1Rq2FeL8+v35DED1UkGUYln38/Qg1
         p54AqfDp9V+FHWZcfVip9qKjfbP8p824SsMWsKihp+q8JKWSlxzjcceh6icKURonmS1D
         Z5lA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5Asj+a2M4Lo08vf4IoK/0oU/o9HvxzRTplN0O/sLVhc=;
        fh=KKPh/D6u7qjRCvsmszyYxaM+51Czo9nedBpoXHyRuLM=;
        b=GXxtZ+uYJiqnb4/PHs+8fMZSvdAuXgFJxxM/c3DB1t0cX8FzG1h9fXlgiF7Qugxguy
         sGTXFtjTSoL3ZPv1zDdCYT8zY5cAcR7RLyaM4uIbgFbx0Fkie+v7QBx/yCGqfMjgM5te
         JHGd3wLhtX2mc/Zlkxf68VtgP46j6/PbyFZVl3+pAgWpyDZ+p/i9k252273bmClZ9S6G
         mbG1LeLNm02KbRm2ntqjGq3TNTxS8ZxftD56WzaiJ+bhtK3UzyLNGkxN+C4rNo9/09CH
         jj0qJGqR9U58AA0NRzoyCcEQ4DTvWUGvONjVAyQ7NFEr/OS7nObkQ2d58WleI7LoCvIu
         vvjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773150677; x=1773755477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5Asj+a2M4Lo08vf4IoK/0oU/o9HvxzRTplN0O/sLVhc=;
        b=j6DKQIjZrZ6pKW3p3AxnL7o9HcJlZJiFGKU0Rvgb/UTn30p6Cp8mdLgsfz7XRZOMUD
         KoN0EbotnkUeV8fDOah/yWgStHrnPNVkBtp++O3KSc01X2LANMaPqSpq1Mc7ymQ/BAWH
         ZeFOstSEFOPc4orxWRJhXoZIKVMIBn94B9+TwiIsbdM41OJ7dJgl271xLBlI8aBN6AE2
         Gyt+g12cmUO4vxgtAZ5H6PSrVvy+tqyr4D7SJyz1+N2oYrPBHiI4T0I8LLvyLVPq98YE
         jfxw2tZDHChxNasxuz8BBZCuVARSUJs+Ypzg+D0unGjDq1YbyLHLvjOki6+2JkE9aCh2
         SPcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773150677; x=1773755477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=5Asj+a2M4Lo08vf4IoK/0oU/o9HvxzRTplN0O/sLVhc=;
        b=BtTk/8chAEdsWQTfFw41uXeVVhKPsD6r9RyDtogYNFQkpwxLVn4XMB1YZvcB2vzldf
         XDt8YlOaoqYTgWKsuQoe5gBosq9gdFKSpjuh4i3mVr8aWlDvq2+GSHoVDOHVFA1f6oFm
         21nw754E4igaPCa/Oovz7+/CXpM0qn6EtMYYyghiQRDKO/Rf3GJEwjxuyQjnvUoM2vub
         jHdlaxchDFVFJnnW2GYdb5psH9GsvzohSfh1NfAV5Y3nj+NzvLj/OsijdvS37eFajC9V
         Pm1wrXafCCC5Xo/lwjx1nRjJteKGbkpmpqV9YZqRZo7lSiWNcIwJr2e0sgKsMgXCfMQU
         CagA==
X-Forwarded-Encrypted: i=1; AJvYcCWzaNABEyh3xct5h93NsSWwXNm+J94uqwyLumoc2fSJe6XfZB8jAQGQTmLH+1lKHnqaNzmEaxr8twhovOBzWw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy7ZQJVb24gAqShVsd+hh+sMw9OCv/CodYYqkkhO6zpWgK6frd8
	kUXaB/puZvBB/cx/Wo6oRzfiGz9bZ5EstfcYZmJVFuHnrxjSQHyue+s9r4L4wB5KdiaK3/U9DO3
	Uklj/cFuFSArb/q4BvMFsarnL7fjG55E=
X-Gm-Gg: ATEYQzwIoOTew58tuZbE7VY7T7RLz8q3Ulh9dTGtZhu7UStWw6cRx7qdECzfSi6aZ1V
	d00LXChtKOix+24MnsjPHUFR/C8gziEVKjQRwsYi0JsAtveFq8/Tn62gJmJVtxdN9FBcXaYI1XD
	0wHLtK8dz5gGf6CA3kWxsApuot6JE+0qmaURGeJKb3tii3woygb2VhivFelxMNwIL79WvfMoFi3
	T53pJ5hwwqvmf6lUY6wHpj0VjVs0+gJxrh/uCeYyt4sTzkkONEI/qWEzegKEY/VpzZrzF8hMI+1
	9ZKVaUWZkL8V2ZWiLOyr2zlVFJ+Y/WDEZRSQDb+LZLOM5WGvZPeBERP0oRBYrDuM7Yo5N9ffsvm
	nXqTA1NKn3t6a1VCllUpsVzM=
X-Received: by 2002:a05:7300:6412:b0:2be:171c:2177 with SMTP id
 5a478bee46e88-2be4e087a9amr3221327eec.7.1773150677195; Tue, 10 Mar 2026
 06:51:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260310023145.120037-1-jhubbard@nvidia.com> <20260310023145.120037-2-jhubbard@nvidia.com>
In-Reply-To: <20260310023145.120037-2-jhubbard@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Mar 2026 14:51:03 +0100
X-Gm-Features: AaiRm524rLNPJ6CusrIgdOiNYDZOJ50_OTkTQx9LkkGOXq3lqrR9J4aNsajGhL4
Message-ID: <CANiq72kiiKkK0Q5w=UKNsPXvuuHMASpRJ7KAMy=2908n_u-DUA@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: sizes: add u64 variants of SZ_* constants
To: John Hubbard <jhubbard@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 10, 2026 at 3:31=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> +// CAST: every SZ_* value below fits in u64, so `as u64` is always lossl=
ess.

Nit:

    // CAST: Every `SZ_*` value below fits in `u64`, so `as u64` is
always lossless.

One alternative could be something like `sizes::u64::SZ_1M`, but if
you expect to mix `usize` and `u64` often then it may not be great.

Regarding adding the constants or not, I am ambivalent. On one hand, I
see the pain of repeating it; on the other hand, adding these only
works for particular values (i.e. we still need the safe casts around
anyway for other values).

By the way, why don't we use the safe cast here? They are `const fn`,
right? i.e. that would avoid the need to justify the cast and it would
serve to double-check the cast too.

By the way (x2), if we decide to go with the constants, we may want to
use a macro to generate most of the file, which could allow us to also
have the sizes as `u32` too, in case that is useful (in 32-bit
domains?).

Thanks!

Cheers,
Miguel
