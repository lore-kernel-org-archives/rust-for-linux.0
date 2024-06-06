Received: from mail-yb1-f174.google.com (mail-yb1-f174.google.com [209.85.219.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E691F13C8E0
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Jun 2024 09:14:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1717665261; cv=none; b=AeBzlltHpa/2X/63rZZehb4rk23VELhMp0WeCqesdciEKtZt1eIkhWKo3gaFY7hPqRoPqa7ELkIEGAkxzWhKG005lrCbmO329BONq319ij++sjgckUSt/afQYHMXOgSB0MB6mmENVuooe8nNy6pjk4526ReZUeWeBlE/tFcpQgk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1717665261; c=relaxed/simple;
	bh=NCUDiUIR7y4F2sGhg5am1GVnfp2MtRfrw5kgtBke/Ho=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eBjFg7pPMmykPQd3hlFb3PMCsKdFrBh8qwV+kARQrQnsI0IA/tZHKQ3iLp2R0Lt0PtBlAKrEUloFSDeU9p7Llbp3i/AJMsdHO58WNQxn1ejIu5mZcNm/Ey1ZFIo0SmJaXZp3HL4tousXvNLb84IfuEgDSGZ3ntXRSbgABF1TCpI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=YSatq9Kn; arc=none smtp.client-ip=209.85.219.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="YSatq9Kn"
Received: by mail-yb1-f174.google.com with SMTP id 3f1490d57ef6-dfab2474152so795040276.3
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Jun 2024 02:14:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1717665258; x=1718270058; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ccR4kKGg6IgPEzF3bYzcD4mh9giWPRAa85nmjlfrVh4=;
        b=YSatq9KnLUMg6KLJ/dbG3MU0YFhuQLmgVvUkvXepi9TrIQuFji/Iiuw7RQOTv4jv5r
         h2PFNpPg/qRSfuvWYm8ORvCKhFopkDJlnr0XYfvNpeOIEsze6Vz/L68UbeWUdkQh01Xd
         oa6VQ+OVhPgOJNyhZf8lD34CaSN4ikJWdN9L0VLJoTNU4MxMIWMm84vFKHrh91nYZHYP
         4Qy3/ukoM4x/4WKjGEi4r9rjkQFMq9r+iDHMEXePSy/1Ghy2Up8GHmKpzLs4EcyWu0Mm
         UVUfG1DXWJ5utFYXn77r05HTed2DbeGnMvkhZIwoyakN144E+T5lL6SVq457AwBvr1eO
         eXPA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1717665258; x=1718270058;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ccR4kKGg6IgPEzF3bYzcD4mh9giWPRAa85nmjlfrVh4=;
        b=FDtLqYeAOQcf2M3jlbeFwRkz8kaUJAoEZS9Q2zn5DbW6vLMO7f6WD1Oj6lMpYQ0X+b
         6APZ8EZ+/pwFEndVVr4RuoUMOTxXavQfxf3ct8sU2jRfhXQfedT9PQoBN+oy6MD+FdLL
         PhQUkV4u5+Jzf/HO3ICWkjhKfb4V08Kw2o4Im3RrSxFolkS95osEUWsDB9hOKkWWXBiY
         TrCvknOXBHUr2McE7/rm3q9ucOMeIFguhFynFsIQmz7ojXnai12wGFjj3cq1H3PndAQu
         aU+Ow5Yn0Yc1RQELjDGr9+i9zZHAjZJTIWluQ7WiBQGUytoIK2Gmkh0Bbaadwv1xXElc
         lSxg==
X-Gm-Message-State: AOJu0YxI6cTOfu7ZoPWBM7a4oFDvyzMCfdtuia93LC56toNAu+14qivM
	78tv/C88Aewnc8ZmOnjUev15Qo+CnylfO8+4JUm92O4fk+XGM9i5sjZTIZnnUMsF9Dg8urbxftP
	P79O9raj1eexihzegyE8cRpalOVZ8C9lpGCI9kw==
X-Google-Smtp-Source: AGHT+IHWDNpAUh+Y3h8JmvhPTnTleYsCF7AET8UMyBINiIOPVRc8cQFMpZDlrQFijaAMf2YGcIaaiUca0cGt96/AIOg=
X-Received: by 2002:a25:8002:0:b0:df4:d29a:6897 with SMTP id
 3f1490d57ef6-dfacac590femr4507066276.35.1717665257655; Thu, 06 Jun 2024
 02:14:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240604070646.1819816-1-dirk.behme@de.bosch.com>
In-Reply-To: <20240604070646.1819816-1-dirk.behme@de.bosch.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Thu, 6 Jun 2024 04:14:06 -0500
Message-ID: <CALNs47u9RtRS8rfTR=7S-xRZ_43PMHXbjhVKEnAFmHeNFEM3Vw@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: no_std is used
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 4, 2024 at 2:07=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com>=
 wrote:
>
> Using the #![no_std] attribute in the Rust kernel support is different
> to the default Rust usage. Mention this in the Documentation.
>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
>  Documentation/rust/general-information.rst | 8 ++++++++
>  1 file changed, 8 insertions(+)
>
> diff --git a/Documentation/rust/general-information.rst b/Documentation/r=
ust/general-information.rst
> index 4bb6ac12d482c..bdbafd916daa5 100644
> --- a/Documentation/rust/general-information.rst
> +++ b/Documentation/rust/general-information.rst
> @@ -7,6 +7,14 @@ This document contains useful information to know when w=
orking with
>  the Rust support in the kernel.
>
>
> +``no_std``
> +----------
> +
> +The Rust support in the kernel links to the `core-crate <https://doc.rus=
t-
> +lang.org/core/>`_ instead of the std-crate. This is done by using
> +the ``#![no_std]`` attribute.

This is a good thing to make clear. "instead" probably isn't right
(since core is still linked when std is available), maybe:

    ...kernel can link only `core <link>`, not ``std`` Crates for use in
    the kernel must opt into this behavior using the ``#![no_std]``
    attribute.

- Trevor
