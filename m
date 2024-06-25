Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 856C6178371
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Jun 2024 18:14:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1719339295; cv=none; b=kzJn7YIPRZN7PNDsakm5bNYW78v5duVvH7pqCDYGySBb6iCkHDBmUjKuZXX2rohP3XLf/vTjpMYqiVZz+jc6FgsiCY1LN3fXblO0K+Ni8IWbZLE4zuDX3AjpR+HMLGhL8ajjvz/V2MMGSGEO9D/f7/9ndi/ozJ2P8YvpX4z53wA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1719339295; c=relaxed/simple;
	bh=cdQG2QH6nCCll3rEP3ihKpXMBl8SgxnP/VREmcfD5Ao=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CU/n9ULcAQ//0ICVtsAy2IdnyvjqSy3E5/RW23bBQ+TmOH6zqewI7VgbviwFE+e/mWkxO960nv00nX9ZiKWFCsJNW3h3qLtVXDqAH6K97kGJIFrQFw66KHTrnCLW7A9IChe/CT2sDs1/HfeW0BYm3obMTRv4gdcHVFyd9zOjdsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ilfeOTiW; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ilfeOTiW"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-1f70ec6ff8bso22295ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Jun 2024 11:14:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1719339294; x=1719944094; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pHQujU8w2HsPdHSeJ+eNtyrJA2jnQulGAF+h4XWMpkg=;
        b=ilfeOTiWWiDCkMojlYgXzyqB+pgSXFWG0HocVT5g04vZ4yrJq0EA5qjbmKSEKSnu+q
         5s359fkGoLtsanHQSSR5jp5chQv3/LGsFN3Ek3u9+NlvN8IfYtvdMfiYQwaZToZ5sLs0
         2LUNchm10K1JoitnEcmKkK1mDo22zJE3VsM+sl+DeI1jxT2xD6fJoyT7/6bgGNCKyrzy
         rrp3RimpRH+scvHiNkGoYGZbUHo9tz7cx7O8xcUpMecsT39cAQXHPnKz9isg0Utt4xye
         8PS+K/h5H10mwg+Zk5+LhUZvJ81KI3HfRU4H3dVg4dNWcAtkaAUlnedLWxM/6HLvYFLt
         kNKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1719339294; x=1719944094;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pHQujU8w2HsPdHSeJ+eNtyrJA2jnQulGAF+h4XWMpkg=;
        b=S3GIugcbOxchVJFtbRGae7yUyAJNSjHTf+rWoo8Sd/hB4Qi2I9ruHupKfJofIqhDSK
         5KmzWokORQX2ka8NW6GjwM847/QA5UmvF3ZnjqpjssgQsa1ovBbB4IH+CJhjt5neRNfZ
         G2JMH3FtUkgWIPXtf8/MIl/um6itZBXAt/HEswWwo9hq9jU+Ehvj+rgSGk5aIpvTJbH9
         JdhlUrsEvKBXnhvbSGc8Lg66HLnzHHQIQbcczTc9xN5jwCBePens4HiCPV2OAI+ad0I3
         1US2MtWD6YADae/m/WjbJa8G9ELaqDDNuhSK1STvQIDJHDmPFiNo0HMjrYKepN0iCpwI
         jNNg==
X-Forwarded-Encrypted: i=1; AJvYcCWvoh0rYAi3hUd4kcAxR12y9CLavfPSIGLn1ljdcHDOycdZfb6qwlu79dFiQrQjZnPLwNNmEsdFdAUQNYn1DSVfjwhPWyJ5hB8OTktJVzw=
X-Gm-Message-State: AOJu0YySoL9GePJWHK7SRFc5y3dYrFYuMiSrzojCLVTOvNSlk3FFW44Y
	scovUB+C9p9CaRsfAkpkWd0rPaj8g0Uli/H9Q/iQ9vtH77PqDH/CjAIqzwS/pyrv0ubu+mVML/J
	nnov9z5/JtKxMeF9sI9OiwTsOAVh7TlacLyme
X-Google-Smtp-Source: AGHT+IHUWVP8jMWtzNNtwGhAuozDrDLNiGYVxTa6bvSAKS2s/Xp4TEwNkFy5eyfDDb3O7LxCBZEQyj5jnib9lTc8oa8=
X-Received: by 2002:a17:903:603:b0:1f7:3764:1e19 with SMTP id
 d9443c01a7336-1fa8886e8d6mr213265ad.20.1719339293473; Tue, 25 Jun 2024
 11:14:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240613233122.3564730-1-irogers@google.com> <20240613233122.3564730-8-irogers@google.com>
 <Znnyi2IPC79jMd9y@google.com> <1fdf637d-3571-4145-8008-f2b5f8fc8bca@arm.com> <CAM9d7cjy8+Ys-Y_35V7O=KGQL0v3+B9z6hhytmAiKKN9pO9yow@mail.gmail.com>
In-Reply-To: <CAM9d7cjy8+Ys-Y_35V7O=KGQL0v3+B9z6hhytmAiKKN9pO9yow@mail.gmail.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 25 Jun 2024 11:14:42 -0700
Message-ID: <CAP-5=fXKLxo9VufpsvjNJ-Z+oA+6k7zYOz6qH69xSAiRA2K8zg@mail.gmail.com>
Subject: Re: [PATCH v3 7/8] perf python: Switch module to linking libraries
 from building source
To: Namhyung Kim <namhyung@kernel.org>
Cc: James Clark <james.clark@arm.com>, Peter Zijlstra <peterz@infradead.org>, 
	Ingo Molnar <mingo@redhat.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Adrian Hunter <adrian.hunter@intel.com>, Kan Liang <kan.liang@linux.intel.com>, 
	John Garry <john.g.garry@oracle.com>, Will Deacon <will@kernel.org>, 
	Mike Leach <mike.leach@linaro.org>, Leo Yan <leo.yan@linux.dev>, Guo Ren <guoren@kernel.org>, 
	Paul Walmsley <paul.walmsley@sifive.com>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Suzuki K Poulose <suzuki.poulose@arm.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Jonathan Cameron <jonathan.cameron@huawei.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, Nick Terrell <terrelln@fb.com>, 
	Ravi Bangoria <ravi.bangoria@amd.com>, Kees Cook <keescook@chromium.org>, 
	Andrei Vagin <avagin@google.com>, Athira Jajeev <atrajeev@linux.vnet.ibm.com>, 
	Oliver Upton <oliver.upton@linux.dev>, Ze Gao <zegao2021@gmail.com>, 
	linux-kernel@vger.kernel.org, linux-perf-users@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-csky@vger.kernel.org, 
	linux-riscv@lists.infradead.org, coresight@lists.linaro.org, 
	rust-for-linux@vger.kernel.org, bpf@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 25, 2024 at 10:48=E2=80=AFAM Namhyung Kim <namhyung@kernel.org>=
 wrote:
>
> Hello,
>
> On Tue, Jun 25, 2024 at 5:24=E2=80=AFAM James Clark <james.clark@arm.com>=
 wrote:
> >
> >
> >
> > On 24/06/2024 23:26, Namhyung Kim wrote:
> > > On Thu, Jun 13, 2024 at 04:31:21PM -0700, Ian Rogers wrote:
> > >> setup.py was building most perf sources causing setup.py to mimic th=
e
> > >> Makefile logic as well as flex/bison code to be stubbed out, due to
> > >> complexity building. By using libraries fewer functions are stubbed
> > >> out, the build is faster and the Makefile logic is reused which shou=
ld
> > >> simplify updating. The libraries are passed through LDFLAGS to avoid
> > >> complexity in python.
> > >>
> > >> Force the -fPIC flag for libbpf.a to ensure it is suitable for linki=
ng
> > >> into the perf python module.
> > >>
> > >> Signed-off-by: Ian Rogers <irogers@google.com>
> > >> Reviewed-by: James Clark <james.clark@arm.com>
> > >> ---
> > >>  tools/perf/Makefile.config |   5 +
> > >>  tools/perf/Makefile.perf   |   6 +-
> > >>  tools/perf/util/python.c   | 271 ++++++++++++++--------------------=
---
> > >>  tools/perf/util/setup.py   |  33 +----
> > >>  4 files changed, 110 insertions(+), 205 deletions(-)
> > >>
> > >> diff --git a/tools/perf/Makefile.config b/tools/perf/Makefile.config
> > >> index 7f1e016a9253..639be696f597 100644
> > >> --- a/tools/perf/Makefile.config
> > >> +++ b/tools/perf/Makefile.config
> > >> @@ -910,6 +910,11 @@ else
> > >>           endif
> > >>           CFLAGS +=3D -DHAVE_LIBPYTHON_SUPPORT
> > >>           $(call detected,CONFIG_LIBPYTHON)
> > >> +     ifeq ($(filter -fPIC,$(CFLAGS)),)
> > >
> > > Nitpick: mixed TAB and SPACEs.

Will fix it in v2.

> > >
> > >
> > >> +           # Building a shared library requires position independen=
t code.
> > >> +           CFLAGS +=3D -fPIC
> > >> +           CXXFLAGS +=3D -fPIC
> > >> +         endif
> > >
> > >
> > > I'm curious if it's ok for static libraries too..
> > >
> > > Thanks,
> > > Namhyung
> > >
> >
> > I think I tested the whole set with a static build so it should be ok.
>
> Ok, thanks for checking that!

Even with a static build it is often the case that the executable is
position independent (-fPIE, and related compiler options) and so
would need this too.

Thanks,
Ian

> Namhyung
