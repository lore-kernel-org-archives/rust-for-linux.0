Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="itpPefj9"
Received: from mail-yw1-x112d.google.com (mail-yw1-x112d.google.com [IPv6:2607:f8b0:4864:20::112d])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EFDD10EB
	for <rust-for-linux@vger.kernel.org>; Fri,  8 Dec 2023 04:43:18 -0800 (PST)
Received: by mail-yw1-x112d.google.com with SMTP id 00721157ae682-5d3efc071e2so18383007b3.0
        for <rust-for-linux@vger.kernel.org>; Fri, 08 Dec 2023 04:43:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702039397; x=1702644197; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ICgEHjlPDRJymuRHU2Wg3L/DUWzbmmYjl8+63qcjjFE=;
        b=itpPefj9DABUs7+IrNCA/q/RjRvMkqP3zGTJKnD1XPZ6Ort5VB116iv0Huc+QxprT2
         a+jA9pue+XR6IIcjn6DrETyFSDSVefTQdsS/yEAZhJRFkdQxpzuPBKed0d2LZaTwrNDt
         FO2vN1VxpisPNN4m+BSBYYAx0ocXHNFgUF0ckXMYCIqBi/v7lyGML+URiy93YsMB4E8w
         FnXJew2k3sNigZTWf2mCSQu1VS2kuAWkIQf46lLihTC/juSwoynVGxyvDdg5PXbJgxcW
         C4Z3sWxg3TOPRAnEr0vMbhlqsE0XWBcz8hKPdBC0sJoU/WnBwqSJPUKqaWUuzWgoaUux
         8BsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702039397; x=1702644197;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ICgEHjlPDRJymuRHU2Wg3L/DUWzbmmYjl8+63qcjjFE=;
        b=sFU8a2iC0CDDGMt1waItxfOQsDCSgscNs7LgoeduBAYOIU09CFnoGkL88KVHgyEwNn
         U4xwkYP9hAyQD4dJGsz7Epvp4bRjjVFI/4/D+8f9YRE6z3C4yfotNbsO3nyLdSex26BS
         4f1SYkk8r/ODIfJBRYpQQcHlv37cF0bSo87U4qd3tgNj2r50UPC4I7RrSOsCpGZH0nyS
         hzsUp+SVdu7A1GZycY5+UGih1y4ac5r6xxoVCzD70T37wWQKApLlvFiDbqCELnrKB2Nb
         3bYa8dzGFzCK0ZkULfog27cvc2NaXpj+UCZinwVgwRWR7eM2Cs8FlYyPrILAEtb/UHLl
         4dlQ==
X-Gm-Message-State: AOJu0YxZKvy9C5vjqcyo4//IT5BcSWCdhALeqWQYBwHK67UUyN8aUbP5
	7WuEkcOFnIHOyJra3oyRhnQJp850AZh2mup+5GTWo6sg6sgDeA==
X-Google-Smtp-Source: AGHT+IGvtHabjaVHE0uD06b65MUZbhAXZd+gj8JxyPFWSZ/e5uRaNpTn7UkbeEzQ8y+KSEji+l8upbvWVDPJEI61Tio=
X-Received: by 2002:a0d:cc51:0:b0:5cc:dcf:47a4 with SMTP id
 o78-20020a0dcc51000000b005cc0dcf47a4mr4231633ywd.40.1702039397527; Fri, 08
 Dec 2023 04:43:17 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231208071455.2584037-1-dirk.behme@de.bosch.com>
In-Reply-To: <20231208071455.2584037-1-dirk.behme@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 8 Dec 2023 13:43:06 +0100
Message-ID: <CANiq72nNtWJq-bMLS0MoD-iMDDyOvFoAny6Z1e0hFppA+UQ4vw@mail.gmail.com>
Subject: Re: [PATCH v2] docs: rust: Add rusttest info
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 8:15=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.com>=
 wrote:
>
> +To run the Rust tests, you can use the following make target::
> +
> +       make LLVM=3D1 rusttest
> +
> +This requires the kernel .config and downloads external repos.
> +
> +The tests can be run via kunit, too::
> +
> +       ./tools/testing/kunit/kunit.py run --make_options LLVM=3D1 --arch=
 x86_64 --kconfig_add CONFIG_RUST=3Dy

The commands do something very different and run sets of tests: the
former are `#[test]` tests that run on the host (currently) and thus
fairly limited in what they can test; the latter are tests that come
from the examples in our Rust documentation and get transformed into
KUnit tests.

I would recommend testing the commands and playing with them to see
what each do and how they look like.

It would also be nice to give some more context about the commands and
what they do, rather than just writing the commands; and to link the
KUnit docs on how to run them (please see my comment on v1).

Thanks for the patch!

Cheers,
Miguel
