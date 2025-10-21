Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 454C135581C
	for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 17:28:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761067727; cv=none; b=dnaHNWa3xO2fL1i+nn/U3NcQUU7+5o0miGcuJPKNJflBWcqh0LOhRcpExijm1Hd9VxF0AXL4X1U2WXDYj0nl7n8ISGYyLdZe+MyMdXMa4LlfmXX4rR+x299IUBRR+IuRS8PymYblMby4fZ0cOh5eoSx6a3yfs8Bjpzlb2nBKuVA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761067727; c=relaxed/simple;
	bh=sIvt0VE6pDtBysMBb+7V61rpjoqPHiE6K3Jjom9GL2o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sAo9iBtXh6nf/Xy2UUDlWMS/z3owN12E1KXJN+mVU/EHep97ES3AIuEylkOnQ8lMpWkF/hb2OeqnikHhhHf6HyPsh+SaUkgQ9p4iQVmNyrq9XuGQ+jnBZCOHTHJLAyMATnn4eFQ7LsFq7MXFkfSbsQVcRNH2WT6l7yPS9PH30dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=V9rmBTBF; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="V9rmBTBF"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-47117e75258so27352785e9.2
        for <rust-for-linux@vger.kernel.org>; Tue, 21 Oct 2025 10:28:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1761067723; x=1761672523; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sIvt0VE6pDtBysMBb+7V61rpjoqPHiE6K3Jjom9GL2o=;
        b=V9rmBTBFgMwOsCzcx6hkbvE2wahV/njmQDiOLRSyhHmv/qf3k1QWTg9n+TfgZzK7zz
         0EM24Nyk7FGkqcwzck1f3KIe23n835LozMEOzjarEAk6oT1BIXKbCpZwhT/5x3O8GX6W
         VbTaVgCquJLUlLYgmwJf3V38kl1/ZbAi1J91Zn9rZG1Up2G7gI5GJHz6T9WNxGFNwKOb
         cVaGPmd+y8r+4hokpMPSmSg51Cgl4Rgad4TihmVc6QO8BbcWz31uyLbyNnVrcUrJbYXf
         gEpqRqplISLivjFYioCGagtzQ3r76PWFIO7PkeyORk6cavR8nbSigJT7iVWjKEpoy16f
         snHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761067723; x=1761672523;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sIvt0VE6pDtBysMBb+7V61rpjoqPHiE6K3Jjom9GL2o=;
        b=IeN8DuGPsHlL9TSjRU1xVplRDkbSV5FRqdGiU70E8jZ383n7nVS7dt223gKQVCwtzo
         /oD3aBOtFR3dgUGo2nO4ESmBe8aXRootIF+uk8Ploo3FLiONcDF6tB42mOrsfP2gVcza
         /49m34scmX8WIjkrEgm/6PuUFusXczeJo/d7DXkHGp6STBctWxq3Or2WD/QtWWW1jqvA
         BP614V0icFGqpMom98Ijl4RXpaquhTvhIoU4uGqCJEwRJp+meTRWkpHxl2fFsZVl/i/7
         XrHe+ZaUC+gIOBTL2zlBtfXz3QRD9IWUwP/Cm3WlvW2bfDmWyc/gexsrSBnxPtbt2+oy
         /bxQ==
X-Forwarded-Encrypted: i=1; AJvYcCXD2gM1XnrYv+zJKu0rA33jTZTmvoRjqAGDErTFwYpKA+IXKPPAY98tqvdQjz3fElYugA8B1e5Bp8LLY+lGdQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz+HR2gcReQwLNJ5QiL6YMV6JCNIXcMdQMvpM0R8Hx0nTAgZuK
	kf5PMQzuLGMdfCWJ0N6dF8zD+tjm932yIw7lcO54AECfHNabuI1FjTq2XNmZc2on0m+wdPmhQSf
	8lSSzqk4iruildsIDUKIg+//zpM8qlHoWsvNDofgm
X-Gm-Gg: ASbGnctrXTnVMxwyzzmy3GAnWqc6PG2Qhui7kCZ5kj9RBmVt0ZPNaLL7IaApYBMTsC3
	WV1reXnlg0ERFGF4H9rINxJoH926gyIO9LeXfjTvKi12urT10QI6b6VLDC2U5iYZkK87FJdFsOc
	BTi5JRgy3x7g22YdaePyEsYA24lWiveaKoC1fCDIdT0j5AS4v6wNDvwb3Dp0yn2hcHcjaMXVQnj
	A1yNbGk9FRUUWqFNTUEh38fkHoWYG6cMwVVgJ9HgbJGzp8oj+v+0FxPQv2L1/tG44UG6+Axzix0
	gvPs5mc=
X-Google-Smtp-Source: AGHT+IEL8TSxmx+ByEqq5v/d3QwgwT+yuicIxnSrNoU89up9h0ClDt25qfzL+RROhLL5BGgQE8K9DsiKX1F8eaxX3sU=
X-Received: by 2002:a05:6000:2089:b0:427:608:c660 with SMTP id
 ffacd0b85a97d-4270608c8b7mr11588746f8f.59.1761067723329; Tue, 21 Oct 2025
 10:28:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251021172220.252558-1-lyude@redhat.com>
In-Reply-To: <20251021172220.252558-1-lyude@redhat.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 21 Oct 2025 19:28:30 +0200
X-Gm-Features: AS18NWDyAysQ4Z6TjDjvO3tfSPAMTRUY6vagZwaabzt8xQyZFFpYe2ktJ7q2CKk
Message-ID: <CAH5fLgjXF2D+498Y2-ayjmNJrQEc3iGDPSQUjinPE6GdWmiWFQ@mail.gmail.com>
Subject: Re: [PATCH v2] rust: drm/gem: Remove Object.dev
To: Lyude Paul <lyude@redhat.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Shankari Anand <shankari.ak0208@gmail.com>, Asahi Lina <lina+kernel@asahilina.net>, 
	open list <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 21, 2025 at 7:22=E2=80=AFPM Lyude Paul <lyude@redhat.com> wrote=
:
>
> I noticed by chance that there's actually already a pointer to this in
> struct drm_gem_object. So, no use in carrying this around!
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
> Acked-by: Danilo Krummrich <dakr@kernel.org>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
