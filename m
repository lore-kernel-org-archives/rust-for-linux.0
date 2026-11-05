Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.208.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793914653;
	b=PW3HkbBUv3gPISNtXFMNSVzc/IZs5aaH3Xb2RPffOVyXWNRT9bc5xsm2IAeZCtBhzuLE
	 JVtoZCmb+x8b7kqzY5kkN5sP3O31au4TGQM8wuWq5bcxICPWfgyM9A5TZjoHXYn9JL/eL
	 9QZovvs/ob/L5tjqeQ3DOZ4J2JoDJ5HSjEnSAG7UI8RVjvnOdxOgyujJn0uP6+iYDW2Sp
	 qBlds/QEXrPAKXinm0dJ5YMfmI7a6eSQsiIHMlmv8jed4c4HgLJzrSlToqS0EP0cHX6ef
	 S8qd6U33fyiQQ2CUuZkJyJz8kFZP2zLyNUUAZa04fF3V/0SmmDWRPCvEkgx8Qyp8rOg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793914653;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Received:X-Forwarded-Encrypted:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=vM+JVI5ou9wldEifJVsxeGyTetK3uxHfHsrd/HXw/z4=;
	b=MVWtc1IG44haw21hp7WHD8cOJ8w+8Zn4ALOIDqvZ7pou3gcGRzGRih55tSNKaY5ks2+y
	 Rw/sVl67xFoqsVHvyoV5uQsAI+Pw54gepwdG3QyRjmDMISeSBAYuc2c3vVBEOVpEr0UmC
	 P/wuVTG2vmfFwucV6bMnC5gu2U7UxCv6EJsxI9ewDUGwcuDZjwgR2lkOkT6w5uuhvjlfn
	 wth6N2ftNjryt4xINpAVSiCQM2NHa4bPXWzNSNIyiPwnnewGOs5gouXr58mqp0R21Ieqc
	 CoxmyqqaB8DOiesRaEptBwyjZiRMwOuGocDkot76ALuASIxn01kuVqEU+QPUTikzW8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IdmGlR+I;
	arc=none smtp.remote-ip=209.85.208.49
Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0AEB3606A326
	for <rust-for-linux@vger.kernel.org>; Thu,  5 Nov 2026 21:37:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0AEB3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=IdmGlR+I
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-6b587538a37so1127517a12.2
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Nov 2026 13:37:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1793914651; x=1794519451; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vM+JVI5ou9wldEifJVsxeGyTetK3uxHfHsrd/HXw/z4=;
        b=IdmGlR+ICCcAANFMGTEdc1iUqiCjrnvV24l+vs+w4l53FuTQQauU7XR+HioK1kUUD/
         mtNZw89EXOH/yeEpVt5TkZ3+fU0QeGB5eeIb49rjF7jtPIO0ZMwj2L+wsX0xDxZYMRU0
         6CaEnlj6goAUyd6jjNca2flJYlghZyYmYfH2w=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793914651; x=1794519451;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vM+JVI5ou9wldEifJVsxeGyTetK3uxHfHsrd/HXw/z4=;
        b=JvMW109u0I6FPBeMmRay/zL6+8/tjsKICCKHtCiyiw0i3Fatub15ZmKyE81QE+wGB9
         toUf8WcC/be5+99AXqo/oz1UC9QE7cnNOMrGcVqVMrmt0295ZcXBdxssJc26jXHOkadS
         5Q9ylLkiIX7ES4ce1lbdRcONPP+zdLmeSuqx6lOGvloiPn3aIyqbRNjUioUeUvtfkFHx
         FNCLXVrYxSd5KxYCg8+/hWdx5qKX+iXqzmk5HYmBzAGLXRBEPr0CmIyte/hIDuiHxmEp
         5f7BkDWw+l93XRkv6Ufvys9qs/nbpC0UcO+dCaV/GCvUd/pryX4bBi6o2E0D5ZdHuxmG
         JdBQ==
X-Forwarded-Encrypted: i=1; AKwUvBwmO+yko0gKPfL9LXEo+YXVQaYqGvhFrlfbjqKsVs2ELagmwTzHNEWobZmidlTVH3V2ljq9mi5cwuH9RTDAhw==@vger.kernel.org
X-Gm-Message-State: APuU4Z+GGq0+w3rNfnIM8Lnpc0WpCPZ4vaFI81IrHJ4NTG9WqFk3FJ8w
	jxTMPsmj9LQWvAywGCivnsdimkRa9McnY83nTRjjYVWF1aRBtVd43B9q1Icd6DOG1cy2PVB/JiQ
	54TewqIft
X-Gm-Gg: AYBFou3xD32Bfie42zRu8CQMdUYWjHw2wxDYY8lPUu7Kmvf2B828OKCTRWLpwWsRf8X
	9k5du0tSmVdSGtk4/FT1xQJEfGFe8Fayj0fpkXLs5gstiL22icJjUgiLw59R0icqcLhK3f4qtLl
	R6BcO+P1X4FC4sDPTv2JlmFo6ZkarerN7kgvGcOhhkgpqV1KH/muDWXtXZl+EmopxsuG2VBAjYz
	AwaKzlkgpK9J2vCqgXpsm5NC0IdT3mwGC6d+G1uxlM12DW7/lb0ej4QZGXdGh/sP85Im9QEVRMD
	2dBf2QYXXJLjEpmiSWlZey5QFWgPbJrxIY6D/Dm0rKprEEH11uZJOr1gkqSnXSnZmhyROTPYI4A
	PdJZaxD3t4BJxSGRb2iQjqPCwcqPfny+13TqQMAxmLMufrP7zFIfLXcxttOSpa5PMrPYe5Sg1oA
	h76iiVhz6WYwFO5+Va8pCr1OxZ9gQt1NbgKDTTu2dpeZ+vs5Od3mbvOzmaQzz+45pz8eDVNKuR/
	3ZFdiuqmmbxmrjDoDBjBMRuQPqZiXWCQc1CyEfsLl/HyJ+EdaPoUJV2J+M/E1kSwK52jN73GVaQ
	aZcQmy7pLommhvzOEilAez97mB6etosZ1uuqD1Yei48n8LeRKl+nnYvWp+T3+RxOGBg=
X-Received: by 2002:a05:6402:440b:b0:6b5:64b3:82d7 with SMTP id 4fb4d7f45d1cf-6b59753c6fbmr387132a12.2.1793914651320;
        Thu, 05 Nov 2026 13:37:31 -0800 (PST)
Received: from mail-ed1-f45.google.com (mail-ed1-f45.google.com. [209.85.208.45])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-6b58c868e70sm502276a12.24.2026.11.05.13.37.30
        for <rust-for-linux@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 05 Nov 2026 13:37:30 -0800 (PST)
Received: by mail-ed1-f45.google.com with SMTP id 4fb4d7f45d1cf-6b577addee9so1733695a12.1
        for <rust-for-linux@vger.kernel.org>; Thu, 05 Nov 2026 13:37:30 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBzPWSgvxkwSbcVFjgMUpNzSBHZo0Ura8CuljqKtg71EkNlJMOQeItuHiE/Fs2/dQVmpPZd4StnPH9rLk6oC+A==@vger.kernel.org
X-Received: by 2002:a05:6000:46cc:b0:492:a72:92fc with SMTP id
 ffacd0b85a97d-49277e91d94mr899867f8f.44.1793914223349; Thu, 05 Nov 2026
 13:30:23 -0800 (PST)
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
In-Reply-To: <CAF1bQ=S52KWHopqxksctbBirFEr5Mz1dKKMAoWh-dqLHii3Nig@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 5 Nov 2026 13:30:11 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
X-Gm-Features: AclHuK8NeWv7Eqboity3c_xvquX4Ve8KJUxgkkfaa6zSURNg96EK107B0KPq_54
Message-ID: <CAD=FV=XE+KuTDCa3cLOsHPfQ9ngFOXrokFbxr=jDm_UFwKdQDQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Enable -salvage-stale-profile
To: Rong Xu <xur@google.com>
Cc: Nathan Chancellor <nathan@kernel.org>, llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
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

On Thu, Nov 5, 2026 at 10:23=E2=80=AFAM Rong Xu <xur@google.com> wrote:
>
> The issue you mentioned regarding excessive time in applyFlowInference
> comes from Profi.
>
> The AutoFDO implementation used in the kernel is FS-AFDO (which uses
> FS discriminators). There are known issues when using Profi with
> FS-AFDO; enabling Profi actually degrades performance compared to
> original profile propagation. When we tested and worked on AutoFDO for
> the kernel, we did not enable Profi.
>
> While I haven't looked into this specific bug yet and am unsure if it
> is unique to FS-AFDO, I recommend using -fno-sample-profile-use-profi
> to disable Profi for now.

Interesting. I can suggest that to the team digging into it and see if
it solves the problem. My AI agent says it will though. It claims that
the default flipped recently and "-fno-sample-profile-use-profi" will
restore the old (tested) behavior.

Should I send a patch adding that flag?


> Regarding the "--mllvm=3D-salvage-stale-profile" flag, I also have
> reservations about adding it for the following reasons:
> 1.  It is heuristic-based and not enabled by default. I am unsure how
> thoroughly it has been tested, so we should assess it further before
> enabling it.

FWIW, we did find that Android seems to enable this globally across
its userspace, which suggests it has been fairly well tested. You can
see the change here, which landed about 1.5 years ago.

https://android-review.git.corp.google.com/c/platform/build/soong/+/3524291

A few notes:

* That change _also_ adds
"--salvage-stale-profile-max-callsites=3D2000". Internally, there has
been debate about whether adding that would be a good idea, too.

* This kernel change _also_ adds the flag to rust compiling.


> 2.  The recommended usage model for kernel AutoFDO (as documented) is
> to use the same source. While it might help in an iterative build
> model, I don't see a strong reason to use it if there is no source
> drift.

Hmmm. I guess in the purist sense we'd want the AudoFDO profile to be
for the exact source. ...but from my experience, that's not what
happens in reality. If nothing else, developers locally working on the
kernel still want to keep the AutoFDO optimizations so they're testing
as close to what's in the field as possible. However, the act of
working on the kernel will touch _some_ of the source. Keeping AFDO
working as much as possible seems nice to me. Of course, I'm by no
means an AutoFDO expert and mostly just got dragged into this issue,
so happy to defer to the experts. ;-)

-Doug
