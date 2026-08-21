Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B320409E12
	for <rust-for-linux@vger.kernel.org>; Fri, 21 Aug 2026 19:35:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787340946; cv=pass; b=baa6IGB2NAY0oWC+4NSdFIU6YUxovwElrbIOtZ48xgv+hbWo4t+qH5wgs3Tg0U7SCba8uBW/TQu/FGBW5GKSNiz4qj7hiUcC+/80UUSAqNt7Tf1whCQMG2aj7QBIJKdGB/N3v/xUCJSLpNGKNNOmHJnaUFtfRoYHK5YL73Umi7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787340946; c=relaxed/simple;
	bh=1/9pitlXb84t05mrk2KlDSeIz4lgs1R8Q2Yf+2RoA4U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NSPjamf5XZ84st3vwkWbcNHJgV0+r0TxcitgllFHFPpSzTOIfKKwW3CB480oOmaEjM40p6WiZr/UnDb8Zz7a5OBALDn2Gp0sL5zTle1mMosW2kr17F/ctP8bO3dMjGhJXb239MD8kD4SUwEoV/2IB/oYc+be9P7mr1C6argis90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DcPaHuz3; arc=pass smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DcPaHuz3"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-c8612812170so166042a12.2
        for <rust-for-linux@vger.kernel.org>; Fri, 21 Aug 2026 12:35:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787340944; cv=none;
        d=google.com; s=arc-20260327;
        b=YT53lcrxw0Ltk5McIoE00csn+q5z7Y5A5ix6vCuV/nKfx80/fX50ulNOe+UI48Oab6
         s24h6u+9A0dnDWG++FNrjToaXsySvJZBcZvkzy1WoFwjhbtW5xA3g1XISB6fsyk6SB9e
         qT+epGztIe5IkmrgXZNuC5UTjxs31TVRYypq/yRu2IFJuaovjYEdqeFQHsgH752Lc2b6
         nkBqQYbmuXQ7OndBCqf4/XVAUOGzFgneIGrvt99C/iqNPOajOl1qxy5Lb47zltgBJIEY
         TxGM/fmCBGhtal0sC1RpXrJYaOR1Uruqv1+LnRJx7Nq7lkRgpChEYyaDchAjfUF07mnp
         +rgg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=5nG/DZhGK8Y7YLUZZ+pZCC7PZWOsMHI2qlWWbSO6I+w=;
        fh=59RkeOi4hik4Bu+FIaAqju2NsmGNxJGxAPlEUJPJsaw=;
        b=szVQ4r/Wq9BLsQ/K2Y7K6a7E6Ou7QYMR3RjpAMFN65z2wu8NZOu97fsOyIJf89DC4l
         81o23aSKARzVyGquun3nv4kPzSSR0dEwiX70DfLoAGjRCA7LI7ORgIwdtYnmzwFI4W56
         VuOktLwSyBV1fIFDrH29ZO7SwbQgmQmlONB+i8kslUInyLPYYaoqbTghUQWBiL/sgLeF
         jMUBNdbmqwTE4db2JfBfGu8WtkUYbjaAvvLnk7lXwUsZIxb3vET/wYQaBQdQc9JFFay9
         3RHD2q1SrDQnWmzaUjeD+JDHSGBv1QWFtNdAXYvzXK5k+AaxQXdCBZ6yFBXzZuQ07upo
         tJIQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787340944; x=1787945744; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=5nG/DZhGK8Y7YLUZZ+pZCC7PZWOsMHI2qlWWbSO6I+w=;
        b=DcPaHuz392I8rbWZ/2LRjn2p+qg+vPHLI8G19uFF9+Zb1i8NdvTJBenHw3qfBBa7Gz
         LQY7I5La6k0Km9JzYGnru+CnWgJApmIUYE7s6C9SazxxbabNc0T9JTmJdC65NAJnv3C0
         H10uy5qhirXt54cC/umOhGjpQRajtoH+9bIFoHCaqSMwDbqtt0RoMDNy41+9/qWyyhFh
         omS+eTzA2tDt9UlDcbpXPKu6vllddmB6wxriI7fuEdQ6gb0ZfkI0EYlzCPyceCCwzHhq
         T7RC7oL+dCi+Qd1Hkr8dP7B3HU7lO5qo8hxmuM8TvY2OQxGa/8bGJM7J3ZJfg8Wfr5ZN
         ZD1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787340944; x=1787945744;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=5nG/DZhGK8Y7YLUZZ+pZCC7PZWOsMHI2qlWWbSO6I+w=;
        b=eAfv/cyVFtNlDw6m3WqLOZw99a4a7AXj+Ba3nlNFRUUO5GozpzaNVVg7Q0HBHOnpjG
         pUQ/jqxx2mpALGLH4vvYhPU45RDmeMSr3rMwDCGgTRDij2K4DXLbrWJvH1wWlKWoWgJk
         9yJjLxu5ikSPXNq9Nw9uDGJxKk6r/Vx4SWE28hgONhvY7SG6m0rr1vzZhD8aXHu4rZsi
         46RuLbNykDksjev6QNNwiLym8UKaYHuSXHZbckzSjCAc5xAjDHggER2H7B1YH8+330dQ
         Bsehcqeugk15iiM9EPstSDG0M7NW/M/LsUBMLY3sAKEMKFHGY7vMvjPc4svu/VJaMsq2
         mlRw==
X-Forwarded-Encrypted: i=1; AHgh+RocJnqs55D5VG5usf6GJUy4uheQHDFLxBlcaBFB9tjsvBM9ljmJzooHe/javNd2IbO0x1qCnfcXqLpsGvMyFA==@vger.kernel.org
X-Gm-Message-State: AFuF++nBsq24yLwGHnFnzFnH5ZpAIrHris9gG5qgL72L+yoWqtWeJDiy
	JPMh68Ivk7v6MW1znoQfJI86QHq2V5DbwfXfWriKjuylpzWlzry5/x+BHvC0HjSc11o6ediwbSY
	3rxbw+Wcga9wmNq4uO1iVujFYVZDTQ3c=
X-Gm-Gg: AR+sD13Hs7Mrya0m8k/URXr2uIKsOcIKADAFfia17Ew6dcPbRyrIjujmwpi/1YGqpH3
	oMxnHDqethlkJmCtttkPt/ANo0AsmWprqQwEsxpTu8o+WILIt1IfCToVuqv3qXC2g2fAXovFQAj
	IPYG5o/9oUhFSeYUiu8TFJ1tn3wAing5iImw5yhdGAdlw5Ov68fJ9C1QHtI4oa3SFkR5Bmqlf5k
	w0VhQs+/m2250LhZf9ZGuUNevGLKWaT7o+lCuzjShdp2E13PEVlinPmyLm3JIXyh+J4PFMEhKom
	+VoTIni8jU1VctkGi8bwV9EhnGIr0U5/jbNGJ8QI2SB0IZW89/Oi0AUuoSZsz8s1EgLT4MKSkFx
	Z765okFODiibArtdmVmupzGbEoVyTXPsHzg8PbXr4xs4ZOH6fLKXI4WNs4dkL
X-Received: by 2002:a17:902:ef01:b0:2cf:7dfa:7f56 with SMTP id
 d9443c01a7336-2d64aff2aa4mr82872185ad.2.1787340944584; Fri, 21 Aug 2026
 12:35:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260817-chid-v7-0-a5872e64d8f4@nvidia.com> <20260817-chid-v7-5-a5872e64d8f4@nvidia.com>
 <DKUGXCFA0Q77.36Q64A1AN6FX5@nvidia.com> <CANiq72=ot1SVQRxzX5NmyTspzf-eMKca7DQMdUMSHtThn+kfpg@mail.gmail.com>
 <DKUKM1RPFDA7.1MBU5EY40OJ4J@nvidia.com>
In-Reply-To: <DKUKM1RPFDA7.1MBU5EY40OJ4J@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 21 Aug 2026 21:35:31 +0200
X-Gm-Features: AcwNN1XAwQYarkYaZO96R1zQNSWSUsItJpmCPtqUwSLujolMS-yXhhZvmEccbTM
Message-ID: <CANiq72=sti1OfTHzGWGE+EJxqBf_k73QFy=G5HwowSF=xCwtmw@mail.gmail.com>
Subject: Re: [PATCH v7 05/10] rust: bitmap: add contiguous area operations
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Eliot Courtney <ecourtney@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Burak Emir <burak.emir@gmail.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
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

On Fri, Aug 21, 2026 at 1:04=E2=80=AFPM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> I'm not super fond of the different behavior introduced by
> CONFIG_RUST_BITMAP_HARDENED.

Yeah, me neither, although for a slightly different reason: I am not
sure why debug assertions and/or EB cannot be used for bitmap like
elsewhere, plus why having a custom config option is needed just for
bitmaps. See e.g.

  https://lore.kernel.org/rust-for-linux/CANiq72=3DtKVD13GD2Bzmt_LnC4SiOX1n=
kHQPcz2BS=3DP=3Db23e0Yw@mail.gmail.com/

I think consistency is important to help maintenance and to reduce
mental overhead for both contributors and maintainers.

Cheers,
Miguel
