Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5ED3133DEE1
	for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 19:44:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776455071; cv=none; b=lbLReSA2KmbKpDFNVf3x9+1lmZVPOEcCiTx7aHldtFzwVVALhMtGg+Ls0NAa2DgOSKLN4u+CHYuR1aiJXE+Wl/d7d6ivuabkT+EEvaZHw56W/XPGPnftIE3mu++HxliG856Fpu1KBJeoCgVlUE3kSqY43qwZ+RIn4iQGgQJ6hyo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776455071; c=relaxed/simple;
	bh=4AUae5KcEeFvFh3msKQXl5hQJhIopamMvxo6YZ4ukss=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 MIME-Version:Content-Type; b=iafXre+P7NanZodQ1RVtYM1uxqO8IQexCUzduFqkCmBFWabu64YRZ5dzlNMtBn1I/YrLpcoyxPvKYuqyznmM/Dxd4rjIeJ2C9aSdxblpeCfGDwd1T2Esc9bfBsQ6w/csaLE/fmR2JQWpSakO8iJp2r1RrOepvlwu7i1uUb2AuQ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ScaF/hWL; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ScaF/hWL"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1776455069;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=4AUae5KcEeFvFh3msKQXl5hQJhIopamMvxo6YZ4ukss=;
	b=ScaF/hWLflWAYuk0Z4w1zIK1BB61+gW2jXF0SUApYSVe4x6/DlccDRXxhm43jDEX7nGOx9
	zpJDpXFvARmjPhSqh28hZWVRlV5edsVAyQnK5OAATzw/144O3EdunQlqWyGIvYlNIBil47
	UtPKuX9K10QLLhIKOqjAgb62EcvYM1s=
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com
 [209.85.222.199]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-458-GmeaCcz-PIuuMsjivJAEpA-1; Fri, 17 Apr 2026 15:44:28 -0400
X-MC-Unique: GmeaCcz-PIuuMsjivJAEpA-1
X-Mimecast-MFC-AGG-ID: GmeaCcz-PIuuMsjivJAEpA_1776455068
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-8d5010ea730so552429485a.0
        for <rust-for-linux@vger.kernel.org>; Fri, 17 Apr 2026 12:44:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776455068; x=1777059868;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=4AUae5KcEeFvFh3msKQXl5hQJhIopamMvxo6YZ4ukss=;
        b=FDrgGENang60NV3B5EQjalNXlCOphoAxnziMPt6FdywARozmp2LNWj6ZxDV4vJgDED
         5j39ZF8LLfgfFZzhKYcXjuE0HXMhwRojfDOdGf7cdjH2q9iHEJxKiBPQL2Cijf4luU0X
         MN0B3/PgsJvFQNZnMhHX2wpphfFfTn3bi15HnD+PE9teHxScuGTRb1osk1sOjh6nY5nP
         Mb7UcQX2E4CCLUQmq/6cChC0kTD4udywSLg1IORCWL+HUKZoLS07+wFH+amNtm/EuCvw
         aXmiBp9kqf3Vkr3NO77P5fEHZgWVY//B7WgC4kzpGKUjNZdBFMedP2Pboqb0Sgc+q6N3
         /9QA==
X-Forwarded-Encrypted: i=1; AFNElJ+yc03/L6EwgtL/I335tAnfhENvxUK9tRCYywb8zw945ituavwG05PLf+xNNZyt8ebrx6R7up/UHOeZSxinTQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwJFXvWg0Q/ylM9R0YSQHU0U3cKin/qkCSQ6SS4QoBBGJXSb8ps
	Zf5+Id4nxQjxONDnbFCKwgeSdjDWKBGFVthxMS+aIvm6s00yqKs6WPDUpgu307eNt059011sBqh
	CbL9nJTK9LRQ9rWUPsA+h9lNrv84F61W9EaFSTw45Y6cn3M9wU2YG+RO5u1qD5AhOdnIA
X-Gm-Gg: AeBDiet04ZivwAJZgmRIVXBm8Aov1HivegM0Hie1khzDanrF0L5VTWp+xVgy9TYfsuz
	FAIl0aTbnjwc0XlUVONvkIA88i5aEfYKC/DMNlDttL6fRazJcNNGK1Md2mdyLm3yiZtHqbhP33Y
	ONguJ2S869drnsbvpB/KEbE8Wi8yMult+3yq1QmPFFN8paWpOlqFKvZb/V/gGe+RuCVAABfgYQs
	X0gCxZxVEja6yYwmk084j42mixFi8kT0fihad6zcz/q8tunSlzCkHGnALAKHGJ9durnR1ZonMrt
	8ZkBxYH2TLeonMhSw7g3U9vl+IlU0DdGjdOH1rli6Ny0GrIU4Ke96FtTK3ayYV3qKeaNUCGZCrh
	0zUwEUb6d2746WXEP4rqCt+Y96N6O
X-Received: by 2002:a05:620a:4408:b0:8d9:ca3b:5ca1 with SMTP id af79cd13be357-8e789c5ab1dmr528961685a.9.1776455067634;
        Fri, 17 Apr 2026 12:44:27 -0700 (PDT)
X-Received: by 2002:a05:620a:4408:b0:8d9:ca3b:5ca1 with SMTP id af79cd13be357-8e789c5ab1dmr528955585a.9.1776455067197;
        Fri, 17 Apr 2026 12:44:27 -0700 (PDT)
Received: from [192.168.8.4] ([100.0.180.93])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-8e7d9abce59sm243352085a.46.2026.04.17.12.44.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 17 Apr 2026 12:44:26 -0700 (PDT)
Message-ID: <ba9d6fbd12a42d95e6349e232111d5e72e88e1d3.camel@redhat.com>
Subject: Re: [PATCH v10 4/5] rust: drm: gem: Introduce shmem::SGTable
From: lyude@redhat.com
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: nouveau@lists.freedesktop.org, Gary Guo <gary@garyguo.net>, Daniel
 Almeida	 <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org,
 Danilo Krummrich <dakr@kernel.org>, dri-devel@lists.freedesktop.org,
 Matthew Maurer <mmaurer@google.com>,  FUJITA Tomonori
 <fujita.tomonori@gmail.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	christian.koenig@amd.com, Asahi Lina <lina@asahilina.net>, Miguel Ojeda	
 <ojeda@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, Simona Vetter
	 <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, Boqun Feng	
 <boqun@kernel.org>, Sumit Semwal <sumit.semwal@linaro.org>, Krishna Ketan
 Rai	 <prafulrai522@gmail.com>, linux-media@vger.kernel.org, Shankari Anand	
 <shankari.ak0208@gmail.com>, David Airlie <airlied@gmail.com>, Benno Lossin
	 <lossin@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, 
	linaro-mm-sig@lists.linaro.org, Asahi Lina <lina+kernel@asahilina.net>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, kernel@vger.kernel.org
Date: Fri, 17 Apr 2026 15:44:25 -0400
In-Reply-To: <DHPBAVQHIM11.XVBHOWYFRITF@nvidia.com>
References: <20260409001559.622026-1-lyude@redhat.com>
	 <20260409001559.622026-5-lyude@redhat.com>
	 <DHPBAVQHIM11.XVBHOWYFRITF@nvidia.com>
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 7oU1z3zqipjrimLe-xzWSc1fXReP7DFJZTGuT_SbWqY_1776455068
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Just so it doesn't come as a surprise in the next respin - I don't
really see a reasonable way of using get_or_insert_with() here (though
I had no idea this was a thing!). However - I can get rid of all of the
ret =3D statements and also clean up the indenting a little bit with
block expressions as I forgot those exist.

On Fri, 2026-04-10 at 16:55 +0900, Alexandre Courbot wrote:
>=20
> nit: let's use `let ret =3D if let Some(sgt_res) ...` to avoid the
> multiple `ret =3D `statements?
>=20
> Or maybe even better, you might be able to use
> `Option::get_or_insert_with`.

