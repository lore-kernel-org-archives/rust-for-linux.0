Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56E0836E49F
	for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 17:25:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.173
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774805134; cv=pass; b=A17WnellJHJgmWcoXNykRp+M222DG/flIjtDQdfreijTipZvXQlixETio07IC9Uglk+OX2HXAitEc1PBJDbLJYSQnJPX2oX8Ghqgp6zc7UA5m+X3oe//6jIE9ZADCZDyDO38vx3DHh/7OuEev3wGpuzgnEDtfJC/GLryCjiqDH8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774805134; c=relaxed/simple;
	bh=m73sMPU/MK8TcaIfCM99MvJ82w8RMhahKVUOa4N7v7c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ahvl5C6oH4TuATUDY76haDmQvjr6IAeiIgFzt/O0O2ABgLaiUWVW5bGNDz85J7hgrOVe35R8E94RQnim8ThDMp30DJCo3zq+6vwtv+FtVr1MNgVnskJawRd3kTlEPu0gxlWzTfKRS0F97jI0DoW0rhr5b1FOpZVWdrplMGOrZ8Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V1fdFJJr; arc=pass smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V1fdFJJr"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2bda3b4318dso278076eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 29 Mar 2026 10:25:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774805132; cv=none;
        d=google.com; s=arc-20240605;
        b=O7fMSfP3kCik4BjN77LwW1S4UeN3NLSqrCrYhw3aRy3GPaQdzQGYv7jq/e2mRpPTIk
         3A1pNsVBVQfzV1cLb1/JCkYiOf+Pesxdn6ApOBv6Umub68rP69Nt7uDsqhlWl/3moBP7
         CFlyvImoFWoINj4oH6zRl5xXeG5YWU49Ae61iOuuJeJfkMmr9hOwKInCzDH4DWvjxNWp
         tLWIEidHDHd1udWV++C4V/0MfE7bUh+vp649ZTEWbi+8OjAgo/77LuajxOj2vVP8FvSp
         FuNWqU1HOI0lopMMxHlQwKBN7KdX1sX8VnxnzhZcZYBgmgZmsxyJr6HJlteoGOHhSxBF
         AAGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=fVO7p1WTgSqxLyUmITHRrLptk/HqH6c7TYNfvg3jMD4=;
        fh=s2dJuhEnPp0PivGGtpBeFJAypVDSdi8FkEUzccGGl9g=;
        b=L5STtryeeCmsfeNaxjDIfO+Vblv6mBNy0WZAx49L/PfThnhBercQUBmTf1jHWTTXlE
         weMGIaRHf/DUGxRFJb1oEwkvclkE7bC+AYf7TyLxTCVh1m1jVGXdTHSADzYDxkQu7x8m
         SBuAYgwjwN6LusKBuBJPHspcHmMU+mONi1wY/6I8s1OCIXTZrVsT3U48aeUuLdGnozes
         MUBQlzsr9T6BoEMIw5TP6xn8lfZGO/9unOJIJYIm1mKTCya2JEtFRpfyebLvGgkln+CG
         wfOqFS3l1mDlCVTrq2YXMR4v/cNI4lUSrUWmQncAjVkftAMsX9nKHPX5BgUQo9dtplHH
         K/tg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774805132; x=1775409932; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fVO7p1WTgSqxLyUmITHRrLptk/HqH6c7TYNfvg3jMD4=;
        b=V1fdFJJr7PFKjkRNIRGnIFfif1PJB/asKfCuPOaI+/3RQK6BDBoUnK5K/xBXdUgvLV
         yf4E687qidWAllYQZmJeZq50WEoK7ZPaZ2TJzwctKquzbmqB5Y3y4PVq0pLrJ3iPBCAa
         2TM/Qxz48bIDXJr2GiGCERDieDYkiDUGenlOyJ0X/2Gm1p6H/IJZeYvHHjdD0BV2kf7n
         3o7FwIA283id7irT0fouqag0olyiEtA9IntmrS7Fjx5rLSCi7mfBk6tvTamIlQRXI6Wp
         f1vGuXZpYm/6VuIg/nmsSFjtt4aUV5LxQzXQWz3eM06afVF7qfaBi64gI7OtGHatVnrU
         xi7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774805132; x=1775409932;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=fVO7p1WTgSqxLyUmITHRrLptk/HqH6c7TYNfvg3jMD4=;
        b=Q2FaHA0Zmuc5KHYsxnVteHYO9wmfGNB/V//wbZQy9XfD9SJ5bhsBNBLHASeSreXUlX
         Ga+7J63nLCdLhR5nDkjTbQRpeZtxO/60iEYYJJfuOqhDmw41ywVgumr21cECeXjTQspw
         JHFgof8jYpZcruYPloo0jNjDhqB49CQ5gpSpYBDeF/f5HVrEWj5KsRsd8qxUmitcpQbn
         8J40LNx7bgBsu0lcpCpuoH6QoTkWUdhiZjen/YM8Wly3WZmpLSMHmhvfnj4c+3DI2B7T
         uxJC9jA6RcjDVKEXTOwe3ePXMaCRFeyrUs1XQ6988uWNCeeW8Nc6BLTxWOKMXTmDzNF7
         dRhQ==
X-Forwarded-Encrypted: i=1; AJvYcCUF0Y8dDSw5Nz9zYMfCFKwq6zqs4bOzBj+p7KEriVWmpOBba9qz3TnizYxeLi8lHdBG8flAl0vhi/72xK6RZg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzUzTbeLopIokY54tUzwqS6EXfV/0q0quwwmhRkmWnkJWoAKFzx
	r9vtGVT+2QREZCIRG1bnwgL0rwKv3DXIUkAdJYTaRUvs5XV2RqbEZAs4y1hUDvfMAaFvo6JJd/k
	KSvgfcFdZ/eUoCs0IPeT9xza0FQuTtjw=
X-Gm-Gg: ATEYQzxCwjf1ww2crIR5SxbYdpGDMTwVdcFW1dP2zmqkMRVmDaaPLGryz8HAxFkH9Xq
	OzYS+ElpXBba+HNY4y6aGp1Rh/HLzx9Vj3DW33X0Vp/dhiH3Tm0fsDHVK4CXFD/WUg/E0AWR0DU
	7PxGBmriESN4L2RUcBzXTyxgOQoPp9wkeU2ZxIvE8xvm/Yn5MaKMIBH7/6s/bhtwUNsVq1IVUcK
	Q0k0pyc+eOx1UMU/YW8BAL7TLAEA5ngrIX/Jlg9QCSco4cV+8gWiJM+pNCjxGJiy480ACiTfDhJ
	XLGu2FsXBEhOv39aZ7l20X1nf/t2ABcwFsFK4y57gt4nkdW2mOMsAeXX/h9w4wW7wbdXCX3hsKx
	IbMhKavM0DOQIHgKCGF6dQDo=
X-Received: by 2002:a05:7300:f794:b0:2c5:704f:7157 with SMTP id
 5a478bee46e88-2c5704f7c1amr330279eec.2.1774805132331; Sun, 29 Mar 2026
 10:25:32 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260329160254.2592207-1-mkchauras@gmail.com> <20260329160254.2592207-2-mkchauras@gmail.com>
In-Reply-To: <20260329160254.2592207-2-mkchauras@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 29 Mar 2026 19:25:19 +0200
X-Gm-Features: AQROBzB_vNGuEdtdw3_y_LDGeOkv1V58X3XWTcOv9g2aVEsFJXa9tLMh2e_XwSY
Message-ID: <CANiq72nxgwPUv1AJhRQSFNWtV+w_a-VqK3VWtjaKncRJkNNETw@mail.gmail.com>
Subject: Re: [PATCH V7 1/4] rust: Fix a race condition in Makefile
To: "Mukesh Kumar Chaurasiya (IBM)" <mkchauras@gmail.com>
Cc: maddy@linux.ibm.com, mpe@ellerman.id.au, npiggin@gmail.com, 
	chleroy@kernel.org, peterz@infradead.org, jpoimboe@kernel.org, 
	jbaron@akamai.com, aliceryhl@google.com, rostedt@goodmis.org, ardb@kernel.org, 
	ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	tmgross@umich.edu, dakr@kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 29, 2026 at 6:03=E2=80=AFPM Mukesh Kumar Chaurasiya (IBM)
<mkchauras@gmail.com> wrote:
>
> When compiling with -j1 flag in powerpc, the libproc_macro finds the
> libcore.rmeta both in toolchain and local rust directory. libproc_macro
> should use the toolchain provided libcore.rmeta.

By toolchain, do you mean the sysroot one or something else?

We should make it such that `rustc` does not try to use them to begin
with, e.g. we added `--sysroot=3D/dev/null` to prevent that in the past,
please see:

  71479eee9da8 ("rust: Suppress searching builtin sysroot")

In other words, we should try to avoid adding dependencies (even if
order-only) to workaround the issue, but instead we should get rid of
the root issue.

Otherwise, after a build, if we rebuild only one of them, wouldn't it
find again both? i.e. this is not really a "race condition".

From the original message, I see this was happening when building the
host libraries, because the targets happen to match, i.e. you are
doing a native build on powerpc, right?

Perhaps we could put the host `.rmeta`s separately, or something like that.

Thanks!

Cheers,
Miguel
