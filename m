Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9107B378D9F
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 17:45:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633559; cv=pass; b=LD1Y6JNIAkay1jNOp5Ypj3xpgY1L+6P3J4vTNLW+TriDSANIIUPD+3BPx4nCDn9Fa3ZdAPkRauJoq6aGiwGkUHgIsEdo6rVbfiiHf6CjATOHEc2R+Vn8Vm69nf8p7QDgkwNFe01KSqHD2TdBkR5yUL2gX9gNDiVTS0Wbu3iy5bY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633559; c=relaxed/simple;
	bh=m6hW95/C3ET1V9mEwYcyKNAogg+hpF0krbdZ9S9hmMw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Xf7Ejsu5U2iBXMkgSTx6gXwY9Xm946wppC4iyEOn0bpviNx8ZxED6tdB0PKXH1ZyYDzA5op6iRexMJFIdOUDuADhmPd2Zvx1qzhZjulYPO91quyi5FjxF/GkIpyeNdeY1Z4j7+tnKcvK2MlU5FfSNww1brmTuIU02fBwR1sJVbA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RdOTT6AH; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RdOTT6AH"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-1277863a912so328027c88.0
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 10:45:58 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774633558; cv=none;
        d=google.com; s=arc-20240605;
        b=B0MTcqTyl5qGtgi6cUXaQjlynWoYub4zNfgjzCXoZX/LPUs1cPqJUPlbwtCIOmQq/D
         q+SvM062/fE3Loq9JUkwFpyFatj3xUraCrO9VFfgd1eALBfpnT50YfC7ZCSoIo85p/it
         ah41GGrZuuvT7argRpyWuzHjvPKmGvMMsocEvywH1d0REt8s+7QFnr003ouwbbvA6n9W
         54/Nvn6RNK59eQoImKIMeh/xphuG/N9MfgTZPEdhuXrlDQDgDUY25307ENWW2YxaGHhB
         Zlh/yeXdug1bs3TDTP4kLiF+MG3C/3IDLixLM/h2uxTSZiHgCRpm3E9vy6SSp1EnG2tO
         b4rg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m6hW95/C3ET1V9mEwYcyKNAogg+hpF0krbdZ9S9hmMw=;
        fh=7AguREeBSb+vhlEkQ9Zi6EyCAUliFvSp31xJgOpqmaM=;
        b=TKtlC8RHM3VCh4eGtTQjjEkH/5mmkve7pV7j3fbgHflhO8S5URVbwkVhgzq/mj9sMV
         nWeiDvsLg0EPPiaTwUdwr++wIh4fWY+PFXkSp18ZE7tCIUyAFno6SsgH5pbXxih43ru3
         m6IYMdRNySVYWAmJSj/IJTXnmDiuuT4bxPY57aSR/LhWRYq3YHkk6jXw8K0LqYFdZAeh
         n6k6doKGH0/DL4pUyiep6143dx3G0PPE14ZV2OfqoZ7BZubEq5fx6fAHxk4cYYr465s7
         cS2YhT6elSW7BO79Ksr4HyVmdyuVLy/3dKK976NO2mbmigQ0s5z4iid/LcWv4PwGJ8pN
         b8eA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774633558; x=1775238358; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m6hW95/C3ET1V9mEwYcyKNAogg+hpF0krbdZ9S9hmMw=;
        b=RdOTT6AHvnrolfFcvWDh2iQzspgRJYxk+7Qp0EQ+q+vdAQ8/GCP4oJG0bvmHmfBx/F
         pH+USxFfAT26792b/CLvv8lTIDlrQEuFoZZ/Hyqc/Hxe/qJZeBdVO5XdVDTiyirXY1mj
         BvEhSOgzVpi0KjjKNVKuysIxsNiTA4LnFtAYeKk0+Hp1jmmRd7eU1ENFgnFdCPmIdHyU
         UZVknEuL7cb6C/t4A4xafLFoc0flwFBGnC12icxbA8A/jN4mYmqiJDhTCj33Axk4CYnu
         s+q+UNDvBYtivT2i21GDYN3JX4I6K1WXw1VjkVvyqW0zGcqXlvTRidWNw2jeLgcXc571
         NJTA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774633558; x=1775238358;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m6hW95/C3ET1V9mEwYcyKNAogg+hpF0krbdZ9S9hmMw=;
        b=Jh3whTiq2DAGMGXVNh/e16Ry3dryfgZ+y9FpIzHaS04dCj45Jow5k0G/y+rwYn2vqj
         guLvB3VY4o4KCrW/UhaWalK6skV/wEB+BgVQDy6LCbYucY2pUtisw8apwDZGrwxbKE7L
         ViNiNkavZnf8gwMRwB/trLc1b7KhoM+R+HiZxaYz21wEIdYUwYif+1ye5q/EVyfsu320
         KOOVZDMd7M2/sVNfJhjC+BFTDkYwBQW+nnx4ylGMe3OxWgeo8899HlTcdO1pFXtvyLQC
         1k7ln4yHvh6tlPN65dUfLb470cI0epvUbGGW8TZriXuVCw3vPojCB9uqGJfCI2EArRcK
         0kaw==
X-Forwarded-Encrypted: i=1; AJvYcCXodL7vmmeMBQQ/SK/847vk6tCMN3Q+hM657W4Sniz2ISgPpyvN1UkFLHspbed+AcBrj1uJpn+yrUIJsHp93Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrWOG8zRTxiy4DtNBuKr5pqi/PFDyUt6iT27hMR/NIeby/JZ7v
	wZjiWGvQ8xapUBS/s8WnhkLhDjLqCuc06mS3hfM9Gc7+CWW9/Ni5uOvzcaykEcNFtuJpF5YfQWx
	VVEuI5HYqInMr2iVOTfXTulXZWmYNkW8=
X-Gm-Gg: ATEYQzxVdN3ybMnfldqpO3ho4ctfMsqvygKbU4BDmnFsdkQC6lhm+A+2B0T/rJnZv/2
	2RKaVbQ/5+zOANN33sdMKbSMIveSrhw86sc7hXvt995JVMmea1auVDNiRuKR7V8J7aFbNsgd0Xw
	EI0mqPcvPqiiGQlsdZjoj6xDezlZEwKYxp1so7fva+9GLsqq1O8u7SvMy4F2vFtvi8vrX8E6QPA
	hQ2Txhut8DrGT/anUFsqmzkOugqH1hHEYxMaiIgwVw/IvhleMSvYXu9/bboh+Yqqu4LzRBe7VPm
	7WMCeyrsKqTuJYszYybgq6Zq8fh0dCB6mIU7piYhLNKfVxmat4kGHSYjwZhJlp45yN8oNHpu2p/
	SqrGFHMTgscNr8eNBwJEj8dk=
X-Received: by 2002:a05:7300:80ca:b0:2c0:d9be:eb09 with SMTP id
 5a478bee46e88-2c185a57557mr875171eec.0.1774633557661; Fri, 27 Mar 2026
 10:45:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260327114741.91500-1-pilgrimtao@gmail.com> <20260327114741.91500-3-pilgrimtao@gmail.com>
In-Reply-To: <20260327114741.91500-3-pilgrimtao@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 18:45:45 +0100
X-Gm-Features: AQROBzB5tJkP8M6dPCGpMeaOv63a95dhaN59p5xt7LwFdgRiK0mSmaXLq6iSY1Q
Message-ID: <CANiq72nFSyKSUcRJL-uME7QsvS-4aaNN2nVp44W49Q6VZhCJJQ@mail.gmail.com>
Subject: Re: [RFC 2/2] tools/ufq_iosched: add BPF example scheduler and build scaffolding
To: Chengkaitao <pilgrimtao@gmail.com>
Cc: axboe@kernel.dk, pjw@kernel.org, palmer@dabbelt.com, aou@eecs.berkeley.edu, 
	alex@ghiti.fr, ojeda@kernel.org, boqun@kernel.org, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, lossin@kernel.org, a.hindborg@kernel.org, 
	aliceryhl@google.com, tmgross@umich.edu, dakr@kernel.org, nathan@kernel.org, 
	nick.desaulniers+lkml@gmail.com, morbo@google.com, justinstitt@google.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, rust-for-linux@vger.kernel.org, 
	bpf@vger.kernel.org, llvm@lists.linux.dev, 
	Kaitao Cheng <chengkaitao@kylinos.cn>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 12:48=E2=80=AFPM Chengkaitao <pilgrimtao@gmail.com>=
 wrote:
>
> +3. rust >=3D 1.70.0
> +
> +Rust schedulers uses features present in the rust toolchain >=3D 1.70.0.=
 You
> +should be able to use the stable build from rustup, but if that doesn't
> +work, try using the rustup nightly build.

[ I have no context on this patch series, but since the filter Cc the
Rust for Linux mailing list due to the Rust keyword (I imagine), I
guess I will take the chance to ask. ]

Is there a reason to have a different minimum than the Rust global one?

Currently it is Rust 1.78.0, and soon (this cycle) will be Rust
1.85.0, so that should be fine for you. The plan is to follow Debian
Stable's Rust toolchain.

In addition, you mention nightly -- why someone would need nightly?
i.e. you offer a Rust 1.70.0 minimum, which is 3 years old, but then
right after you mention Rust nightly, which is essentially 1 day old.
So it is a huge contrast, not to mention the availability of unstable
features in nightly. Do you mean sometimes you may need unstable
features?

Thanks!

Cheers,
Miguel
