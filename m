Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9697F1A23A6
	for <rust-for-linux@vger.kernel.org>; Fri,  3 Apr 2026 05:02:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775192551; cv=pass; b=grTl2G9CmHaa+d1caifAkvLCvL+EK38vfrid5sL1zoHjPbq0uIRiUSjNfQqHNf/UlZ13mxdVMS6S1e2nqjR1pU3IdDSmXoodFSy/R0hF3ryqJxEwIklWjKiGio/v4B1W1oEVzoVH75AMcTObN7YjUBBdHDOr/tddg4VChOeIy9A=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775192551; c=relaxed/simple;
	bh=i7LG7WVLotIAfEJyQ5yIMhIvpukdW6Pq0bA5sjiBmFQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=QyNSSPiaAjTcnrJ0pM0m+fE2DuICeOJ78ELxYQthEuT9IuM7Pnmged3JFGwg3nyYDdklU8OMmX1bMyni5qKDBnGu6qru5C2puWcA89Loh6Y4LsEmQcb+g26RFUH7gpo8L7Zgc2qD6t0cPCrWRCtmMUo02HNRIZ2IJJlKHKvfdgQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E7WonNGD; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E7WonNGD"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2c7e5f38a69so79578eec.1
        for <rust-for-linux@vger.kernel.org>; Thu, 02 Apr 2026 22:02:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775192549; cv=none;
        d=google.com; s=arc-20240605;
        b=VBYzP8m+DxzGAOBgXlrZZF7n4vjeFQAPnLFpyzFhTYnZx83TqapZoPoOxixkLNCpsM
         pMiatp28kZs0ek6V73ZHBc6iti1nbfSbiYLpTieOjJinDVni/vMTk6NXcI/jlCcEPHDC
         YPZoZMH3GEv3ZqWQ4f79t64dIAS+O/x3F50YVrZs0HV39l9yz2emG9vOW3ZIYLE+q/Bu
         ageCI7NFlsgQ3qKkig/4Ah3aDCkzW/I4JqmHo41UdgS845D14R/3ZkQ7PyX0DARDyIXR
         sdoAWZ0Afql9q8bs5LQrIlADdIIQEtk8wjOj0MQ+hTgC6A+etfgFQ2As/XJDyq8zRaWL
         SZQw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=VT5X+dKC6n3IqZ3uOSrTarCGYIJN54lVZ+LFd2nINF0=;
        fh=y+JxI+FQM/qJ4FjPEwBzVVrD1DVxtpvZZjt4UUfbzKU=;
        b=J9pFwXP6jy2YtuW1e4RTumY5K8HB3447k5G7Mo3//40CDhvEPHqyMo9harKbQFY26j
         WVpuly6Q0oMgoUAeqvHM1okbZafZCiazfv1UNxSyf0NMDbFnpCatF7E12ufXN/p/LRs8
         MOapqpb6Ckj3SgCGadtcbhUBUm3d9IhYnvGIsTGRiQe/48K6pG19IsBt23wTK6OUzJ3K
         fIUiWq9msa+PITcEy3aEkR/CcFgO6sV7BsgvovQOVhkrEvWlU1uGG2yS7wE27uqgwqEM
         VaS30yOoLSRup8MmAsrevtek5QVkEfyFCQHw+Ht3bLO/YDXUhzryWCcV+jAh+2IGjL/6
         ORuw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775192549; x=1775797349; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=VT5X+dKC6n3IqZ3uOSrTarCGYIJN54lVZ+LFd2nINF0=;
        b=E7WonNGDNs5TE6dWIbqAbXlSIIogm3biCdHvYgRFh77uvBxaMUMLJ3t6r0tOU9dkQY
         3qgKsH5zfeaVtn8jFmw3X7k6aFtYGHZvcIcT7WNQBJQDYUSlzjA7kSJW6Nk1IzD9uWaL
         8dSLV9J3oO4p23xbMTF4mMNgXKMmZb8D//4RG80qfdpUiJNaaAw53hsJXGuyNkt4BGa4
         GOemaGhGgBBr8xZ1ZENioHCOp0hAeuL3Qr6JESw34Is03aYNMx4E1LMKf2t6n1fez/tM
         L01pv35RIr5qUhQjv9Ab2jOr0ciWGy23/X6BW4AMcclBM+kDDyNiFu+L0HDocuo48iAJ
         Z+iw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775192549; x=1775797349;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=VT5X+dKC6n3IqZ3uOSrTarCGYIJN54lVZ+LFd2nINF0=;
        b=Q37vcTUw7Ix+GuSxBVknf5yzYaQAPtI8ByAZFfHTdf0xp5jtSfEBCKXy1iboDwnf7m
         QnAnCOUMVwH35e4+53IkrICmMXukcRfuMd8bw4yFV3GEB75v2CDj2p2+an21MVxtXuu8
         ZUUoSNiou9xd0CZW3PffZMYa4PcIqAT4MCluhzuMgTdBbFr2So2VBz6kc5dw2/yMGpUi
         gW6ytC6xvK0lAijmZpWZewHtSjpzH2OQHbcRP6HmNTHKp0BdrvldcaDq50srwuP5aPav
         hKVij0225Rrvp506496JtU22tT44k+AXBfCC2CeCGfE17PqRrKsBH1ixsVPcdVCaSqHl
         Rcyw==
X-Forwarded-Encrypted: i=1; AJvYcCU9Q0XAuRZB9f88EQ6IdhZj7InT9Ib/t99lJJqlJd0nGOWhKwt7Ti/D6JtuiYYf+WdOxHVmwDA2XpmdiLMLEA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5ZWlDwzcwE/ArE/odC1xHSMjU/10GMj/m2Y61+tUKwsloIsbQ
	9w+r1mgtJKIGWPcJMKsexhVxliOJbmEyREh75wX6oAJLCVx9VbpMA4/kzLCQ1IfoIMNL+xiWnFX
	TrM0kbypqoO+3M6BHGzuNUXdWaVkU1Ec=
X-Gm-Gg: AeBDietCb+SLQuUhBIpwkJcM8wQ8J9JPrNxcPN43aS4jno0qAk8cIKyOoLPNZ2L03gI
	nZlOJ8BQcsAYAhLMCdGwsI+m9HTisJcD1lEKmOiV1uuNcME0krAlzKhOe35GByql/VwSn+07g/b
	NmbZcZiprtOw2+utp2seobION4djhK2ZR2SQG2315sRlUgJqvrCUERRYI3c2+A0QnUDjfFBMoxE
	r8mwkUmdOAdoeiXfbgVb1Lx09//ArvA6VO+g9rY1QnvQ9HTYX6bsDtwNbfwwu/lXjRywhVVhBR+
	BQYWm8NyRICB3pn2V22hVcnYmOv6aI9DpHn1xisBxf+oUxqV0FCsXuvoOG5HFqatWJjtK7hRU5R
	DL9xBOL38WXOgHKKtL1QALcA=
X-Received: by 2002:a05:693c:414e:10b0:2cc:5eb3:1bef with SMTP id
 5a478bee46e88-2cc5eb33392mr93762eec.8.1775192548678; Thu, 02 Apr 2026
 22:02:28 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260331-autofdo-v2-1-eb5c5964820d@google.com>
In-Reply-To: <20260331-autofdo-v2-1-eb5c5964820d@google.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 3 Apr 2026 07:02:15 +0200
X-Gm-Features: AQROBzCLkIhzg9zAkotab4uQuB7e2H78CnQz7FhuaVKW1iyHFMCBt1gLFYLInDY
Message-ID: <CANiq72nLAqkMbiNcExVnYZxLN1g7tr4EZpUj_pwvWrjR+zaoLA@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: rust: add AutoFDO support
To: Alice Ryhl <aliceryhl@google.com>
Cc: Rong Xu <xur@google.com>, Han Shen <shenhan@google.com>, 
	Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Matthew Maurer <mmaurer@google.com>, 
	linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 12:58=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> =
wrote:
>
> This patch enables AutoFDO build support for Rust code within the Linux
> kernel. This allows Rust code to be profiled and optimized based on the
> profile.
>
> The RUSTFLAGS variable was suffixed with *_AUTOFDO_CLANG to match the
> naming of the config option, which is called CONFIG_AUTOFDO_CLANG.
>
> This implementation has been verified in Android, first by inspecting
> the object files and confirming that they look correct. After that,
> it was verified as below:
>
> 1. Running the binderAddInts benchmark [1] with Rust Binder built as
>    rust_binder.ko module, using a Pixel 9 Pro.
> 2. Collecting a profile on an Pixel 10 Pro XL using the app-launch
>    benchmark, which starts different apps many times, on a device with
>    Rust Binder as a built-in kernel module. (C Binder was not present on
>    the device.)
> 3. Using the collected profile, run the binderAddInts benchmark again
>    with Rust Binder built both as a rust_binder.ko module, and as a
>    built-in kernel module.
> 4. In both cases, Rust Binder without AutoFDO was approximately 13%
>    slower than the AutoFDO optimized version. Built-in vs .ko did not
>    make a measurable performance difference.
>
> All of the above was verified in conjuction with my helpers inlining
> series [2], which confirmed that this worked correctly for helpers too
> once [3] was fixed in the helpers inlining series.
>
> Link: https://android.googlesource.com/platform/system/extras/+/920f089/t=
ests/binder/benchmarks/binderAddInts.cpp [1]
> Link: https://lore.kernel.org/r/20260203-inline-helpers-v2-0-beb8547a03c9=
@google.com [2]
> Link: https://lore.kernel.org/r/aasPsbMEsX6iGUl8@google.com [3]
> Reviewed-by: Rong Xu <xur@google.com>
> Reviewed-by: Gary Guo <gary@garyguo.net>
> Tested-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Alice Ryhl <aliceryhl@google.com>

If Rong/Han or Kbuild want to pick this up, then:

Acked-by: Miguel Ojeda <ojeda@kernel.org>

Otherwise, please let me know -- thanks!

Cheers,
Miguel
