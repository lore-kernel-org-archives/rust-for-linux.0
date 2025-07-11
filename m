Received: from mail-oo1-f42.google.com (mail-oo1-f42.google.com [209.85.161.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E3D3148827
	for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 14:32:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.161.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1752244378; cv=none; b=c1zqUn1rih4nQlKAkB4Ncw601CN8MSZF23nULKdpY1dkmhcDVEpLuVDic6vZ0QXvGf2EYpyO2J0JqgD1gV5SaBRe6P1z7FRzGQy7ARx36rLqUuYRupbzCFn1gJUOihUJjX+US4+U1ghMyczksiYuzwl3vloFWhWpdkrK9ZUkuvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1752244378; c=relaxed/simple;
	bh=sHwmBKr1pqR2VPOJxPrJ/4p62JE63HgdR/AUsw+bKwc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gkQrHlygmmFW/0h54EzR2ToTseK4huRrwtdXpH6hT36VdJIO2MgY8nduNn85tWNvokzKA4ausulbhjVUbLpfATcJaAUjWiYpUgUjQcPwGLY57zjoyZUGytSNSswD75mLPoASy9gCk9OrdOSoWHNdBHDnc8UNVfl9NC2BvjZ8Vgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G2v6S0tn; arc=none smtp.client-ip=209.85.161.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G2v6S0tn"
Received: by mail-oo1-f42.google.com with SMTP id 006d021491bc7-6113e68da82so914618eaf.1
        for <rust-for-linux@vger.kernel.org>; Fri, 11 Jul 2025 07:32:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752244376; x=1752849176; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Yji148rFbMc8mnB2S2TYWPMgYlpgsVXoOrnHojTbyX0=;
        b=G2v6S0tnd7MGqzJs/CKbwGfDUktCtwC/SNpa/QOUGkNiUZlbBwKpUf2CqS6tSJf0CK
         UTYjMvhCym9Rv/J0B8ByWmSkWJ3GB8wpS2eB63IqTvlmAb1KVhOKwcqySvlZqxuEotrx
         JSERStopivJG4PhuokycUHwxTUoCsvUcRzGLrJVCCiv3O9UvaFUKPxIP6jJlG4W2NGC4
         J+bPeCiI6FiqZUmNZ2iYOugWgYUN1VW1xg+H7PZiN/m7LyG/WbhS5EJJvWWYWl6iCVtU
         bKqAjjPJldpmMXR/xCz/lFp09KucsEyIQuZ8OImHjuG3IJqzAnXDqqU+G8QCObC0HU23
         5Fjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752244376; x=1752849176;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Yji148rFbMc8mnB2S2TYWPMgYlpgsVXoOrnHojTbyX0=;
        b=lre12nkaRp7jrBFE15RBVOrpdsW8v9DWMAMNtmoVZ7xvpmO+/ioMC8Hy8TCdI9OvtJ
         8Oer4tnB7efvskwREHg5P3cb1/PeRBfYNvJU7Vd04fFxXn2XKj5pVVTRSEKto1UTR3YY
         omiXlmNJdavqSQ4v/KZTyDKKWtNgP+06Bv/9aGYKVOlBLZQVX8vXnt+a3HvGAjJ879cM
         BUnMpS6QW43Bsyn3D3rgnzD9qs6N5xxFfHXH+iinuXCyBurma6hSpSuzmucs+0ZOs7eR
         nNpYyN3PsWx8g/lGs4BtoGZhVvSdTF4xE9MLUKfG82aj9uf+s0XhjW+s+UkiIUNHMBAF
         zaEw==
X-Gm-Message-State: AOJu0Yw3xHr1qgBA94Tdyx0Z3mTC8EE+pOJ17DYtRN5q+Ac39P7RSGC/
	T4B2VLeY4eKY+usMSd0d0X6J1edUox2lqmO7EG24JA43IcPI3bwW8bFQ/M9hV42hRt1gc2ZlrVs
	f49+b1UyI69eQXdKO00pxQn5dXmbYBJE=
X-Gm-Gg: ASbGncta5NCGxpU73Oy7vDD0M+B1mLiQykw4QmEOfmGmj+ZIsgS0HXpknYGJ7NcZJAq
	9Qq4BVD1bqUpPQU+vMpOou5DewEDe6MlsnrN86i3cOKP3rA+aQx5V/QFw+cxL03jC7fZvEK+Acz
	fgyqEQVbZVNpbDH+eHbDgRiJITliaEYwfVdqtrMzS4IDVnckGAa6rm1fH7dLdo3t3UIajqcFI90
	VV11LayktLCNY21Qn8EbbnH4E9We/IQZIt1ZacIVqSRpcZmZiE=
X-Google-Smtp-Source: AGHT+IEgxQKGmGqah5zVe5w9iG/VV0XSNZpda7Vl2/G+3LKv8quhuWZOy7T0IYmt+ZEz3Nm6Jjk0wRi492dkTfmyn6Q=
X-Received: by 2002:a05:6820:a0e:b0:610:f58e:6bc2 with SMTP id
 006d021491bc7-613e6029f20mr2075442eaf.8.1752244376014; Fri, 11 Jul 2025
 07:32:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250711113327.39201-1-krakow20@gmail.com> <DB97N2MN47L3.1F7450280ONEB@nvidia.com>
 <DB97YVI7QEEC.4YC9S6BZ1PGG@nvidia.com>
In-Reply-To: <DB97YVI7QEEC.4YC9S6BZ1PGG@nvidia.com>
From: Rhys Lloyd <krakow20@gmail.com>
Date: Fri, 11 Jul 2025 07:32:45 -0700
X-Gm-Features: Ac12FXyKEyAJ52NAxyXHz8XYCoMa_TmEAoWV2QDZf1CL9W6p8myvARwU2bn8otw
Message-ID: <CAH7AjUz7YBkBJWiriNVN2q4ZxkDV1bo2dF1yVYCKq6u3Sk50dA@mail.gmail.com>
Subject: Re: [PATCH] gpu: nova-core: fix bounds check In PmuLookupTableEntry::new,
 data is sliced from 2..6, but the bounds check data.len() < 5 does not
 satisfy those bounds.
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi, this is my first contribution so thanks for pointing out my
mistakes.  It looks like there was only one newline between the commit
message and description, so the description spilled into the message.
If `git send-email` was supposed to add a From: line, I couldn't tell
you why it didn't, but I'll change the commit author to my full name
instead of my handle.

> Regarding the patch itself: is there a way this could be done better?

As Alexandre Courbot mentioned in the other patch, the solution that
fully addresses the issue will be to use `FromBytes` once it lands for
structs with no padding holes.

I don't know if I can submit v2 in a reply, so I'll attempt another
`send-email` shortly.


On Fri, Jul 11, 2025 at 5:20=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.=
com> wrote:
>
> On Fri Jul 11, 2025 at 9:04 PM JST, Alexandre Courbot wrote:
> > Thanks for the fix!
> >
> > On Fri Jul 11, 2025 at 8:33 PM JST, Quaternions wrote:
> >> Signed-off-by: Rhys Lloyd <krakow20@gmail.com>
> >
> > You will want to split the subject to something more minimal (e.g. "gpu=
:
> > nova-core: fix bounds check In PmuLookupTableEntry::new"), and use the
> > rest of the sentence as the patch description (as a rule of thumb, 70
> > chars for the subject, and kernel patches must all have a description).
> >
> > Also your "From:" field must also match your "Signed-off-by".
> >
> > ./scripts/checkpatch.pl will complain about these points (and check
> > other things as well), so please make sure to run it before submission:
> >
> >     WARNING: Missing commit description - Add an appropriate one
> >     WARNING: From:/Signed-off-by: email name mismatch: 'From: Quaternio=
ns <krakow20@gmail.com>' !=3D 'Signed-off-by: Rhys Lloyd <krakow20@gmail.co=
m>'
>
> Forgot to mention: please also run "./scripts/get_maintainer.pl" on
> your patches to get the list of recipients you should send them to.
