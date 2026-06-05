Received: from mail-yx1-f41.google.com (mail-yx1-f41.google.com [74.125.224.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4FC63B42D5
	for <rust-for-linux@vger.kernel.org>; Fri,  5 Jun 2026 16:21:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.224.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780676488; cv=pass; b=QbYe3eDoWyVcmunJMKn0z7Q+hMKFKdmtI5q5Rfbj3MSJzRQWcX/JcayVHKhO93EAPRwuZ04VCyMVIZswcyNo6XpyOE+uh97LxxEXbhqVzfu4lLhDfTOTNo3HmGI+Ctvqsys8CibSincS/oR28rEZX5xigfWW604OAyI2T0EI++4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780676488; c=relaxed/simple;
	bh=mWB1QjoCqaUp7xOYtL0VXwUOlRHPZS3Zm5pVWOTzZow=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XgTr9Ht8oJOraASsWeAXeaqWoeQbUGB1xqq8eRc7JRxxPNCmT8TTBSQGcK2h5A6+wTF11j/EWWungcfy+NA44ZPL2MCzjdOTRkphrnqjoTFgpno4WIQ5HeS3P7jt+CrBgzPxBGnQ7k3VV6xCa8+OndBvLmMBJb4AVprRciAjbVc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Ui8wUur8; arc=pass smtp.client-ip=74.125.224.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Ui8wUur8"
Received: by mail-yx1-f41.google.com with SMTP id 956f58d0204a3-6611689dc10so118914d50.1
        for <rust-for-linux@vger.kernel.org>; Fri, 05 Jun 2026 09:21:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780676486; cv=none;
        d=google.com; s=arc-20240605;
        b=SZ/IlGpGJkAmw8VqFHJyq+9DFCY/374HCcgBQLIK/zTcJz4fzCIKSSaeTzx1y2kCvd
         cWqMsgE2PH7EohD5gUFqvTiD8CBNVy1RKqAEdAAq1pUQlUUbubHEBF2Z9n0j7V+nMhEX
         6jJ3ytQWkp7CbEZ2EjD+xfEN0FWrR5p1YZ0lGNBXRDaE/rT7ybduQNvZxViC2rMJqHaG
         AarSxTlB8nOsdkLO+bl6PjfVJIkxrnS09Z2Ap9ZhbyttX2GDXqkTs9G1wmyZwPHgEE5E
         WRrgV/T9kw4s1klvPmKP2guXCQYTCZ01Cp/IxU6qV9En0G5haEmscv1xX3B6MtAruXjs
         poyg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mWB1QjoCqaUp7xOYtL0VXwUOlRHPZS3Zm5pVWOTzZow=;
        fh=LatNg7CmvFwQQEmX+CxhK7ZIvsAB7pCwn1MHl9YnNo4=;
        b=eixEt5QJ7xyuTeFLl2D6RsJdVvs8Yliw8ULqyxBAOhyJ8ry6MN5u7rCWS7rITiy1Eh
         O2eCkcnG6Cq5KihC0DVrIjX6oE6jB128JVtNIc9jFvKcY9pCvdqjt65EwiKWI1C1i6kS
         9jdIVLBjPEPf3XpeKwV8QIL6P3iUW08WOqRQ/tR2gO66SjVLvkfNcFoGRjcdwgjC2Po9
         ddj8U2fvz4PuOLB4OyiUpVsjhcopb6Z8Tc1/Fj30hoAvA1QIJld4llnEONYpTE32pPLc
         XMZYFZSlmgJ3bzyz2ymbHB0JvMKzbKEZ+jacLOlW4goByLqlT9gZGT/B83hiObnIyTm7
         jubA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1780676486; x=1781281286; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=mWB1QjoCqaUp7xOYtL0VXwUOlRHPZS3Zm5pVWOTzZow=;
        b=Ui8wUur8KSyN0pvynRn3skezHBd3sfh1W5TIjT4eVt8Ktiz8vrwisyKkScL5uRWs83
         GBDkw6QrKOQy7eVUQZoCJWF5kgJ9MUu2mbMLhq6GgQOCJWyTwgqUwp3kwBc1JF6hg0cY
         AVaO6PI9zVJGkoVY23ra2X+Pshx9zPmheAZP3Vgy5eNnT59Is8pWFvrufHHr7ADCbIan
         N1LnZ2808X83NOKNBnd2eL5qBX97ba92cAY2Qh3rEEM5SzBPlKMWOzrojBQau6ULIAiL
         fq+cXcJbuJiw+OekQSmQwaeYvzjLb5tD7/ywY9GJ8ni0M44MdhHBiNzPnzL2umckP+rC
         RWig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780676486; x=1781281286;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=mWB1QjoCqaUp7xOYtL0VXwUOlRHPZS3Zm5pVWOTzZow=;
        b=luB41UHAv6Sl8AgnPormS7dq0MdFw9Vsv2kdPt3mSVMJbcFooJwyV5Gysqoy2FbKAc
         pWpliq6pZyNLPjATgUqyieKxqSbJqqhbto8ii5o1EXfqWDm90CmD1214EPrBpdHzLpCn
         76q0eucL9btr2ar3vXJFCyGyx6MSxFX0MzhPB1YVmbMDY9M1dCrtv5En62x2SbuEpiD0
         YYBBoY+qFJwdPkKMPhnnDD01NJzSoO0ycDqSUDrvv2bq9pzAzvCZgLlnYFc52bAXoXLM
         TRk1focc6n6cBBp1rhSOe/Gu6se+9hKdnhkqKifnThDbMEj5gy4GWtLTLH/7QtWcSvyd
         IoDw==
X-Forwarded-Encrypted: i=1; AFNElJ/RrVdYtkJb7xH/A2B6YiEAQnaPE6eHd9LNx789/Dqx+49WD5geUxnXgdh/0gE7A9zNgwOxvrxK8PTvPmnSbQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YykGw7k6bnimeIOxyGfJ+UyGdjBrgmqEgyfOqeAMxMRB7U0nT7E
	yNiILuObgrTNz6vEKzNz0jaNSEc8Ww7tKfbiw/jRFSlUCJWgEq7yYzV4HUBDujH4yAk3F30GiY7
	grRBeG5HtCt9WbEZ1rkYxtQhhDju0gZSG0e5Hmvm9
X-Gm-Gg: Acq92OFCkDlfq0DqUF9OnlqwWVCqLYS4q60RFpgnXSkMq2c8B3eL9hQwcMAr2iwJ19V
	N7iRaWgdREOVb754/pArhPnIAi4rEcJPm7Aigh3vRjzQbOvqIjLYbYWhhjFZUuo4tlQ0HoexI3R
	9mf0cRWLlrEIFU3XGVW+rGN30boLsgOWXaCoR1RaUI0Z0LrcoO+N2TofJOoiA8qErr5d1vBtpTK
	VZ+SWH36zck06JsUeckHf4vV2z+C8e83/yEhqhlF93OLlk5YbspLHpMu1uon0M7heIjPIBouePP
	IhF2WH3dS+4cu8IGczQmqSotpmxpg2ZQ6a95MOxxifDBgK6wgDc=
X-Received: by 2002:a05:690e:1388:b0:660:877f:a5f5 with SMTP id
 956f58d0204a3-6610704f8f0mr3897550d50.43.1780676485426; Fri, 05 Jun 2026
 09:21:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
In-Reply-To: <20260603-kcov-dataflow-next-20260603-v2-0-fee0939de2c4@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 5 Jun 2026 18:20:43 +0200
X-Gm-Features: AVVi8Cev4P7AiBmPodWfwaPtX8_k3m47tFa_rHl6t21z7L5L4Qmm-6Ly0xXbR54
Message-ID: <CAG_fn=W1++qPJWQk1+4MtRfe6n1iUKF2O5pddnqKGwSq85CuqA@mail.gmail.com>
Subject: Re: [RFC PATCH v2 0/6] kcov: per-task dataflow extraction at kernel
 function boundaries
To: Yunseong Kim <yunseong.kim@est.tech>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, 
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Andrey Konovalov <andreyknvl@gmail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, 
	llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, workflows@vger.kernel.org, 
	linux-doc@vger.kernel.org, Yunseong Kim <ysk@kzalloc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 3, 2026 at 7:43=E2=80=AFPM Yunseong Kim <yunseong.kim@est.tech>=
 wrote:
>
> Introduces a new KCOV exetened feature that captures function arguments a=
nd
> return values at kernel function boundaries, enabling per-process visibil=
ity
> into runtime dataflow.

Some high-level comments:
- Make sure your code can run on every platform supported by kcov (namely A=
RM64)
- Check out Sashiko findings:
https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-20260603-v2-0-fe=
e0939de2c4%40est.tech,
at least some of them seem to make sense
- Please consolidate changes to the same file into a single patch
- There seem to be two tools (one in C and one in Python) with
overlapping functionality, can you keep only one?
- The test modules seem to be used only in manual testing. Can you
convert them to kselftests or remove them?
- At this point, long dashes in the kernel codebase are quite rare,
and I don't see a reason to add more.
