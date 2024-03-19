Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 564077CF32
	for <rust-for-linux@vger.kernel.org>; Tue, 19 Mar 2024 09:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710840779; cv=none; b=VzDXXW1hDETEJ8cGw0mb6Mttb9hcYywqxyLvkbSS7GHg9c/3Ra7PSV2QTSclvIVUoMM3AuYoFr3cF5QMhvQph40WaC7TNgTn/7KTDiT6J1iYwmcornyGkICUy8bueYB9OxQBaRjVvVGdtGt/MvBFCbnaPjKuo1Fhwc8LFw2hAx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710840779; c=relaxed/simple;
	bh=ltFAvz+UR3pI1vVG/Qog2FjzivTlcNabCPQD33jgFN8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=N9tLcxthS3HxvD6QKqT4OKTsY5FWHY1uFl/+xr5vNWI+KXvs8PKbmFqQrr4c6U0DWUjiVwsz/16j7JA/9PKEvfiJMOm2p81fBpjwAltZCak+e3Q/fC/Tc4sJOe12uiZ30lcsX+rgPDYc3+uH+0C554TTHDA5u8N7zYDYVPlfEo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=CnsDUczc; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="CnsDUczc"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710840776;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=myUYXSXEfRiI3CauEW1rnw2E2713JJIdN6pCUXco+PE=;
	b=CnsDUczc24b4FpaSdKqKyt+Vij1i/GbGQR2ikCvH5FLoBw6V4tZuexJqYiRuOm8os0bmgT
	qIJMto/sJDeYNP2Ewibf/7P+27R+XYrZ1OP1h1RUwi7jIifT1HbR4MhvEWIw4RP09pc9Sy
	hC4V7ouov9P/FdTjf8qTOKeG+l3hbok=
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
 [209.85.216.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-202-CNYaAortOEC1s5FV1TdQ9w-1; Tue, 19 Mar 2024 05:32:54 -0400
X-MC-Unique: CNYaAortOEC1s5FV1TdQ9w-1
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-29c7792c8c6so1809907a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 19 Mar 2024 02:32:54 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710840774; x=1711445574;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=myUYXSXEfRiI3CauEW1rnw2E2713JJIdN6pCUXco+PE=;
        b=t2xc2/+laKJngeOq8DJlq/GBYYinO7Dh3iJd/3jzEnNPlvYjmBvqWW28U6JyquQtFH
         hCoToPi+krsmyUvKLNS23KcJK6Ui/oubut+CuUXY68cv6xq8XUG0VEo6X85UeQK0kEgD
         7sacFWFpnWUVhHqxOsO/QM5GSydANCxE230gDDJraHYvQJup+SrWq2hgw4HWNWuXT13B
         HVFEF29ZEd9LR1YHcfwxJlJI0kFs8IjibHPID5tHdg2fx8Zzzi/Y7Z7kCr7A/MH/bFdx
         zYkhKz4nyMhs/3siqiJDhpb0293V/gu48QpqYpu71/4119IT08284X2kxKb5cnamTi/S
         UJ8g==
X-Forwarded-Encrypted: i=1; AJvYcCXIzYXwvbKiok2EWlEVPdK2fQ73sx1HFBEgFdJHkoYp1wMQ7YJWj7li4yothGpOBfe0j7pIcXrp0b3aWe9RL4BeoSneyEQrBGtHiyT80LA=
X-Gm-Message-State: AOJu0Yw8ZDuDl98tKbOmTalCsIOd4ZV31jscbgpcCS3dybjTkDPNpOYD
	bP/yZoG6MPhWrXOiXhabBbIlFikOCx6fn6fYK8q6gjsK0W+3AuGIBxdX5o9Hr7+XK2NcCnQfWwg
	o7eWan6CAkzF0hsNz1OKwbiuCurFp73srGSnwhctsiWIrQC3ENyCblCtQKB1BCaLY
X-Received: by 2002:a17:90a:a882:b0:29c:7697:d2dc with SMTP id h2-20020a17090aa88200b0029c7697d2dcmr1514753pjq.4.1710840773870;
        Tue, 19 Mar 2024 02:32:53 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IE17qD0qlNXiH735OuHqzRdQxRNKobNEC0s5dp7fWezTGMhk1Ph5axwwnCg8WUHfB7wqi2kDA==
X-Received: by 2002:a17:90a:a882:b0:29c:7697:d2dc with SMTP id h2-20020a17090aa88200b0029c7697d2dcmr1514738pjq.4.1710840773528;
        Tue, 19 Mar 2024 02:32:53 -0700 (PDT)
Received: from pstanner-thinkpadt14sgen1.remote.csb (nat-pool-muc-t.redhat.com. [149.14.88.26])
        by smtp.gmail.com with ESMTPSA id pa10-20020a17090b264a00b0029c693a1e6dsm9420560pjb.17.2024.03.19.02.32.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 19 Mar 2024 02:32:53 -0700 (PDT)
Message-ID: <c8279ceb44cf430e039a66d67ac2aa1d75e7e285.camel@redhat.com>
Subject: Re: [PATCH v8 2/2] rust: xarray: Add an abstraction for XArray
From: Philipp Stanner <pstanner@redhat.com>
To: Alice Ryhl <aliceryhl@google.com>, =?ISO-8859-1?Q?Ma=EDra?= Canal
	 <mcanal@igalia.com>
Cc: Asahi Lina <lina@asahilina.net>, Miguel Ojeda <ojeda@kernel.org>, Alex
 Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>,
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?ISO-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>, Benno Lossin
 <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>,
 Matthew Wilcox <willy@infradead.org>,  rust-for-linux@vger.kernel.org,
 linux-fsdevel@vger.kernel.org,  kernel-dev@igalia.com
Date: Tue, 19 Mar 2024 10:32:48 +0100
In-Reply-To: <CAH5fLgi9uaOOT=fHKWmXT7ETv+Nf6_TVttuWoyMtuYNguCGYtw@mail.gmail.com>
References: <20240309235927.168915-2-mcanal@igalia.com>
	 <20240309235927.168915-4-mcanal@igalia.com>
	 <CAH5fLgi9uaOOT=fHKWmXT7ETv+Nf6_TVttuWoyMtuYNguCGYtw@mail.gmail.com>
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, 2024-03-18 at 13:10 +0100, Alice Ryhl wrote:
> On Sun, Mar 10, 2024 at 1:00=E2=80=AFAM Ma=C3=ADra Canal <mcanal@igalia.c=
om>
> wrote:
> >=20
> > From: Asahi Lina <lina@asahilina.net>
> >=20
> > The XArray is an abstract data type which behaves like a very large
> > array of pointers. Add a Rust abstraction for this data type.
> >=20
> > The initial implementation uses explicit locking on get operations
> > and
> > returns a guard which blocks mutation, ensuring that the referenced
> > object remains alive. To avoid excessive serialization, users are
> > expected to use an inner type that can be efficiently cloned (such
> > as
> > Arc<T>), and eagerly clone and drop the guard to unblock other
> > users
> > after a lookup.
> >=20
> > Future variants may support using RCU instead to avoid mutex
> > locking.
> >=20
> > This abstraction also introduces a reservation mechanism, which can
> > be
> > used by alloc-capable XArrays to reserve a free slot without
> > immediately
> > filling it, and then do so at a later time. If the reservation is
> > dropped without being filled, the slot is freed again for other
> > users,
> > which eliminates the need for explicit cleanup code.
> >=20
> > Signed-off-by: Asahi Lina <lina@asahilina.net>
> > Co-developed-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> > Signed-off-by: Ma=C3=ADra Canal <mcanal@igalia.com>
> > Reviewed-by: Andreas Hindborg <a.hindborg@samsung.com>
>=20
> Overall looks good to me.
>=20
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
>=20
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 if ret < 0 {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Err=
(Error::from_errno(ret))
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 } else {
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 gua=
rd.dismiss();
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Ok(=
id as usize)
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
>=20
> You could make this easier to read using to_result.
>=20
> to_result(ret)?;
> guard.dismiss();
> Ok(id as usize)

My 2 cents, I'd go for classic kernel style:


if ret < 0 {
    return Err(...);
}

guard.dismiss();
Ok(id as usize)


P.

>=20
> Alice
>=20

