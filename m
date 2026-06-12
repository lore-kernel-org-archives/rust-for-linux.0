Received: from mail-yw1-f174.google.com (mail-yw1-f174.google.com [209.85.128.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E59D35674D
	for <rust-for-linux@vger.kernel.org>; Fri, 12 Jun 2026 08:00:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781251248; cv=pass; b=RNt3bjXtKvd5lA1myLcHzjz8fghpIy+maYl8T0YO0XLLSuxsix6HT/Tu9JEC4zjg1xoyPxk2ZD2WvbSii+KXo+SZfTHY96fnyTChuxnFynz5NRILHoFD+YpBhCFoF7Ok6XMalvXf5ewHSXLhedkExoGSKdNMv1OSlTgnjMzhTqA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781251248; c=relaxed/simple;
	bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=R2GUtDY3EmZivP8OJg2Wvzjq6T6Z9DJRG3npnCazSr+eCAmW7AaJeD3NOe0Fk2NhUCNp4ZXOdXLPan0Ii7jCdc50qG2tlhm/qKKnyQJZIvWZNXOdlRcdewrOzj2boJOpfhYZOewujkKNNgFqDwB5RCG1oh6FgrX+ACEnPWgvHVo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=v/KaT+yK; arc=pass smtp.client-ip=209.85.128.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="v/KaT+yK"
Received: by mail-yw1-f174.google.com with SMTP id 00721157ae682-7dd3f176f84so7398947b3.0
        for <rust-for-linux@vger.kernel.org>; Fri, 12 Jun 2026 01:00:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781251246; cv=none;
        d=google.com; s=arc-20240605;
        b=XcGnZsMDDveTwiCS4qthmZyxmR0jYnV4TWUhJufty3UWzk0a5/qKDDBSFhqRN4/iSE
         tAUz5wGNyUz80z/NP3oq1Y0iW4AQTOfUaEeyh+j8hUe7alJPXzqNIJb38klwXXj/Hw+q
         dAsMrY5bJgebQc6YLBVuyt68lKRn9eGUpmGAA5SalW9c5NJnjsBnOBhjmTC0vNNQTrQR
         O83uqWcXQW2rEyfWbPwmsfCELrjRMPWKFPWM38TeweuQenJlepQZetBHXqVWeDIYSURG
         wYTHQW0imEHzuKEOkv8qN1NcpPQzYyXjHJtVfr9SJ0qcxcjcCfA0a7DzjTSyTRTalOJN
         vV9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
        fh=Axv/MHEx7E22Afsx+Svqc4b+Vzzde1JGnfcNpDFmfnY=;
        b=kbxBxDx0zn9J1D9E2Me/BrE9LdmHYUEN3iEHz1fA+5qANHX+jqWhQTwoUFWF7uae4o
         Ont9IDBwzhdHYLkc8PU2QmoMPmIZhL64KAGpEJqUN/4c1HBmbxMe2SQ1OR5IdknetVtw
         6EiTCj85NhZXn2Yghz6Hment+hzKHWv8NM4bqg6CG0E+HZGIWVUjlNcSo/nz/7JB4gNb
         nkGxBtqUrrMQS2kbj0Opea4MBo7ZIQQ4gnHLxTsD5DGVLgo7+W2feZMNH7ECKCWQXn5z
         Dmb93aibH5aqrNq0+SuO/9QYcOu5tMVZZbkHcrJyFWziXt4DCfRYXN+FdzL0A+lGPCQ6
         2xNw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781251246; x=1781856046; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
        b=v/KaT+yKVuYKxugk9GOkU+ByBS5tAuu8BM52P0ROYU/zA36UgpEdVVgn/Siw7JATqN
         eJF4aDW9cpF4phgd8eNvDOGOd9fp9S8mgtqPR02h49maNhy6DW+9FDBxBrjYkfilUXtp
         173US70nRQrPQjMz5ChJs4F6QYj0e7NO90jIwHXCCGmxmrKjfghm4AUxd6eNSQnUkwhv
         qhzkHeddM8HkbCVyqW5biYj9jbh+zqe62E968ClSB4V9Jym2H+hq4cbAz5RcxrpaBwN0
         YrF2QYkryG1AYMaCgXfsQ29oUL+6fvYeXb34RP+xlfGbfPJUeBhB9XEnPQWC03zgAE84
         CQew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781251246; x=1781856046;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KnRvALqwspnqi9RT/gX4yfpYLdFKrxcGw8Lr0DwyYvw=;
        b=tGRGpsAGpfx0v32RXyCtLIrNGl5ilWruseD1fxVfublRVKSKUTVpwYVab0YO5LM1Qv
         czV0YEmJhSgWUf/Muz86Wyrn3Nz6rpWGyEvjMLss0IKQ+GMwnjHlY/ZlN/vJ0TwUhyF0
         gbUFI9+JaD2hbi6H32NbnW4tlMmE0ZEZxG+xJmiMfPIj3IKIRVPcZKTTuKscDXMDxWGJ
         sjSfUnTCT1WrZhVrN30EFH+ZJ+7r7iDM6I/asU2TQ5EO2Tc1/o23NdwKLIVS7Jv6lPHB
         zc6JXdZGFe9YbNSR6wb6bQacfO6jFMOSkhgoeRT/z+ZUJxtJGy447a0sH1kYisRUq9FR
         DL8g==
X-Forwarded-Encrypted: i=1; AFNElJ+zpe/hfVcJe6xO8Bj6qOImyp4UZbqxrM1F/xrt26FomiAMqMhmS+181uU3W4L3uXWorzc6RlpitPMXRby1RA==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywtti690jByFnga5ztoZAF+i3zsjV39FKdNBAL5ZwYvD6+m8T6L
	94pTT1weClNE0i546HTPzaH8GeFwKFqbkjwO4tPBITPihtUQs6Fnri8i3IjYd0TBZZs7w4xRDXg
	iAx08o5yOyD402RX0LaLUMWb3SoSTqBeFhW14yvQM
X-Gm-Gg: Acq92OGVcBAsknimgaB12LCOJJlusit/xMRIrKfTdhZTOiR2MHESSn78M8etnIEdtrb
	NolY0/qWE5hXwxQTgdQ+tq4LdV7vQlcgwWYhNxzgvRaJVs8EctNigaVIqDrPP0kXK3M/d4RZtYN
	yfUov+z/fs+36lIiNYLjgckfZujjxtvsVEfXX+Gm7ye3X5IUmpvw/7t5w2dxzB5PQhwJVFvb0qp
	3wk48YwjHysPI14ZXIR7afYFGYxdd6D5QY1UEw8hA/1cmnE+xs97NKoruK7LZw5Fdoan5rmxe/g
	Wq+cms7bhsfauSzqAad11Iv1Dl+NPVu3PPuU/w==
X-Received: by 2002:a05:690c:6201:b0:7db:f8b1:cd80 with SMTP id
 00721157ae682-7f7bac02970mr15863297b3.2.1781251245971; Fri, 12 Jun 2026
 01:00:45 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-b4-kcov-dataflow-v2-v2-0-0a261da3987c@est.tech>
 <20260611-b4-kcov-dataflow-v2-v2-2-0a261da3987c@est.tech> <CAG_fn=V1+_xLgCZgdLnT7Y-muRO0CXkrNKkC8AzrqzWoL4eR8w@mail.gmail.com>
 <5fa7a528-a4c5-4fdb-9a17-1b0992e955b3@est.tech>
In-Reply-To: <5fa7a528-a4c5-4fdb-9a17-1b0992e955b3@est.tech>
From: Alexander Potapenko <glider@google.com>
Date: Fri, 12 Jun 2026 10:00:07 +0200
X-Gm-Features: AVVi8CdEFjoun-R64CqbvYJPTnaS_E7TDNryUpyw-2UHJoZxcDfdiOQP2RCPBTE
Message-ID: <CAG_fn=XB7_zbjGzpgwEzm5dqcwehqvB+=SpJhHvw9QdETberAg@mail.gmail.com>
Subject: Re: [RFC PATCH v2 02/14] kcov: fix INIT_TRACK race in kcov_dataflow
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
	linux-doc@vger.kernel.org, Yeoreum Yun <yeoreum.yun@arm.com>, 
	sashiko-bot <sashiko-bot@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 9:25=E2=80=AFAM Yunseong Kim <yunseong.kim@est.tech=
> wrote:
>
> Hi Alexander,
>
> > On Thu, Jun 11, 2026 at 6:21=E2=80=AFPM Yunseong Kim <yunseong.kim@est.=
tech> wrote:
> >>
> >> [snip...]
> >> Reported-by: sashiko-bot <sashiko-bot@kernel.org>
> >> Closes: https://sashiko.dev/#/patchset/20260603-kcov-dataflow-next-202=
60603-v2-0-fee0939de2c4%40est.tech
> >> Signed-off-by: Yunseong Kim <yunseong.kim@est.tech>
> >
> > Can we please avoid this?
> > kcov_dataflow.c is being introduced in the same series, there is no
> > need to send a buggy commit and a follow-up fix - just squash the two
> > together and note the changes after Signed-off-by: separated by a
> > triple dash.
>
> Thank you for your guide. I'll remove it in the next patch set.
Also please make sure to update the patch version. It's really hard to
distinguish between "[RFC PATCH v2 n/6]" and "[RFC PATCH v2 m/14]"
when both series pop up in the inbox.
