Received: from mail-qt1-f170.google.com (mail-qt1-f170.google.com [209.85.160.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C63B71A4F08
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Sep 2024 20:53:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1725569596; cv=none; b=GozbDDz58e9lF7fI/wDB9prorIanDLGcoj+nnKrzV3urXzjSgQsTuzmV9KMqbN9FlTu6I1MC3FV5/dkXy7A9n2sOrRvZD9ZO3wZUfUP9v1/X7XobysJ7fO/fB10ajv/+mxbTJBDyPK8Rxjv6IOYCVUKFr5+N+KirT0IjDLV2s9A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1725569596; c=relaxed/simple;
	bh=BCPHjrxa/2c46cQlwvtBcorPbkKjJ57wCHWPzKc0gYU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jUGdlFVQlVraOKiqwXhCEtcNFxcYVxqDa51S9JfuUpaTZUj3WSHQDVIpaHZJMVVaMbVTP7bUTAGBSDFBNtbks292gixw3IzOxWQ6Sb+oiWPRyDlQ5kkcZerKXd8JucsmmLnGLrYAwqQos/RPH8OeTHi/ldMurpmVRjr4E7fS7C4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=F6jfJn1C; arc=none smtp.client-ip=209.85.160.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="F6jfJn1C"
Received: by mail-qt1-f170.google.com with SMTP id d75a77b69052e-457c6389a3aso23081cf.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Sep 2024 13:53:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1725569594; x=1726174394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=BCPHjrxa/2c46cQlwvtBcorPbkKjJ57wCHWPzKc0gYU=;
        b=F6jfJn1Cwaob9wTLKZrSx3fiAtOZnEJQuPUIWsWAUBO1Z3y+q9UMPdwGmDVg7AmeU7
         MxRIRdTkWkekJGAB5eB8ft7uvUGMKSTI46ekfguNGz4DPoU9rWOMbGgTiR6MJiciBhaP
         kt4J4BV/SF79VeUHCAb50yYUwzvcVte1irZRTX0siVvxCS09SqnhEkfelhxHQIbYo8e+
         vejStRVe6oHLihgU1bv7L1Ee1TY06TYjly8sOjNIWzVaSBSA/G02OvzJYoqlFOajWMc4
         2a/y0Xyry4GVLdwR+q7PCIFeiH6fCz+oh1zRygGsFPY0tFH5C4E7zIq7yPC03VAuxhUD
         KxrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1725569594; x=1726174394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BCPHjrxa/2c46cQlwvtBcorPbkKjJ57wCHWPzKc0gYU=;
        b=egc+jotGJLQBlA4rphMqM7lli1zDL+9IzRE3XR/HNc7OkvFRu5FwLoNBWKEjPwkyr5
         PGq0uzPxFiMn1zy+axvGum9zRzo5YWYe4S7JXnhc+5967w6dbo9EAeZ6Uc1+mvZSRmH1
         8+kgRs+f1+D+Ken+QMMUEtS7Uy1C+boFzZXTH8+uoU1vD50zT0nVgkr0OzW+VgplWZBl
         M/nM7RDDZonsEd6zAieKJ2mMFB8cHWqPbTwzwzj1uuBQTQ0yAZDE/PrH0rdGz0fdzTH+
         5p8NdY1vpGMOX7n/MniGJpfiwHRoplnB9BuBPVw40s7lxsz0kBGikRAvExNnsDNK5iIi
         bKtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVVii3y1ViIZXSBAa7FU+3Zyy2kmSAVySrsoEWGflzA9/pUT2bbpBMrYF4vzQwoddhbv3dtfdQVJiG2BrFScA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz1ILDidLIY4AFqX0yeAoLm/4e6Nmf5YI/75cPwK7+kWTYZAuCw
	uNsHT+VMqU6J3lCF2sv/WYHEyz2TNqsZPR8iDAjTiB2SJuu++6xQ+aqivw2pZ/Uwolj1qnO9tss
	aY69Bse059k3ReuIxQ9Nac6scRStyY4Q2hAVz
X-Google-Smtp-Source: AGHT+IEyDq3JrzaEs03Q1q6474Lw72SpaaWbS1WNHPASK98Yp/ym0+RHgGQfwZR8C+mk4SWq/i0+5v5gojSd3ZhoK8I=
X-Received: by 2002:a05:622a:1486:b0:453:5b18:817 with SMTP id
 d75a77b69052e-4580c4346c9mr987391cf.6.1725569593602; Thu, 05 Sep 2024
 13:53:13 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-22-samitolvanen@google.com> <CAK7LNAQdutCiBkWtA6MbVLpfhB-MQXnszQm8eEiBZpeX++5eLA@mail.gmail.com>
In-Reply-To: <CAK7LNAQdutCiBkWtA6MbVLpfhB-MQXnszQm8eEiBZpeX++5eLA@mail.gmail.com>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 5 Sep 2024 20:52:34 +0000
Message-ID: <CABCJKucott2g8mZyJ0uaG+PdPTMsniR7eNCR9GwHpT_kQ+GFvg@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] tools: Add gendwarfksyms
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Luis Chamberlain <mcgrof@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Sep 5, 2024 at 2:30=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.or=
g> wrote:
>
> On Fri, Aug 16, 2024 at 2:39=E2=80=AFAM Sami Tolvanen <samitolvanen@googl=
e.com> wrote:
> >
> > +++ b/scripts/gendwarfksyms/gendwarfksyms.h
> > @@ -0,0 +1,78 @@
> > +/* SPDX-License-Identifier: GPL-2.0-or-later */
> > +/*
> > + * Copyright (C) 2024 Google LLC
> > + */
> > +
> > +#include <dwarf.h>
> > +#include <elfutils/libdw.h>
> > +#include <elfutils/libdwfl.h>
> > +#include <linux/hashtable.h>
> > +#include <inttypes.h>
> > +#include <stdlib.h>
> > +#include <stdio.h>
>
>
> Could you include external headers first,
> then in-tree headers?
> (and one blank line in-between).

Sure, I'll reorder this.

> Also, please consider using scripts/include/hashtable.h
>
>
>
> How about this?
>
>
> #include <dwarf.h>
> #include <elfutils/libdw.h>
> #include <elfutils/libdwfl.h>
> #include <inttypes.h>
> #include <stdlib.h>
> #include <stdio.h>
>
> #include <hashtable.h>
>
>
>
>
>
>
> If necessary, you can use this patch too:
> https://lore.kernel.org/linux-kbuild/20240904235500.700432-1-masahiroy@ke=
rnel.org/T/#u

Thanks for the patch! I think this would otherwise work, but I also
need jhash (or a similar hash function), and I can't combine the
tools/include version with this, because it ends up pulling in a
duplicate definition of struct list_head. Would you consider adding a
hash function as well?

Sami
