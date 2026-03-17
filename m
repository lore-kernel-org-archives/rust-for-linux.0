Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370E6342CA7
	for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 19:41:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773776500; cv=pass; b=BnKY9VQNjIOXTyCSULRtVQdgEUgdiQJkwp8og18qhELEWqTn+xUquKA/ATx2SWF3nZZCRPmVZl40yzuGaKRKp8YnL4clWwsCqymc1Otl0jvtgDfYLPxlRhaLNcMmzsYTelLunfjDy1OgJrF7D9hgrwDwj3KN41gx6cA3j4D8qcI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773776500; c=relaxed/simple;
	bh=wlFA6oh9h2Uqk0U3FytL3VE7dGDdOrHtz15OKY6zjA8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pjYvXLoGOL+bhzz/mtj4iBwNJHxf3yGksvcY1nFVy1CLivvsiC+s2pfefkqpmFQjfXuLJ59iEZM8APU90cRpUDDGLhERMzKrvDw9Txv+I5LtGHm6x8ysA7rgogcOkseHLd0y+MiZGH0mGNhDNDDmfV8FKPDb0iOb9rIdNeFcQ+o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IGcHG+UP; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IGcHG+UP"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-128eb45835cso251593c88.1
        for <rust-for-linux@vger.kernel.org>; Tue, 17 Mar 2026 12:41:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773776498; cv=none;
        d=google.com; s=arc-20240605;
        b=LkjCZyboDTTl+4nLjnME0yOhz0O0GBUA1myKvZ6i7FotxQBa7Z7Vyqb87ylaiHLFle
         XCsr9GEfD+f3Wl6iqo9XpoXvk06Zt28Aw0QbRx/7o1aNtk+kYVwW3gCKbPtiw3ngsLle
         ONQ4AUSbq3F6a6wgFlnCnkUSDM4iTDZDf9g38Zev2qQBsOH9wA3cZ8bbu6mjRYumXhO6
         E/zA7Zkms0l37RxHJmSL0iCA3DwCWsQSOIV+VUETmV3iatk+GnhJ8nxc5JT2GkeB5f+w
         nEl8c84pqsyy6HQ4WuSLtBvY8nooPiRjvwET/I4LwFuNAyY8rcQGLvMvzviTFfred/Xu
         jBHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=wlFA6oh9h2Uqk0U3FytL3VE7dGDdOrHtz15OKY6zjA8=;
        fh=odKIDQYjnEGArCSXmU24PCzbhj92TMS0sRTJR1YizP4=;
        b=OhF8gcsard9RejB2jl49v17lsTqKdmP1Avg9qKhkuinQj9eQjvz7BJzM3z5kuGVARV
         VahussaYqkevwJxHunCQYPvKQU4rVfC+JTR8NgLwSozsb8AAJVZash3xwxaQTpNybtmx
         8nBVWtLPXHdnhqTmGGayAuIbkTU36pL7t/jIRaxMH3UAzjmDhukAOzuYyw8EMgeLZSN3
         TWTacR6oCOD/zL0OgLohe8mb09Qo+TRaa5muVkoJKuiK2aULAXUsm5Ebuxm5NfmVmsOK
         ASp4pXfhLlJKh1Q6cQKwRgO7jToHnJQ0nJ9uO/id8wGN06E1Y6h+Hd6WQ3ibcFUi+owL
         RCYw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773776498; x=1774381298; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=wlFA6oh9h2Uqk0U3FytL3VE7dGDdOrHtz15OKY6zjA8=;
        b=IGcHG+UP6/DEPNY+z5NWfCc4g1erQrs20ZHus9kJOI84II7ID2N4dHLChK7NuM5eKV
         hwr1fZPoHGRNj2jWbMqLpxme4FBJQf6Anugnz0pkfHngQhET+p/6kN2iFWSfb2BjuxVg
         3f1Yl0Bz8Xaiodjfvhsa2ueQD+du1feQzDqc0W3I3HOckqYtZUrtkUfH5qkgQYnWJlA/
         0II5l/SfFuGYubBh6XYdj2ebq8zGByybGe095fH/8jvh6oRVgPpeDkmHpEBOdwS6OyL3
         KJsYx0bD6EDQ3ixV628mrEzWVRwnm5Pn65jmA2X/nmxse62OmioSPxouJEq6yrmpLyHy
         NxfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773776498; x=1774381298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=wlFA6oh9h2Uqk0U3FytL3VE7dGDdOrHtz15OKY6zjA8=;
        b=G0ZhcVbzIjBZ31EYX5w0QlVml8wSxApGcbiLIFLpFndIw1Zki+iCPmnfJLcV2sZ0Vj
         BtCNH++iJARe0TbDyaKPYU2iHcjsF7Bmbww8uyDqzXHWpABl4EwnEmW1o+PMJ0AAyTcl
         lxGE6YD+lYn2UCrq9XeXYxAejOBfjFvAdrMoVireDNynoavpj0lWG/IqLHBmbQs/w5fX
         0m9SVjQqwhaGqEVsqb/IlgOMpVb0MQ2Nmnhxr88GTwJYr6FW+vuGRdcC0mhP0irlo7Q8
         2KABQPzrXQfI+yQhk4X05/dDMjklj1sdXaYkQAmyKToz3Tw7J2LmvAEkdPeddkuuPdhP
         zv0w==
X-Forwarded-Encrypted: i=1; AJvYcCWuc+w4yL4F0mJNVh9IoqvKjwodtr/7EzcfL1mj1jx4UU6llnk6R3fKbKrS+TMYuVFPdXp0wJ0iEFWFYkmorw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx8cviMUTjzOWtdkP7gy8r8EZjA0YC0G5BlptAQWnUC8zFRhX7
	qpWDiG1fIqOBgIJxjHbKsRZTwDP+qbfLYXTZGrjk/jy2Ntwe5iofLYZXDapOAwKR/P7l6v3MMop
	GTP8TMNRPvctXTFRNpibzlkbQmF49MyM=
X-Gm-Gg: ATEYQzzjQeBNWM0vxP4lh25MTephBHcQmA6TV+oIzoKpKAmbOQw9Txxl7OT/llbKEoa
	WDbpb8qLvBU5IUwHz/80wdiUY3i29YroZSjJdWkuc7bU8kL2xxThvjnphl9wcrM1/aT57fLvtwb
	geO/wNZhYzIi5sE3QKZFCU0DismewXtb0oG/M37jLducA4PUQUrAH1n0lSuH0Pgei6XJOqpvoqM
	RFhIcpknkDWxs38Y5Ryz9IzYCuvxLGdsi+5FyJVHnof0GmRARi9Y0et2Ue2fsUQgnf4DksL6P20
	ohnQoiP+xDD9qn472AnZ2KpS7pnmm3Jq9ISxhuPjuOfxjvS7ZerD6aRgkVShAWjWXi3ODOBP0PE
	O02miKAc1XXRbWvIdQWo9muw=
X-Received: by 2002:a05:7300:dc8f:b0:2be:687:5dbc with SMTP id
 5a478bee46e88-2c0e5267586mr145307eec.6.1773776498156; Tue, 17 Mar 2026
 12:41:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260316043255.226352-1-matthew.brost@intel.com>
 <20260316043255.226352-3-matthew.brost@intel.com> <7A8108C7-7CF0-4EA4-95ED-8003502DC35A@collabora.com>
 <abjqfXERS6Xk4FAQ@lstrano-desk.jf.intel.com> <CANiq72=Y2g_5=iEzU1L07pMPYD+wVapJXpp9rvYXEzCKEs59Zw@mail.gmail.com>
 <abkQTEcRujrFLsdn@lstrano-desk.jf.intel.com>
In-Reply-To: <abkQTEcRujrFLsdn@lstrano-desk.jf.intel.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 17 Mar 2026 20:41:24 +0100
X-Gm-Features: AaiRm53yINyatDJ_WJZjRpETpmBvLRs2cRRQIisdD6TKDINCtuP52WidZCuGK0o
Message-ID: <CANiq72=gHArzFS=SkiZyPpEfSL+0AcU3ifKRnwfEyet42662PA@mail.gmail.com>
Subject: Re: [RFC PATCH 02/12] drm/dep: Add DRM dependency queue layer
To: Matthew Brost <matthew.brost@intel.com>
Cc: Daniel Almeida <daniel.almeida@collabora.com>, intel-xe@lists.freedesktop.org, 
	dri-devel@lists.freedesktop.org, 
	Boris Brezillon <boris.brezillon@collabora.com>, Tvrtko Ursulin <tvrtko.ursulin@igalia.com>, 
	Rodrigo Vivi <rodrigo.vivi@intel.com>, 
	=?UTF-8?Q?Thomas_Hellstr=C3=B6m?= <thomas.hellstrom@linux.intel.com>, 
	=?UTF-8?Q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
	Danilo Krummrich <dakr@kernel.org>, David Airlie <airlied@gmail.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Philipp Stanner <phasta@kernel.org>, Simona Vetter <simona@ffwll.ch>, 
	Sumit Semwal <sumit.semwal@linaro.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	linux-kernel@vger.kernel.org, Sami Tolvanen <samitolvanen@google.com>, 
	Jeffrey Vander Stoep <jeffv@google.com>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Stone <daniels@collabora.com>, Alexandre Courbot <acourbot@nvidia.com>, 
	John Hubbard <jhubbard@nvidia.com>, shashanks@nvidia.com, jajones@nvidia.com, 
	Eliot Courtney <ecourtney@nvidia.com>, Joel Fernandes <joelagnelf@nvidia.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 17, 2026 at 9:27=E2=80=AFAM Matthew Brost <matthew.brost@intel.=
com> wrote:
>
> I hate cut off in thteads.
>
> I get it =E2=80=94 you=E2=80=99re a Rust zealot.

Cut off? Zealot?

Look, I got the email in my inbox, so I skimmed it to understand why I
got it and why the Rust list was Cc'd. I happened to notice your
(quite surprising) claims about Rust, so I decided to reply to a
couple of those, since I proposed Rust for the kernel.

How is that a cut off and how does that make a maintainer a zealot?

Anyway, my understanding is that we agreed that the cleanup attribute
in C doesn't enforce much of anything. We also agreed that it is
important to think about ownership and lifetimes and to enforce the
rules and to be disciplined. All good so far.

Now, what I said is simply that Rust fundamentally improves the
situation -- C "RAII" not doing so is not comparable. For instance,
that statically enforcing things is a meaningful improvement over
runtime approaches (which generally require to trigger an issue, and
which in some cases are not suitable for production settings).

Really, I just said Rust would help with things you already stated you
care about. And nobody claims "Rust solves everything" as you stated.
So I don't see zealots here, and insulting others doesn't help your
argument.

Cheers,
Miguel
