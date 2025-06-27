Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20CCC29DB6C
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Jun 2025 11:44:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751024661; cv=none; b=Xdt8YVAc59aZC2JiMd2N6aIuiOLtya05c2RsvfEuASnlObOwnuvSqylZfSi0aLlMHjv3iuB+eGaf/fkrlLIferwsCHy7J/DHB1RQgXd9wpUlzeekQ9vWxE/0ROvLTNIIgZhffTMMldzRD5J0CCd2fBSPTDJ2XNzvshFwsg9OFFA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751024661; c=relaxed/simple;
	bh=OL+RP3b07r5oCSV8n2+AbVnJkI16WJtMe6m1uDM8frY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XelK5RNNkyNyqXwfLSVzghKooWkbvtxXmjUNbKKVQzZLNJZLrLaGJNnDKy57JHr6w9O8Ja0QWyJL1gdZf7AtMp2jHMKRigzo14uaERYMvQFDCE1eeT563Tk5X1+TUYSfYyOjVSbe1w6cruE+ct2Ya7bUlj2v2rFPzZ4nJO7VyKk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S5qz9FRA; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S5qz9FRA"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-313862d48e7so284317a91.1
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Jun 2025 04:44:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751024659; x=1751629459; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pS+ZPyznlJ3iS5vNN9mSK0o3DY38FMnpY0fJETaSO/s=;
        b=S5qz9FRAg04tN1flbA+FhV4qjSTaj4bp0T1h+Wiu4ubPJWn9BG8LRo6DfJ99eK9sUd
         t3S8wG+4ZUZbTG8NYYDoeUD+uY+fd7kDSS1Gti0LqPAWfYPH9M+Sw2Wdluml35fhWoZR
         6zhoM76jFyeaCfp75EmOB3x8G7yiFL+ZC2zzMdGc0Ww29AtHk4+B6E57m0sPoVmJu63l
         VyBpKhCn2JFxu/DQuucpLymUJScxWwEAmPX6JN6/o1oyuCzafAj3qyPdTQFUeHbiEPJm
         toh3p7F2XxUJJuNltFDpKwWqEfK2tcsDH9dpYC3Vnzi7XqwccoG9hUBXILa+YCmfgkQa
         yD/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751024659; x=1751629459;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pS+ZPyznlJ3iS5vNN9mSK0o3DY38FMnpY0fJETaSO/s=;
        b=da1+AF67PwoFHYGfl9eAt/bT3sZc0fUD5CSvotXldnzDs+MJXsF21nXvapZ4ywhxhv
         Dq+aRFJ+LHwKUcP6PkdTgfQWx+1+DETJ3YOk5tmf1zRdDRnI+JmAdD5VqRrbY+3dF3DA
         l58NvDyrGsMz6Rym+Y8nrFrB1tjt5NgM4KZsc3h6cSVlchXJAeoebkbVkhgdGKqut47c
         Ylx73W6jLH7phxNcKMTKThy7QNdWzgvE6pUGFlmMllqEu4gxaP5DUopr0Z8/3fWzECZ6
         fiuFhhrkPhXxY1tAOCsXy5lGLCxDAiwSFHP1DAOL9lPj0Sgf/voBszvcF6wP/mTpdoWN
         KcGw==
X-Forwarded-Encrypted: i=1; AJvYcCXtikzzW83qpqbkHWIpC+QzJogAlZVD/d9g78BoCOoGZ5poTYZUGUKgbnTNaRhYleO2BDVZV+9BWq5Rr2nWrQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIJbjqaod7UPL4UrEwc10/bQP7IODaRNW161wmMpi1omBzfDWb
	BJd5zIas20r/TYVXX7wO9Z88n5bhQMjuRmA4lIwmMi0BRAol2k6JOKZTeulejBpJK907Wb3lheg
	RaIWHvGp3OB6AeU6eCQCW8YFYPuRNcDvPuIg5yMk=
X-Gm-Gg: ASbGncuPEQlwiorRdMzJVaOFVtF20eciMAMYalYsf6zw/5xOTdnzAxQJGWIU2fGcd/D
	iFw17I2AVCU6VsT7JAbvKeLVq24oE3JvRqssUS4EUOxQ41SJ09R5whjH3MGsNYHeglPTs7usAgg
	GvVyYyAKg6PWquWkOc2TpqHec6ZfLFOg/DjqxYcyrhQtM=
X-Google-Smtp-Source: AGHT+IE366TUu7KMH/hZ3aJAQfk1MJ2VG8O3hymjtiBQTP+jBFFLF0J1kyJhKcyp/4h7ZGpYnNpQeVzFO4P2hKv7u9M=
X-Received: by 2002:a17:90b:3d85:b0:313:14b5:2521 with SMTP id
 98e67ed59e1d1-318c92af3a7mr1613655a91.5.1751024659411; Fri, 27 Jun 2025
 04:44:19 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250627094102.770689-1-jfalempe@redhat.com>
In-Reply-To: <20250627094102.770689-1-jfalempe@redhat.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Jun 2025 13:44:06 +0200
X-Gm-Features: Ac12FXx-5LTvv9I-ZDb9-nivG3KWk1kM0W75cZm76TLxZSE56N1ptu8fSUOgiIc
Message-ID: <CANiq72=aiAnn3n7ADgmKUNNSp7HfBjRc1ftG2qSD4EFUkS3jqw@mail.gmail.com>
Subject: Re: [PATCH] drm/panic: Add a u64 divide by 10 for arm32
To: Jocelyn Falempe <jfalempe@redhat.com>
Cc: Andrei Lalaev <andrey.lalaev@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Arnd Bergmann <arnd@arndb.de>, 
	Russell King <linux@armlinux.org.uk>, Paolo Bonzini <pbonzini@redhat.com>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, 
	Linux ARM <linux-arm-kernel@lists.infradead.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, Javier Martinez Canillas <javierm@redhat.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, dri-devel@lists.freedesktop.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 27, 2025 at 11:41=E2=80=AFAM Jocelyn Falempe <jfalempe@redhat.c=
om> wrote:
>
> +/// On arm32 architecture, dividing an u64 by a constant will generate a=
 call
> +/// to __aeabi_uldivmod which is not present in the kernel.
> +/// So use the multiply by inverse method for this architecture.

This sounds more like a normal comment instead of function docs, no?

By the way, formatting:

    `u64`
    `__aeabi_uldivmod`

Thanks for fixing this! It is nice seeing 32-bit arm taking shape.

Cheers,
Miguel
