Received: from mail-yb1-f171.google.com (mail-yb1-f171.google.com [209.85.219.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E6DF2D78C
	for <rust-for-linux@vger.kernel.org>; Fri, 15 Dec 2023 12:53:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="N7NGX6md"
Received: by mail-yb1-f171.google.com with SMTP id 3f1490d57ef6-db537948ea0so511851276.2
        for <rust-for-linux@vger.kernel.org>; Fri, 15 Dec 2023 04:53:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702644788; x=1703249588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Ob1Sfbc7+iVuSpj7FjgZo9EXUvsUW9Gzl+T15xBtEE=;
        b=N7NGX6mdF2ASdYAipJ7L1ZQXnTbGRrf5w+RjuwKnXJlnYupysN/EVxKFxO6Xe1Ukjl
         XY71fdMV51SdzHFKkUVkejW2J8qWCi8dyzwV4abSpm8pTzDlMwIK4mW4huRp8lGobjuc
         S/2fQvidYgZkmcouOQ5FM7fXOaMqJuxldjEsYYUD7Tx4pf+RFV6gvInXq83FvuGguZ41
         KXiRUoBgNk8i6M2QN/ECgMox9h5HuOUC7uApylX7rYmvKHeCbo75aLxOIdHxiD0ivamZ
         zBDqt0Jdz8rMlO7I5qw9Yueopvvk2dEZfpEKN6HVNq75s3rK71MTd6ffe7Soa1KP6HN9
         NgBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702644788; x=1703249588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=6Ob1Sfbc7+iVuSpj7FjgZo9EXUvsUW9Gzl+T15xBtEE=;
        b=nwYZelylzmNQeqH8WmckyhL9CsIPQufTd//UC+RP/OBsjTwGgEUVldVgI/+SReNbQK
         LSoR24oygBYRV+f6IfKYxd50GutzIQ4KBrO8sEpdkIi/GqF16TK78AHo1zTSCl/dlvH/
         s1GLgyyGOAA1xjLknIkCGuJFRlmbvqPI5Vu/aadXTOPsRsBvopDyV5j1Dn7NtlQGnvN3
         896P62R9bvasNz11y9Gw4UbW0yWMmexX8WVM2UWTJv3fsfn2yqxKQ7ZVhV2Opd/M7tWF
         3jFOgDsncgQKa3/VmTbnh6ZF3k00mcbstIAWdDL6CnbtK2Oj8cZgymY6ciOnf1V4gd4J
         By6w==
X-Gm-Message-State: AOJu0YxXqjY4BNACQoLiW/hrjFiRo82U/GWC1DIvMmWYjDIplUDjKDOq
	jwHrVmQWHk9DHhumtNKEv4IUjhcR48FQmDAQbVo=
X-Google-Smtp-Source: AGHT+IF/nMJBPV1NDSSjPCZQFbvudKG8pj7n8+1Ld69C5ZBGKFKNfsiwcQjBPAXt36lnqnZoPIMB2jKbBdWhMcgucrU=
X-Received: by 2002:a25:b944:0:b0:d9a:5918:8f53 with SMTP id
 s4-20020a25b944000000b00d9a59188f53mr8492489ybm.56.1702644788556; Fri, 15 Dec
 2023 04:53:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211121613.3489513-1-dirk.behme@de.bosch.com>
 <df0d8a01-eac3-43b2-8498-e237a0fe6eb5@nvidia.com> <CANiq72n5OB0X9sHoNf-htRY9z93gzdg-BqdrOUDTqTEvUytoNA@mail.gmail.com>
 <6df6e8e5-8d5b-4d3d-91b5-bc0e90c424ea@nvidia.com> <CANiq72kQYS2Z-tRwaH6SJHM5RY8D=TSsdSgufD9YmX2GfDgPeg@mail.gmail.com>
In-Reply-To: <CANiq72kQYS2Z-tRwaH6SJHM5RY8D=TSsdSgufD9YmX2GfDgPeg@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 15 Dec 2023 13:52:57 +0100
Message-ID: <CANiq72ngxFLo1e5Zd6hq1U-GSujxxG6rGuLLKTW_hn6_0L_SQA@mail.gmail.com>
Subject: Re: [PATCH v3] docs: rust: Add rusttest info
To: John Hubbard <jhubbard@nvidia.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org, 
	Nathan Chancellor <nathan@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 15, 2023 at 11:43=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> Yeah, it is the "old way" for many architectures, but nowadays
> `LLVM=3D1` is the recommended way for most (in the last couple years a
> few architectures got promoted from `CC=3Dclang` to `LLVM=3D1`).
>
> Given that most arches are `LLVM=3D1` nowadays, including those that we
> currently support Rust for, and that perhaps by the time e.g. s390
> supports Rust it is also a `LLVM=3D1` architecture, we should probably
> just remove `CC=3Dclang` at this point and perhaps add an extra link to
> Documentation/kbuild/llvm.rst again just in case (the link is also
> elsewhere in that document, but I guess it does not hurt).
>
> I will send a patch.

Patch at https://lore.kernel.org/rust-for-linux/20231215124751.175191-1-oje=
da@kernel.org/

Hope that helps! (and, sorry, I should have Cc'd you in that one).

Cheers,
Miguel
