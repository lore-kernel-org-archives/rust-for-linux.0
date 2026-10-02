Received: from mail-dy2-f41.google.com (mail-dy2-f41.google.com [74.125.229.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE287415F06
	for <rust-for-linux@vger.kernel.org>; Fri,  2 Oct 2026 07:08:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.41
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790924921; cv=pass; b=JV6ngh5niSEXClT50ufQ8z7S9CCCdk/GAhu7vW4gWAp+mo5FqW4S9FRrlAVofvDqgP4X02lRGYIiSuDs3KebeTf2QrPDk+OQZbvxy3TdCQ2uwwTE6MGZlYSEYBKlbMWX2PmsFN3hPmysJl8HcF1hFiHWhVEXKmqusrO14INlIRE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790924921; c=relaxed/simple;
	bh=U5cQARyaWZkHef4krbtaBB6amM6mVxw3dWFsEzGJgW4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=bIdZrpQC0/asmcL5Oo3+YzLbUjNwTdifYk/GP90euQ6MDu1XSxCpsND5opmfjcje6JiX8jVdZh3VAn76f/FlEomxc+v4iSprLGHBXCalxbXslZngAP3FpcH6iYrBq0/F3aB5jPIEpuavpLTrnCXTEBoz9fi5Ka1W+PM+2cBZPsc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YlFiO0iT; arc=pass smtp.client-ip=74.125.229.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YlFiO0iT"
Received: by mail-dy2-f41.google.com with SMTP id 5a478bee46e88-34c99260bd9so307774eec.1
        for <rust-for-linux@vger.kernel.org>; Fri, 02 Oct 2026 00:08:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790924919; cv=none;
        d=google.com; s=arc-20260327;
        b=ktQDb1uFH/nCpGZLewlqrn0WgaL1X0HfQ+Tx/1DOW3jtEgOmRDOJb7WhY9F5ruiQ4e
         cm+HgZ6N3yKgg+Q9d9DafY1ElkgnsqJabna0p3E3mMIxMAdDkPhvgzKmIeIng31uynF0
         pI9pIP0kYmGT7o00VSa8Sk83AnBnF+4eQSzJ51pFjiybY69/lQ6lMaG0oOYi+Cex7dQi
         CdZ8kzkUXSAPhYVnM05t0BwCGcwwAstZjDmUp8LbxYlDzb9Jm6WGbMwwBYm0XOYYkac/
         6ElxE3MXAb01fUPkvhUwEe6T75I6gxaekeSM2+0Jojgp+qg33IB37V4Fwx3IFNuyJvUW
         Z1bw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=U5cQARyaWZkHef4krbtaBB6amM6mVxw3dWFsEzGJgW4=;
        fh=I1BD+wQsxqwDXRpQm1JiP1EFvpV8/EdraMk7GIROdxo=;
        b=jJqy4mjtl6SisejO2obhS9qa4orBawhJt4Y786JeQjdsgbxXD/B/deIARCcu/mImM6
         KdmIpenSq1Q6tq4k3evZqErzn29yeddzVTpR0x0lqjunBq5hj44QPsAvtKmia/ieEvlT
         nnPPyZF2VhtRPyh0X1MdnX7ZDkzVJrsYmSi1aGRBj3ZEnrsBGBq/EVPIpLWA0oclJFU/
         MJzQ2a2I4R/tCvzVQZJBZAh+zji3haGCWFuzVSILNOLbVR/X9pRQJOtMdAm/NcTudzW+
         YruLd1GV90NounqPdGBEh1BJk/xTPPmRKbDCfGhCzUoF3YwwnaUD9GzLi0sLQkaWtXYF
         531g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790924919; x=1791529719; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=U5cQARyaWZkHef4krbtaBB6amM6mVxw3dWFsEzGJgW4=;
        b=YlFiO0iTofvOzy4ALaoFpFuKIZhVZZapKUrYo2f78KRnuCiISVS482eRh0PMsfs97X
         HvaWDFDulw6wrG8zFtolK4Y9k4PAT++d3cYtgBvAF634Bf9pFI/zNX3E+1FHNH3uBZvt
         6MhDP4DYrOR3Ct9F04wpyLhagYb9ldRhVkZLLMZ+9pJiYdlxb4svi5cp7DKS1Os/bukd
         UZtxtDfhzWs9xKxaiY8uTJmULKl/HzUOx6gz6znz3rr78bpKfvA4oMuS0E3eTPWv/iDQ
         OdGtCsstKkbVBktt5Fs0R5MDh7TwKMqiwBY2oeJjYLtvY2/CN/AtLPmnW18+s6tgo6+c
         SCCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790924919; x=1791529719;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=U5cQARyaWZkHef4krbtaBB6amM6mVxw3dWFsEzGJgW4=;
        b=T0jrL67WK+aFDIeh5PEz110o2ylS2uJUmWUnPpntZCIFrIal7vnwWc+tnrE3M/X+B1
         vggyH0o4aqpzrR9luzlBiBsFI3+yJBzTE+ya8xL7P6+YmvOXg2Qw1RN5jd7p+QZatHfh
         NNF177jiy/ly591evkC0RQZSUw3PGpaZJ8NxuZ1rKwEHPP8yb6JwxmlIALA+a5yJCA4R
         FnPkhbUqLnxRXH4/kRPYiirXs8VMM7ocd3Qz5cgIP7G/JRojB9MmOGXWbb5sMVQzqhrH
         YZaAcyYmCWCBRGP76JGXDWDy/t2mWusWpVfU6BPP3zDzFbovbKdgYjmUL6rGV8PbFKo1
         WABQ==
X-Forwarded-Encrypted: i=1; AKwUvBzln2/mlvmveApv2g6WYR2gGGJoT81P12yfT2f9V2h2i+BYmCGBFVwFR1wDUdEIrpteVjhT/8VX8TGRVT9vfw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIsaL3Q68hIoIeYDgA2NC1vvLQ5BEGKJh7MYRhFLjWZK88PJMA4
	2XqkBqc0cgXO5i3o9Yn5V2GgrMloT9OcN+qtEByHBpoOaQHauCFoHfBBajubw3g/ivjS6lsq+eA
	kw2FnRNjHfT5K0RgLPPtaPTofG+I8p3E=
X-Gm-Gg: AYBFou2vJqg9EBFS3T1OjUJiPysA1iOORyVpwm704Ci9+xKAjQsKcKNRKCGbwd3UNTu
	8xhmNYY8DxmURzt482bQt14A2FOZQqYX0Lbn3aya6eQ5smsm+rlfpCph6RpGNkrv8t/kSZZZs+w
	Ke6UOdWCrjpp6FCFR4wo6mX75rLXET2zze0GnBXZVcBZrPKrhzhrLVLM3uo7H5lgP2OllkS0g48
	uFvjWjzlihIwwfOY39Kl6eMgHZPTYPbnuAnlMR0Cs+gKcCdmIBDNG36Hc1U0Jnd9y4UdEcKPxWr
	wioxfao/8vLi8QBChN8W0Ic0JLniUA0RsBRNOztL70A9paOteWAVzGgiWFCHffhQjwh9bw0kEly
	RKqOC+d+AxIKMibK68RYMQDcfHkj6BZgfML4y7siwcIp8hAobaImyIrFh6KrPyINDQaFhX/kc4N
	Xg2DvFzPYbuTemTsobv/2MWl3Ff9Fhxe/o8AwYvZgCs3adrgqfK8U=
X-Received: by 2002:a05:7300:24c9:b0:343:fdea:9a0 with SMTP id
 5a478bee46e88-34f15028c8fmr3410119eec.2.1790924918693; Fri, 02 Oct 2026
 00:08:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260910170542.92010-1-gary@kernel.org>
In-Reply-To: <20260910170542.92010-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 2 Oct 2026 09:08:26 +0200
X-Gm-Features: AclHuK9UYZElY6zbzfH_vMUzN-_4vCGrMUQ8u1k44r0G3B-Ywr9v8m3eSYm-myw
Message-ID: <CANiq72kq1CKJR980mGJwE1GYZoXQ7Y7vcW8SQqmaFZAPWLSLzA@mail.gmail.com>
Subject: Re: [PATCH] rust: bitfield: remove unnecessary `#[allow]`
To: Gary Guo <gary@garyguo.net>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Yury Norov <yury.norov@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 10, 2026 at 7:05=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> From: Gary Guo <gary@garyguo.net>
>
> The `#[allow(non_camel_case_types)]` was there because register names can
> be commonly SCREAMING_CASE and thus not CamelCase. However, when a bitfie=
ld
> type is created by itself, this justification does not apply. Thus, remov=
e
> it.
>
> Users that want to use non-standard styles can add the `#[allow]`
> themselves. For example, the invocation of `bitfield!` inside `register!`
> macro carry this annotation.
>
> Signed-off-by: Gary Guo <gary@garyguo.net>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
