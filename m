Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B063217D3
	for <rust-for-linux@vger.kernel.org>; Thu, 18 Jan 2024 01:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705540099; cv=none; b=rzzp2tCXOvv1r4oxuimEK5cvJkrYfFg/3J3eL8lO6eKRDZLJwZFPghtcHoSkAQKGnsyAmWuPJX/b0e5ARVkerwiK/drzsFpBr6GzE/p00qebdxMH0VhAhEMFfWTKcSw9vGC1tyg59mfQWarTWZp1Hos5N5nQzEYbbhG2ofwPjfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705540099; c=relaxed/simple;
	bh=8T7NC9Swub/nQZ9DVuaYsmYOVn2PSq1kpJSa5iPp6AQ=;
	h=Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Google-Smtp-Source:X-Received:MIME-Version:
	 References:In-Reply-To:From:Date:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding; b=ALnx8Yg8pY2yJcHrkJ85u07DwtE83gRCRkKi8lYG+npoPTbE8fno5ynZNwoWl0Kqnacrh92klYmt971MPRMnVmUieBs3DUkpyLc1gQr2dSHPTjR1Z2DXjxjXzd7hJdpONVUt4yFK6IGdyE1GebsRaBmJ8f9qpOq9D9IdrWWlLs4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=fLU1bQnF; arc=none smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="fLU1bQnF"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-5f2aab1c0c5so2310567b3.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jan 2024 17:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1705540096; x=1706144896; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lfrc0adm8w3bLRpMaJS6zecF+K47ffHuEOwCMesTrUI=;
        b=fLU1bQnFpbsIvB/Dg8fbdwZafy/0/9v5nNrL1EevzHd34ECdflpgObjgB33XkGCl5P
         ISpC/90zqkeBQk7KHEADG7d8y4g6OgoqPB37NaloYOEO9ZcPxp4O0bhOaUH731NbOzdt
         HONMytFr+pcfyYrsh7qK8OlHHgnIjqraiP2Mpw0pi8GqXUwT7W7JamYytxHPe9Jp9yLD
         95r/oS3pX/mozDcQLpMKnCH6UAzzhrN92T44eIpf71Jo6Z9VDTlIEwlji3S+TAk3j7px
         4hddT7JAEc9JhlxeWJCml5r6YdK7zsmEubxobKPOqMpbXGLeVWSvVD9d0E7RXJhBzMfZ
         CVcg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705540096; x=1706144896;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=lfrc0adm8w3bLRpMaJS6zecF+K47ffHuEOwCMesTrUI=;
        b=YeTJBJBbYhYz28Bo72GZRbVMl2ElkiUvk3uHmlJiA97W2w5k80U3tDoqpbQi9MBMGG
         l/lli5YL+VwwKdoZO21uE4MhpqncqovkYZR/7d9+voTqBsK0m8RpcHuTJ0AR/pG4BBnm
         V6VaWeL/v1oOmhxC0byHowRt3bbikgj06U+FxdnG+bEFnJzlqoSjsnyLtcS6ddjaOGk3
         TIIWV/FZamkMQzL09eq21haLcRIPz0XOegv38Uo3NVauznuPDsVAm/ryvykGb7NiyWa3
         rZQFxZAu5V7kOdUT9n5wsF2zbNtiGt5jr8TFv+MAQ1WE02H+wCeAzG279roJT0msR4wD
         mRTA==
X-Gm-Message-State: AOJu0YxzAIRkDLOlAdE9x+kqHQbNJY9Vm6pdPLhhyKWAourJ9JMI3A8U
	Uz+vxrMukP95+Hvbyl/8mhWrxvUwEXNGy699qzyqeEeaMnYJ9pL43yKR9FBN70K0BJCJWNOPHpF
	b4E69Rbqgbq0efKHMRLTBbWqD6vlbLebEXB5puQ==
X-Google-Smtp-Source: AGHT+IEcS3VxlJsgml3wAtNi0i4aW2103tOvs3ohRe5uF7KGfdjATYiKhxmMoj6o0VOFrUJO48mwvQHH5Ryf3T27jKc=
X-Received: by 2002:a05:690c:fd0:b0:5ff:6509:1e87 with SMTP id
 dg16-20020a05690c0fd000b005ff65091e87mr1447967ywb.18.1705540096635; Wed, 17
 Jan 2024 17:08:16 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240116160141.165951-1-kernel@valentinobst.de>
 <20240116160141.165951-4-kernel@valentinobst.de> <CALNs47sgOaPZ6BiR3=WcG6bZuWVtF_vT4D+SLOdJ4jJoQwyAGg@mail.gmail.com>
In-Reply-To: <CALNs47sgOaPZ6BiR3=WcG6bZuWVtF_vT4D+SLOdJ4jJoQwyAGg@mail.gmail.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Wed, 17 Jan 2024 20:08:05 -0500
Message-ID: <CALNs47tKVZR8YQ4yLQ8J1CxqDS8bVeKikXHhKcXmn-ejNnUbDA@mail.gmail.com>
Subject: Re: [PATCH 03/13] rust: ioctl: end top level module docs with full stop
To: Valentin Obst <kernel@valentinobst.de>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 17, 2024 at 7:32=E2=80=AFPM Trevor Gross <tmgross@umich.edu> wr=
ote:
>
> On Tue, Jan 16, 2024 at 11:05=E2=80=AFAM Valentin Obst <kernel@valentinob=
st.de> wrote:
> >
> > Every other module ends its first line of documentation with a full
> > stop. Adapt the only outlier.
> >
> > Signed-off-by: Valentin Obst <kernel@valentinobst.de>
> > ---
> >  rust/kernel/ioctl.rs | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/rust/kernel/ioctl.rs b/rust/kernel/ioctl.rs
> > index 59050e5f5a5a..5987ad6d38a7 100644
> > --- a/rust/kernel/ioctl.rs
> > +++ b/rust/kernel/ioctl.rs
> > @@ -1,6 +1,6 @@
> >  // SPDX-License-Identifier: GPL-2.0
> >
> > -//! ioctl() number definitions
> > +//! ioctl() number definitions.
>
> Would you mind also adding backticks to `ioctl()` while you're here?
>
> - Trevor
>
> >  //!
> >  //! C header: [`include/asm-generic/ioctl.h`](srctree/include/asm-gene=
ric/ioctl.h)
> >
> > --
> > 2.43.0
> >

Nevermind, I see you got this in patch 8/13.

Reviewed-by: Trevor Gross <tmgross@umich.edu>
