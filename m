Received: from mail-pj1-f53.google.com (mail-pj1-f53.google.com [209.85.216.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B928531D384
	for <rust-for-linux@vger.kernel.org>; Tue,  9 Sep 2025 17:18:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1757438291; cv=none; b=ZnHF5Q1gbakyvvKMn7fZXUlY0qu6vgnI0+yUVIBeMHxWYkc/tkq41ZgI7cP8hR5J8/rklZtmex4BKvoRGt/+/CDsojV/vS3z2pGBQu8EiVxgHGCs9iOkD86OymQI2/zHZ85FM8SFQfYOaSqVCIslwyarnJw7CTWxYmzYIQowWWQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1757438291; c=relaxed/simple;
	bh=eANuCz33lH1bMwsj7oCJ47IYyMj8B04J6bOmhdmvkOs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZBfiBHXo4SR4BlbR2fGxZtk60kImuDJntzDh2Dxs+6A2I8S7NF8zeiTw7W8XHkW2giU8dgh0mlGgosSeNlrip43x9Z3J8QPG4m1XPhEXAFrQ6s1RShcFri5P2EgHGVmGdcnQ5ZGrCA5EwXPylSeTZFpJseEkA8fqHSe89VHTHds=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZdHAeo6; arc=none smtp.client-ip=209.85.216.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZdHAeo6"
Received: by mail-pj1-f53.google.com with SMTP id 98e67ed59e1d1-32d851ee34aso327397a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Sep 2025 10:18:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1757438289; x=1758043089; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eANuCz33lH1bMwsj7oCJ47IYyMj8B04J6bOmhdmvkOs=;
        b=HZdHAeo6jft2YL/jmzfXkBErUCLaVlF1vBhemzMsBp85HUzujkGiA1NPDcXZZYZyc+
         R4sz0juItQ4ZlAuaPugh9xe5SSa0eVYlF78AKOJqbYfOU7yMVs9UC9SGi4fajnta+MFe
         ab43cH53kjj8K8klu5cgMrxnM34c3xtMrLOewYpcYNRTNWpDvTkbnZ3GgaEXU4uPl8Lm
         MTlNLG4qu5ODB0LArv44HtqfpboYGLUpZvKlU7ERi89oo39zX4fD/8zY4SddRYqq0M2h
         PzUJU47oEoZzjaqqv5qcjfGKVl4e6FV8Uzdt4LwnTamiSQVKa5q+T3eBaGm1XEEZzYAE
         nIZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1757438289; x=1758043089;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eANuCz33lH1bMwsj7oCJ47IYyMj8B04J6bOmhdmvkOs=;
        b=mfXYy3JmlBPwy0JfBdoE19sPbsigGNzL9iE3kNCP+IREIPiCebC2VkAFfBmg84vTDg
         EOUeKUK1ezFV4wXDKMecafph3K5OMKIWwMUWRmRm9KNtSn+WsUi317ZOsm1hzbXUn03M
         RVFlshLJz3gqg/yyfAZKdYgPs/saekf9DmTTP4c1bOCvKmlYEO73t3kdFMVz6Azen/D4
         WykuXCQx1RSKJQk1lTURY/jJyjovq1qkY5Of+UL2N3B7SOE7iStlh+oHa8G8B0e3RS+J
         TfrmQmH5gLaBq9BkCYZdjSXx9ttUn0SwlAMNvEVceKuv1PMdgkX7J7i2G6LuXTuBBKqr
         ZpdA==
X-Gm-Message-State: AOJu0YxgIInHgeN2zcnrZiS7KfBMyytGQw1+sfzg0zyfd2ZWP7KYj8lo
	qtryhavEJmpZh4n7mOb6nKLIjdPJbQXHAbFfvbA10K8+JwCWaX2N1Kt7v+32A3hKcnkQhJauiNH
	ZFlTbjSpLuspX1Fx5lPgbjSf4KAvT1Es=
X-Gm-Gg: ASbGncvoZcAiPFip+oXOd7OTp8rb0bWo/ranJqDlUx6A/mqOfgn1pGp+FPFPYOD3w2Q
	IK9pxyVrmtRxkEdSyLsdfc/Ws6U9iamh/Qngs0FC0RZq0nIUogJVDKV4EE6f7QI8KD5+gEgBc79
	b28Q1XxR3XMr3PMHws2v4eLyqlcgojBmMkbyGbBEKA5zaAVyb49g2WkCeIy/W1IX2LopThDi17A
	L0yk2Is6JlkTJPfdw5Z8F1+YQZb3SZ2JvSu5n5lsanwW3drkBpyFtGTZbV3LiSlugX155NL30Sm
	t1J5DjpdpHVM79F84PqDzrWmbZrTfChRr9VY
X-Google-Smtp-Source: AGHT+IGZvxHwMJuJTTKpdzQ2seSpBVyMgSszDRBCdloTBJkjA+PRzY0NWCEouBfzawrB0YlxcoPbJsyhaKtUMdZErKs=
X-Received: by 2002:a17:90b:4b07:b0:32b:aed4:aa2e with SMTP id
 98e67ed59e1d1-32d43f8eaa9mr8987250a91.3.1757438289039; Tue, 09 Sep 2025
 10:18:09 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250909170013.16025-1-work@onurozkan.dev> <20250909170013.16025-2-work@onurozkan.dev>
In-Reply-To: <20250909170013.16025-2-work@onurozkan.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 9 Sep 2025 19:17:56 +0200
X-Gm-Features: AS18NWArfz-SKR6eBoIPN5tsQPjXO3WdMRNjKjDTQlv9bzevnMWFofEbcB04VyM
Message-ID: <CANiq72=kWpxpo23JUYTqxwpsY=E0uUvCHgotRuepZpL-qUqXqw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] rust: refactor to_result to return the original value
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	daniel@sedlak.dev, dirk.behme@de.bosch.com, felipe_life@live.com, 
	tamird@gmail.com, dakr@kernel.org, tmgross@umich.edu, aliceryhl@google.com, 
	a.hindborg@kernel.org, lossin@kernel.org, bjorn3_gh@protonmail.com, 
	gary@garyguo.net, boqun.feng@gmail.com, alex.gaynor@gmail.com, 
	ojeda@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 9, 2025 at 7:01=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev>=
 wrote:
>
> This patch only fixes the callers that broke after the changes on `to_res=
ult`.
> I haven't included all the improvements made possible by the new design s=
ince

I think Daniel asked in the previous version what you mean by "callers
that broke" here -- it is a bit confusing, since it seems this is a
fix (and thus needs to be prioritized).

Is that the case?

Thanks!

Cheers,
Miguel
