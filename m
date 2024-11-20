Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D1E00149C42
	for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 09:10:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732093860; cv=none; b=Nzf5N77WP5J4R2GLfzSK2k6gNbpOb0KPtxthHVZZVIxmbB8nKTwCxVWbrTKi1K0xKqXTs8SdvgkNeBU/BSvE49X/KWLWOPmSYQI/J8872SXc2YL1ZeGWU01NfXnD6DMzBvedyO4l6f5cVgVIknq9ZbPs/sS+6g8c5m3TcoBz63k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732093860; c=relaxed/simple;
	bh=2no53dCj7JDkx0sffNAY9g9WwHKzK1IG3PuUNiLugXs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EV8BffQ3mqvk/KvOWknyWrH4hAl95wvBf31FVwhKxy6Hf0b36XGS3D7pbmKqoitBlSt+g9AO5QfjMlUbcXUQXtcOrXi2F7BkYinIHbLQ5nMNBy0cKsTun53kQP/MBf0sSge/wUHHBVmC6oLn2i6mbmP0iStJyMgJoNOUiTlRMTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1ZcN5P/d; arc=none smtp.client-ip=209.85.221.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1ZcN5P/d"
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-382456c6597so1261394f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 20 Nov 2024 01:10:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1732093857; x=1732698657; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=taQfAO7UsVPf+OWP/Z17Mad9ERlkGUab/JxNPFh1DDw=;
        b=1ZcN5P/dIlsPuRy1B4z9zDEzl/tWj/u0DLBSF/8kZq/ufHPscXw4TzGK4hap17tf+1
         ZyqLZfED06bvMNkYMf4TcBELgGHyIIrgIJYYcIaA6NiSQ2VmapW13ozQyuWOYRs6s6L5
         5wKIGE6Swa7k0LizqBOy/KyThT3ZmBAxx2kF2gryFqvqet+xEy7+Pa2u7AJS+QJirOq4
         /Yr9WLowxirJdXOr4kFI2qKR8OQQv30lWj8brsE4ot9RAEgt4a48+GYvIonHYBPZ/HP1
         QRGXOVgVEQMRmA+RCT4c4b/3sgMEy9fJPBWkgK/PTEtrTem+M/ZcwyM824efmtT//HYU
         /kHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732093857; x=1732698657;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=taQfAO7UsVPf+OWP/Z17Mad9ERlkGUab/JxNPFh1DDw=;
        b=w6mTiCaG4S0iRV1L/P9DkRqVSZeCx1QHN33fkdl9FuosgHkXuHR1z/gyPyOETYsVe5
         Y66bgLyPFdY0mfdHcJ/iP4zSZdCeFxU4Vr23jUqgrmPVG3qKLcCoJInh0HuUIpv12JAd
         1l7X9By73PKyJke3ssxvi8gbQRJx2Dz0uptM6E5BSIfFdMaH96+PisAyvW3r6DRp4V4W
         GhrpdKq+kn4wdjEEuR9PHCWLRQIDtMc/G0HSC5l9i8ro+mNByKLkasoIsQiz9w8C/1MV
         M4TyLIPIn/0o0RUAQ/PD+i5kylj2Shqu4C/zn1uYAAPY+J5mpR5h3H8viY2A5gm6GplW
         ZvcA==
X-Forwarded-Encrypted: i=1; AJvYcCVq2OvrvYLL7pOPNNajUsOXQLWRhaavnwa6lHXLkPzy0caZTtqx+PVEBN6UnkaWc3Qcd5P/wtocOof7kO1IHg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwFX5mTxBD9XBnkr044VLkJLJ6wPwiBiqFEywv+8a+kvVl9W/oy
	b3k+3Xs9iOrXopO2+rfEAfNJrxl5EsGIIBXU+Ee//MXw5r4/RhrcHu/RFS2JDauHZAq8o2gfQCN
	cT7Y5mYsxRQ9YR1x7FURBm+izNppIc5rxWNQ0
X-Google-Smtp-Source: AGHT+IE0Qr6c8zEO0W+zjaOi3AJMKcjk7pnHmZj3Gs9w6cUneUNmZHuNKxDnfUxGyGK7KDV6BRIx3PXwyrLZUoiGnjo=
X-Received: by 2002:a5d:47c4:0:b0:382:499a:dc6d with SMTP id
 ffacd0b85a97d-38254b24de7mr1265757f8f.55.1732093857168; Wed, 20 Nov 2024
 01:10:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20241119112408.779243-1-abdiel.janulgue@gmail.com> <Zz1sHZLruF5sv7JT@casper.infradead.org>
In-Reply-To: <Zz1sHZLruF5sv7JT@casper.infradead.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 20 Nov 2024 10:10:44 +0100
Message-ID: <CAH5fLgiyHGQJxLxigvZDHPJ84s1fw_OXtdhGTd0pv_X3bCZUgA@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] rust: page: Add support for existing struct page mappings
To: Matthew Wilcox <willy@infradead.org>
Cc: Abdiel Janulgue <abdiel.janulgue@gmail.com>, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Valentin Obst <kernel@valentinobst.de>, 
	open list <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	"open list:MEMORY MANAGEMENT" <linux-mm@kvack.org>, airlied@redhat.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 20, 2024 at 5:57=E2=80=AFAM Matthew Wilcox <willy@infradead.org=
> wrote:
>
> On Tue, Nov 19, 2024 at 01:24:01PM +0200, Abdiel Janulgue wrote:
> > This series aims to add support for pages that are not constructed by a=
n
> > instance of the rust Page abstraction, for example those returned by
> > vmalloc_to_page() or virt_to_page().
> >
> > Changes sinve v3:
> > - Use the struct page's reference count to decide when to free the
> >   allocation (Alice Ryhl, Boqun Feng).
>
> Bleh, this is going to be "exciting".  We're in the middle of a multi-yea=
r
> project to remove refcounts from struct page.  The lifetime of a page
> will be controlled by the memdesc that it belongs to.  Some of those
> memdescs will have refcounts, but others will not.
>
> We don't have a fully formed destination yet, so I can't give you a
> definite answer to a lot of questions.  Obviously I don't want to hold
> up the Rust project in any way, but I need to know that what we're trying
> to do will be expressible in Rust.
>
> Can we avoid referring to a page's refcount?

I don't think this patch needs the refcount at all, and the previous
version did not expose it. This came out of the advice to use put_page
over free_page. Does this mean that we should switch to put_page but
not use get_page?

Alice
