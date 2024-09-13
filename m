Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com [209.85.221.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 706306EB4C
	for <rust-for-linux@vger.kernel.org>; Fri, 13 Sep 2024 07:33:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726212840; cv=none; b=r1wAkJWPTzv4nbQaX+B36kdV1Am2uqqFrwn6UYJIaUwHgLUrkbcFkBZGdBJvAoiEIVHM0vAN2c0hK4/yB2uAymV9TNANnbzCL/axXobF37nZrGIPyiqdcVceFqmQzt8fY5uTieYQRx0BidU9Aj9An1bGv5QC/36zqvmyA1B1+w0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726212840; c=relaxed/simple;
	bh=4EhGCh5UlFLWv3yy5BWWhJnw5ZlhnXBRO0XFQzRSN9A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gumJ2MwDuzHMA+yCOauMFRAPjTY9Ff8Hq1f/9kx8wwrvessK2kkHD1knAJY0n6+E3m0K+us4W/lo0+H+jERUO+NzyNkkTJfiT90En1BSuTuw9FWh/SM3ZWfTFMF0XOfoDXbKO4TGMzyrcn4H+dzvAv8fL8mxeSX2opjkDb8+Xy0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T8Xbao1b; arc=none smtp.client-ip=209.85.221.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T8Xbao1b"
Received: by mail-wr1-f45.google.com with SMTP id ffacd0b85a97d-37747c1d928so427842f8f.1
        for <rust-for-linux@vger.kernel.org>; Fri, 13 Sep 2024 00:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1726212837; x=1726817637; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xX7GEgwmZmRNetD/mdSl0xv1Lugr1MnK89Dp0qjJIwY=;
        b=T8Xbao1bqpUZgfLcdaHn1xtOSmoUWRAsNdy1tqnPyT7uny5e0tdo/WAPYbwHe6cyWb
         QyOQzPJb0nOC+qXx9w0yd5dKhXmswisK0FOobNIpdgKVTO+UUdKVC+MI45Fpz+3Osa3t
         +6zcu697BlZSp++4Rb9O3KPltFoF2I4FxHPA2VqSsFJ09YJkJL4vKBnWT/Nh0rI8R9WN
         cPPWCexrgdeuVrk6B6QvtEZXvHElJWew9+54F2wUgpYOSx94GNOcI+ngvR+cWD2deKOX
         4/xqQmv/LfB1bGq+r2E0QXL/rwSl0S5/agmKTenRPSOiFggBSFFgj03nUoCqP8J8JVu6
         IdCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726212837; x=1726817637;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xX7GEgwmZmRNetD/mdSl0xv1Lugr1MnK89Dp0qjJIwY=;
        b=Sk8NFJKlk5+u9IbrwE9JASIFM4Dzyy1MmdmPyI1aWuPJAnctzumwPA29/iZ6LkJhQI
         u5MnOJUG2uflj8AqvSwIqdQ0XH+v9xEqRNQ6/vZUzacQ0VLeBUp7eGOHxnKVX1ECAC0p
         IfmP4DNNGBR71G9SLcUSNl+0QmqeKU4GmABnyrDBvhKKbIDhxE1ma5rNFzXvDpg5Nuje
         90pzV/+OjL3ckcVQZcQlE2r51dX5ix8Ui/3wJkSVb8lS00G6iUi86s1PKBchqV46zNGC
         SJGBNbNzNrjyU6GPclZtK2JxJ2gkaPEsGCRBoE/irQgSV8KD63XqFnqxhpZrVI1AytM4
         dXjg==
X-Forwarded-Encrypted: i=1; AJvYcCUvxwokgG7p6tw/1MI+nbiEwcNwc1o/Pd8/w46VaXlIdexxRdXHNDDQ2ahezDnpzYtmC2BaASYMbLgLwhgCEw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxkFFvgCsGsPkjEisIbgHRS3Jw0kStw4QZj42yucUtUPzrQhd3A
	F14Q/bWXvgHDwDVFNtzQG0XYkMIaUyp0IUMe4Zdc9tvms/APtoUmSutvBF4eXleNCjt4NHoAvVN
	HUmAF/cpbvAYlAGuzufiu10QwEH/yK0tf1D/6
X-Google-Smtp-Source: AGHT+IHnztr4jlB7m8lLsakxkOS0gIY/NRQK0skKLI3F9WO9LF5gVY0ClyYEHsr3Ab4nqjP6YJUKnyihOrotw9LgkDA=
X-Received: by 2002:a05:6000:154d:b0:374:bcff:cfa6 with SMTP id
 ffacd0b85a97d-378d61e28camr961842f8f.18.1726212836453; Fri, 13 Sep 2024
 00:33:56 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240912195649.227878-1-paddymills@proton.me>
In-Reply-To: <20240912195649.227878-1-paddymills@proton.me>
From: Alice Ryhl <aliceryhl@google.com>
Date: Fri, 13 Sep 2024 09:33:42 +0200
Message-ID: <CAH5fLghxvLoQp+G1oaaVfBx6DOh-GO0Wc=jboiwz9ZCoEtHVpA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] checkpatch: warn on known non-plural rust doc headers
To: Patrick Miller <paddymills@proton.me>
Cc: a.hindborg@samsung.com, alex.gaynor@gmail.com, apw@canonical.com, 
	benno.lossin@proton.me, bjorn3_gh@protonmail.com, boqun.feng@gmail.com, 
	dwaipayanray1@gmail.com, gary@garyguo.net, joe@perches.com, 
	linux-kernel@vger.kernel.org, lukas.bulwahn@gmail.com, ojeda@kernel.org, 
	rust-for-linux@vger.kernel.org, tmgross@umich.edu, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 12, 2024 at 9:57=E2=80=AFPM Patrick Miller <paddymills@proton.m=
e> wrote:
>
> Adds a check for documentation in rust file. Warns if certain known
> documentation headers are not plural.
>
> The rust maintainers prefer document headers to be plural. This is to enf=
orce
> consistency among the documentation as well as to protect against errors =
when
> additions are made. For example, if the header said "Example" because the=
re was
> only 1 example, if a second example was added, making the header plural c=
ould
> easily be missed and the maintainers prefer to not have to remind people =
to fix
> their documentation.
>
> Link: https://github.com/Rust-for-Linux/linux/issues/1110
>
> v1: https://lore.kernel.org/rust-for-linux/2024090628-bankable-refusal-5f=
20@gregkh/T/#t
> v2: https://lore.kernel.org/rust-for-linux/92be0b48-cde9-4241-8ef9-7fe4d7=
c42466@proton.me/T/#t
>   - fixed whitespace that was formatted due to editor settings
> v3:
>   - move && to previous line and remove whitespace in WARN per Joe Perche=
s
>   - reformat following C coding style
> ---
>  scripts/checkpatch.pl | 7 ++++
> +++
>  1 file changed, 7 insertions(+)

This is missing your Signed-off-by and the changelog should be below
the --- line so it doesn't get included in the changelog when applied.

The change itself looks good to me.

Alice

>
> diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
> index 39032224d504..5b18246ad511 100755
> --- a/scripts/checkpatch.pl
> +++ b/scripts/checkpatch.pl
> @@ -3900,6 +3900,13 @@ sub process {
>                              "Avoid using '.L' prefixed local symbol name=
s for denoting a range of code via 'SYM_*_START/END' annotations; see Docum=
entation/core-api/asm-annotations.rst\n" . $herecurr);
>                 }
>
> +# check that document section headers are plural in rust files
> +               if ($realfile =3D~ /\.rs$/ &&
> +                   $rawline =3D~ /^\+\s*\/\/\/\s+#+\s+(Example|Invariant=
|Guarantee|Panic)\s*$/) {
> +                       WARN("RUST_DOC_HEADER",
> +                            "Rust doc headers should be plural\n" . $her=
ecurr);
> +               }
> +
>  # check we are in a valid source file C or perl if not then ignore this =
hunk
>                 next if ($realfile !~ /\.(h|c|pl|dtsi|dts)$/);
>
> --
> 2.46.0
>
