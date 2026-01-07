Received: from mail-dl1-f41.google.com (mail-dl1-f41.google.com [74.125.82.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E4CB34D4C9
	for <rust-for-linux@vger.kernel.org>; Wed,  7 Jan 2026 18:25:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767810353; cv=none; b=SysqB1Bh3A9jLdOBV+4q0LuCOpKgmMZfJ+U9HiMRko2dHb6H/d0TOOM6CAfxS667cM9fU9tPf0uBgXhtUSfzYiTkKOdo89gf0zKDXmlZg1NEqeGyT81hlwKIKQGo5cXSF8N11/u0UybcWRwMqeU1ykRdu+eM5QBZy40JpMCIwNA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767810353; c=relaxed/simple;
	bh=ybEPjNiCcRdCpRYzCY5DgOBnbB6QnavjJa8i03eIIHU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aXR4i2BCj71/cDsK//8Cm7I6RXe/73bRIH29KmsSpsGXVDpp9lZvr4cpeP3GjGQcILsPWJSBoXyYtET4LhEMFX12QPVTH2TmdtcovE/OedSrfKN1uD9Jyl80TPxKrpct/b8SMDEm4RXBJCJOmvMQiSOuxro3OuO9SAL1AOrlVNo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J5y/gHkq; arc=none smtp.client-ip=74.125.82.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J5y/gHkq"
Received: by mail-dl1-f41.google.com with SMTP id a92af1059eb24-121b14d00a5so164530c88.0
        for <rust-for-linux@vger.kernel.org>; Wed, 07 Jan 2026 10:25:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767810349; x=1768415149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zmfEsx13S+5kgIulBTXHS49So/qNF3mV7k/YhgXr2wY=;
        b=J5y/gHkqUaWhRQesKtB+OnSmUicYT9+9mZyuzAW8BsY/kHqIFvnn7uWw7mbSrHwHNC
         5Oc+Ot26GqxxSEMpDfmg10bSKmbSTandlGAqCzCZHDPJfYdKcoTCcdWwEF+Nz45/VUCX
         BajxGKWzlXU7j5Qu4UC8IXc2AVBZt7/hsoUyCVJpTEYiy7VPrxsFYlLcx3HWG42Krg9d
         fDUYb16w4Cg6sz/3S8Hc+HUbbuo9f6gSNawwmnLgLjFBHZGnu6rI20mk+xPV2Iua97Et
         BIqok47GrbLQv3Zf9Oy5O31EgWNS43NAPrrxJzBILZ2/X1MfPKQVNx6Nnbn+7yK4gYzy
         l9vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767810349; x=1768415149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=zmfEsx13S+5kgIulBTXHS49So/qNF3mV7k/YhgXr2wY=;
        b=xOtpsoWIrsFEHmU9qx9lEMsLEMhHwTb7w77KAwORez2c4omiWZGkuhQPTuqgxDjK6s
         L6zcVkT93pM+lwiJFIIDtXND6scs0uG276FnYKXvDLt4MgpS/rYy1EAskgR+33wVv50V
         ABt78FxTg3/NVg2qN019bR1pd6UKFn5cJMRrW/tgvuTXjnPe60lFRTUdGtoPcCus4Qf0
         syZCHpaV6GgCmZYkA1jyHVmRClKD95WUM7dZhTqxyFmM9MgyqWoAbNxGxb1BO+C32sRb
         cU2TeAyfEFradanoNKWxFa5DgEkklq9fkOSYcMwkXbgfY2VQ8IhNlPFP70cvtRo/QDq4
         l/Ag==
X-Forwarded-Encrypted: i=1; AJvYcCVoq93x3zYwTtUPnPV8MTXtuJB3jwvZ6AH7IUAggU+QtrofuJJD9O+QmsPhpHrTLaQIugw3huxTQ+dzy0MxzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YxY9fFpvOsQPPQxKY81uw9dj1VSyfsovEwsGK9wXzQz7CiH+9sg
	xmlOTCth7MXxRl4OyT1q0EFtUEMGdXRIFjji9w1hrnODpMwENK/HlvsK36sqxnj1g+eQYG8dXOm
	12WytlxGqTwkz3prQouMjfZp8MXSM3a0=
X-Gm-Gg: AY/fxX6mwqTWaJNWheyKWiGeyXBZOt2iT+bzkPMIi+MmnIQSJeyK0WqarBoujDaIN7r
	0T8Ss4VCoT93BLD+gzVnRVzQl5bvLMjO6m9KMaqfNO3Dw/kbvHK+QLQsYWWmShP0EVFsRw9a8xO
	VI6I78xMWV7ZhECQ9av9rZJyfNVmErMTdeDxA9psDTlp5tGFM64FwLlD2z3giltiYbc4JoEjvYZ
	ZttAdUYkCqiWCWpzxAPnyX5kBjXsR6ZxcUPoOLvQJ0gnxg8ctQith4zUAlhVOWTF19yorMTOpKX
	LujM5RaL/faU1vJlBXALzOtJcCpsyVvECV9xG4IX5O5dMoWZFerd+JwuI+2TZ6djSEOiA2iKiLm
	CxUt5frwF9nN6
X-Google-Smtp-Source: AGHT+IGUDU/qL1SPLoEQWykHXJpeBGHaPkJcYB9RKlfTVR1z+y/ggYx5S8IleeGfmdBq1UwTKzePqZHdAag6kIsA54Y=
X-Received: by 2002:a05:7301:100f:b0:2ae:5b8c:324a with SMTP id
 5a478bee46e88-2b17d30df86mr1335115eec.4.1767810348898; Wed, 07 Jan 2026
 10:25:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260105150106.567830-1-gary@kernel.org> <aVvdt90YmhJz3i5i@x1>
 <aV4TkNE_hAyByISq@google.com> <CANiq72kUVvMznfFtcjks=0iJ7HE2uvCSyD-Xu5NV=_9ZykVXhg@mail.gmail.com>
 <aV6kcMzcwF0tLpgt@google.com>
In-Reply-To: <aV6kcMzcwF0tLpgt@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 7 Jan 2026 19:25:35 +0100
X-Gm-Features: AQt7F2oz7iCeRNKU58YjiBKyOfwUd4yNEZcp12hZyyVHQKijn8HMEt2KMzBLias
Message-ID: <CANiq72kgcv4PBBD4hiA5Z0a4J9g3uSeeM=n0cu5efsCjuaxyvw@mail.gmail.com>
Subject: Re: [PATCH v2] perf symbol: remove Rust symbol workarounds
To: Namhyung Kim <namhyung@kernel.org>
Cc: Arnaldo Carvalho de Melo <acme@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
	Mark Rutland <mark.rutland@arm.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Jiri Olsa <jolsa@kernel.org>, 
	Ian Rogers <irogers@google.com>, Adrian Hunter <adrian.hunter@intel.com>, 
	James Clark <james.clark@linaro.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, Andi Kleen <ak@linux.intel.com>, 
	Dmitry Vyukov <dvyukov@google.com>, Stephen Brennan <stephen.s.brennan@oracle.com>, 
	Arnaldo Carvalho de Melo <acme@redhat.com>, linux-perf-users@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 7, 2026 at 7:22=E2=80=AFPM Namhyung Kim <namhyung@kernel.org> w=
rote:
>
> Yep, perf userspace can be released separate with the kernel and it's
> recommended to run the latest version regardless of kernel versions.
> So from the tools perspective, it should support any kernels.
>
> Thanks for your work!  I think it should be fine once the backports land
> to distro kernels.

Got it, thanks!

Cheers,
Miguel
