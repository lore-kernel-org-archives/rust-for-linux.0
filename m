Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A44D4400
	for <rust-for-linux@vger.kernel.org>; Mon, 23 Mar 2026 00:16:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774224965; cv=none; b=r60vAA8FpzCCgHNR3eSnB4Gr0ru9ruj/pLcFOZTS1PgP2UeJDvJxMj8fZlyZHRNCYUdIjgCLGmJHeKlu0Sbzs9HauHH5QUkpS3PCW/Fd14lVCFdE0HTDc8gbmKH/RIty7evWrmxnWU4yt2OEhzx76WAr4lF+7+UQCMteHD4FJNU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774224965; c=relaxed/simple;
	bh=Mz4C/9cLAOaPCx0GR6OuyCvm178ZaYrumVlM4vEmkDo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nUGM/gOpZG5uGjs5BTyXYPiByxC6qpsJwjfZInq+GC8sF5VhL1/ABrh4TGXnPvh3DSNB157s9oO16ERUCLTd/lXF35jBEknT1POxFklTGFsQKn5gDNtEG2lmsPzQ/igGXbqc4p4ae6PSUCBH+0J3xe+8NCEi9z2jLorLO3AxkOw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=DvA6/jeN; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="DvA6/jeN"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1774224963;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=Mz4C/9cLAOaPCx0GR6OuyCvm178ZaYrumVlM4vEmkDo=;
	b=DvA6/jeN/F+bukrZilrk81irRXPAKgroaeLO0GH8WjfINB4OzLtMUt/YNewBacu1Bn0+yS
	effV/p+VO2AZ5tq+kAA7cpobvT+lBYa2hkQp0Kgd9dCrceqfBxuKFrAuHT9+q8ls7B256z
	qYCYomjr0ca6prESYeLw4x/hjNtwJbo=
Received: from mail-ej1-f71.google.com (mail-ej1-f71.google.com
 [209.85.218.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-435-D_lYQqXYPCGYOndeLfplNw-1; Sun, 22 Mar 2026 20:16:02 -0400
X-MC-Unique: D_lYQqXYPCGYOndeLfplNw-1
X-Mimecast-MFC-AGG-ID: D_lYQqXYPCGYOndeLfplNw_1774224960
Received: by mail-ej1-f71.google.com with SMTP id a640c23a62f3a-b97b6ccf166so257232766b.2
        for <rust-for-linux@vger.kernel.org>; Sun, 22 Mar 2026 17:16:01 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774224960; x=1774829760;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Mz4C/9cLAOaPCx0GR6OuyCvm178ZaYrumVlM4vEmkDo=;
        b=QJNs236ZGtP1y79d3dt9PwMwQyvDjkZxlV9YArjTTsOAh5TqEtPED0ia450ks8cDdj
         dnWpZawd6ekFJdxVYNTi238EdabamueLi5sxomSZLpwNRrt2C2Y3bCQzCdsj5mmyDyt1
         UB00oiRkTPho7tTtZvn+sj6wkWEC24xrmHaWG4gFEN46wrqzsHVYlLsCqqMYAeqIDbhg
         pxAmAAZDLSlgr+wZEmj3ydIVom0D3GFUFomQbAMFWMC+ATH0cT7ti0cFO3moQx0C791P
         QsLop+2K3EXD01tTVKSroYlaDex0QaNoHGVqHiv2PtgOtR9CFk/bE9FciDckrwNOJKBq
         6SQg==
X-Forwarded-Encrypted: i=1; AJvYcCXf+TnaoGSVjJyKVevZ4GvOUe8zVE2X6TsbvsQjPSHj/YFdnOaqnFPIMte/uWaOziQUUnQZiy20e8dwITUtfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzE5xsvwvJ8ZP6VhepoEFmg7AOwc7Hn+cK/1I4IwVfd6Z6aazfr
	fvmaPpykyQLNfhQbfDFeoGYTj8JUzaZCeAvhpUuXEMhzlxNAfZGkhUPkKH3TovZ7+szxmxioV+Q
	vwkJE8NiMZgJapB9T3J8t4zMrPsgUolB6qZdP5qAyQ1+Ep+dIMGuYtkfsELthVmp4Y7s38wq8Gs
	F33wnNcOYmI2LKmpYFWMjAvvT95AqbxZaY7/fF3rJmlap6YjZvnccqlg==
X-Gm-Gg: ATEYQzzaKU5g1Fg83wN2M/6S6ffnB/zWmGQx6FywTlj2tuDg/HZXyzuXt9pcPsimPJz
	BrNNgiYoQ2ceG4z6NYvIEcARzqYqmzOgaEKKwptFyF1FwRoVG2VcdbfSV55qQUxGT9nQyfo+aft
	U9caxCfaURfvy9SWGdV0RQB4PstiaVQvlb5UjLqR6MGawRbS6MxT8OlC455NO0c7czI1TmtR9wt
	NM2cQ==
X-Received: by 2002:a17:907:cf8a:b0:b98:32c1:246e with SMTP id a640c23a62f3a-b9832c15bb8mr715929766b.8.1774224960416;
        Sun, 22 Mar 2026 17:16:00 -0700 (PDT)
X-Received: by 2002:a17:907:cf8a:b0:b98:32c1:246e with SMTP id
 a640c23a62f3a-b9832c15bb8mr715927066b.8.1774224959860; Sun, 22 Mar 2026
 17:15:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
 <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org> <20260321-awesome-hot-kingfisher-5d9f55@houat>
In-Reply-To: <20260321-awesome-hot-kingfisher-5d9f55@houat>
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 22 Mar 2026 20:15:48 -0400
X-Gm-Features: AQROBzAoTifV84Es4roNHZ7fg_jcFEWRuoYT-h9cCD6210iyG8-nf7F7j1kSz9A
Message-ID: <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement Send and Sync for clk
To: Maxime Ripard <mripard@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Stephen Boyd <sboyd@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Boqun Feng <boqun@kernel.org>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: z_0Cxh3JKeYJ2gncUo08pK38OvHXjcTXKrHSN5B4PIQ_1774224960
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Danilo and Alice,

On Sat, Mar 21, 2026 at 2:17=E2=80=AFPM Maxime Ripard <mripard@kernel.org> =
wrote:
> On Fri, Mar 20, 2026 at 12:43:47PM +0100, Danilo Krummrich wrote:
> > On Mon Feb 23, 2026 at 11:08 AM CET, Alice Ryhl wrote:
> > > The Clk type is thread-safe, so let's mark it as thread-safe in the t=
ype
> > > system. This lets us get rid of hacks in drivers.
> > >
> > > For Stephen's clk tree.
> > >
> > > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > > ---
> > > Changes in v5:
> > > - Rebase on v7.0-rc1.
> > > - Pick up Reviewed-by tags.
> > > - Link to v4: https://lore.kernel.org/r/20260113-clk-send-sync-v4-0-7=
12bc7d94a79@google.com
> > >
> > > Changes in v4:
> > > - Pick up Reviewed-by tags.
> > > - Link to v3: https://lore.kernel.org/r/20251218-clk-send-sync-v3-0-e=
48b2e2f1eac@google.com
> > >
> > > Changes in v3:
> > > - Rebase on v6.19-rc1.
> > > - Pick up tags.
> > > - Add fix for pwm driver as well.
> > > - Link to v2: https://lore.kernel.org/r/20251020-clk-send-sync-v2-0-4=
4ab533ae084@google.com
> > >
> > > Changes in v2:
> > > - Rebase on v6.18-rc1.
> > > - Add patch to tyr driver.
> > > - Link to v1: https://lore.kernel.org/r/20250904-clk-send-sync-v1-1-4=
8d023320eb8@google.com
> >
> > Alice has resent this over the past three cycles, but it hasn't been pi=
cked up
> > yet. Please let me know if there are any concerns -- otherwise, I plan =
to take
> > it through the drm-rust tree in a few days.
>
> Stephen hasn't really been active lately, but Brian (in Cc) has been
> trying to pick up the patches falling through the cracks. It looks like
> such a candidate to me.

I'm planning to send another clk pull at the end of this week and I'll
include this series.

Brian

