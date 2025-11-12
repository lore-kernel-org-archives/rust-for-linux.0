Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27CA0302747
	for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 10:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762942915; cv=none; b=XxbBfAfUhCi9EIwtG4SlFj20Vrlw5h1ZKjE9SBQSlgYt/GYQ0u2+u0Gcyihdc5WaeQczdv97nUCaT14Qv3DrgRfoCdfCdqDsECnCiHxz6xj5vZDFA3vQC3r9kjFES6cuTWpV8LM7q9SfGVZeO0WdXcJ4+zngujJEysiG/I6enG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762942915; c=relaxed/simple;
	bh=a1LbZXoKqASbEUpN7+CIMVVnKdzk5okC7gkeCo+wSp4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BfAYLdZB5w6rX/odoGYgM1nctPg4e/RgJzCH2bP7gj0RXKyH+qYwkqo+OhSc8ftYBccMEqtpofpKi5itNeaLJ+e8aZEx1A1KSsdFBcAYdXn2vrhaOqQpOg88Zah1+wgynekMzgAGw4+s1IZ5/k6w1UCmthaRer7x7mgRPeNK68Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=F6E7gJKa; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="F6E7gJKa"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2960771ec71so830085ad.0
        for <rust-for-linux@vger.kernel.org>; Wed, 12 Nov 2025 02:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762942913; x=1763547713; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=D2Q8979WUafsHbF02hsz6ih8XON9WMXfl3cHVtdnFpw=;
        b=F6E7gJKaKWo8qWNzwWiazf17nyl7mlepSv9EzH41Fcj2QRl+eNAQUHgbiY/jReHdi7
         mv1ngTSDwAfoRRP0oUzyQkSwVPjo9MisANNMazYn86c7C/WWAsd22gfsBoupuBuesk4t
         SspKbkaxGD1aX2GG2CB/bV9m5KYjPcXZcrms9Bzle9fpqpzhO8JqpUdklyk+GAwr30dJ
         IRgkedogZ52v9Yy4TmDS7uXl/aTxbzeCAAKOioZTlvDmWqFoWQyrA7JO7GU9b5S9tie4
         jstxqQUy+O1a0rZfcJDdKO4mNuZvvU+tOVv3wwpZ6Mo+wsN7dWkJT7XK7kTW5KZAgln4
         Tx0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762942913; x=1763547713;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=D2Q8979WUafsHbF02hsz6ih8XON9WMXfl3cHVtdnFpw=;
        b=QP0L2ABWyQXkh+VVzGi5Sc3erqCAOeBu3FuKZWG6/20ueER4NN9+Lh14dDTPAgCQd3
         GY5sDbovE5fk6G5MuTV3c3zE+vfGdu9OuFZ6sUvtuHuvZMZX6AyUXEMkBRRNkBafvMxw
         H/PoQOHHJi7MoJZPbTqsAg2hlhggtKxWj5plz++1d/xm14kEQWeslQMMC4YWkOROnNt7
         vd/1fZIJ0Yzx9V5HReTtaMQPe3Xagz8d18xIENFOSYgHY6x5gpYxu6pIJYUtIXr1jJ4l
         7wRsd6uy32qsI4D66yvb3SEpmNp6ePj9YsA4phP21+lTWog7w2y/CihWegMttBy3yYYE
         n7dQ==
X-Forwarded-Encrypted: i=1; AJvYcCUEVgQCXKZjBnHRP2u3o8vcCacVIAS0vbIRpYuOtKxdhjxf0S5/6NAy1+2BRm2OuSaj3MCbMSMcWd/ogmaiqA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzxn/L7haIHw/qEi3mudzIccydkvhTwdvBtyMrtBud4nhksS2dl
	2DvZ4Q98DD7aUSlPEOkJOT1Zsygbq3PK/sSAP0z/kZl4Ro9NvSpwzLjEsH9YE0R1ZoPtg/t27CG
	0LgP01yaan88jOEVHvdy/VtnctW86jPc=
X-Gm-Gg: ASbGncugU34PYH5kOfAA9ptvJCMRtzoBnLHSUmVHIgrNIiSfAT37xMqX9akmhyMAAR/
	Ih3NDEmX064EOJxY6bOvHQWfJMCSczj3BRqdPobOYpOfKxF7BIxGawYeGiXacll0yKBoXMOwbLW
	B/IW01H1EyIELecwaLwBc5B9BB0X03G1rikskvWSBocUn9Y2BvtEuv0lTw2hejb66w/zNU218kt
	aSrDT0eQiF6brRCb/GA8fNCTcdQilMLcvfNWpDcpgQlpG/y+0RuTY9MkD7VfO+d+qexloDvvUJs
	+Sjd59kvulBerKFfQjEVG7aKdVnSK/Cg7mISyyL6UEzR3ZS/viUCYeOVW+Pla1rzLodAvJ8COhh
	X9qCFAX1d/HTL5g==
X-Google-Smtp-Source: AGHT+IGmicDENKU7JiFKpvKuaoETjK/7j3jCXmA+p5saOFKLhmhJuX63oTyY/v5MtBwRvWCmwk5r79w7uF8r3OmPhsU=
X-Received: by 2002:a17:902:d50f:b0:298:371:94f1 with SMTP id
 d9443c01a7336-2984ed2b38amr19650835ad.1.1762942913408; Wed, 12 Nov 2025
 02:21:53 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251111-binder-fix-list-remove-v1-0-8ed14a0da63d@google.com> <20251111-binder-fix-list-remove-v1-3-8ed14a0da63d@google.com>
In-Reply-To: <20251111-binder-fix-list-remove-v1-3-8ed14a0da63d@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 12 Nov 2025 11:21:41 +0100
X-Gm-Features: AWmQ_bnHq9qt4ZLqIUwDgKVWFlRiETETpEIpC5CnP6lKPeTrcA2YHnmb1wWl4Lk
Message-ID: <CANiq72kR6hsr26gxOJp+Ok85ru50QqW-jXjC=cKDssUUchrCQQ@mail.gmail.com>
Subject: Re: [PATCH 3/3] rust: list: add warning to List::remove docs about mem::take
To: Alice Ryhl <aliceryhl@google.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Miguel Ojeda <ojeda@kernel.org>, =?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Martijn Coenen <maco@android.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Christian Brauner <brauner@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 11, 2025 at 3:23=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> +    /// When using this method, be careful with using `mem::take` on the=
 same list as that may
> +    /// result in violating the safety requirements of this method.

I suggested adding an example or similar to hopefully help prevent
this in the future, and this note is "to the point", so that is great.
Thanks for adding it!

Nit: intra-doc link [`core::mem::take`]

Cheers,
Miguel
