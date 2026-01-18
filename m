Received: from mail-dl1-f49.google.com (mail-dl1-f49.google.com [74.125.82.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB04423EAB7
	for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 19:43:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768765405; cv=pass; b=pk8NxZcWE78EadDgnUUGeJr/5vdTuRz4tjN7lFRl0KSk7kzNPu5WFAOt2FaOo9u3xV6tWzAUfuas0CThjK6CB2hpwEDD7NcOELMPQAtUpkY/7RLnqY0w3cQWorzJiA88loPnXbN4t9yWbWX+h7E5LCKLkPvuUx14mynF56k2tRw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768765405; c=relaxed/simple;
	bh=nQpSK1jhoj1ixzRBBHG4I4mMZc+hix9T7+kxBl0su/Y=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Zo6hX0Yxko3vtpriJNdM6lEzx9HSrlZtoz7SrB+lCevd+fqUHodOLf01BOrqrGaSQiEPk+RRCwoQiL4WJzCsTjix/XD2DSVk04jQSDV5w4WiHDtb55FL0hh9IIAGCgNFW7SpxL3Df407ZbI8QPxV8W5X9aaZpXjCdN9po0EdjAo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NGafUPNG; arc=pass smtp.client-ip=74.125.82.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NGafUPNG"
Received: by mail-dl1-f49.google.com with SMTP id a92af1059eb24-1232de2e2c6so101383c88.0
        for <rust-for-linux@vger.kernel.org>; Sun, 18 Jan 2026 11:43:24 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768765404; cv=none;
        d=google.com; s=arc-20240605;
        b=DVNFc6m4FFa7P+G2wJ4nE6X+cQr3prnqC1g41tFM5mxIbqCMEQSM/aforeIZDFsTLo
         sItbha7KfcomNvXOPWh9cY6oAAnWxgJ3X2Zfc/bWKVdWa6uKV65pv5cmoSy4dM8fSZku
         2Lpr8hZyng+x+TbohT7bG4FzrBYXuVIBmts0wIv1LleJXPpiik4Ts5mx8VU7Anx0nQEK
         37XCtLBEWuF8hRxVOrZpE4Z2jSRcs4s1dRfir5YNYcQUUhoIdW6ypFfFu9nsLWWOTnUy
         /EUHFdu/DIVcTi7/06vmXHU7tVgmD4mh5OjMKSC170H2LCtsskYG/j1iPeZc1TtNL/Y+
         jZoA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=lcP5qtKRpIwfP877F6cFp0+F/gBJxn7DM0tE1zeA5l4=;
        fh=DuUXJv4j4u2iwLDmgghaPimUpUUPOuLdyT2Lt1Q45e4=;
        b=gguIgGtn0E4RKycSyRa7rt0VP8GJXxEA22wU4L8t6wEgFhy8PcmDdyZgZ2V1m1jEjq
         kel9548jBTvZBZbx//0OCiD90aKjshE+pWgPUJS/IiKhV7H2wZzSB3sabkx8fu5fAVnh
         n++hjbgfj8ZexciJX3atoFnyeDkPJlmfUnLaHwSLiyY2xYoWUgbKuz9Rc/xLV0RV+9AA
         saKiehmZrObOzDaw9kGP2DD90Ok+NnAmq8823b3PQvs/+Vq6asPTBGv8I/BJ2rugR35i
         5gOgZwIT9s3ST9WSGnqPBVeg1PyddOgPnuvdI/09h8Blprg42R8PBgnDl0u0IPqwab9i
         9Hrg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768765404; x=1769370204; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lcP5qtKRpIwfP877F6cFp0+F/gBJxn7DM0tE1zeA5l4=;
        b=NGafUPNGMpwkTeeHncrQPffr1QvogENk19nqAcaM7BwF9RMkgkksn0ge8Pf1U25ozE
         sOT3XiEryRgnG+DuQ+6RGNCcRQIhhmpQZrTp97kUSONyxMA7X82gdVPZb2MkV29coagF
         lc9wUJRK0+Syl1mvsIswYB79KxTvOTx0+FcDQLAEdO3O0XsuA2F2FAj+AWSy5K8KqdqZ
         5Lq3eLmPdsqwddwmElR4KyF7p1pn5VYrJbhz8gu7MZMMq3eV9fc7jA6QfRZ6yWzWTmHk
         oIiSOQA57UI+79KwY0obHQe3PrReRlCVOvGmJmc5tUWiE7zLd1yxniry4FpfTLW8S0tZ
         PunA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768765404; x=1769370204;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lcP5qtKRpIwfP877F6cFp0+F/gBJxn7DM0tE1zeA5l4=;
        b=Q8WG88x5k4qPFMccHR/EaHF2tzCOHUVjqRbb8da+T5KvVMY2aPSrmBo56xdMLe8ymc
         kYw27C9ioxyAQdfZ3AehE+844ZAbNamD7vU6u4UuN3KnPBTTSLH9iPkXwzpuyShYbAAw
         lIIWoPuF/bZtjepEtdnd7VS29Q+tgQB4esF4EwFrRWXNkwv/+VXybJfJvJdfvgBj+3Fd
         R9SRLHD5r7tnD2OuiaCqR7H8z8LteiIDE0wHeobo6/jiyb5ZzIQyJMp/cPKCH4tbpY1A
         sRmKYHYRzFo5quxk7I7sBO6duIAZkTAAcy7IXMqJEabZ2A+bgI4+l5virs35ZrQFAx24
         Mnxw==
X-Forwarded-Encrypted: i=1; AJvYcCWwpnieztauylafBzDFSt+fwNpKYbOG3B46WHo2n7nugKGtkdc7B3vVh9lKkip4qzWI8qYYd3r1+X41kOu4Aw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwjXqJp2WqT1MualmDwFMghWvJF2N77llmVL/XmWfniRmyIaym6
	j8GtITDVJ6/MRzjQkV8vulWo+umeE7lq/4Zxog6AR0eeL215c5kQRXhCEN10tKrxT9cfN4Hf7A2
	xmiEz2CNMQak3EXqb25RpLAmw4YaZl70i2tfz
X-Gm-Gg: AY/fxX6jr2arMEg6iR/sMaLt5ELJPIPGTZOcUymn97NfrnJMKIGF0Gf5dzcTv4scrPq
	5Cmww9nmaLgITs2o2hAgq+SfO9qXfFQiT2KPsIiizrVfCcV7JvNxZDrtvXbMs8Wf2MTRLcArbEP
	xRSbF3KWURBC6eweAJPDiXmkKlKOUAiVJs44awoxrMRQu+M6rgl6dW19XHClGZjmnJ9ZZOulf2k
	cSYqUZBU7z1IbaKUP2iov/+acdArH9j683xoj+yp4F4txhcJrN3+7+9HSSEM7JIipwtCjN9ZH95
	DXA7G1wKTYF+V9QcbkHK+8LMygJ8RQNqqgWqEdv76FGIuEDJtMNUgmfpaHYxXD/S7iPECl9BE0g
	w5ORp64jblv8R
X-Received: by 2002:a05:7301:3e0b:b0:2ab:ca55:89cb with SMTP id
 5a478bee46e88-2b6b40dd0a5mr3450844eec.6.1768765403686; Sun, 18 Jan 2026
 11:43:23 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224135343.32476-1-work@onurozkan.dev>
In-Reply-To: <20251224135343.32476-1-work@onurozkan.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 18 Jan 2026 20:43:11 +0100
X-Gm-Features: AZwV_Qg43hRAQ1pNM4R2GwRpygO8U0lz21Jjm5D1gBu80tjVeKKNS6jB5hsvFVU
Message-ID: <CANiq72n9K9EG4yiCUnZe0_Po881PA+=Qt6y07-9mtPeuac9fPg@mail.gmail.com>
Subject: Re: [PATCH] remove sysroot assertion in generate_rust_analyzer.py
To: =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>
Cc: llvm@lists.linux.dev, ojeda@kernel.org, boqun.feng@gmail.com, 
	gary@garyguo.net, bjorn3_gh@protonmail.com, lossin@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu, 
	dakr@kernel.org, rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Dec 24, 2025 at 2:54=E2=80=AFPM Onur =C3=96zkan <work@onurozkan.dev=
> wrote:
>
> With nixpkgs's rustc, rust-src component is not bundled
> with the compiler by default and is instead provided from
> a separate store path, so this assumption does not hold.
>
> The assertion assumes these paths are in the same location
> which causes `make LLVM=3D1 rust-analyzer` to fail on NixOS.
>
> Link: https://rust-for-linux.zulipchat.com/#narrow/stream/x/topic/x/near/=
565284250
> Signed-off-by: Onur =C3=96zkan <work@onurozkan.dev>

Applied to `rust-fixes` -- thanks everyone!

    Fixes: fe992163575b ("rust: Support latest version of `rust-analyzer`")
    Cc: stable@vger.kernel.org

    [ Reworded title. - Miguel ]

Cheers,
Miguel
