Received: from mail-yw1-f171.google.com (mail-yw1-f171.google.com [209.85.128.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEBAF12FF96
	for <rust-for-linux@vger.kernel.org>; Tue,  6 Feb 2024 11:32:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707219123; cv=none; b=ZJJBi/QqljPa4OKVMC7m01ArnzQzQJf9VxD7QOXu4RPrRnD9+7u3Kwu9cwMSjQux3fk7X5pCDrdipS1afcCViWDb9L4x31WcefCBXBo2zwGaT8Waopy370HN7hu4j9aABCA4fhA5eljjd/xPAKTzS4y9oTfrq/QiODNr2k/vMS8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707219123; c=relaxed/simple;
	bh=XbOKHFfG4p8qR8k8h1d+3s/edHf9JT2yRp85LKfCngY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TgL7eVy94ShlZXjPhgGRAiqTupoMMw/CZowcD5ER+eQOlxx3ts8F7yihyoCr52q529pgmqhfPFYurViNrreo9piBw9CSpwIVpriPV5OVNcfBtAAtibtP5rOcIuLjULJn5rriKVl6aBqV7eBbrAGSrnU/vUtdCZq07vr6pgHLy1Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Porp6JTZ; arc=none smtp.client-ip=209.85.128.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Porp6JTZ"
Received: by mail-yw1-f171.google.com with SMTP id 00721157ae682-60481f283d8so2029347b3.1
        for <rust-for-linux@vger.kernel.org>; Tue, 06 Feb 2024 03:32:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707219121; x=1707823921; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=883tFjRyJ82A2iB99WBLeD89ui1B1E+lTZccBRY57Bk=;
        b=Porp6JTZBqdYUSWWqWlaRffMAPfo7z+ox2KPKp12WFv7j0966J6GUa4gCq11tWQLba
         EhWznup3O9wOphJ7PAnmUJe3lE6lZwqrK2yupjeBlsba7rx2QKVv6m2QQgyig9o6TEFX
         q9OnUSNCZkomSbtezpVeGE1gT+HpPCirL2BeGiG35LumIdJ+jycpjh4/WJCNtkvDDm8t
         U3fZOntKpMi7z6GVHdPZ3wD9w2seotJ6rkWAOE3NUqeH5/XRkdPXhMBlMwlFVqZvqkTy
         4NYeSKfOLEojKSnb8WRnbEGQAQTMULeznpiwTIiDtTeU1ErAagxQLuYYIvKUOn73hmUn
         e/xA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707219121; x=1707823921;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=883tFjRyJ82A2iB99WBLeD89ui1B1E+lTZccBRY57Bk=;
        b=h69rgvlvUcuh++C5yaIEasnlzX4+1rlg0vIAnE0u5K3670V6JwRbeJoQ/9ct20AKYQ
         ztZxetfKdIRBfRuYLo0Fi7Uc91i4Mdr2UFupdYMcAxm9wT1chyfsOO8N/e9qzRDhSxp5
         DWVFER+rJYRHjhmxnruFlD12TIMJDLSADMVLIZch/RNwzD+hn6/RcYP8hDI3So7VpyUH
         doo/18WSEccTVGqfuhDl/cIirlwpVN7V+NO4FPUSQxqXGvAtHONUjG86SxWds473lW2F
         KU0Zzy2t09J26RsRpFflVx3It9aSCSOnV2oXscV/k+HsnZ5LuEGWef/m4OL7TFqo0Mv0
         fGPg==
X-Gm-Message-State: AOJu0YxuL5P2e+8jYtuCK/boyiK+wOQImzwgZsCt0yCXQmzejGShD7eP
	FISstGSYP7GRe57JEvsm2sGQ9+PUs8xs4KON1o4TW4/QFtzrMk6yFjtyu0C38gDxrL02HWNE2A5
	oTKo+gwT9WTrp/DELCHmxqd8YTwk=
X-Google-Smtp-Source: AGHT+IFIGSndVrvdt6cNmOdvpj6Uxfdz7d6AVMSDDJW/h9x9jm2DDozrAYsBF8JpkPE5xaom1lGS4s9ANWrMOeZARzk=
X-Received: by 2002:a81:c745:0:b0:604:55e9:fb35 with SMTP id
 i5-20020a81c745000000b0060455e9fb35mr854602ywl.7.1707219120970; Tue, 06 Feb
 2024 03:32:00 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240206012535.480193-1-tahbertschinger@gmail.com>
 <2024020646-browbeat-cozily-0bf2@gregkh> <CANiq72m8V2nycL=P8yT3M=e6Nek0w45zBK48Aqbt39Kpt+bwTA@mail.gmail.com>
 <2024020617-robin-countdown-d572@gregkh>
In-Reply-To: <2024020617-robin-countdown-d572@gregkh>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 6 Feb 2024 12:31:49 +0100
Message-ID: <CANiq72=mR4c9CAi1MNRP21ABvMOj6DRa5_ZOh5qkUkraAz+KXw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: place generated init_module() function in .init.text
To: Greg KH <greg@kroah.com>
Cc: Thomas Bertschinger <tahbertschinger@gmail.com>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, rust-for-linux@vger.kernel.org, 
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>, Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 6, 2024 at 11:58=E2=80=AFAM Greg KH <greg@kroah.com> wrote:
>
> But why not?  Rust code can call these functions, and you should be
> writing functions in rust code in the init section.  There's nothing
> "special" about this other than it is a memory size savings, and if you
> get it wrong, the linker will tell you at build time.

I think you are talking about init-section functions in general -- I
agree we could have safe `__init` Rust functions if there is something
else that guarantees no case escapes (and, of course, we can also have
unsafe `__init` Rust functions if there is no such system that
guarantees that).

But here I was talking about the particular case of these module
initialization functions that are generated from a macro and are
explicitly not documented publicly (not just the one in this patch,
also e.g. `__init()`). These could be even more restricted than
`unsafe` and completely hidden away (in a "private-in-private module"
or an unnamed constant or similar hacks to accomplish that).

Cheers,
Miguel
