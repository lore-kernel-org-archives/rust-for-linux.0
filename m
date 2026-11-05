Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.173
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793919621;
	b=E6kn0uFMBFsZgf2//JtAX4bsqugoVAsSlBrcLwoPEdvvEeEtDweQ3d0RMQCe3hwrm3hK
	 swDbsCI0RxEWWi5nDTMjzalnsBqw8qfMU3yGzXHq/e8jwpG0ZOc/MUM9Vcr00rhQE475D
	 r0esRnZcc1tjmV3hqJDP+PPfpUsfTD19LmAlVQQGciWPvqF5rIfu1dsLQjhtz17WteIUM
	 B25oBPRgjC7QLkzqE4lPoFc2sCWxHfB2zemlqX0z7Ha9F7o2FCufXmyJKinPe1aPMWkLm
	 cqAQqK6SuZoz2nADgmWzVfLrqqHjtfzrmcN9e/qiKbOMqbB0Ah7XXVxxbsSsx5I5uYA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793919621;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=WotC0SC+byrPPXJl6m1kLGnVJbE6lPSdMSYkFBTw4wY=;
	b=46XeymlnMcuNaFxpxlIKYYauhfl3UbcY+xr40oIxws6Mj//KsAqY7M4Wxwm1lBQOV5Dm
	 PYRqPTEH81HgwGIzv6kV+JaFuyFbJtd4N9fH5xMSX40k2JNUJRau/LEMzX7kG7VlxIN0C
	 oqZqpokEYSao6MRrfLz6tBzBdwmhyIfrOwaYQO6MqpKUuRYpzVtMSXR7dyZEwBweOEILL
	 KLLMfT7vqtqM6Ev/7O8XLU+F6aYMq7L5i2sxiuWnzOVCbz7/7JqV5pJynKgQQPouT8/Uv
	 NwhKeA8pF+0qxM4/LmJLhCA+Cd69K2ppoSJm0YGPSNPM85TnZ47p6B6jRg0Ix31WpoA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WpNzG9zo;
	arc=none smtp.remote-ip=209.85.208.173
Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C29C0606A31B
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Nov 2026 23:00:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C29C0606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=WpNzG9zo
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-3ab4891fc73so43781fa.0
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Nov 2026 15:00:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793919619; x=1794524419; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WotC0SC+byrPPXJl6m1kLGnVJbE6lPSdMSYkFBTw4wY=;
        b=WpNzG9zo6ZnhxpyB3m+Oo0OY5Sj31yWqoc6Vc4HnBIIAi6sE9fYbxLVWoNjGvg9mEL
         bjGQtqs8/gmSl541tgY72HHZC931mXRnQWfs8WuiCyJGqXkkWaPT99hs+esocpjQSUtV
         BjL4F228iDxFjAhlVffjvwY5v9QlwDhjlXzhI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793919619; x=1794524419;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WotC0SC+byrPPXJl6m1kLGnVJbE6lPSdMSYkFBTw4wY=;
        b=WuIgbDACFmjxU2vr9o2kq0AY1CcIRytRotjKNtCD+D2IGKC/LM4R/Wetk/oU7UUNOF
         kTHsyUHS0GXamsoUiIxNVRkzz73+fMzmG1jGRHL5lxa2kA5x/cchEZOFtauOYrKEVzmf
         vIY818OaXwSxpPlU3MppYo3vIhgsbY2vkwjP19PCw2aB+Y/68IyOgmYYqZeQh8E4p7z2
         kPEP2EqhZIqVluOLKydYrrYiIjv7Lf73VfRxWhdCoup6qVte7THZcvJpZArmhjp1rGeX
         Cla83ho61g1IN+vbf7vZVrL3DBIEsFgZlHVgiT6JSQBsVgenrT+OCJZa7Nlgi0g+hEtr
         u3gA==
X-Forwarded-Encrypted: i=1; AKwUvBzi7x2baAZLiOyd7FFokMT/sMA0qvg775nG477kiM8mxcZ9ztAn5jx+cFkO/neiV4AWyUySeqKJHvlnHrS2Rg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+LHPAkFD5wdIFLD1PPahN/rrp5prQnQPftmxZJG8ph2qPN0ncs
	iVueYskVRbQ1J+W7vsa8+AIse2AJj3R/hOS79ga7CSP3mxCDw7WRYlCM7FkaFjvAMaQ5e+TePcb
	3VFuyJrCn
X-Gm-Gg: AYBFou2GpL4U2hgA3ppA+6gLSMzIAsDxWoZET06YGwKQc+0GfH/DdtbOgMGrvaqwWBW
	vhyI8veh2+66eMGwHq4tiVc/8usH1Cl9pL81ieQSZsNsTNnCPpB9XUW0TVABeEEarXYD7ugjLJ8
	3Gs8ozeVpjgQFjzpAT7S4g19xfEV5s25rn/ZwIvTKdsuFJoIumzs7RKo8RUDRTIps4+26jHpTFM
	pUhSBeuKKmX0dqd3Er6o9Dsby3ON2FKVAhO/4FeLboR8zSrI3jnDT+3nXYYjPvxTn8CVTkM4UuO
	bZouU9/ZAPikIQ0tRXsa9iGo48/QvTRpZwUxSUj9qU8j44rW5mvmWNE4pyYkxYBHn+DIL4QEfhX
	UCrDPKPvOA4N3wnqK76qp1HOoQG2T9QTgLXZ7Ix+gJcfrhO4aR0NAxyUedLX33iY3hU0vwb0Emp
	mAvWapD+oDUkMlA2HJ8ie0oxctW1/mABxo5R33bFg445o1ASFBRfa3OiKXeFb0qH6ukTgfOLSxc
	DD2VqaV9a8xPNJJJ9o0y2HPPVAXrY9nJLbRaXBGx9TYpXAA3FTOWaj31lObox/zYkPQ1PT4m5kZ
	EfelMrMIt71lAnPawf+Vm8tmCyrCzuDuSc/ZnVyDfdf9YiAmqwor405d71FS+J6+dycj3Iw=
X-Received: by 2002:a05:651c:1b95:b0:3ab:1067:7b5f with SMTP id 38308e7fff4ca-3acf3a0b7femr1444561fa.7.1793919618967;
        Thu, 05 Nov 2026 15:00:18 -0800 (PST)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com. [209.85.208.175])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-3acf5db599csm128721fa.18.2026.11.05.15.00.18
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 15:00:18 -0800 (PST)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-3ab27b4924aso20661901fa.2
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Nov 2026 15:00:18 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxC3kA0ixC9SbLg+M/zxWkVlPwOFvNgyoq9UJ2NNId5SZ1UrSRSlDktaptB+KICXMuL2OFS/mltGq/HpuIB8g==@vger.kernel.org
X-Received: by 2002:a05:600c:c4a4:b0:4a1:f736:79f3 with SMTP id
 5b1f17b1804b1-4b6de4a7678mr7775055e9.5.1793919278293; Thu, 05 Nov 2026
 14:54:38 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261104174554.1.I8556199ea4f1335169ce16e97309aa63ae2e2310@changeid>
 <20261105052401.GA862715@ax162> <CAD=FV=Vx4gHvF0TegRBwZetTNjP5AsjbBK9+sjNA43OpL1Wjiw@mail.gmail.com>
 <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com>
 <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com> <CAKwvOdkNvYz7mSmfQzWuFd7FZEUyZkH0L2tfPSbouE0J2w=b1g@mail.gmail.com>
In-Reply-To: <CAKwvOdkNvYz7mSmfQzWuFd7FZEUyZkH0L2tfPSbouE0J2w=b1g@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Nov 2026 14:54:25 -0800
X-Gmail-Original-Message-ID: <CAD=FV=UW26c_28wcZeHkZbwwfV6-r6YTzi4BcBmJTJXzCvygBg@mail.gmail.com>
X-Gm-Features: AclHuK_Ffzk__3YGh5Ruw9BKABV7G_tKL1f1gc3qp3lqSWqolrpj8eHeMy1suUo
Message-ID: <CAD=FV=UW26c_28wcZeHkZbwwfV6-r6YTzi4BcBmJTJXzCvygBg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Nick Desaulniers <ndesaulniers@google.com>
Cc: Rong Xu <xur@google.com>, Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, 
	linux-kbuild@vger.kernel.org, Han Shen <shenhan@google.com>, 
	Nicolas Schier <nsc@kernel.org>, Han Wang <nesthanwang@google.com>, 
	Alexandre Courbot <acourbot@nvidia.com>, Alice Ryhl <aliceryhl@google.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Benno Lossin <lossin@kernel.org>, 
	Bill Wendling <morbo@google.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Boqun Feng <boqun@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Danilo Krummrich <dakr@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Justin Stitt <justinstitt@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu, Nov 5, 2026 at 2:40=E2=80=AFPM Nick Desaulniers <ndesaulniers@googl=
e.com> wrote:
>
> On Thu, Nov 5, 2026 at 1:30=E2=80=AFPM Doug Anderson <dianders@chromium.o=
rg> wrote:
> >
> > Hi,
> >
> > On Thu, Nov 5, 2026 at 10:23=E2=80=AFAM Rong Xu <xur@google.com> wrote:
> > >
> > > The issue you mentioned regarding excessive time in applyFlowInferenc=
e
> > > comes from Profi.
> > >
> > > The AutoFDO implementation used in the kernel is FS-AFDO (which uses
> > > FS discriminators). There are known issues when using Profi with
> > > FS-AFDO; enabling Profi actually degrades performance compared to
> > > original profile propagation. When we tested and worked on AutoFDO fo=
r
> > > the kernel, we did not enable Profi.
> > >
> > > While I haven't looked into this specific bug yet and am unsure if it
> > > is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
> > > to disable Profi for now.
> >
> > Interesting. I can suggest that to the team digging into it and see if
> > it solves the problem. My AI agent says it will though. It claims that
> > the default flipped recently and "-fno-sample-profile-use-profi" will
>
> I wonder who flipped the default? Perhaps they're not aware of _all_
> of the existing users of AutoFDO, such as the Linux kernel.

I've been preparing a patch to add -fno-sample-profile-use-profi. As
part of that, my commit message will include this:

Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
automatically passes -mllvm -sample-profile-use-profi whenever
-fprofile-sample-use is specified, enabling LLVM's flow-based profile
inference algorithm (Profi) by default.

Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48ef25=
522aa17c2a71003
[1]

-Doug
