Received: from mail-pj1-f44.google.com (mail-pj1-f44.google.com [209.85.216.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24827433A8
	for <rust-for-linux@vger.kernel.org>; Sat, 22 Feb 2025 18:27:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740248823; cv=none; b=Qa3k6YMD5AA5KR/T7TKwVQga9V5CfIjiyvWIDYreb+2PKHUUZ3i98tgtEQHaogcLjUCIuNxw08ki1V3LDYgyAjkLgOgPIWS5JXuD/vNju+S64Y131UkynM3OZC1FYSZWG3TUt6loudOjGinm8XQGrJQCms7nFw/nNp7+ql7vQMQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740248823; c=relaxed/simple;
	bh=3MOjVcKxkPd72Pi4IpGKBtheWLtRlvgQ4N4S6UxcsBM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lsg19moMRrxo+IzA7wayetBYnIGafriWvzTpiud8EEmw50EK/jrkbNiVTdO5T0+Xpb7Nz6w4LNGDj8/FeNKi/BmwQtwqmVRIqb0A6FDBlG0M43Tpk1c2rpj92/KnhQD4xD7vyK4x61k7fpbWVNjRNX2G7TMDm80VsaXt7+siLNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PKKPDa7u; arc=none smtp.client-ip=209.85.216.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PKKPDa7u"
Received: by mail-pj1-f44.google.com with SMTP id 98e67ed59e1d1-2fbf706c9cbso762527a91.3
        for <rust-for-linux@vger.kernel.org>; Sat, 22 Feb 2025 10:27:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740248821; x=1740853621; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3MOjVcKxkPd72Pi4IpGKBtheWLtRlvgQ4N4S6UxcsBM=;
        b=PKKPDa7udAGT//rqWsmfCJW4/Mtwe34RKFIVlLUJ7JjE6ogocH61RSfy5PTZDJQowb
         CfMT2RUfw+jq9DmbRq25Wf5eBBaa4UUao49jxxxvxo/+nKKrUU0eLOpd3oWBAYoxUReQ
         e1QoDVQNVNsGDzNi9TFIF/LsvSdoq1kT93FRlqOEqM2aP6ZHV3klwhv8D/IcD/6jYD+W
         tFxotqR+5HOfVyIKvC+v7nXaen1m8KMlsY6E1vKgAHJ+tfyzca5gI5NfWbHQcamwgB0q
         K0TbUuITQT8UV82TxlhREe+oH+wJNXo5jvGTSA757YQ7WFicLqE4DKFNmrUXZ5Rkl9DI
         i0tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740248821; x=1740853621;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3MOjVcKxkPd72Pi4IpGKBtheWLtRlvgQ4N4S6UxcsBM=;
        b=DbLth8+FPXaC7hWNhljqLN3Ngqpf0HWb4nLyGuFz4CadvSJpKnrkXSTTCnfi/sIAlt
         te5kRqrR2Y4WNBZ+Rx/R9iM3CZqYLxAzPmw8cf5W8BoRdxhfESz4nj9zJc9JuA3TVMMI
         PpLpIYKjLLmLGuttorCWgugf0Xx7pxyWu4PNay6XvYGMkn9sox5WsIInreVH9OF+U4nE
         bPkjyUOl1KfoCl7vQW68yeyVJ/Ujh9ZMCv+OQwkEc6flxrNFnNiUfbjDm0+Y5YXU/6L9
         Ird3o0fYTBDSyVDx/mxNGXuL1F0KnzJuM6qvNX5JYXBnfn6Ijb6c8v8bLTiVd1bLPTLa
         St4A==
X-Forwarded-Encrypted: i=1; AJvYcCXOfGVgpsXFR/KraCrD7+JU1NKHwj92D2NCtnlIAXgpAyHLheilmcLqfHhdSPfLXcgwpL1J4HJwLTRdNaBXkw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwuHayS4C1/5S7hOQkbJGj4wG5e6YLA+7xHOOJNe1J4prrHKxlf
	pCcCIXoS6lEtnwFJI3QdQcL0s9KFi+IAR59UE8wh21C0nStGDcLPs2bjr7IaoDSvoaQlYmYyCBb
	62roGR8I6GUh6Od9FY2ojxD1eqSg=
X-Gm-Gg: ASbGncvdUhFseAQ85vVQxEWhTO2F7a2n234WGsfwKo5u8RRJdRi4vN4CZBLU0a3oHws
	NKsDqR6mMjKJWq0D0VE0cWquID2dC3KUojAm9ZTYbyjlCs3wa6DxW+F7s1o9cc/X6n2QOl88/nM
	PH99QznT4=
X-Google-Smtp-Source: AGHT+IGVrq1YpVsNJ/zjq33QD3opXAAuki9QYa5/P9+0RIuLh15WuDFxoMjGafKBGQZNLcd0AGTRKZTKiG+R20sui+U=
X-Received: by 2002:a17:90b:164e:b0:2ea:c2d3:a079 with SMTP id
 98e67ed59e1d1-2fce7b3e1e6mr4802644a91.3.1740248821300; Sat, 22 Feb 2025
 10:27:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <QD0GOJgCH2aX4JQuTDvwU-r5K8zcpSxD3eN6ixps2goHl3elDKOJFlkzUpSQSKaYDFls5CElJa-QXcoHLpInog==@protonmail.internalid>
 <20250219055516.359454-1-dirk.behme@de.bosch.com> <87y0y2e55h.fsf@kernel.org> <CANiq72=ixg0kg7gY1m32pQ0f4hZDDdgpZ30hotHD=C7trevMtA@mail.gmail.com>
In-Reply-To: <CANiq72=ixg0kg7gY1m32pQ0f4hZDDdgpZ30hotHD=C7trevMtA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 22 Feb 2025 19:26:49 +0100
X-Gm-Features: AWEUYZmL7tUVgqG5n61hEZEPWf6cA-aWF_dhJJRCWEprUBOnV2GCF2KtdK2Ry7o
Message-ID: <CANiq72m5gdma_EYAO5QsNW-zjdEVBHbUi1GmEVGfBp_AOp0X8g@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] rust: types: `Opaque` doc: Add some intra doc linkage
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org, 
	ojeda@kernel.org, daniel.almeida@collabora.com, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 19, 2025 at 11:54=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> It is fine -- this could have been an independent patch.

(Going through things again) The commit message does not seem to say
anything about this change, so it does seem like a mistake, sorry.

Cheers,
Miguel
