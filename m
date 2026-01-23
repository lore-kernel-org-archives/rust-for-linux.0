Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2C73199FAB
	for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 20:21:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769199717; cv=pass; b=EbJTC/pqxLaa0V5zq+DEh0EztODP3M2hHsQi3Vx8jA24jgJQMU50b1sMajWuOYXF0u9Okc+TrbNgquJzXjyUU4QcVZlcCsNhJDgXkvgrW2zg9E6kuBUavzt/7lu4QLwbusvtZfJbQfZ5snitPuSTDGlYJ+eEqc0cuUHfZQ/JHoc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769199717; c=relaxed/simple;
	bh=tYTkrrKvxXRdGIyytYvYnylK83PY2Yek6IF+8AvwZ/I=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JG7HaTOGDYC2NqPFjRGnXKcuyzMTe8CDRTYf5vMFbJhn+0r7cw75TcD/BRL/Ay3Bmhdn88p2TcQwl28JokhyNvs6wD1IZxWAatcmqvb1lnCJygkORs4aWFqIz7J4fe9nIDf7NNp3XYAGmK5qefCMGZW6ExWky3NJnXIRXz98ChQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=3Z11BNFz; arc=pass smtp.client-ip=209.85.221.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="3Z11BNFz"
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-432d28870ddso1417063f8f.3
        for <rust-for-linux@vger.kernel.org>; Fri, 23 Jan 2026 12:21:55 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769199714; cv=none;
        d=google.com; s=arc-20240605;
        b=HC2Ri8Zqsa1iA76Bcr+Z4Of4BnPNalAZQv9DKMjuAKQGAHFAlSa0zQWJ7uXcaqJdPY
         gJ02TQkUeyh6Ir544ZFX+3J2/MML7m9Huzge7kN0vJaACyVtqIv0WqXC3sNgSECsPR+B
         cjtLvlOvV+BVxvtno+sRy0nnzxxyRIy7kbKGQgdmpBHGf9VRaYxFfVBZJ/m423/i19GK
         kFFrVh9mhiQiZqvqXn6uUhGYfAYkncrWm3WZbsO1Op7hwVJzA1cNVsizXjyLFL+gjgA0
         mWLTyADhOSv1BaH0BVw5skHlfCKYRm4uL2V+lwz8wNf/8iCgsUdrk+YMmPaoY4NxfnPU
         VevA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=tYTkrrKvxXRdGIyytYvYnylK83PY2Yek6IF+8AvwZ/I=;
        fh=HE06Mg8HYwK/jww3c79w9jjM3dkkSKs/ZfV9DkOW5x0=;
        b=eXY4U55hCsP/dDEexH+K+sb1UM70K58ca4TO5qomfQlPUaM/kBHevdgPqAxJqKbWfR
         o+ZjpeBTe/bp3XyE+57zjdeQpDJIFW0/KSgVkhSZnn1gwpo36o/W/ejcrt9VPK5mJeRu
         dYqnXGUmJ+Vdo0Nf5PENaDZNEwSIMiOmZcMT6pTmIsgfRheOu2S5EpmXosk0ONSKhTDg
         E4AeRbXMMBJ0GwfkI/F5fmnLvnI4gOAs7UEJp8YDdYlgv+vasqHDY5ez5UiEiEfETQaE
         Lw+ugDgmQxAtGLQ42I67B9plgD8ZPpZxAl/F5XsrKjHcmrdUjbxxDtRmappSXYkWCvLK
         PUuA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769199714; x=1769804514; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tYTkrrKvxXRdGIyytYvYnylK83PY2Yek6IF+8AvwZ/I=;
        b=3Z11BNFzMbhGJue3wG6QxB9MhXqIZ1ydPRrL3UapIZLtEl4QTg8eqDIlfQeo5S1QXh
         Q3rRBC1Fqax3TUZSI9lUpv4YGXdy4uI2vxZ3CFg93EJqkeid+hqHNy5ElB5AuFN2/GYc
         15y3KjVmPQOiHl4TZaaMvNLeI/l0fherWmeywIMzv9NayCUnAqfDVNukoCqcEdKCxFQS
         8zaoE1/OWUX4t8arRfZVu3Avyvihkr3YrxxOM8DFCcLr9q+L24A4/uQR5JU8/tzV9dQM
         pDWDfS+uU3jaPa5B0HC0P9t5HrpgeLDhjm27k3AKS++X3Xbd5IhdBP/Ki4PsKh82wex4
         p2zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769199714; x=1769804514;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=tYTkrrKvxXRdGIyytYvYnylK83PY2Yek6IF+8AvwZ/I=;
        b=gtZ/J72atPPrYgtOmZWsSZuecM3BFl5SnWLvDvH+JuIMFuDb8VXodIBAA5u9tUPg4C
         5FHW5DIdGSXgmfR5ENkw0pyP2AsL741Dvuq4cSg6QOfxb9k4nQRyy+wHOa5rwsP+cZmr
         gpJQbld/MxbVk4tVZJybVuVQrR1MMQPYnPXcrSX2VdUGqvMRuzFu1eO0O7hOp/Oh54Dv
         IL0HLNEsLsRO6hp3AyA8Dqs0rdZxT7c1oWntZNA65fZjbp8BdbXDo7oYRh+lJ2Hg9Zi/
         r/HpmGVb99WXtIbatWfhYcOJwyNkXAsIiE9vMqzBxDt0xSVLruwbdNw/lECR5Iw+iQhe
         qJPA==
X-Forwarded-Encrypted: i=1; AJvYcCXN6d55/7wlenQjgpHrnr4fXRPVuRi9JEkGZq8FMsywc2krTC9DiYoI+1LHRdiiVWTFZncSa/+rKIDRNG5vXw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzG0zJM0RmfeRCBIMsnE9lEMNrOsxVcq1qSWliYslpaEcOgZSuU
	AkRpRnt/TRP7m6cW+1sePjSZ1DCTpvv7heSfRU5CsYdm6Nk5uSc3xICRnirG0R9hwAeC0zoWheo
	zwjEJb39vxhtyfBVzanSN6cCNyB1nFlqLObGCnR3b
X-Gm-Gg: AZuq6aJBiWavUyo+P8wU8GJtcphrdeXYmCXi7NovzmwN2QoIHTEh8o0vdYtrzhwC2ig
	0nPEjrD/RT7qHWaB2i9VDXJP7pDRWAk4WBAPLeyRzYLHtytbGoT4gvd2OyRUMrE7he0cSYV8aAi
	SFh1AcrmVtRM7Ta9DUH1OBqDxhU+9JvCiVz5VcGIzWOBN3DGYFgCi4VNDYO73JnfxZc/oNqTBvt
	H0gsDauHoLRA4ibglmlqlZ4XGI6Ur0hC1LJNntvu7hNvpisgfzksXVIvuwuvQuIQ82WKs2ivLyY
	53qSYxIWOMYL4W1FVmLwiU3d/Q==
X-Received: by 2002:a05:6000:2307:b0:435:729b:c390 with SMTP id
 ffacd0b85a97d-435b9669f54mr4708948f8f.47.1769199714152; Fri, 23 Jan 2026
 12:21:54 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260123175235.209092-1-deborah.brouwer@collabora.com>
In-Reply-To: <20260123175235.209092-1-deborah.brouwer@collabora.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 23 Jan 2026 21:21:41 +0100
X-Gm-Features: AZwV_QhV7L9EpT5JVv9GhLwtH5gmRNqQm9kkG0BqPUvJju6rCMrDt9HxQcIre2M
Message-ID: <CAH5fLgjtZORYCJBohhD1W7RYcsSG6=ofVVLkg=xsdhKDA94ghA@mail.gmail.com>
Subject: Re: [PATCH v2] drm/tyr: suppress unread field warnings
To: Deborah Brouwer <deborah.brouwer@collabora.com>
Cc: dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	daniel.almeida@collabora.com, boris.brezillon@collabora.com, 
	broonie@kernel.org, dakr@kernel.org, miguel.ojeda.sandonis@gmail.com, 
	gary@garyguo.net
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jan 23, 2026 at 6:52=E2=80=AFPM Deborah Brouwer
<deborah.brouwer@collabora.com> wrote:
>
> Currently the rust compiler warns that certain fields in the TyrDriver ar=
e
> 'never read'. The fields are needed, but they are not read directly, they
> are only written into an 'impl PinInit' that is returned by probe.
>
> When warnings are compiled as errors, these warnings prevent Tyr from
> building.
>
> Suppress the warnings by adding underscores to the problematic variables.
> This allows Tyr to build again.
>
> Signed-off-by: Deborah Brouwer <deborah.brouwer@collabora.com>

Applied to drm-rust-next. Thanks!
