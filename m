Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 548292F361B
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Jun 2026 07:31:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781249465; cv=pass; b=uuAp+mJC+X1CP6qt4358h3Fkz7YNtoLso6m6TcGT6jbHObxjszJfDYxuWQGKbM4G5CNfGtzfUP5mLSNo+n03e0LaowvTEjpZ7VubbW7u4lSms45pL2dKZc+9NVSYnFe99Ni+zstccxMaIjN3qf6BK4R5AOYGzysrkgItB8DioAs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781249465; c=relaxed/simple;
	bh=TJhwC0TjtETgO7UDDcPQsbkdSGcQTc0ybmTI+jD//dA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rtQt7ShCP8c2bv9Fir7bbHzo5I+sUcUk5pKMVxbZt6a0aMbawjQLlshV8TVJAKsWabU5fAk8sGUhSrIOwm1ZlORw7SrpD6e9Mj29VAlWirSvMwS73h0AlRiYhB7V2a30JUVl/rV+pDdw3gKveCg4DNoP/3MVeWu/sKF9rMWphEY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=L58aOBc1; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="L58aOBc1"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-68bfcf11050so1199539a12.0
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Jun 2026 00:31:03 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781249462; cv=none;
        d=google.com; s=arc-20240605;
        b=iqGlHt/uXBDxFCijVjF4a7ecqeJbvgYtuoOCF75NP1F3gZN0bR3rF9NsoWrkgF6PyK
         LOYI959ZsfyxdFmNds2ENVB0khIwIsumoeWPYrJ85FuzMrZ6udogk7+y0ItyETJHSjQy
         5Pr/agn0pUgayIkfH9uZ2o6IEijo6zDL/OtA3FHWYXhiEmjc7hX0915xTjg2xOb0k39z
         5nDqUpXswWCg5duY8NnzQl1Ib4NIq8gGaSokJGoE96NvLVIMuIifj/sPt9oedE5gaWEx
         jBJsVHXnCYWRqqQaJZKd+1uXllqf5+fkzR2TuwU1fD1x86qKy+cl5WIsUcOtIxZAIiOl
         27AQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=SbYOYDefhLvBGJQzilDjssSWO2zIKceTdBiGnToKxU0=;
        fh=kz0VeQ3ZqvablTxCe2PvDL2x2X0i3GlgFDnZL/rP/Eo=;
        b=BVbHy6XRNNptcl+u58SiOKbf0yqjrL7weU6xs/X7PVTUMxY890r13F9q6WOfRD4sk+
         nucPfMdoKzj3U8wLYSDD/k74aAYfe0omnJ2qxjr+v8pqBC8ZZc8ddUVDXkXmSLuxLsz0
         i/rpUKNpbdE52U1okNrcrk0liD6nHguTOucBJifMKci/XUzRwS7+PDwEKMmZRUxzhweq
         aTiAEcvYBg0O5j+mYlE6tvtO3X6r8vX3DcUOpAoMZixj2lnP6tu03D5BBJ8sURdEfarf
         rlbtxboqXY900s/lImilTmX3fS9sXrlBw7i2h46VqNJr+fA93bT1H+qY/56m2Xxc63yQ
         Pnqg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781249462; x=1781854262; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SbYOYDefhLvBGJQzilDjssSWO2zIKceTdBiGnToKxU0=;
        b=L58aOBc1t+GGEQcW9ZUCClwQvWRVSfh0l0dwUX8RnHUPdAiHfoAgoY/hLcJF5PqmDz
         wD8Dm+3RibTWmuGetriZAkwjyoP2m+Q4jWl7sqx5+R0KFi0niCRZuAdEfb7uJHjaLBIs
         buBnyvjXmSXIzid5o7u60MGJ5+6TJrjvLQfTIaiUjxT7msImLvAEluy5rwmU3flVIOmT
         6gWjbSPp4E9eYP8MuxGF+1HB8FU2Rwrdd5LhA+49UXBs0si3uKubqA6+S+ONUEfSN359
         OEJcXHBCDuoFF8wcGR8XNKobiWWA3Bo0w18RacL+2ijuRLf/mOQ6KqaZNYaAj0u6AMh5
         5/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781249462; x=1781854262;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=SbYOYDefhLvBGJQzilDjssSWO2zIKceTdBiGnToKxU0=;
        b=BZqFEO3XTf97S9sffx5t9zas5VCUQxfjAOd1uCaHfnw8Ow7+wW4tWo9s6e88a8aTRj
         2Biisx3LzRGS3akv3V35IMdJWgJf1BRyPUt8zxj90PUE6Da9/OTLim8rlFDHqIP7ogwN
         TJzpBL5mPInc28loJnEg2EE0BW8eLew8kNEeP/+hQsQg5xGZpSTS6jkTYSJOn8cZR2UJ
         c7h7cqfnsAihII2EmVd2y0kXaInTq/IWDoz+X5OZq6Gzttsuy3RnJbmCjGyoeoalWUnJ
         6iqfj7n3u5C7s16WhuEnywMI0B6WGQ1FJKqvlNAlxRPDSgUoVLXsxrG2zkEwRT+F9L7h
         dTBA==
X-Forwarded-Encrypted: i=1; AFNElJ+GoknmFMma5Z0y3j+7gkKE3aegSch/B41MmguMkYnrAjuaQAK+oWWSdCLk7qq3U4WNZHofWuD0rAiSQoriHA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwTW8cnuVNqV9ZASsgcr81n/+FE2Nugn5a2nrLobvtQbNo2uoGd
	IrmnXKTQJLyEIENp3xAoKnM4lUwlwBkkMVyND4JSc1oGp6xt6uwzLMjHz823f7aDZfbxklGi1QF
	xHBT/OKRddt6omh296wVhHIjmPBo7uV2BXar9GWdf
X-Gm-Gg: Acq92OFsIWM9nSqkgeNlrDP/yIe0ZhLsFLt3+KwWL3WVbkUO0JrD6S3nCZl4djfFrHn
	YJvgxwa3M4va9uahLAecDpI6LvmnL6U/OAOWIp+EXUG0qjppFAb9exKAaJoIF4WgmlsOUsVGI59
	vcWZtIU5HgtjMtEbxga0BJ6eTE9zwUK7Kx5W+3ablHNQEC1eM8/Krszgu11Rlr5Q0KvSOZyTs1g
	UeezUb5/EEPwExXG7rUgGsISDmFfLODvzbDIEalJ7P22IpB/GUEXrQS/2920ArcTnA4kI5XqTKb
	ezuxdYUCiBPdKkwEVFaUEnN8G6GAhRPB27E+bg==
X-Received: by 2002:a05:6402:360e:b0:691:ad29:ea33 with SMTP id
 4fb4d7f45d1cf-693779d1edfmr692502a12.12.1781249461160; Fri, 12 Jun 2026
 00:31:01 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech> <20260611-b4-kcov-dataflow-v2-v2-3-0a261da3987c@est.tech>
In-Reply-To: <20260611-b4-kcov-dataflow-v2-v2-3-0a261da3987c@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 09:30:22 +0200
X-Gm-Features: AVVi8CevQ1ha7IS1m5wrojNeqF7AokFDz6V9vLKSYwmszS5cFjeqHBoSGHAAq9c
Message-ID: <CAG_fn=XRzSuFrxtFbz2t9jjY8HPUUhhnU3iWJiSV-X4+hg66cw@mail.gmail.com>
Subject: Re: [RFC PATCH v2 03/14] kcov: add barriers to recursion guard in kcov_df_write
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Andrey Konovalov <andreyknvl@gmail.com>, Dmitry Vyukov <dvyukov@google.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Kees Cook <kees@kernel.org>, 
	David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Shuah Khan <shuah@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, linux-kernel@vger.kernel.org, 
	kasan-dev@googlegroups.com, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, llvm@lists.linux.dev, linux-mm@kvack.org, 
	linux-kselftest@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> The recursion guard (bit-31 of kcov_df_seq) prevents reentry when
> copy_from_kernel_nofault() or other called functions are instrumented
> with INSTRUMENT_ALL. Without compiler barriers, the guard set/clear
> can be reordered relative to the function body, making the protection
> ineffective under optimization.
>
> Add barrier() after setting the guard and before clearing it, ensuring
> the compiler does not move instrumented operations outside the guarded
> region.
>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> ---
>  kernel/kcov_dataflow.c | 2 ++

Please merge this patch into the one introducing kcov_dataflow.c


>  1 file changed, 2 insertions(+)
>
> diff --git a/kernel/kcov_dataflow.c b/kernel/kcov_dataflow.c
> index df7e8bf70bfa..5248293280d5 100644
> --- a/kernel/kcov_dataflow.c
> +++ b/kernel/kcov_dataflow.c
> @@ -86,6 +86,7 @@ kcov_df_write(u64 type_marker, u64 pc, u64 meta, void *=
ptr,
>         if (t->kcov_df_seq & (1U << 31))
>                 return;
>         t->kcov_df_seq |=3D (1U << 31);
> +       barrier();

Please make sure barriers have comments explaining which barriers they
pair with (see kernel/kcov.c)
