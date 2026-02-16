Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F2438329E7F
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 20:41:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.171
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771274511; cv=pass; b=QtjPoWR3x++we9K7D/ZCFSUrUipTK1M9iLvztFYO7vX9Wg6rmIGpSNpNWhbjVCy+jxFFhxyw5XbKyFxBNconYv1tH+7cHWXdY/oNJrnV9p7ULzszZFJj8toVimbz86cwo/bFS7CamG63t1ac+6NozKwiwdzOcJRZ295IieiYeNs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771274511; c=relaxed/simple;
	bh=niFgeZaFWZq+2Xx8sAkgvHJjXq6dUk0A45yCk0UDf1w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=F47v1+obZQgV0OfDGwZ3a99MYLATAmmdJw2JUzsNiKYtWo+Ycd9uw9ZExxiF8u9RvniOfmGl6XOnGd4LLNmUKqifRRl4nV+zthcHckxE0L1gWo9SpRTq6i14Xo9DO/9E19q6Gle3H909pSkpiqPPKgl2tqj41ndFdH3Xa/Hx3DU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fCb5Ej81; arc=pass smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fCb5Ej81"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2baaaeeadebso175749eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Feb 2026 12:41:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771274507; cv=none;
        d=google.com; s=arc-20240605;
        b=VuPM49S6Zznpl1rzFfEKr1ylLTXKzsNPqCbBtWywQYS/JfROkj9AUtgTjKNdVwWKns
         Zj5uaIoxcWcDz2zkQJTIa1fChQM1QFSwj1ZTJp8C1OtjpQ3extJBaAar1TesCbVPoy/s
         lEHNHD1MUyCK5kZWa4iEXVJkdEndUawK52TzkxfOTkVthXFARi/WJjxAiWFJ18vgUuuq
         C5qYRFBJbwAb4ATY0fXSG46gsluR7qLWQpGGmnrzRrUle6su9IgpVLqvxsVYrlB9//Pm
         kQR1/40h0Z0uO+oYkP8Ut7z500HHDSXNFgDRgN+TBc9ScHghSKD3VWpQStaDHPA3vqRd
         XRFg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=niFgeZaFWZq+2Xx8sAkgvHJjXq6dUk0A45yCk0UDf1w=;
        fh=61ltxGpVX1OcWJrUkAFuRsXw52i2KIVKuMrxZV0WwVY=;
        b=i7nDzc2px3CrUtgP8wwDR1lzPtUIvgCKPyF26gTBLTlIRrLbXYj7sKHiOjf5Qn7LBX
         oY/rHRWBThz33EGNuFLxcpiuyO+Vcwj4YZxPF6JKpRTm1TgpFVR5JOUkiD67jWwndY1j
         lspdzHmmRfifzgfhkP4+eWeOXsHTpyyGip0FQ8Rp0Kouu30W3s/0el9NLTq5KW9u7TJA
         q4oIELwG8NGwuDji4OnOdMBbjZEPFgb7C7VeH9nbFYWl+oXTgoBgf/m3Khe2dxyCJ5t6
         DJyjEg4LNNfI4CCAKr7su975f7TOVebWNe/6H+LCKBuOSqyFUjdeAMSR/R/PflNk6G8e
         b2tQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771274507; x=1771879307; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=niFgeZaFWZq+2Xx8sAkgvHJjXq6dUk0A45yCk0UDf1w=;
        b=fCb5Ej81/1Qbw7KLMj3wl7fKmlXod+7c4JLAgATFJ5/9b4ssG0t8D980sWFuMv2Ufm
         03P5Sd+OT9U6+slGX1R1eAVZozTUlo4Qrj60Pc748fHMNIRTWqX3MqZnhbXjnD95UmB1
         bp19Ex5m7SOahwJlFbuQE4rfgNGvVL/Zm6QjVxLc5VaZ3z54oT2fJKBueNut3XMiOKtV
         O3zTwpAcO0Y/iVOHMYBdMm/f9FQNMG8Kyruxex4g+Xq0uXM2RZLGUwJSqC9BBGuFVXiW
         yhzjakc17WU778oxnW24jE8vMWW+0Z+omJFF8Qj6PXsjc6GD623XEoDL/yzVWn9fY0t3
         InHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771274507; x=1771879307;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=niFgeZaFWZq+2Xx8sAkgvHJjXq6dUk0A45yCk0UDf1w=;
        b=NUDIT1nf6pyvkNgIKeVgQfbw1jqKRR9AU+AF8St0YDoJ1hklXs06VefclaCehSbqu5
         GB6P1pR9Hr1WlTlizR7qVREUgknqvGdjawbWB2WxOsLjL1OlSL9/hgxINH4W0OZBtGPt
         oURjdbRhzP9lrLKW5BfW3UiS9jj80twEzjAtGTgBhsj3CZH5FSGTiOzrbyKo7W7ryPA4
         EHZljSkJU7B2wnhLtGCZyZYYI6Kcequqzo0MvHe44Ei7ZvknQTqTFuchjFeX9xf6WI3y
         1BBkaN/NCSaldcppnj/FGxmObHlpf+3/kwk54pZmgmqHRAByrujKu0ljrxVoGabey0P7
         LXPw==
X-Forwarded-Encrypted: i=1; AJvYcCU0ovet3GinY9HtZKf8UdLppFTf5erkX+yJQbokq7Iz+mhoTsg1jr2hS9zHGSgzx3hEVtBR65HtDuSHLsU+nw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy8g3YwbhjPo+PJGhBEB4g2RGitX1mRV52ZkbtHtHWCsUNrFVc/
	za4oRR3l4yd6HYo1Ee3TttGdkxxyraYoy6R+NPboNi+BDIh6+j4vvnSuRhPG3hzAXGDn6ifTAnz
	av1zps5UyyN3n2/qNo3peQWz17Bm6s6c=
X-Gm-Gg: AZuq6aJ2fxZcpLNt8tD7IeuzidbDGm8Lfyd/GcQDkfiTP066a+oLQpOB7giSP8ykfVf
	vRR/Ysp1zk4uwcherr9NyDILJlU6SmqwqQFdJHdl5E9JVPa8HSFAh+jwti0YsSTQgJl6+wfmI9e
	OAs77AEBbZha/FJ0ssPV3se/zHP1HERgt5scY4rey2upqnBvx1B0Or7WqYNGNWJOrEVZpoTMv4d
	0KMyIrexwsRJ8gQKIzz2HTSYhUhrDTIKB/4GYp71VSkPFpk81Ji/3ozSw8LmC4aNUZFNkFbWjW2
	xSzGMKJcKOnFluT39yIYNsUwuT0RJ7BaW8LMPRbHdZW8fEzXIfZWX+pLnYVPqTjr2PfOzGLc76T
	8a8xIyymb2fqM2TDoZqKYXC7f
X-Received: by 2002:a05:7300:d709:b0:2b7:24a1:865d with SMTP id
 5a478bee46e88-2baba03c364mr2814598eec.3.1771274507004; Mon, 16 Feb 2026
 12:41:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260213191212.33328-1-9erthalion6@gmail.com>
In-Reply-To: <20260213191212.33328-1-9erthalion6@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Feb 2026 21:41:34 +0100
X-Gm-Features: AaiRm52AQh1nLse1tepTu3V9vLsY4p9m5Cmmc1cWP7wLS8GwhehvOv2qge2KTzw
Message-ID: <CANiq72n3FPOBVbR83-Vp6uetu8RnazMuu6MhzG_hA=_j18_BTA@mail.gmail.com>
Subject: Re: [PATCH v1] tools build: Fix rust cross compilation
To: Dmitrii Dolgov <9erthalion6@gmail.com>
Cc: linux-perf-users@vger.kernel.org, Ian Rogers <irogers@google.com>, 
	Arnaldo Carvalho de Melo <acme@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Namhyung Kim <namhyung@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, 
	Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nsc@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 13, 2026 at 8:12=E2=80=AFPM Dmitrii Dolgov <9erthalion6@gmail.c=
om> wrote:
>
> Currently no target is specified to compile rust code when needed, which
> breaks cross compilation. Detect required target and pass it via
> rust_flags to the compiler.
>
> Note that CROSS_COMPILE might be different from what rust compiler
> expects, since it may omit the target vendor value, e.g.
> "aarch64-linux-gnu" instead of "aarch64-unknown-linux-gnu". Thus
> explicitly map supported CROSS_COMPILE values to corresponding Rust
> versions, as suggested by Miguel Ojeda.
>
> Tested using arm64 cross-compilation example from [1].
>
> [1]: https://perfwiki.github.io/main/arm64-cross-compilation-dockerfile/
>
> Signed-off-by: Dmitrii Dolgov <9erthalion6@gmail.com>

I think this was meant to v2.

By the way, should this have a Fixes: tag? i.e. since it sounds like
this fixes an issue. Perhaps to 6a32fa5ccd33 ("tools build: Add a
feature test for rust compiler"), or something else? I also usually
recommend showing the error message in the commit message.

(Also, you can use "Link: ... [1]" for the link.)

Cc'ing Kbuild maintainers too.

I hope that helps!

Cheers,
Miguel
