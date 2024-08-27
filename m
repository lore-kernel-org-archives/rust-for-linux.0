Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFA843E49E
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Aug 2024 16:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724777132; cv=none; b=Eu7HMDj2AeApSowYiJAgA1SP3PymeVIbfAp4rYb81Z8pfGkCnbfm2UtZGaWjWpe9rIoWNt26FvijR0khW/1xlaqMQnXaw20pJNLY1OfZA5PK6V0LJRWIYnfvdG0XyvhzT0wEC+Pz4Gjl9CMoQbPA2LrkOdZzHGXD+ZkJ5yiPtUc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724777132; c=relaxed/simple;
	bh=13N9rWiQqinjqu5t0FpuSFOBXGf77nou/F+efdv0gD8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fUAfoMYSEo6tn5h1AlN7z8YXhKa4nHXXAAY/LyaGhMLYfAFrpiWLxN0qF7KitO6vB309CysSwHBAsHVsRbjYx7cZ0PtS/XaMWlP43IvdNxrIkOuqV6VjPl5JNFcprV9A0E3begq6E/cyORdWIyds8Z42p4QIfUHEfkt+8Db6pO8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=RY7eEK/p; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="RY7eEK/p"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-4518d9fa2f4so5801cf.0
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Aug 2024 09:45:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724777130; x=1725381930; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yg+baRcLpnI1aQ9hlrSp/2fH28bJtbk1x405VvbEiCQ=;
        b=RY7eEK/pvNkcY/cFL21Qknc+7wcnBa6HbZkqzwy7+P1UfVB8nkzOetBoD5J8WgRv7L
         tFmmpD+0HEjP3sF9OOXJwBau+MJ+IsnT20s5IUXtg0+40y7ZQ4RMRHg++cE6DZD0v5mA
         L3eTryIKWPN+V0Pw2SNuqw+q0nRw6frsmP4fuKkmnkF1zuI2r4VAXr8g0X/GsIZEsaPd
         1nLDwEg0dVCUn1qe4pLMra7q2SdBDqrl4UWtBmgXLD4Z3LSpLjZ4cqvJh6/VaQaGyNBR
         xYBw/VMQHy5gDNQKhmw7vWOtDJElogiL5MizUTu6+oZwv46sv4PwsqwXYud56y8oVqh5
         k0Tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724777130; x=1725381930;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yg+baRcLpnI1aQ9hlrSp/2fH28bJtbk1x405VvbEiCQ=;
        b=im8vrp6E5G4ThbAM215YyaEk83P/bJ9likrPmnPn7nAJ3nza/eOL1wtdbCn2njkSJS
         lgGFc76WMIyORZn3O/FvQdTUrZpAyBeDD/CCIaXjvnwIzh/TvrpyDmO3YyRB1+w9pv4y
         uqHLtGdymbwuN4Etnk6e1ZO6MLwHMutKUgSwTczb/+OnRCVZxEYQ70AL9h4wXj3p1l/S
         vWxPC64amUujtKDCcBqfYeeDpn4YJvAcuvEloPwNqlvUzbU48d3RUSEy8EXJ/AVv/Jor
         4sxe0iPduefEPckqq4k5uBeVtmEd9Cjz30oNu3b58jH4JqB4bVfIUl2kV1MAyVB5loYn
         c9MQ==
X-Forwarded-Encrypted: i=1; AJvYcCW253vHJ73+eRepB79NHvQ11WFYHD6fwXPEDqipihhnJVg/Mv86uWJfvQOEqu/4I2/yHSpxRyP4D4VpAMgMXw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8Elaid9qOquyjbFb1Vbdgkop4IQ9Xh+HYPh0ZPpZLZqfkZd9w
	7zaECp47py93y2+dkYdc4aN9MVN5aGvqf5yv+6QqczOdmgNnq1Y0HhGsaS3+ibHGRaDL3hS7yU9
	3a74il650Cc9VYGPSrhN/7EIJQz0gnCRdqNJ/
X-Google-Smtp-Source: AGHT+IESmvxfPWyz8OU6lrsb3/WdN97UClbBtMAbPPLrSZVeS26g2TfKlQrHovYGaH2tJhJuXW9A22yAePy9L6g0reM=
X-Received: by 2002:a05:622a:298f:b0:453:5b5a:e77c with SMTP id
 d75a77b69052e-4566168780fmr4067251cf.10.1724777129419; Tue, 27 Aug 2024
 09:45:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com>
 <20240815173903.4172139-22-samitolvanen@google.com> <2024081603-punctual-hamlet-152e@gregkh>
In-Reply-To: <2024081603-punctual-hamlet-152e@gregkh>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Tue, 27 Aug 2024 09:44:52 -0700
Message-ID: <CABCJKufF4xpwGkYu_H-1AH8cEAg2K4umrM07DY_X2j9qORQj=Q@mail.gmail.com>
Subject: Re: [PATCH v2 01/19] tools: Add gendwarfksyms
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Petr Pavlu <petr.pavlu@suse.com>, Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, 
	Janne Grunau <j@jannau.net>, Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Greg,

On Fri, Aug 16, 2024 at 12:14=E2=80=AFAM Greg Kroah-Hartman
<gregkh@linuxfoundation.org> wrote:
>
> On Thu, Aug 15, 2024 at 05:39:05PM +0000, Sami Tolvanen wrote:
> > --- /dev/null
> > +++ b/scripts/gendwarfksyms/dwarf.c
> > @@ -0,0 +1,87 @@
> > +// SPDX-License-Identifier: GPL-2.0-or-later
>
> Sorry, but I have to ask, do you _REALLY_ mean "or later" here and in
> other places in this series?  If so, great, but I want to be sure, as I
> know:
>
> > + * Copyright (C) 2024 Google LLC
>
> Has some issues with the types of licenses that marking will cover.

Thanks for bringing this up. The license is inherited from the
genksyms code that's included in this series, but I'll consult with
our licensing folks and adjust this in v3 for the other parts if
needed.

Sami
