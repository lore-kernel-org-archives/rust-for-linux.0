Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 247AC4B95C1
	for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 19:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791833117; cv=pass; b=kCRT9an33aqAorl9hBY8YWl8jfdu1MKBGHMBYAqVZT0UsbZsgctqVz4MRavJ+Fy5Q037clZChb1vw6O/sE4TLFn5egU/dvnTJH77oNgwM6q4b9d4VA48qYy6iHp7v/f8YaJsHqsZe/kEUO9SdY30EWozfwU2PmDrATiDCIJ8ohA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791833117; c=relaxed/simple;
	bh=yDSpUhnuU5c/mZx/ipi9jv3/2siultKoiXhvFv8pW34=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=kMOeiE5cfoPf8kZM1HLtdhaB7WDBfF5D+iUZObUxBH3QgpTsxiQ1mFo7KQ240zCYrW+eUhwEIwU/+Xkz4oNGiV5EwjwZzlpxYjVpHllJpOlb0/IZB+to7GjxJ6gAbImKZ3XBo3PMLoWuoEmYjwVN9XojCV7LxTaNAcVY7H75tmw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=awdK40MV; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="awdK40MV"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3535aa147d8so142605eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 12 Oct 2026 12:25:16 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791833115; cv=none;
        d=google.com; s=arc-20260327;
        b=D9pHnuFg80K6MUQUJgY+12Sh4BdVcCwMdfY4UCUbNV6Wt9HRzGiykjPU7tIiwzOxwN
         3e1fzInSG40Gj4Zz0fvrSL48kbkmW8Hsd4wHb2bheRIzqYcTO++B/4SjuzPKB3LQW+Pk
         BfYRbVURFTOMdbAiY3ehgqNJSFI8l4Cmr90GzlZipwhNkLtKa5QIstnE3CkVbCTmBQt0
         w1ptEklnQulJhdoo0tl4Ya0pCU3eQn+UFRO72gypM//kLQjZ6/A9rKeEcRR+OoMKvTUZ
         gXRRdkq4KNNlro5kWIDRulJ3y9LHghXInlOeTjJ2gSb+yoqaOYymHa8tWUHZ6aBzmyUU
         eWYQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=cP/IMy/IkF4nvLd9S1eEPD25v1RZ1+mCGCjmCnmzoBw=;
        fh=h1kIvcel8VqVYqZssBauTxWuc/2CrJR/YtnenW6NDCA=;
        b=j8q6Hn2c+q8/X/fWGTe24hl4Ed0gTpimygrqgo+TAtDykd+XqgcS+KO4CfqAoVCFYa
         ol9aj8GgAzns12JNhImA12opeA8LEU8NPMl6Vi4vvfivhyyIvmqxsqOZN6pHbO6fTD8R
         W5WrQszcHf3oL6sgHK766fC2OjVm45nSPHeT90JJknmKSdw4OgVSm2oqIIsp5CNVXp3X
         JZxM969DpGx4j5PpsSMLY6Bsj1wuyWnYQFq9GY4LLWKV0RPMLgml6VkxqQxnYZY6kDMT
         wauVuQmLdPEK3L4QV2Vah2PeVtqL/SqAC6plXKVp1Zpoxba8PwpL2uPTq5efwWhP/2Yp
         NM4w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791833115; x=1792437915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cP/IMy/IkF4nvLd9S1eEPD25v1RZ1+mCGCjmCnmzoBw=;
        b=awdK40MVDmH95iXJHU/D6QC4vl6rRROsq0bNnTgFgDV/zQG222gnf8Jm2j2CsmMEP9
         rhuqel4Mugj6mPsrqN3zTQJJR69dajX0l6Sv6fOBldyW0jqlh4eexfMbxOnoFdTEoO0M
         VGM1iWF+nXZcrWiveGXN0hUR/T5oWPMCal3adguNRtKDEQakXvaYXR/qiX2z8RuFWi/s
         fJuK6X8ciDwwzK8+q/8PvDLVcxR3t3tIV5K/GkNgpKXCO75HaWpUqhbdUT5136efZjBy
         Y39fqd4KyithEzWQzH0qsC//FArBwOedd2ZHztkpSyZQNvEOC1WIDeN1oNnAXlVy+/2w
         A1Mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791833115; x=1792437915;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cP/IMy/IkF4nvLd9S1eEPD25v1RZ1+mCGCjmCnmzoBw=;
        b=zOxYtqKzCMDD9LIHd5LoaZnOI5l8XuVYrz5wuc5YYWPD1mj0Xuyc3dWTq5baIGYRrM
         bzXAsyLRESHTXj3SqUxFISD7209qqIGkSThVMQpMuYBfEaHTgxzUye9p9HmVWI/DEJ96
         C31V8fXbBHV41gJmjpwGYC0nU5+nMgbjf2fAP9BF0op/NyuL/ZRCSSjzY1mzCHQCC3Ba
         C2wmMdHIsRX4eSxri8C8mWS3ZGq+Mrnuomz1pzqHGvy4UGYyHj2Gsrp1zILglVt5s/z7
         Du5Frfr8JovCKcUWJ22lvcGZxWOW9mRnffu5G5VrdY2RWDlOBo8ANvlO2TtmfCi+4I4L
         nf9w==
X-Forwarded-Encrypted: i=1; AKwUvBxx0MhR6IUzJUli5DRGI1Vt3FOYLVDCKee1x8p5VxOaXVBXyQmyMg8JSTC08IvgH1BeIVTEEgRLMu0Pn7gkHg==@vger.kernel.org
X-Gm-Message-State: AFq9FYJQw0/1PDKguES9qleqGoriKHml/kpD3QTG1g3xlPqO7YwxE4RA
	08a1/3obhn7RLKpXDiSqZYFbgF5pUWsLvEN+6T8kxREQCEA3+JXQ718NvOIAiAq9TaPPNTUobX6
	7XlsxVMcSb58NOmFDQHIfz1OKtaLskms=
X-Gm-Gg: AYBFou0C36W3chfaMgv0Oy8JyoVLxDYwHkq8/Axo5WgyMFc7QLcHLfO4eOSGlNN13dJ
	qkG4fvuAqFqVLqP6KVNlFyywyN4wwcELSN4UzHlrLmTdJRx0KbrFTUrDtMC4Vo8Jmeky7GvY/FV
	HBdqUKJaFfZ+RnCS2iJ5MiWMO1Rgix3UoHjVUJhNWB0Rj502qoA7IVok/NCGuYA2iHseYzgR8iy
	W5M1f5pdOpdgGsAXGu4hOZDj/RtlN17pSc+KtWEhxpbOuXIpkfG6orDVwYyu+8gc9lGWMLOendG
	DAuY1mfzjAGvbIQi2y1d2eiwQL9uVW/PMMeNN1r2hNDvxQOEafu2QtQd7qIT/6rmUS+3BLw3kbR
	rNoyCEGk4D0aT3QrCsRYV0Sn9btWtxSWsveks6jhHAWIHCiz87LjSTRw0P0gEwryDDbxLEtf2Ni
	Mvzqute48MvWrqMGoPiXetzqVlqqvlgzJOSrqOoJ6GCU+LouXhA7E=
X-Received: by 2002:a05:7300:c8c5:b0:351:7e15:9c59 with SMTP id
 5a478bee46e88-3537dc89f58mr22053188eec.0.1791833115144; Mon, 12 Oct 2026
 12:25:15 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261012184429.1613374-1-gary@kernel.org>
In-Reply-To: <20261012184429.1613374-1-gary@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 12 Oct 2026 21:25:01 +0200
X-Gm-Features: AclHuK_tms9nBWcObQWyRv4qFcrX3Gjx8prRIikz21n8Ap83zlEf_zb8Ec7SUyI
Message-ID: <CANiq72=urvred0g4NHSeiXu8tXvGTMSxf+kbBcPvVLjZaPMWow@mail.gmail.com>
Subject: Re: [GIT PULL] pin-init changes for v7.4-rc1
To: Gary Guo <gary@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Oct 12, 2026 at 8:44=E2=80=AFPM Gary Guo <gary@kernel.org> wrote:
>
> Hi Miguel,
>
> This is a cycle packed with feature updates. Two of the most anticipated
> features, tuple struct support and safe self reference creation, has been
> included in this pull request.
>
> Safe self reference is a big one and is pushed a bit late in the cycle. T=
he
> initial plan was to include a minimum subset for this cycle because I was
> worried about potential soundness issues; however during Plumbers it was =
agreed
> that the features should be upstreamed at once. This is because the initi=
al
> users (Nova, JobQueue) would all need the advanced features, so it is bet=
ter to
> ensure that the feature get put into use for real, and it can iterate wit=
h
> users, rather than being fully designed on paper. The existing safety che=
cks
> are already very comprehensive, and Benno and I are confident that if new=
 ones
> are discovered, it wouldn't affect the overall design.
>
> That said, the the usage of the advanced features (invariance, existentia=
l
> lifetime) shall be limited to the pre-agreed users only, so even in case =
where
> the feature needs to be reworked, the blast radius is limited.
>
> Another theme in this cycle is to improve the developer experience when t=
hings
> are used wrongly. A lot of work has been done to use proper spans from
> user-provided tokens so error message point to things that cause them. Ma=
ny
> common misuse scenarios also gain additional custom diagnostics.
>
> All commits have been included in linux-next as of next-20261012.
>
> Best,
> Gary
>
> The following changes since commit fd73f4a6659897191fa0d40695fe370925dd37=
80:
>
>   Linux 7.3-rc3 (2026-09-13 14:38:02 -0700)
>
> are available in the Git repository at:
>
>   https://github.com/Rust-for-linux/linux.git tags/pin-init-v7.4
>
> for you to fetch changes up to b7218f1996f8491dbe28632b70f444cb73f554df:
>
>   rust: pin-init: internal: suppress `explicit_outlives_requirements` (20=
26-10-12 00:27:53 +0100)

Merged into `rust-next` -- thanks!

I have quoted part of your message above into the merge commit, since
it was great context to keep, in my opinion (but if you really prefer
not to include it, please let me know).

(There were a few typos that could be fixed, but I kept it verbatim
since I was quoting.)

Cheers,
Miguel
