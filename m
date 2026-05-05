Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13BAE38D011
	for <rust-for-linux@vger.kernel.org>; Tue,  5 May 2026 14:37:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777991836; cv=pass; b=qFzckla8RXRqv0lsBW1CgnHEus7a9RJlvhGC+4Wu92u0rJN/hZ3nElfcVD0XbKQZ7MUytxzJhf9DcSSBjzRcQp7+feQcp0RJ1YALpcuynMYsn7dtzFJqD1n9WIMOET7ByHoM38M7MWD8Tff4Q/7wDV+zKdWbSMheNxR+MVjGZWo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777991836; c=relaxed/simple;
	bh=14Nr+9gPmNKNTJDvr2xIkeXoFSBJU+9cLt0U3OQ7VPo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VQ5u+2NxCgZGrMbL2E/Uny8NpLSlpAezE8AjCmDvnEGMNV7zoVBA6ziwfTzW23sQ5NKkgiaE2zsLRCgaIREKqIwq1pqieFKWtU1ASYmgiiImrnVByurYjx5LBpwkxivLYt/YixBOWyom5E8yENgON6GswWv50XMkXbKVwRmJAIM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b6ZAo7wI; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b6ZAo7wI"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2ee4e75bc93so324150eec.1
        for <rust-for-linux@vger.kernel.org>; Tue, 05 May 2026 07:37:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777991834; cv=none;
        d=google.com; s=arc-20240605;
        b=LHwwf62ufxGrU25OZrNmZmhM+GRyxIOgMYTV5q0eb3SBHialnzIeDxTRtttek4QIne
         JAMucJjdqb7ZUPupCKHvXUGgp34LNOAtuGenVSwemhBUAXvMoDWAq0beQNu51vEn8inj
         mEe7KMFuVZlDM0miqvwJ4/TWK09pjoN+tQ8kHxZiSqhXUviNNuxCaDKuMtQeuXFyBpWr
         6RrmONOVStkRjRqjJrT0dbaPUg9wfk8LYNz6iUA0dSOw1vBEX5U+1E5ggVBWBxEUb66/
         oe//U2LqyEeZIqLp8l+Wkd6YeLWFL83Ro2RVkJ63+FC360Hj1YqQ+qht3i6wSXtpcMcI
         Kmwg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=14Nr+9gPmNKNTJDvr2xIkeXoFSBJU+9cLt0U3OQ7VPo=;
        fh=/wksi763RyVCb0D3gpkPUjGDIzmY1zyGi+jd/q7b0ZE=;
        b=drkq42+jkRTtxNRKvx/tim/7trVK8wcVXiZdexTn8XIjE8JnL2wrkGnPaeWPiO3pQM
         AtmA/rVL41EhfA7IoXTZxLm+fli7pgOvBQD1fPr9r0qJ4dLdzmnE2Wp0iue22ECOoFkT
         0aA4MOfmivyF12jo9hqeoofHkme3PeUnBVVf24goufKfK5EyTfZND0yoQASJfruSY7Td
         8vqrQw8zPkysCf1Y+QuiriRzfCmJDAMmZ0BEdIWEIVTG93e/o73fn8TWPKXdllnnWmUT
         rPZ2E2tq2ANGpxeDAjBd80uxgZuWexhD7vA/HtxU8C2ds+uYQ4tjBZCPKV31gkTHgVZ4
         Cy5g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777991834; x=1778596634; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=14Nr+9gPmNKNTJDvr2xIkeXoFSBJU+9cLt0U3OQ7VPo=;
        b=b6ZAo7wI+YWlFSfmV94de0j+syISdOgZa2mm2ZuDQZvS72skP0z9+CqIeauoD4LvWb
         jWcwUngEaDNUgSjpfxpKkI717k2wfz9YgapahmADHqMm0yAMI9I3qMOj84KCioKorid4
         o4/FQb2l7aJjrsV6FDiEzj6BfztHgg6SK8GbtdOGDhl9BsGIW5UtSmhdBV6yYFvX5+6v
         d2P3LuDd+qsMp0ZUKgPNrNe5wS1eppoxhh6k5qdZLmwAoRfC21++LDQctxyq00wTqyI9
         EClq4OLHQ+Vv7BwbN8oYhmxqqkfyur+GZOMLl28hg6Z9cPk640zlBBgzsGrvy5oTxNsq
         Q0fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777991834; x=1778596634;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=14Nr+9gPmNKNTJDvr2xIkeXoFSBJU+9cLt0U3OQ7VPo=;
        b=lEFL+Oc1lXm8HX+j5APW6sD741vSUtxlEz0em88qDtcC57BPWlLPXhiGhMU1prliFv
         pEJSaOeHffTO99WrFymzp0Dsg7UYsX7VFRQzGlWhCxv157hL+4GrN9Zf0+6aWJfcLWpK
         Af8ofI5cilF2peODvxDBGq8biBg/yVrjW77SdLk6JXORIpyfLlxvIkumNOHrTWOXVxhs
         Udt75PsPYRatElr5K1Fz3aky3QFl2vBQWYEcXoXK8AJJvMRMhKGkYaZPczVIHTY506bY
         ws/AsAJlOj6JVOjcKdRy19NFnEGLTVOkMbndKsEdhR2X7ISuqXqWfJ2WeM63bmQHXmBa
         LlUA==
X-Forwarded-Encrypted: i=1; AFNElJ8K3y3MLMEZ8MlcDOR2tsbq9BxmJdz92Qtrgh1a7lK0AI+6FGFqywwdxDY9mJ36CD3CFgednQg93SewDZCiUA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHF0ZeZL16NWYz+aYUYRbJbCsQcIUuAZFB7YXNWs2pAYqkJPTk
	YNpyGBf3O5icLafEAnCGkEWEwgajSLVD6Coo0OxZ7LZxtR8/CPhXC1THzBgXfkeuQbmbhIyVBe1
	9+Vngdtdz3NLuKgxQ2h8Meg+/KwEPsdA=
X-Gm-Gg: AeBDietxKNKCxVLivJ/q0pbc324mmAX1QeEkJUp4Nb+nTY5T5v9VNd7taadg5fqnUmy
	txEfpe/+4WPGajwU8PXGcKCLOUuXMzXKbm/MUZ7duI3e/HAn81wRlnVhF6sQL8Wo5ctBWWUJBQe
	kDEumyg5emcf2KrlBWVF2dld3RDk6ZBtKoSZNH2n5BY3igmHVD0AusZRQIwPqCO4fx8/NAFCbw8
	11J4fYrT/O8YtnlpU5VCr85rpr26yYS6ZJmCzZRf151ee5xy7pa7QCH9eJWEyvjkaELOk+tyh9C
	JL8DfMYWqk/OfVuc2bIKYWvop3bM3uzNYusFwq6/+kZtU/otWetJ4OJVwdbG/Mvn4IQ6f/+tjeL
	QXcqN46kr+TS676e/46cd8LqVGl/bMTlBsQ==
X-Received: by 2002:a05:7301:e25:b0:2ea:de28:f389 with SMTP id
 5a478bee46e88-2efba5b4911mr3081382eec.8.1777991834024; Tue, 05 May 2026
 07:37:14 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1777908711.git.mchehab+huawei@kernel.org>
 <fce06f1b1c620c65ff6ddbc09fb4808ecc1aade3.1777908711.git.mchehab+huawei@kernel.org>
 <CANiq72n+y0AerfiUzh5fLpMRiGGFq5rMxqweHG-TsmX_05vxBA@mail.gmail.com>
 <20260504222637.176edc7c@foz.lan> <CANiq72mk=gyGcQCL_DU4tKXN4U0rqH3wD7S04AuT4UGRFjCQaA@mail.gmail.com>
 <20260505020831.698650ec@foz.lan> <CANiq72=2cB_bDa0c1FA4aOMx8d=RyuNs_O+_72EiUurMAY+0mw@mail.gmail.com>
 <20260505074534.5fefbed0@foz.lan>
In-Reply-To: <20260505074534.5fefbed0@foz.lan>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 5 May 2026 16:37:00 +0200
X-Gm-Features: AVHnY4KFg-nA5FI-3PEmoPQaEhP2bML65wk5bkvVgUZ5mMQRL_JGieGpQ42SIY4
Message-ID: <CANiq72n3CJXK3wcze0Ee71knG5U9RGruwO59Z_vS=tpW6=+XyA@mail.gmail.com>
Subject: Re: [PATCH 8/9] docs: maintainers_include: don't ignore invalid
 profile entries
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Linux Doc Mailing List <linux-doc@vger.kernel.org>, 
	Mauro Carvalho Chehab <mchehab@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Benno Lossin <lossin@kernel.org>, Boqun Feng <boqun@kernel.org>, Danilo Krummrich <dakr@kernel.org>, 
	Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Shuah Khan <skhan@linuxfoundation.org>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 7:45=E2=80=AFAM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> No, this won't work. See sphinx-build help:

That doesn't sound like a fundamental issue, i.e. we could work around
it. Anyway, it is not something we desperately need :)

Thanks!

Cheers,
Miguel
