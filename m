Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 821333EAC98
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Oct 2026 06:03:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791352986; cv=pass; b=E2tdywxielmSo/7mQtyf6gjv4vREr0zKqinecrdZvtgUKbO7kWXhtLwyjLUizIXFbppaE6lT5thJRW17Iu1yB8whaMdMbPUDTGgBOl/TWrZmPQnxHtzCjOtcGIT/vqnoUSkuE+bALkhT8T5nRgqgSm6fQFM6dMQU8Kbwfqjd2OM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791352986; c=relaxed/simple;
	bh=FieSFhLdozKsUNyoEr9PXiW853gnhNUhDQ5NE6wOnaU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zx+Hb5o6+utQEGIk2gsAizzlldzNH9nVihxk1/qzybJfEsXc0CtKR75oNoogQdiq2czEARtZx6dlg3w0/yj710w3Inmdq5p3+rghpUWA7ORP3EQoXoLu2zHUljvTpG1v0UP4jmzcYb47b4VTCMMChUGKLrwgWASaoZu46UqRk6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=U81xgbUH; arc=pass smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="U81xgbUH"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-48af27fe287so1057161f8f.0
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Oct 2026 23:03:05 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791352984; cv=none;
        d=google.com; s=arc-20260327;
        b=cQaAJK5LfJqKIRHwhMdNBj6s+ksD7k/D0RcMSW2x36Fu/ccBujdI+TyqKTL9v1F6XG
         TZTOx7EAwoU2kdkBAeL9cCOiRvGKOj5hSS+Q2Nnj/c/+x5zMvbTqT43h3YPpy7NLzNtS
         FbIxY68fJ5MRfICAI3YH92ZCAutu1j1cKqwaWqCnQw9KzNLRMfr6YCvOBGIPEhu2cN+o
         LGZ4NzkiDFDgMJ5jQrjGOwNf8UpDRFs4jsMnJYmbbH4xAArDgNLA2NltFGdpU5HtBU3E
         LzwmaUeLKUe+wp4qUWv+KL6rP5nh2G6pRcUW3d+HRBm40ORpl84ap7SbC0fNgiqGYpd3
         DlsA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=FieSFhLdozKsUNyoEr9PXiW853gnhNUhDQ5NE6wOnaU=;
        fh=/jURmHcXt/gN6KrMH9ekWWJoQ6qMnP61S/pyFU6Ea50=;
        b=U22GD8KnB32Zt1BjirjqX1PW3XCR5O8FG64DM1tI95m/3870kGVgl7pO+5egwE0IbN
         x2i9/Yc2Ap0OrTwrehcfeHF1PpLaNimqhPzeJFZLA54cYbYm9lrA5AQkNaOonJfqTnm2
         2jYgdOyO2jt6F6TJELIK093k5VOaY/NGUoYmzAuGePd9Rems+ty0/ojSiLk/Z3n///Ur
         UG7oNIPbygQu6x8YZDHGklSakX3zzhLtTRnMKQ2yLwqXNZ9Tk2YZGJo6KIEIYV5b83H8
         3ixwd2gGcP/Av08OxmUPMdBuQT7NqSiahdAvLpp+4Ab2FnxdxKk2fhidxdnWtokQfr4/
         E0zg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791352984; x=1791957784; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=FieSFhLdozKsUNyoEr9PXiW853gnhNUhDQ5NE6wOnaU=;
        b=U81xgbUHTEHIe+zPE0e5sgxSsNp4Z+8+8Tf0uxVgUtba7L69pBa4pyRqmeIZ61G4MC
         eQsY21rWt9/cHrkQ9PQX3jWtgZQB/YTdRLE/kTz58O6z8BB1jfAJCgyh5rUNEVZV4JGs
         2JiU14f/B4RueP3vHu49LFGDXEIJeRP+O/OhiFxs0AfRrqjP1Epy7XdxIkyEGD92/44j
         N3l3PssF+yiL6hRChw+3c5xI0jNLv6bGgIkPec/zh3Hpn4PyOPqpe8ciaH4lZz8mrua5
         v9Fxx//Tmao35o7LJTP3nYiP/pksSC+kIjhE9dZiQoilqkKHv0EtUEA71nu4GO8ntZgf
         FCrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791352984; x=1791957784;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FieSFhLdozKsUNyoEr9PXiW853gnhNUhDQ5NE6wOnaU=;
        b=OQo8A4MRRD7BVb4Giy2W3c8TmvtCzF4ellGOr9o2OrFknwq4i6Dx1TYJUdOhNZAGrB
         5R/GyjsfXyHYgyxxBUygMi6ZAvwaIa01bXoZpkguaqao0qbzywID2dTnPcNa0ixYqMzw
         QUloPfQp5eyHTnGzw/sJr7f3Oz7+yrxtSYvQFfWobAnN18x7Ysj0LoTZh9qmpnqOJj5f
         d5ER6O1edeO8c0kt3sMRveSBIt+tWB/JbVCR52oCDcDYqS/8l6xPQe0hkVEng2nk+QMj
         JXA+ONAyRze5mjqIgw3hs3/gYiDZdE8/8MOemqrVKItZnnams4IsN3xSvrEoox/H5HfB
         2hcQ==
X-Forwarded-Encrypted: i=1; AKwUvBx6zSA/MwKPOsh89wbWgUVvBOgZMNys8OZkd8j9K2tRvmeKY1J8yAfL0U1Og5H+SSk0/HISxYPZSCaGQd3OmA==@vger.kernel.org
X-Gm-Message-State: AFq9FYIqba99DdkkkieBbpXrgXyQOQwnrGiIrxD4JrWpgXvVswsNKXxk
	90c1f6fv0UBdnTHOXBv4A/MO5QhBBqcFMqJYHmlE0XZcmu3kM5tiqB3lbvhVfY2xZs26iv/o7T5
	3x8voZjHrk897TDYnLkOAz9pz83PWxw3gn88uU4tn
X-Gm-Gg: AYBFou0hcQ+LHcujsnBgV853jWQZ95HrcRciDImdC2J5RTpvIAlUU5p7nBpskmfqVXA
	yGjafDvaWZQSKxCc4jOu5D1Hd/4qFBmAHrnxsSjtZBCSgpq8OBj3h7NeZFGH5VvhPlgathVGkzf
	wCvVcfuh9S+TOvtnAyX5cXsnST0Qy4OnjFEem3h4mOkh4zeOOlpWd7lWv4o5/AEPfYIJq1pxCQT
	YUKn+lxB8zgyDrVQhaq8iN6AnPTMVVocMxyPf4gHFGoMUi1CtfdNJyM8grCr15nSk+2lZtP/E5P
	lL/FAFLB/9nbeR0spVVhzJKyL5d2Cl3JfeW0bQKur7jNs/HPHWdJkrDnloSBLSXZiOlBQAuqoRG
	c7uPT8k/A4c+QuGEp9fDi2w==
X-Received: by 2002:a05:6000:22c4:b0:487:27f9:840 with SMTP id
 ffacd0b85a97d-48c72898491mr2425269f8f.53.1791352982922; Tue, 06 Oct 2026
 23:03:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261005-devres-6-18-backport-v1-5-06dcf0e592d5@google.com> <2026-10-06-1-daily-reply-0001-rust-irq-cookie-7.2@kernel.org>
In-Reply-To: <2026-10-06-1-daily-reply-0001-rust-irq-cookie-7.2@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 7 Oct 2026 08:02:50 +0200
X-Gm-Features: AclHuK8hcWrWSzFx2gPHGU-ZsxcJZ1WfkgDVOXDwBNO83no3aGdcmvQVaOUlmNg
Message-ID: <CAH5fLghSL4skGJZM3wmvq=PYiHVgB6gRUZTg18wSx8x2rETT6g@mail.gmail.com>
Subject: Re: [PATCH 6.18.y 5/5] rust: irq: pass RegistrationInner as cookie to request_irq
To: Sasha Levin <sashal@kernel.org>
Cc: stable@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Boris Brezillon <boris.brezillon@collabora.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Gary Guo <gary@garyguo.net>, Markus Probst <markus.probst@posteo.de>, 
	Miguel Ojeda <ojeda@kernel.org>, "Rafael J. Wysocki" <rafael@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 6, 2026 at 11:36=E2=80=AFPM Sasha Levin <sashal@kernel.org> wro=
te:
>
> > This is not needed in mainline because commit 98c63ce4d760 ("rust: irq:
> > make Registration compatible with lifetime-bound drivers") removed
> > Devres from irq::Registration.
>
> 7.2 has the same uninitialized read. Devres::new() returns Result<Self>
> there as well, since ba268514ea14 ("rust: devres: fix race condition due
> to nesting") is already in v7.0, and the refactor you cite only arrives i=
n
> v7.3. This patch does not apply to 7.2 as is, because d1880d5f5899 ("rust=
:
> irq: move 'static bounds to traits") moved the context lines.
>
> Could you send a 7.2.y variant of this patch? We will queue the 6.18
> series together with it.

Sent! Thanks!

Alice
