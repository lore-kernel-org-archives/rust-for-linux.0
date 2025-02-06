Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5668217579
	for <rust-for-linux@vger.kernel.org>; Thu,  6 Feb 2025 13:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738846870; cv=none; b=YEBDS0oK4W0UsU5bSPNK6HbwdljPntGidog1E7iCn93Eg9mdJ9cSAIAR4zNnIeD41oq6STcYr2goGF+vZpgL9tMZYGQbE34vxr2OB2HIDkzcgdw60Gn1vJ8R2moCQub/B8LAgnoWGb2rWhmwuKdG1o7LEtBZR5Q9GWl7hkEJnS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738846870; c=relaxed/simple;
	bh=A37QCqOjWyCYz3CY8P0wTUCh2X6BkhARMT75Rvwxcis=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HZMYNFCM9HfnEpw83gXxPzDJBzwRjw7VF+BeGrJSkauu8kdEdIdOXZIJTTdZVq6lCYklwFYXHK+xgC8Hj3+8QNpjEVMEfE8XC+14l6MnH09YXVR6LGYlovkGR+lRBFwnBU9+QhT0r4fAsG0JyB79RwJ9g41dBxswdRox3Jeu3x8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JpTcXaA7; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JpTcXaA7"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2fa122f62b5so82068a91.3
        for <rust-for-linux@vger.kernel.org>; Thu, 06 Feb 2025 05:01:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1738846868; x=1739451668; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vUapwriKzoOz8nXgyiqbgu1mn0kbUMUv8vQ64UIwZJs=;
        b=JpTcXaA7Z3GO/3/3IZvzTWYO/JtHi//dFdwkRoQKXHfL7iy/knAEhpglPYwht6vTB7
         rHTv+cFnW6y2M0b9VO5HH/MmbrjakQM2+aAESWvOeofw+5ux1MENE///a9eZRAC5p6V+
         v50g2aycx3f+wqmXJ+D4287k+f26wQRf7BEMPXs6GCAGRaU9WV7wKSg+zjlFp1mR/EWp
         muzzgjMlG7tdxSatekUDKQqWd6LGeG3ys7R8aI1dq3+cOJTvf3ytRmifrBZakx063fcO
         D/ZJb1IGdFA77s+DYMHLRvcRuhPwBDnf4fMNSXZMCWvXojbmn6iOBJH14G/obNatqwCx
         plMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738846868; x=1739451668;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vUapwriKzoOz8nXgyiqbgu1mn0kbUMUv8vQ64UIwZJs=;
        b=rdsMKYjWc/Z5vgwvdNeLHalvx6ne1z6Cp7QMHGvKWYq5b+eIn+gTB08hAZqmSIlIIR
         LSUO2PRqUqZaQaQaocCxSCxRZFj3Nx2pvI6ssdpE9//GVhJbjN1RtN0viZ4L6Yh0bsgt
         MK6WtBmX1gio0RPzoqIo+nvdXzeDKWOIpfD4soT2Qw+Ge1/CT53gZFxCGAHJhKI7hBRv
         CwiVzg4lRVX4UqoKSqrQDNgJwrTvQXoV9XVsgb11RtlGf2ybzKWWjuFBs3MgRuUkzxAb
         bNLh7n+ss1HcH35tmbzz07+ILsXDBlP5aL0r655jf1UPo+rdPHm1ca5YSz+Aiipwnc1h
         mWxg==
X-Gm-Message-State: AOJu0Yw4lWWjyw5Wwq2vYEk9nozlo2pKAeXNwgK+iIDZyc1LBg0Gw642
	XtF8Lj58U05ltl90Ca8QzCZD5P8srgVZBvWiwfw6868jlLGsm0ZRiaswWDk0MhJ50Z2WoF8whcO
	Crz0napqZv+50iAVWzhdavUnkCFg=
X-Gm-Gg: ASbGncuhT78TD0Dn5WdwC/gmTh6w84egEdz0UBWsDytLHqwr2vc8ZLioz7yOluMmLoE
	yVN+VV6g92EGLHXK8+qvW4mFbe1Lhz/aWUI5rkHF+ccZQ+w+Pyw29omlJO1qBDRjKk7ffkQfo
X-Google-Smtp-Source: AGHT+IE+G3SQarShlFxbQ+GYILFYSBeMtxZsrGRnxa1T12ZIS9wGbbdH3W2Q4K0TTwSSrBC0NkhWfI/PTyvPqj38iio=
X-Received: by 2002:a17:90b:380d:b0:2ee:d9f2:2acd with SMTP id
 98e67ed59e1d1-2f9e085a504mr4413706a91.6.1738846868331; Thu, 06 Feb 2025
 05:01:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250206123238.201415-1-kurti@invicto.ai>
In-Reply-To: <20250206123238.201415-1-kurti@invicto.ai>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 6 Feb 2025 14:00:54 +0100
X-Gm-Features: AWEUYZlLYeXiVNOJBadA9TPKongnJgbquXzY94cpmB-mTwKcZZYC471oLJDNdVw
Message-ID: <CANiq72=oqfrWfM6qgET92iohVpoHKDdjhGDGcRgXkuY43+6Eyw@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] rust: printing macros: add missing newlines
To: Alban Kurti <kurti@invicto.ai>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Feb 6, 2025 at 1:41=E2=80=AFPM Alban Kurti <kurti@invicto.ai> wrote=
:
>
> Fixes calls to pr_*! to include \n

Ideally you would also mention the "why" too (i.e. not just the
"what"), e.g. explain that the `pr_*` macros are supposed to be called
with a newline at the end, just like in the C side.

Moreover, a quick question: did you check the `dev_*!` calls too like
the issue requested? If yes, please mention it (i.e. you found none);
otherwise, please fix those too if possible.

Finally, the title should probably be: "rust: treewide: add missing
newlines to printing calls" or similar. However, since these are
fixes, it may be best to split the changes into several commits with
the proper `Fixes:` tags, so that the stable kernel team can backport
the fix to the right releases automatically. This can be a fair amount
of work, though, since it requires creating a patch series rather than
a single patch and finding the original commit hash that introduced
the issue, but it is a great way to learn the kernel workflow since it
is a simple change otherwise. Splitting also allows you Cc other
potential relevant maintainers on each patch (please see below for
other tips that could help with this).

> Reported-by: ojeda <ojeda@kernel.org>

Please try to use the usual signature people typically use in other
commits (I recommend checking `MAINTAINERS`, or otherwise the Git
mailmap or other commits in the repository).

>  --cc                            |  0

> diff --git a/--cc b/--cc
> new file mode 100644
> index 000000000000..e69de29bb2d1

Something strange happened here... :)

A few more tips:

  - Please To/Cc the rest of the maintainers and reviewers of at least
the Rust subsystem (e.g. for the workqueue file, you will likely want
to Cc the people in the "WORKQUEUE" entry in the `MAINTAINERS` file),
e.g. please see `scripts/get_maintainer.pl` and/or
https://rust-for-linux.com/contributing#submitting-patches.

  - I would suggest using `--base` in `git format-patch` -- it
provides useful information later on to those that want to apply the
patch.

  - If you are not using `b4`, I would recommend taking a look at it
-- it can help: https://b4.docs.kernel.org

The changes themselves seem OK otherwise.

Thanks!

Cheers,
Miguel
