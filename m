Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AB041CE71D
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Aug 2024 17:58:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724349482; cv=none; b=tvEZr+15grfXP0U6QVLgM5NeYasp9aeDAraR/8WKhnl31CwPfgCzGTF7VqyPIIZiXLycIa33HkXc8zx1Mfb4hOhex0BQCFni3WRq0OCM5aSY2yXTMLw2aINY4BstMVkIh4a/jKM5KLURZo1U7jf2FCK4oIfokp0npYocwxkFgZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724349482; c=relaxed/simple;
	bh=AyQnYoPe6sf/wSyLAOYvZiLsLlNC/z1c6uDn8wvCjt4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WVgTyzSoUMBHUpNTBFYaOZbIi5QcE1M6fO2LApTJ2wYxgiLAzfccmAmhW6/HyVDBLBItXcTcGzHgw2Xpe4CrDeZc9OB5oATegmrdPJFCQNwRrIBQW2k1bH+oIzsUzieaA9jm9FDIdE3oRoVZgk6/ZIsnX50DNHyVPU2NR+Y0Y0w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=A0TnMeyY; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="A0TnMeyY"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-44fee2bfd28so27481cf.1
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Aug 2024 10:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1724349479; x=1724954279; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TOajGVKCmpE5kmdw/T7Qp/wNBvNSdZEW8S+OXk3bvwo=;
        b=A0TnMeyYdHzSVj/b2HPYdhkBusch8SVI34fBwCpGSZbzyKirr+eshjNsd/eyeq1DmH
         oEr82q5XOSGB1/Nx1BGV2zQLPQlIgtgpFR1pZc/iXchTci7b68j1vVkIGq1uzemWAQw7
         hekHQKnm1CFInFEdfnZ5IOA/Z+sChhxSlyDv5rT/jTdD8P+xRkRAlrAlRJwEa2FFSirN
         vHVDlAcwUKdM3bd3GXaNoSv1CHgBKVmFyLN2QsL7RX7KF1f2EBLwd0bh8hMWDwuK3UUP
         xR3QqYAs+OYTHkxpYBIniCYr0vKfRzi3DFiIBdFhkOnhrr2vDJKE9fFiYcdeIBUaUajI
         nnzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724349479; x=1724954279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TOajGVKCmpE5kmdw/T7Qp/wNBvNSdZEW8S+OXk3bvwo=;
        b=J13fIHAo8nFMwxyrcMBQwBxP8BeZP1ZCdc7GK1TpK7heIpInPNipk7h6rD7BYnn9Nf
         uEeStq0979F9EgkC682wdTomKP4BEwn3NIi2MKbsVcYUgH6GWW1fd4hxJajPHxFNugEM
         UN7v/nWBJHtN0y4ALaK1TCo6X/ETfkW0su0p3KqjzmU4BF+Abi625gwWiyb5VEPxyo0q
         LH/h3P0/FEq4nYzb2cxsgr+zYwl9yQidyh28SooLeMY09+mq2dHEhRi0y4gC+IorYP++
         cuQad5fF9lzC1yf76iX570WZuGgN6Vwd57RvUE+Q95h2MJn9w4VkyFl3sxod5C8kvKif
         6vew==
X-Forwarded-Encrypted: i=1; AJvYcCWGT2LvMXenO92XgS24ZN7s/U4MfF3CdijlWhqfQZQWo5jeU2xTostiIaqppNPng9nErW7Slav7PGueq8UpiA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyItYRF7dhp1hY2rP9iDw4xJeH1A0wZhSxupbibP7JEnIOKcy7c
	H9ms49ba3wdIL/9tppdMs6hkb78a7BlXAk32bLW2o9+IlIFlfL5O7E2C7Dsc71Xc0VbvOFdLgXY
	5XDw1Fgkv3Zx2QjwySv2Jg+3jP+nEshY4C+ET
X-Google-Smtp-Source: AGHT+IHpOQGA1+Xvu8VfAIHeP2jPYfCEPVVyYq8ryHdwZRdhtAaz9lpYz6WE5A47PoBLoqFMm3zfFnuZRf1AcYxhCf8=
X-Received: by 2002:a05:622a:1b91:b0:447:e3e3:77c1 with SMTP id
 d75a77b69052e-4550859549emr27021cf.29.1724349479217; Thu, 22 Aug 2024
 10:57:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240815173903.4172139-21-samitolvanen@google.com> <874j7ccxtz.fsf@trenco.lwn.net>
In-Reply-To: <874j7ccxtz.fsf@trenco.lwn.net>
From: Sami Tolvanen <samitolvanen@google.com>
Date: Thu, 22 Aug 2024 10:57:21 -0700
Message-ID: <CABCJKud=YO=fxF_tmX1N2ec66Rzqh8RsaQu0qrbC5WB529wgWg@mail.gmail.com>
Subject: Re: [PATCH v2 00/19] Implement DWARF modversions
To: Jonathan Corbet <corbet@lwn.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Matthew Maurer <mmaurer@google.com>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Gary Guo <gary@garyguo.net>, Petr Pavlu <petr.pavlu@suse.com>, 
	Neal Gompa <neal@gompa.dev>, Hector Martin <marcan@marcan.st>, Janne Grunau <j@jannau.net>, 
	Asahi Linux <asahi@lists.linux.dev>, linux-kbuild@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Jon,

On Thu, Aug 22, 2024 at 9:43=E2=80=AFAM Jonathan Corbet <corbet@lwn.net> wr=
ote:
>
> Sami Tolvanen <samitolvanen@google.com> writes:
>
> > The first 16 patches of this series add a small tool for computing
> > symbol versions from DWARF, called gendwarfksyms. When passed a
> > list of exported symbols and an object file, the tool generates
> > an expanded type string for each symbol, and computes symbol CRCs
> > similarly to genksyms.
>
> Potentially silly question but: how similarly?  Specifically, do the two
> tools generate the same CRCs for the same symbols?  It seems that might
> be important for users transitioning to the new DWARF world order.

Reconstructing the source-based type strings genksyms uses from DWARF
wouldn't really be feasible, so the CRCs will be different. The
similar part is just that we build a human-readable string from the
debugging information and compute a CRC from it. If anyone is
interested in switching to gendwarfksyms, they'll have to rebuild all
their modules too.

Sami
