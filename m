Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BF9647A0CD
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 10:03:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788257015; cv=pass; b=uZm1O0G0EcfJKWLl1b8AUY5nhYyFVCYDKHBp0rOhoRJcc73bbxiOEnB6wt5Dy/OHq74wZXOTW6bqj+VPrrzVfoCzuAfbfxL0E2H9F3dn0iKKv5VoUMFprCxqTeNSfRwdCkXqwMvwiKrF0A1XvB40g0ZhBKOZqwLTW3wZq9znGbk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788257015; c=relaxed/simple;
	bh=dtC2b9rE2+PvqyfvIQpFBFFgI4ZlT+seDQ76UBcyXhk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R1FeLG0ukfAtwQKbaDNKzj75K9mZqvEnqUldEjfCHuOArknWC1A3W8hfVxLzE5+JPlygcFtobeWOInaqq9RGATM9RxTpW1pZ9maCZAM48GU9rw1SE3sjwD3K6okfwVe+dwHesn9bx7YYX5U+b385DO+DdrOmr2/1cVm4peCEAbw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m2rRfVrQ; arc=pass smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m2rRfVrQ"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2ccae46de39so6628805ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Sep 2026 03:03:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788257012; cv=none;
        d=google.com; s=arc-20260327;
        b=kK81Sp1J95dCYRj3LOF76EdGzJJhxPGGLCMmAyxOMj+Jhr/zSagfQNcBCXHBzXFDga
         K05OLtodmZi+ENGU49Utqk8EohQ/ixpQbKoaMYvYyn5ucRkxChOdHLNUIeD/O4mYtN4g
         w60TJTozAMOszWO783pBY8BspH4g6kEHMr31UcJEoY3estjgtjisnekMJQ0LUqWYNLwt
         h3p/+Vb/KbD730fCuhO6jIswx7KWhILC425etIuvdgP5PM2Bdx8SIMwm608fHZM+wcOb
         SpCh6L84KF0+BYDcP+AyxGj/XpH1HnrhfhL3smImxJDur/XbjY+Fn361WILF7mVO2gA4
         05Yg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bmZDR4ZqqsB4rIh7Kzatyaogr6ocdpUcdSx+7fuMEz4=;
        fh=DNbRityqoUqEcmlTz+TX4cOQOhUxm+FAosa2xIYWA2c=;
        b=RokFqobNXCcAHXrdoa6JL9ISO8chnOOsR4ODbLVJPAKQNNmzee1qRGpfXikx3xezTi
         AiUuOixTWLxSlP3r2BRZTCJcu95zWzj09QEjb7k4sBE2PLDxV/sn7aNUXkSyyAcxER7S
         0h/Gk+pQl+HXIt1qgsEi7OM9sTbqcGzrg9JyRBocQw8kp2Q2w2rqaywAjTFdSknqKkTw
         P+GvjKVZ3kKdMEmMhq18arbxkQdZYW7H6k3PHPAWo5YS4yR9SByO3/PBidwbn3Y8AZPH
         d4wkrTCtqX6+IWN7UYfscTOBsX8EQUEIKnS/YnoGKHuVZ2TrCWDtmTkSjvqBA49hM+rd
         NGxw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788257012; x=1788861812; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=bmZDR4ZqqsB4rIh7Kzatyaogr6ocdpUcdSx+7fuMEz4=;
        b=m2rRfVrQUF+pl/kSam6VyJuJMlKFCpKV113UKvrgRdbCvB+LA8c1VZE60GMGuqVK0d
         Iynnc2jkGkjmV+FADIvZDGIfWpB1e2SqBZEG8A0/PyhgPZ7CUF7+rNci/JpNI/hH9xUX
         ItKTfLWTFEF3CZmK6D6Eb3GH1L2nz/f0j8MtgnYnwFlS9yOvj4Kfd4kDh+IDsJ9IQG9a
         iD4E76b+B1l0G2UyVgguZLJCQ5WwLFaMlhwHwhbBfdWXGKQrtiDudtCOIRET4udMU+Fz
         zIkZS8Vw9HuFOiDEgzzDYq3/UiIFvnq4clS3Yg8ljZgZBq3W4grGnoJZbsSpslzK4Yvg
         rPjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788257012; x=1788861812;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=bmZDR4ZqqsB4rIh7Kzatyaogr6ocdpUcdSx+7fuMEz4=;
        b=b6NXaQQ1WRsRhXA1PgWBtuSstlVawp+Jzbz1LwTcVX3zamZonrO92BmZue+eejb7Xm
         BQrB9IMPjTq5berBs8oeXZETznPRQZCv+3NMZ60nfpOl3/hsnf8FfzDW1DTpgeI6BSdi
         Rn8SMuG765ahO0ju966ZOqHWG35+j20mdIgTK0cFrZBAzu9WQ0jnsLMaxmheKSMyVb3o
         QIlapkh0XBuKZlVvLwGtyC+2ZQtAyG0RNJMGKQCBzeMfJFNYhjYr9rUjrnP1AGHO+szM
         Ya7LSqWCaLu7tWi44MbXK7y1WQ3AW8FacZnKcs1xLk92hskrK1qQ9pdGNiY15yh5QxgE
         1cHA==
X-Forwarded-Encrypted: i=1; AKwUvBzVBp3RAJuEzbCObRcroRcBlcD7ct07YNlzfgpeq/LKJhvYpACqRqmthLOl0nMrLeZfBCkWSpe9t1DD2Z4jHw==@vger.kernel.org
X-Gm-Message-State: AFuF++lVfqhaNQUn9zqRCAms04gLfUYU8HXVdu02gkJZjxiYu1Y0w3Hy
	V0ZbNbOd/baMppt6Pngemo0tsz8i9bz9BWEbM6p3WyAXy/R/4IZ3wl42I8gb5mrBBfkiarnc83C
	y+kes4jk3HDvuTjqa2bgjktw1vAc/qr8=
X-Gm-Gg: AR+sD12P4dZxBKeWYDOwqwO8fNJ9W4u0OL5bLt5TnMNl/DGeCIPKC9lJIHQQ5la+5bb
	8PLqW/450SPOji+w5G10VtXNuDP2GHzMOjarBsE+kAbNdU2usZQXKxNjurOt0jHmukSyNMzxefS
	NHzek7DKiY0QT/h5OQjgVH+ileCijOjirFvKr5y6ZLkm/dC7z0hv4Nq3TPAjpvWlmvtdNCLbNnK
	F5Nt5avtNORZZECYbMiE4v/Tr6fdvw/1ijaDPHw0ODYjOPGtDSsLVNpBEB7ZiA28niML58raudM
	gVcVqYskYL5lOTAWaNBg51ubMbypV0YhyCDlnZKUf+ZEHdeDawj4DeH9nBDlA7/QTmDLSLu+kkg
	0Tyyp4TX5VusItrbpSBtZki/RBWR9CR17gmhQRnaJMWKEHXkbAd7veWWRxKrk
X-Received: by 2002:a17:902:d2c7:b0:2c9:ed4a:c3a4 with SMTP id
 d9443c01a7336-2d74ce38075mr274123155ad.0.1788257012245; Tue, 01 Sep 2026
 03:03:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260831151605.638172-2-manuelebnerli@mailbox.org>
In-Reply-To: <20260831151605.638172-2-manuelebnerli@mailbox.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 12:03:18 +0200
X-Gm-Features: AcwNN1VbNKqeV_yey9Jhr55AwO_DusZQ-wcQLGmrDCepzJ3Tk4JUYrXX-Z1lHAo
Message-ID: <CANiq72m0xHD1YTADnmQ-fqMPSNHrMGwfPBbT7V4crBgu7B_ecg@mail.gmail.com>
Subject: Re: [PATCH 0/4 v2] Docs: changes.rst: rework
To: Manuel Ebner <manuelebnerli@mailbox.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Federico Vaga <federico.vaga@vaga.pv.it>, Akira Yokosawa <akiyks@gmail.com>, 
	Daniel Pereira <danielmaraboo@gmail.com>, Carlos Bilbao <carlos.bilbao@kernel.org>, 
	Avadhut Naik <avadhut.naik@amd.com>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Hu Haowen <2023002089@link.tyut.edu.cn>, Alexei Starovoitov <ast@kernel.org>, 
	Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andrii@kernel.org>, 
	Eduard Zingerman <eddyz87@gmail.com>, Kumar Kartikeya Dwivedi <memxor@gmail.com>, 
	Martin KaFai Lau <martin.lau@linux.dev>, Song Liu <song@kernel.org>, 
	Yonghong Song <yonghong.song@linux.dev>, Jiri Olsa <jolsa@kernel.org>, 
	Emil Tsalapatis <emil@etsalapatis.com>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 31, 2026 at 5:17=E2=80=AFPM Manuel Ebner <manuelebnerli@mailbox=
.org> wrote:
>
> ->[v2]
> Ditch the name change [PATCH 1/5 v1]
> Add Acked-by: Randy Dunlap to [PATCH 1/4 v2], [PATCH 2/4 v2]
> Add genisoimage, mtools and syslinux to list [PATCH 2/4 v2]
> Ditch footnotes in favor of a column [PATCH 4/4 v2]
>
> [v1]
>  https://lore.kernel.org/all/20260812120805.1631430-3-manuelebnerli@mailb=
ox.org/

In my usual go-through-the-ML exercise, I noticed that the subjects of
these emails look a bit strange: one is missing the version, the
version is at the end, and they seem to be out of order:

  https://lore.kernel.org/all/20260831151605.638172-2-manuelebnerli@mailbox=
.org/

I would suggest using `-vN` in `git-format-patch` or `b4` to handle
this instead.

In addition, if the changes on a given version are local to each
patch, you may add them per patch instead, after the `---` line, if
that makes it easier to track.

I hope that helps.

Cheers,
Miguel
