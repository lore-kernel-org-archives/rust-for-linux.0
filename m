Return-Path: <rust-for-linux-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93C84C7EE43
	for <rust-for-linux@archiver.kernel.org>; Fri,  9 Jun 2023 10:06:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238941AbjFIKFj (ORCPT
        <rfc822;rust-for-linux@archiver.kernel.org>);
        Fri, 9 Jun 2023 06:05:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52564 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241974AbjFIKEy (ORCPT
        <rfc822;rust-for-linux@vger.kernel.org>);
        Fri, 9 Jun 2023 06:04:54 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5272D76B0
        for <rust-for-linux@vger.kernel.org>; Fri,  9 Jun 2023 02:56:03 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id 3f1490d57ef6-ba81deea9c2so1610527276.2
        for <rust-for-linux@vger.kernel.org>; Fri, 09 Jun 2023 02:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686304561; x=1688896561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p1RokTxo26rOEZ5CeLmbdkUGVqRLD8O2ugQpYcNMhAY=;
        b=jkUTVoAkJSM9a09LYDliOMHRppYhfiC5w4Fs1mmQ+ICxV+ZTU05UrzhIcLwG2HqCVu
         SOkR6OlvpKvXmlZ9SpeEJhfMys/2zQFw3FlG6glwpbKtLhwVw4PpmLKp5oWr/nWlVL4y
         2RGePwJvSswi8N6nCKwg03M/FH/SZF+Yyj72OBrl/ZQasbiuZko+9GZ9i7RktcsbjHzC
         ewrmJXfdolDtpc9k5ofbeN20awBoS6fG7ADYG0/r7c0SpG9phFzSweMbCSOfGW/bmQJ/
         8I5P3R9C+lyd7SQxSgk9ReX0W9yXE90b+1clAcWqc9chvb5yv2Qq1KhVQHSFKVeVmtFe
         Lc7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686304561; x=1688896561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p1RokTxo26rOEZ5CeLmbdkUGVqRLD8O2ugQpYcNMhAY=;
        b=Xxs8HlyhQpyeJ3lOSN11sNN/LQVScuIy3kh5T6I2qpYVv3dmcc4rnFZrk4ogRm+bwE
         /6YrLIYdhrzGFH5doQcmkSeyhaTX04mh+XhXXO+k2JvHV6kq8+Erclppkb4tioH0dXtl
         MRfdgqTFIJaVwoXhe/MtaLsoSyKjAjBIEQplOhdIaS+qkfV+buVW8UPBrJuV9m1HbKv8
         2NBU1MqOrUnua0AX7RIjbYfPeft3ehOwvKBoZR1gKa/sD2AWKx5h5ciB3OXzO58OjS3R
         fPMww2pRAmHgohy2nsW9hHRGYzsgpsvAK3Y9QjGMiLAYIuZtWFqK2pmwbF7YCz7yTXh5
         f1iw==
X-Gm-Message-State: AC+VfDzVGWo/D7v5G37vxBmytBh+MY/EOJ2+7WWPZSHS9vAmSvAlP1LT
        zxtPZz4+b2CiNDVf6uRjtJlO+3LcaoLXfYBJGXE=
X-Google-Smtp-Source: ACHHUZ7n6sTZY88T6eKt+G0afX6MGQqo3+wXlboIzgUTdUhFcQ4TYgZLHqJ0inT98qqM9W5uxGbXRYhQtywCicKl3vw=
X-Received: by 2002:a25:8c0f:0:b0:ba8:8550:6d66 with SMTP id
 k15-20020a258c0f000000b00ba885506d66mr532937ybl.63.1686304561307; Fri, 09 Jun
 2023 02:56:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230609063118.24852-1-amiculas@cisco.com> <20230609063118.24852-44-amiculas@cisco.com>
In-Reply-To: <20230609063118.24852-44-amiculas@cisco.com>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Fri, 9 Jun 2023 11:55:50 +0200
Message-ID: <CANiq72=NaL-VvwkR0xBOAHaiNiPLyBBpUB9EKP98VRoYDuRwmQ@mail.gmail.com>
Subject: Re: [PATCH 43/80] rust: serde_cbor: add support for serde_cbor's
 from_slice method by using a custom alloc_kernel feature
To:     Ariel Miculas <amiculas@cisco.com>
Cc:     rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <rust-for-linux.vger.kernel.org>
X-Mailing-List: rust-for-linux@vger.kernel.org

On Fri, Jun 9, 2023 at 9:05=E2=80=AFAM Ariel Miculas <amiculas@cisco.com> w=
rote:
>
>      let j =3D &[2, 0, 1, 0, 3];
> -    let expected =3D Test {
> -        a: (),
> -        b: false,
> -    };
> +    let expected =3D Test { a: (), b: false };

It seems `rustfmt` was run within this commit, which makes it harder
to spot the changes. Please apply it on the commits that add the code
itself instead.

>  impl<'a> SliceRead<'a> {
>      /// Creates a CBOR input source to read from a slice of bytes.
>      pub fn new(slice: &'a [u8]) -> SliceRead<'a> {
>          SliceRead {
>              slice,
> +            #[cfg(not(feature =3D "kernel_alloc"))]
>              scratch: vec![],
> +            #[cfg(feature =3D "kernel_alloc")]
> +            scratch: Vec::new(),

Can this be simply replaced, i.e. without the gate, or is there a reason fo=
r it?

Either that, or we go ahead and make `vec!` work, but originally I
thought it would be more confusing, see
https://github.com/rust-lang/rust/commit/8cec88ba76e1d6edc98f30101c40f9247c=
754898.

> @@ -371,7 +376,10 @@ fn clear_buffer(&mut self) {
>      fn read_to_buffer(&mut self, n: usize) -> Result<()> {
>          let end =3D self.end(n)?;
>          let slice =3D &self.slice[self.index..end];
> +        #[cfg(not(feature =3D "kernel_alloc"))]
>          self.scratch.extend_from_slice(slice);
> +        #[cfg(feature =3D "kernel_alloc")]
> +        self.scratch.try_extend_from_slice(slice).unwrap();

Do we know this allocation would not fail? i.e. we need to be extra
careful on `unwrap()`s within the kernel. Especially for facilities
that may have more than one caller/user like libraries.

Cheers,
Miguel
