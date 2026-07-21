Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217CD37C908
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Jul 2026 11:38:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784633893; cv=pass; b=OLcu8SmtNhJ1oj+QyQPOiz8du6ctRMSQCVvGg+jOlL+5p2JQLZ7a4nSFm/XNCY5O1s+Wmefx5NG3eab3xYp1AmKgsG+ev8sQdZIg7oYn2L1BBMewIIokP7Xv0AW7RLXSx2IxsIZrKEAwYcT35viAoRQaY62gViBzghrhlCFBAcY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784633893; c=relaxed/simple;
	bh=d9NUNCQBY2Ha0fMR5awCCKQ+FwcUtIWOZneVpKw8Ws4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XCtjcQesUrUl4w2GxE7JjteAsXZ5eA3j6nb+LAZsIACCqYRJPt2fXTFeU53Vt8ZhZT0hYpzQILUoPJo8Z2Czo8PwZdiJlXGXLx1066ASZFgGA1xzdyQQyMjDB2ZtDcCku3BIRkagMyt+KGTF0gLD09NTlD/NaL0eAaO8LRwIWAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DhnCbK36; arc=pass smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DhnCbK36"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-caf45fc5202so7856503a12.1
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Jul 2026 04:38:11 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784633891; cv=none;
        d=google.com; s=arc-20260327;
        b=NTWcpETwfoQ7hR7kzf2AYoPTl6H5JJN1gHcke8H5QSUGnMF3LF6IkcvT83gobGiLZ4
         ZQoFZlXvnh5Vk5XF4nYXrOrJ9/8w2QCLlqpdFmrfWZLpy/1wvfoZ0BDYSDyz0ihZ4mby
         TpEvT2LlDS3Fd8bLsrDUBP+/0yOeNSYyKgtRiOXKeX8+/67hJPDLZSeTCjkGDZGFVHJS
         CUmHXQs+Yf+IyVgQULgk27FQvDHEM3WE5/SAihmLORkbjfvX1rA+fFz5rnbyNlSHzLTa
         oH/80P0S4M+7f/qVcj5nXSvW1bT5NHUxUtMhUl+CJo2N3jjoBIzWxQ9QjTDrLFn0igIO
         d31g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=d9NUNCQBY2Ha0fMR5awCCKQ+FwcUtIWOZneVpKw8Ws4=;
        fh=GeAvQSDajdilhiWDvMfJXBWV2eQT4oLj1mA6Sdfmavk=;
        b=F883MYdQq5r41tH5PbmqpdjZ+Oeg9ocD/d6efDh1WMFV3yo841N6r0P5obgN07AR1m
         ZFmoOSsy5HvgUQnZcn4UCIfV1Wn35x7epp/bofva2ll6OmIfUSzMdqYR5S09Qtod//4c
         51YFkl0/bpHUWda3YGionVAIVpbh8pyiSqOs3ncweWMVlt9t50ucXhzppJ28IypdJmnf
         6ltusmjZmcnvzEvA2Yn/uiZC0ccrtB2JfQQw1mO93lEnjyU4nyPZ/lZa8y2VES/6BpsL
         ZmKgYT7FcmfGuu9fC0EENlwVhx2qFCJuEosUhU2v7/0PyveRKT2IkTrXVgz7gDpMGyQw
         2IZQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784633891; x=1785238691; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=d9NUNCQBY2Ha0fMR5awCCKQ+FwcUtIWOZneVpKw8Ws4=;
        b=DhnCbK36sDos8Bk7bK7655LZ7p8zDhcX9NPILj9u/R3jrDq8quMhilNTh37PX2o9YK
         Ib2f+vqmrBrAPsY8OWJ+941G4OJlzbDA3RKZw3rcETPmunph+mVnCj/z6ydgy72/F/oz
         zQpcuOjRaMxc3xjNPGdsuIq07nXb3UIiLOzb7w6lrmF08q774m93PVhnVjMOwEM+P1oB
         ePjUqOdepRml4Dx44AxbFEVRzuc44xj8uPBl9EDd/39HjjGhBcFwX9+7F0Q81UDaoU7i
         eUowS+WS8bpAwHxquLTcZFrGQq4wzG/VpU5OiVcd5Sgafx2LhN7wDf8rH4epNmH1TRHS
         TDYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784633891; x=1785238691;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=d9NUNCQBY2Ha0fMR5awCCKQ+FwcUtIWOZneVpKw8Ws4=;
        b=DEphJyw9xc5mcutw5a9UJXR8XCVm4ZGniv829eUAaJGnv3X3wr01Dm0cFJL6Mmw9Ak
         O0xKBDueQvVAcBWMga4z0eTHp3JCx6eIIf5EgJvd0xrMi8zCCw+9VOQiwYruwbW9xYrp
         0PxJDS53wts1q9tBzMaGkdAubwwL2OwlQZieO0kvv5EqM5gyss0f68PD3OVwu37MfFKf
         +98Lpy/soohfpUjG2ykgsyHU0MgpP6yQKPzHcg0ThhQG4E71uKedCzzgQj21Z/BoVkKA
         v6wn1wOKYqleldc/9qpZwvHVW8ICXwtdmbbiKM1vVTOEAxxFR23CgrMqZhW8VVIiRPtS
         c9WQ==
X-Forwarded-Encrypted: i=1; AHgh+RqiYqiTD0SMS2zRs6dDaBcPYMtfII9yDtQIaoG4Q9etpKRhP9/c+0SDEVLy9G9jOxF426Pg8NiEHG1WZk6lrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YySO4XJBqN1Trq3Qe5tsR+zkpscZx7Tg1TqKL4Q8N3pYVeDlwLg
	SvBfTvtWe2azOFWVDwKvui+tMLV7aY2Sp1EOtF0ofM4Gz7FmVyCqO1BNI4NO0Q6XwBjaXF6DNrm
	xIBNHP8q7KFSicHyHBIpp+WDFqlHft9M=
X-Gm-Gg: AfdE7cloTKoN0Lid1keP1+uPAPm0dgxmvNep7DTLQmUH+2YgZbQcaiPMXWxPPk/z22m
	aeXdCZTO1eAaMCfar39nDghl5fxrvOpxgOohfVgEGpmrbMNtAKREIC/i0vnLCdUbxzyTKiom97P
	rSD3DQ8o8TfEZgjumBOH+IYw/iB1NB2egE8hu5oLNFTSWqQAzjz6MvteT04mAu/ts7uNcvwZTkZ
	8F8Ce1qX26URKmGFB6QtAqax9jXx+M0yQ6Y/PN/YXR7qcfb2eLkAkHX/MugFqeSNaX61kX3E6BN
	NgSKPKp3VkPDQa6P6xfeHUlZwSFjE0RtvKf1IHiqU2GzOA35
X-Received: by 2002:a05:6a20:4c8:b0:3c4:1c9f:d90 with SMTP id
 adf61e73a8af0-3c41c9f2e30mr1087330637.39.1784633891394; Tue, 21 Jul 2026
 04:38:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260711-id-pool-move-bitmap-v1-1-cd5b7efc2c12@google.com>
 <alzeHwmGJsmK4z96@yury> <CANiq72mz9bvrOn14yVtEOLf9BW7R6mS+whRszmcA-WNMuftcNQ@mail.gmail.com>
In-Reply-To: <CANiq72mz9bvrOn14yVtEOLf9BW7R6mS+whRszmcA-WNMuftcNQ@mail.gmail.com>
From: Burak Emir <burak.emir@gmail.com>
Date: Tue, 21 Jul 2026 13:37:59 +0200
X-Gm-Features: AUfX_mzyvPf1pqj8L_1zI8QA_CFWBNHXej8tHPjZ4yFWLblnn5YE789ywm_Fj40
Message-ID: <CABwQupMxu+7J=NnbwaWoKQjxhU-gO53DHsvZh=g0NxpJyQnTrw@mail.gmail.com>
Subject: Re: [PATCH] rust: bitmap: encourage using xarray/maple_tree instead
 of id_pool
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Yury Norov <ynorov@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	"Liam R . Howlett" <liam@infradead.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Andrew Ballance <andrewjballance@gmail.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, John Hubbard <jhubbard@nvidia.com>, 
	Matthew Wilcox <willy@infradead.org>, Tamir Duberstein <tamird@kernel.org>, 
	Yury Norov <yury.norov@gmail.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Carlos Llamas <cmllamas@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Lorenzo Stoakes <ljs@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, linux-mm@kvack.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 21, 2026 at 12:08=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Sun, Jul 19, 2026 at 4:24=E2=80=AFPM Yury Norov <ynorov@nvidia.com> wr=
ote:
> >
> > ID pool is a user of bitmaps, not a part of it. If we move every
> > random user to the bitmap directory, that would be an immediate
> > maintenance burden on you, Burak and me. Not sure I'm a fan of
> > this idea.
>
> Splitting things into more independent modules is usually fine, yeah.

> I don't see why we would need a `lib/`, though.

My read of Yury's comment is that this proposes to organize Rust files
using C include file conventions.

@Yury, the Rust compiler expects files and directories to follow the
module structure. Module structure governs how stuff is accessed in
source (kind of like c++ namespaces, but done right), crates act as
top-level modules. If you create a lib directory, you would have to
have a lib module. Everyone would have to mention lib when importing
types and functions from there, which seems redundant.

My thoughts:
- there seems to be precedent for nesting modules under kernel.

- agree that ID pool is a user (depends on) bitmap, but it is not a
random user. We do not want every user of bitmap to go into the bitmap
module, but apparently there is more than use-case for the
abstraction.

- even if ID pool depends on bitmap, nothing prevents us from putting
it into bitmap module as a nested module. Everything is part of the
kernel crate and built together anyways.

- The idea of this series is to make clear that using ID pool is a
commitment to bitmap. This addresses the recurring discussion "why
isn't this IDR/IDA/xarray/maple tree etc".

> Hmm... If what we want is to avoid having `id_pool` as part of
> `bitmap`, then can we add the documentation paragraph added here
> instead?

Added where? You mean not moving it under bitmap but just adding
documentation to IdPool in its current place?

I don't have a strong opinion on module structure. I just think it is
easy to miss documentation, and it could convey that this ID pool is
intentionally strongly coupled with bitmap.

Cheers,
Burak
