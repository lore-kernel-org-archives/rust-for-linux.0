Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B5D3BE4A9
	for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 21:52:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769118771; cv=pass; b=lrYixWs8/ZHSSkyl3FOVjlTN30E1VWGX+vSxF2F0tKuWiqmTBFsGaQ5KtK1udYnp48ASFW4h2OfzixpBnJorO77M3Ij1jwHcgLvPeSVy4ALzynBDNTud4UWhnDq2MnjtelS+yXvPqdZfxjdi9LRH5C7DcTAnspDszbluqpFNdl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769118771; c=relaxed/simple;
	bh=kJ1n1W9oNr5vNhOoeiv4otLFkO0Rv3BVZJZSEM76zTY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KAONmZWzZEBPxUT9ETw3jSmtcoORsWy+xRpHoVlz6n0VQlBRhPnP16yf59o+5G9C8zWX4Vd6p9LSh5GV0wbS5w00Kv84KN085fO+7j6Y369WkEPjMZs0e6PJ5jabEVS7wWkAwcybXszjmiwbB5yWUemRRu9sqZW47WZ1p+lxYVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=htTwDgJZ; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="htTwDgJZ"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2b701d29ddcso34028eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 22 Jan 2026 13:52:44 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769118762; cv=none;
        d=google.com; s=arc-20240605;
        b=Go2NGxFSlJebxO9PUFcCOtiwctly2wU07RU/m6FtKjZO+fdl5dxyG+NlsQdyHMcWDQ
         yrBESdsSMvFRRkQQkyzeSj2QjDv0dwafCeW83VWcimzb7GjYteOYbfnTnmYLO0s08MB1
         iVAOPWCJvLGUt/6k4fuF6Dd5opCZc5dISlZ6MfE++eMwVEpHo9LfufABYQ5enbsIu2n0
         h/meZ3wOi8jP012VY8SPRunKXvJAnbfmgTZLJXtgrwZg6WoOr84vb05+rUklgzx7CJuO
         ULSb9mGBUPpOzO8KcCWQkhENAPIjOEW8V6tK9JlattW5aGaIxNSu0ovztKcnVP0i2C/Q
         SNLA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=kJ1n1W9oNr5vNhOoeiv4otLFkO0Rv3BVZJZSEM76zTY=;
        fh=fariJZ2DWQ7tI1kKAQBOboQYrhg3doLJD4CpTqkrOYw=;
        b=UMRs+WMhceFnmxlgNCPQJo6KyaZcSxJCtHiAWe5BDb0tvvd28mherFeTK0QG6JMIti
         Kd3f3ItlGA0bXFdnYyJWRhIGxCI2xwZVqRPeDUq5h4mW18uw/QnBhTtwX2AdMCRPnk6T
         HdHoSBNXriPKn1Zno4CGs2js4GlWHhcvFforhCvwn900PRrzpTd/T7fvGeiwC9Z+oO9L
         hLDh1z+JFLr88nGn4jlomIwLRCOJN4WTVkEO3xDIGsdpv6auc+F2kzRUatyGbAGIQNby
         6YUg7gfMh1Eobue+9wevQH2XCJA/AbaCD4K7+KWdw9GsgJBXvnJ/UgKhXVn6obm4iQzF
         cQFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769118762; x=1769723562; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kJ1n1W9oNr5vNhOoeiv4otLFkO0Rv3BVZJZSEM76zTY=;
        b=htTwDgJZ8GFmyDfJFx2QnDmnxcOaY0d1yVBWlkGKkyIEp5hzW91Um7YEA8mPSorxu8
         bJNfvtcplOze50v2hGTEeGed0D4HuBSjl7VGXNhWvpeZ0GsUyd6LvoWdZOxYQRWYiV/i
         K+X/HUp07p9aFm7U2A2vi5ahbQO62+ZWZcI/6/UElJsymSB4wIFyDM6ppM6tLas9DuQJ
         2mhMSn25lBg0n/oZQQfkHNPan1p45vw4BpfW5UyYW6ognFurdZC/i+jlR8ocbFAreatq
         6/4fTkKcOefdbtqKatCRaVDDfOujoAz4oAeHVVvA7TD7F+vxf3q5UaHAIEoKIHf9CrFd
         hzbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769118762; x=1769723562;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=kJ1n1W9oNr5vNhOoeiv4otLFkO0Rv3BVZJZSEM76zTY=;
        b=fwxJRu5MPLlKWIJmPtZ8sB6y3tpZ9jO8O06FpMNduMf7YUmFFfIn/V9NO85UVpjti7
         Xi9VJGbo/J0eteGfW1eesZEbO+8rHkOw5wlRTEffzOuea5TtZHbR73KKh2YiZxtgKmWP
         2Pn0SHQV86VJSkwto9nj/+E7WT+mZbwHgJBZznpCdes2jlnAIX/hYcetFkSPKQr4rghQ
         xgDpdYyaFgmQl65PCfkaItjxPWUF2vFDuGhWjTsaaDJfA7tSCQouQaecffnGmI7HAZOA
         F7Bu7+GvQ304jJm7V9XZgPziScmQ2x3e00ul9CF9jndEPYBk6iE8j7BPeNvpaby3Ak/S
         m/9Q==
X-Forwarded-Encrypted: i=1; AJvYcCVr472lLXis/HgLjdXYJHTs2nG9WeUBXrTtDITU3tLhyo4ogYDuP0G7aZ52rp3eEOUWpEDvD3/DOccQYv8uTA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzSZTSedGoogkEDSqXT8qfgEkztPUN0tCeDFPcJksK06QP+B4Ak
	Hvf8ZPU464bel/hoMeErSTjBZOgAj0iqdX4pcJrVgBYw6IuB5TvNtDrJJe01rCtlcECzdGIj5A9
	zkKCizrWhTg+lG7uArMEDN9jUMGXr5L0=
X-Gm-Gg: AZuq6aIv7MeEdVJtI5Lnspo01P6NYW/0oUWQqCHUZSnGgVMkBnnkhyKqEF7BRjYPiMF
	bQeyuGkGl/uEbhR6IsfrvoAJATfnIZz2vFBXTkw33pF9HCZqdReCRaNwJbAWPTKFhewTL4vmvt7
	Ay8PN2th6HmslBc4NNZluSNztonI1lghfBk3nw+Bl+aunX8OZLtsMF2limdrGxtWdtLuj+1ugit
	Hye7DWjG/OHQ3Y1I24ieNqGupTy46t9rFr8Qo7H3pxvJ2C+E5PPT762PnWc5BEuXmPd2E7wdgO4
	lU8gcP1nZwQCWuFM8D9hDBSdyB+Z1AJf/CsIHfYhFqDIVkSU8jACbExigkBWjn+ivwhnA/Bi6xO
	5wgavNXBovqpW
X-Received: by 2002:a05:7300:324a:b0:2ae:5549:2c86 with SMTP id
 5a478bee46e88-2b739b6f4e4mr228287eec.5.1769118761814; Thu, 22 Jan 2026
 13:52:41 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260122202804.3209265-1-lyude@redhat.com> <DFVEI4KHCNFS.2IT595IZJBGGT@kernel.org>
 <25d3c403781a88019340a47567ff85959b0c03bd.camel@redhat.com>
In-Reply-To: <25d3c403781a88019340a47567ff85959b0c03bd.camel@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 22 Jan 2026 22:52:28 +0100
X-Gm-Features: AZwV_QhZZxWF4WZYVcR4FnS_Sg28Z3ZQQfKTOoxKuwtN0Bkji7JJbfvuj-OOB1M
Message-ID: <CANiq72k1b3DLEy_32ruWu1XBFK80oRDVzSer69ANL_232mmv-w@mail.gmail.com>
Subject: Re: [PATCH] rust/drm: Fixup import styles
To: lyude@redhat.com, Gary Guo <gary@garyguo.net>
Cc: Danilo Krummrich <dakr@kernel.org>, linux-kernel@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, rust-for-linux@vger.kernel.org, 
	Miguel Ojeda <ojeda@kernel.org>, Simona Vetter <simona@ffwll.ch>, Alice Ryhl <aliceryhl@google.com>, 
	Shankari Anand <shankari.ak0208@gmail.com>, David Airlie <airlied@gmail.com>, 
	Asahi Lina <lina+kernel@asahilina.net>, Atharv Dubey <atharvd440@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 22, 2026 at 10:34=E2=80=AFPM <lyude@redhat.com> wrote:
>
> Just a random musing - it would actually be quite nice if we could have
> some sort of automated style check for this. I have to assume the linux
> kernel probably isn't the only project out there with its own prelude=E2=
=80=A6

Yeah, that would be quite nice indeed -- we have discussed this a few
times (most recently a couple weeks ago, including whether Klint could
be used for that and for detecting "long import paths", i.e. when we
have a re-export we prefer, but that has edge cases; as well as
related bits like a `klint::moved` annotation -- Cc'ing Gary).

Cheers,
Miguel
