Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F060B23A11F
	for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 14:45:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736779547; cv=none; b=UV0ShYJ2CdXVMgZE6cS16VXu+rhV1/2QThD0lPi3lPmb/JOV0R93duO5k8CrxtPyjPFHJYI4dMJy93A/9ysfaTr98r5DGAXIIkiP8dXxYRI0TYQFO7QAmEpqgSgoWUjpVgZYjg1FvsQlB78PmuJCKDng5Mk2oy+lMmV9HR4Cj3A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736779547; c=relaxed/simple;
	bh=L3dWx2fu3uDTk1hiwYvwSYXPEanzTucViHMQlrsweiA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=KNG8y1JACityGldiR1VXqL/MjXlRIuvhZlerjp1fE5EDh45Pv+oHwJw8Se/kN4B8Z8vNzgBiwqoCR3NbvANtpgTS8xHMt0TyHGbSemPBQ9i/14qj5as+zCAEosJuaZUxAvTpAmzDriwNW4neClvvdO3B6sYoZA4Ip/2mcZZatoo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ij5y/4O3; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ij5y/4O3"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-2ef79243680so951824a91.2
        for <rust-for-linux@vger.kernel.org>; Mon, 13 Jan 2025 06:45:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736779545; x=1737384345; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RHaGJlcETCp+45zTwVK1Xr82pCTnu6PR0BAxmZjkhug=;
        b=Ij5y/4O3E2m3aWxSzuHLuDV4IUBwbEQUbFjeMbsXEDAE8I4n3uFTZTQaYBBtiMLAzu
         c5HfuwuiscQj60//Nm9pNmyVQLskL0sPz4C3Iz6IC7I/gj3E1QFcqiNFfF3IoksiJGIC
         xUFVoAD8nDYQv2F6zt8eWvmftct/IKTlbyiMDNiYrhJgqZqf8LQnnACrVYtCfweCKcAz
         vebwinPQBiv1QlD+UwAgjFVljsge2BTtlaxZwNSH9I+nbQ1/Ob83iNzlqynXTTbjBzUq
         mmx8FzGEWsRMToOAXDuK9jes68cGUau2PB5BUeBe0suiDGU2DIqrTd9eWiik9t3YFFQL
         pX/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736779545; x=1737384345;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RHaGJlcETCp+45zTwVK1Xr82pCTnu6PR0BAxmZjkhug=;
        b=l41RBXiT60TUamDLUSnIDz3fwAt6hxG9ZE07/JBNhv6qQv0xl/GNCijnz6yhuhmq5V
         7vAOMGT/mCO2SgdUqNwQnMTtYXiGgP3F+BBxqdbDqx8W1Fvxx0EEvM/5vjaHEFyeR4TP
         rX/diVTxkU2EfzcyM+Eml99EZmzQFl5PxVszkMpr245ifS+gJp8xmFdABprreW7hCLib
         QjuU7lToObaEvEmno51ZOm92DsYWdFvqiUV4Flgr/DhRDEc8XYstkAtO6arvdANK3Ak2
         73KZwqqsOMOfHbqVMH/OpphpdSrDnjAOU2DJQEaGzJiXwIYDv91+GNGYs9Em/Q3lcKnz
         rAnw==
X-Gm-Message-State: AOJu0YzA06f0cg4mYgrJ0Lx0Zk18maNmuqWOa1swnjagdVQS7odLex9B
	khPO3ke1oKromkFcBb1rC1t8EoYNfJxdTr6sAr0Q4kndd8e4056txX4EpsQzju1VgoKGSw8afo5
	iSOwNOnBhwPfjMVDeZDFmB0zMDp0=
X-Gm-Gg: ASbGncvyEQihnItnozxCKlfjJrbTXTmGgW2xMtS+GLyfQQuy89rOlhRva/JTvZLWIo5
	stUpmv9eyEqf2GhWYRVuMbqvxjjtEIavyn61fhA==
X-Google-Smtp-Source: AGHT+IFQZnJG1CrIam4soj0FrQSR9wj5YhlDdRNGONmw0S3BzC6bKUigbq7kkkIQrPXsVnC088BwkfU7bZOELxrFygg=
X-Received: by 2002:a17:90b:2b8f:b0:2ef:c419:6930 with SMTP id
 98e67ed59e1d1-2f5490dcd55mr11564157a91.6.1736779545205; Mon, 13 Jan 2025
 06:45:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH5fLggS+3K8WHV7mrgTJQhGZMNni5gj9=huQtezc4GK8bk4HA@mail.gmail.com>
 <20241203205050.679106-1-dingxiangfei2009@gmail.com> <20241203205050.679106-2-dingxiangfei2009@gmail.com>
In-Reply-To: <20241203205050.679106-2-dingxiangfei2009@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 13 Jan 2025 15:45:33 +0100
X-Gm-Features: AbW1kvYA7xsgaY-xAXgqQNjop7Gh2D25SAAtB9lkxz2-Z6qksjRYSfMo86PsHkA
Message-ID: <CANiq72mMR91cX5VAv4KVORQVArUsEOqEs=yuuhxsR_kUS91FaA@mail.gmail.com>
Subject: Re: [PATCH v2] rust: use derive(CoercePointee) on rustc >= 1.83.0
To: Xiangfei Ding <dingxiangfei2009@gmail.com>
Cc: rust-for-linux@vger.kernel.org, aliceryhl@google.com, ojeda@kernel.org, 
	dingxiangfei2009@protonmail.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 9:51=E2=80=AFPM Xiangfei Ding <dingxiangfei2009@gmai=
l.com> wrote:
>
> This patch makes this switch in such a way that the crate remains
> backward compatible with older Rust compiler versions,
> via the flag *RUST_COERCE_POINTEE*.

Applied to `rust-next` -- thanks everyone!

    [ Fixed version to 1.84. Renamed option to `RUSTC_HAS_COERCE_POINTEE`
      to match `CC_HAS_*` ones. Moved up new config option, closer to the
      `CC_HAS_*` ones. Simplified Kconfig line. Fixed typos and slightly
      reworded example and commit. Added Link to PR. - Miguel ]

Xiangfei: it was in the end 1.84.0, not 1.83.0, right? i.e. commit
fd36b3a4a8168 in upstream Rust (PR:
https://github.com/rust-lang/rust/pull/131284). I tested it and we
would get an error otherwise.

And, of course, please let me know if I made a huge mistake or if you
disagree with any of the changes above -- thanks!

(By the way, I thought about whether we could just use the version in
the Kconfig name, since it could potentially allow to reuse it for
other things. But I doubt we actually reuse much or at all, plus it
looks better with the feature name, plus ideally we will live in a
world where GCC Rust can build the kernel too, and thus we will want
to use actual features for things like this. So I kept the name you
proposed, with the tweak to make it more consistent to the CC ones.)

Cheers,
Miguel
