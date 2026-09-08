Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A95F333123D
	for <rust-for-linux@vger.kernel.org>; Tue,  8 Sep 2026 19:47:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.227.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788896850; cv=pass; b=iVnm5X6oSaKoooid4ojxEj000ROXWMrqaY5t+YqOipLsNSt9fTVbKwIgoQlcJoSmWTQw2jB58WSgE/C8XJwixKfEvQS149ZAPsB5uffYlH1ZNO4pLyzgQlv15ZblzbNBkRHo2vZ+Hek6/BZLJPK9eFpQhBwqAoQgU1txYPjbSrc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788896850; c=relaxed/simple;
	bh=iY5QnsT4qlVhjZv2PDQCFtybqjTxSMGZqhX7XmXrD0U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XdnVafvzouQyl1/Ur5jwgHHAwqkmp+fNpogRLe+IWAYtnDzZqy8EZW/SUhIsiEsx6M/xV0K2/amUnQhG/6nHHe3RI60CKZKJh+Fevony0bWLQe74j32ZrAdkGYV/2YilELrF4oX1G+vWprzF4qMYHeY2+GiuXic+RBQIumFR8ck=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WKO4MDZE; arc=pass smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WKO4MDZE"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d6ff2f2c4dso4953165ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 08 Sep 2026 12:47:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788896849; cv=none;
        d=google.com; s=arc-20260327;
        b=YfrzZ+U2ygx+W771UmBZYAQR2RylPKNwu7B4dQzGlkYuF5X4MaCQRp4A+yjHAkQMjQ
         qdtePwSimu1PfUDNlYmOl0r7yCTljHURs8AK/t58vPMk+1t+irn+f3gCv/U8VxvASBqY
         /hi6CempP56vShPd/WM1AOou48e6XwtIRcy0YKjYtvyJDtDjrifWxoD9Unl9FCjEZTP0
         VHP0tFQM3eOBFfRo/h2cUKd5DWlVa5x8oUHx174OTplsZHW10bYz8EQrxHQuiOil6EkB
         x6ZeRblyOv66/vb26+H9JfPtl3VF+Kg4R5LvFXxRIbDzu13zK89C9XTKayu4pl+FOu4E
         6q+A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iY5QnsT4qlVhjZv2PDQCFtybqjTxSMGZqhX7XmXrD0U=;
        fh=M1Q9MlkJFiF1/j6y2+T4SC5D4449J5fMUcSLPs2U1kw=;
        b=c/8eJwzjPVuln3p6jiN3G971TBVGOFTSKi2oaf6NIbUuuDaLlUNh/hNTIrjcaPmwjD
         ReWEFL1k8Rtp/wQ3hLyTO9sidQk1UwcTOZyr0Wsc8Jp1AAKtMWrzCFj9TcY/RTph5Ixc
         ZFT6xXwldcL9oxUQdN+y/1iVMvV9Zsu6crW9wCYdmPCxp9tAu3ICkUdrsrtj3a4rQLQ9
         gOFm4LBkMITtVqRd/inzIoima8CWW7OHFZyHehCyCXI5RQD96EFHk5L9NCGQeptdMC9v
         WaiYkIQR51xHtTkTt3HU3uIbv2omUYzGObopXDqXDIiTozdLqT/bgbeqTO/bZ/axNVXf
         P7Lg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788896849; x=1789501649; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iY5QnsT4qlVhjZv2PDQCFtybqjTxSMGZqhX7XmXrD0U=;
        b=WKO4MDZEC19PCK+f2yr3mrZUQazyRNBEAjKxJsxbgYJA1jMqpjl7xaL2sg15NFSMxI
         y2FlGOAt7Rf5rTsgQpqYaM5wBMwzDK6aQ6/VURQA+qcFtgg6f4uZEu80gdaG0nMbY2bP
         /ssUrHWp+qOzfq6N9/tdtpAjm2PP8CLNo5zDCTBS0H7tSHRkJLzOWwrO0VYKE4QyUcGI
         8lnAkcl2m9hck0k1gDVT6YZoGnBKSUokXcIBHw9f9kfEUNG1IMGBjso8lz3H+2xYgLTZ
         DcA7fy3O6+6YOdOCDOGkMkG6NQxo/c9zLlgvVjwbJVMKXnLhS1HqR9R+J3W5Kk01VBHf
         fqHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788896849; x=1789501649;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iY5QnsT4qlVhjZv2PDQCFtybqjTxSMGZqhX7XmXrD0U=;
        b=lhPe+dAjwrFWr93XvKDAkQ/5wPWsY50h+J7x7eAeyJxVfKsPpwZdbJHRjzaboqDnlO
         F1aeGwAv0uu2oNb+non+jeA8pGDe6SR/4PiYMiyTGm44PHUOwAOWkj3Nb0+9757wKTfw
         LiWjJZ4alwqOJF+lpwXc5HjwxODHNYBlWrfC9gCpSDcFvlFRzpBdrCmANwbIkptL7iXB
         F7wG/hla3otmRwTsZu0SBynBg5BkTmPqnMqMUbOE+lRZ1hgAgwCx6O3cWZGdFdWu0T5m
         KmSypbFgRpsPU/PYfJGOKwJaa4HUW/xPQm00xREcX0rhH+YUR002jszJ20wnXl8ENlbP
         Ws6A==
X-Gm-Message-State: AFuF++loGyjA+1u3mjUN9nQHE7bd+rT/CAvSZbJFPy6QtJAbpLGsThRA
	B3ofLb4eJjlWoNlWJZgGFRLBiEse/xWV+FCGSl4k1eIkX1J+xhaNVNtRzPYBnOFiWoesJCQVFg7
	Ie/F0KU00g/GxXF/PwDAt+RyxlPlUjHA=
X-Gm-Gg: AYBFou2+GeuyVlFQO6U6YB7gjechcWjUBs9ONHOR/Si7qcWQYbFMj+s9FTxN3xgRoY8
	RH4LoOEnJ4t7rNbpRkG/Fckr51GaRfT8X1WjgUDFJHpKZaNER1UUTYKZ0SADRl63Nobo/OfQCZx
	YsMUBAvNFy5NBFr2yt2dH4i8ChT1/yF0uXQ9Ca1WaEbxRYzSTXsk+ytHFtQvHIIvfGvmRSiyH0O
	vJKYywrJpwrtaz9WyAj4eW8VLhmq1bIMAW6dDu6hje3oZ7apctmqLoknq1FNsfjnjSzJih0181B
	5fmuNvi6R6zWikeVts9ohhRgQqPoEs6XBibqM0R7noi/uFv4r/iPm3l+dayo3D4gZtn/77ar7rt
	BnUDdyI2vhJotUkPgfRbNQ4d6MbJK9ioIbHcktgK5uohqAefPs49DFdBFccWqAfhHJlvAvg+k/Q
	aQOwA/jdaIFaZuttiLp3ADDtQ7oGN2cg338qMS/OZUbi7ywWumui4=
X-Received: by 2002:a17:90b:2801:b0:38f:aa76:88b with SMTP id
 98e67ed59e1d1-39b3d7d056fmr21707651a91.4.1788896849093; Tue, 08 Sep 2026
 12:47:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260908-tyr-ioctls-v2-0-88bea777df67@kylinos.cn> <20260908-tyr-ioctls-v2-1-88bea777df67@kylinos.cn>
In-Reply-To: <20260908-tyr-ioctls-v2-1-88bea777df67@kylinos.cn>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 8 Sep 2026 21:47:15 +0200
X-Gm-Features: AcwNN1XXa9g_iZLSTKQDHhq0xMt2HPgPqo8BFVOYoRvUTe0z8qL0cOKPZrDxOdc
Message-ID: <CANiq72mdp9hS_U=Mtf5F6Qv8M9=m38xOXtCP_a4c_QtkwhpFEA@mail.gmail.com>
Subject: Re: [PATCH v2 1/9] rust: sizes: add SZ_4G constant
To: sunke@kylinos.cn
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, "Liam R. Howlett" <liam@infradead.org>, Lyude Paul <lyude@redhat.com>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, dri-devel@lists.freedesktop.org, 
	Alvin Sun <alvin.sun@linux.dev>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Sep 7, 2026 at 6:48=E2=80=AFPM Ke Sun via B4 Relay
<devnull+sunke.kylinos.cn@kernel.org> wrote:
>
> SZ_4G is used by the Tyr driver when splitting the GPU VA range into
> user and kernel regions.

The message should explain what changes, e.g. a new paragraph after
this one like "Thus add a new trait that ... and implement it for
`u64` because ...".

> +const unsigned long long RUST_CONST_HELPER_SZ_4G =3D SZ_4G;

Is it added here to be nearby other sizes, or something else?

> +/// Only implemented for `u64`.

Intra-doc link: [`u64`]

With that:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Thanks!

Cheers,
Miguel
