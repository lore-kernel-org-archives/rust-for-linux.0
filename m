Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D01AB176ADE
	for <rust-for-linux@vger.kernel.org>; Thu,  3 Jul 2025 13:39:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751549944; cv=none; b=Ea3lvKvYH/QVBUM3/QOwiGX1fC02c9z25WR5sTRq2H57krWVg9gZPzKc2vAQtmL5758fYvGdsCalkkUUgyla8cXy6UkAgq+oiF6m+tuHmUj5uRg5vF+rTE56VxOCHfn3rTvTn2O+wsHbaLSfoPxFtXT4y2lC9AllMJdRZMEwFrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751549944; c=relaxed/simple;
	bh=4K3OYwR8F5N0MTgj+DbBcMWVVwz+BMIhBvPvOzKagIE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GQSlNQc6Ao/NjMLfPKFIraG45shiv/l7NEiFkatU7NIT9CLrmi4OGu7ZiUgO4mnIrbcfBdSW3dP5E0TBaX9ZzQ0G+uN5VCDFpBtgE3URjUCSeg9uSMVxWoMbaEp4d/1a00NbRZMuZjzjo/6SLbvnz4LWquRcPKCNbKCbsawmmfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fCUCWHf9; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fCUCWHf9"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-453749af004so45340645e9.1
        for <rust-for-linux@vger.kernel.org>; Thu, 03 Jul 2025 06:39:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1751549941; x=1752154741; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4K3OYwR8F5N0MTgj+DbBcMWVVwz+BMIhBvPvOzKagIE=;
        b=fCUCWHf9AYPvugt8vrqMpWO9UAGYWM5dLymNAM8iI84oI7dV6h+NEclp6A09VmdYgK
         W+qSe4ipPubNHLh0I9LcPQZTGk3k10w6aBVZpIPI338au+0mMXjPXzSQhgcywh1bMfF5
         QjSeO2J2gLQw7zH5x6DyUeiW0BV19jvkdHWUFeHUnFwy/t149N7TGRNH97kthZZXOoJi
         7wHqD58d1nYxJlmm0ZlTM2J+wrqBD0KJnBiNXdp76J4sHcuywBp9N5WQaNieooqFhVwW
         qA/FRxPHZejOCT3eAzIeXYalC+hEQL08akMMnbEQAsxjWAGZY99ix0eatKAzWyslXSpg
         g7lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751549941; x=1752154741;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4K3OYwR8F5N0MTgj+DbBcMWVVwz+BMIhBvPvOzKagIE=;
        b=dIlG13cMEMm6yUnq5qnp5vB+JxDdzdC/vjRFWTatyb+ySllOq9trxCbIzTjgc3GVtR
         VWZoK0fBZJJ6tiOOF+vcXCs/AY8+jVcfCPiGnlcyzlAbun4JFQAsAz7yAiWV9nR3AC3t
         zb5a1qmZ0DQfdLBMMrsk2TLuUVDv6BWMCWTdagWNeVTy3LR0Wz4Ksg8ixdzPGb7oNAxe
         9VKTdKhhcQjTArW/lHG3vpdBY++PkhbGsG9lWtwBDxRysZ//sG6BvJcczsKHzgLUDYfK
         U7YZzGJvF4cRdfqIGrPm2umG16wKsHXI0hCOTH+jXsoFYugfGUt14bdOeZMZadAYLcHJ
         To7Q==
X-Forwarded-Encrypted: i=1; AJvYcCWPlaKrum1nnHC5GAXvWTALYKxHFMCoVQqpT+5+Y4eB3HNvHUVFOtcKTzVcklGpm7HQPlyycVeJPGlwwTC11g==@vger.kernel.org
X-Gm-Message-State: AOJu0YyElY6HaOEjve52i/lE2T3iKo70cRFmVNNyZ0zJojZud6wslr8N
	LFT1w449owZEl7IwlsH/PCqf7fYmamWV04LHc2PQBf4pdW9zTyIpSJkGN5Q7asosBL0DPzuXmHr
	z29fhv0xQ0Z9GVpfk2WwIg3Ic2bcXIG8UAH+bTAmh
X-Gm-Gg: ASbGncuigoaTvC7PJjtYtsGjyqzRxWwdbTo87mwXnHjPKWreQ2UwY/7ofp2yq4udXZS
	Mdegs10EEcXY43URAkaiWl+HycG17x8cWxrZ4Gh+aOPluoqU1QCw3jp5wujalarQtYwASm923Wu
	4FHqRDIFadX+9zl/E5GEaYaEppVP/WqK06NAYVc9+Jb+70WScqKHJi1JAab19yrg5NB2/Nr4uKO
	g==
X-Google-Smtp-Source: AGHT+IHdPkh315EiIjs3sNVT+FhWFvTNeu7WuaqV7pmJmX2UEr8PR3s1HAxn98NSYvoOcy/BrMIUYKXOi0bQgOR7Q54=
X-Received: by 2002:a05:600c:4f07:b0:43c:ed61:2c26 with SMTP id
 5b1f17b1804b1-454aa189576mr38171085e9.17.1751549940928; Thu, 03 Jul 2025
 06:39:00 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGSQo02hyJncD1oTpUMgiSZeX5UYYY2p-WZTyroQJJ6fMnOrCQ@mail.gmail.com>
 <aGLUl7ZtuQBPoCuv@pollux> <2025070131-icon-quarters-0c16@gregkh>
 <aGPtCBB6nWTNJuwK@pollux> <2025070137-tartar-juncture-fcd2@gregkh>
 <aGP6d2-jJy5rtjMK@pollux> <aGZVUqangIR-c4aW@google.com> <DB2COGYW20C5.2YN1TFXR87UTS@kernel.org>
 <CAH5fLgjaNzOHNxa+XY1c2V5A1H2RhWP9gHAAmHx=9LN9CbHq=Q@mail.gmail.com>
 <2025070349-tricky-arguable-5362@gregkh> <aGZ3q0PEmZ7lV4I-@pollux> <DB2GKFUREH3U.15ME8JB2HJOQN@kernel.org>
In-Reply-To: <DB2GKFUREH3U.15ME8JB2HJOQN@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Thu, 3 Jul 2025 15:38:49 +0200
X-Gm-Features: Ac12FXyegFZx9yBUmzc1ighB3O4JuHMJ2DJ_9lx2nv5RcilUCxCJFL6NBVNMbkI
Message-ID: <CAH5fLgi9POX-yZaVDaLYttO7ehpZBcnuLHoQ6_irOw0V3GA29g@mail.gmail.com>
Subject: Re: [PATCH v8 4/6] rust: debugfs: Support arbitrary owned backing for File
To: Benno Lossin <lossin@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Timur Tabi <ttabi@nvidia.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Dirk Behme <dirk.behme@de.bosch.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jul 3, 2025 at 3:35=E2=80=AFPM Benno Lossin <lossin@kernel.org> wro=
te:
> Where do you actually specify this callback? At the moment, the API asks
> for `Display` and thus it can only read values?

A later patch in this series adds closure support.

Alice
