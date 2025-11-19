Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AE8A6307AEB
	for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 21:56:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763589371; cv=none; b=Vesx8e0Z7FXzFHl7NxXpH3wJGMoqbVplKUyMf+IPIXgbI+thugWqPo+myzrg6k5NIbHV+S7hvDUPRTXFLVlGC3Zuqf+J4f5HAQnyAm/UP5nu5sNT5b2633RzXRX3dOPYS3R0m7IdKPbQ3QVr5Hz7LZW4v8RZVVD1ZasOFyZESf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763589371; c=relaxed/simple;
	bh=onNpC3tENL3hyNWtGgbWx/uUMITr77K7Hvk2v5PMIzE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XCBEXpwHCd8gOBXKAI/o9vK3FkT4glYWPmC21n6LkxNacuzDQS3qTGYy2g01ipgmhnH7DLjVEHt/e39yW3mPmHaOiOJ7A80eRqk9b4aKrFguc0F7IMyPaxEPAdCTCninbmDlFddsrt0mUpCRi4Vb0jt+dEhh8m2UxKh4MblnULA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KytTNj4W; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KytTNj4W"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7ab689d3fa0so28334b3a.0
        for <rust-for-linux@vger.kernel.org>; Wed, 19 Nov 2025 13:56:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763589369; x=1764194169; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d0R591e8nlfjSijopWGB6gPehsri2lKNUdCvCOVwet0=;
        b=KytTNj4WH/OfMLlw2ajjK2wYzLq2eXoeOCoTD8J9dmU5N9gv+tfAd4gnGYaLGfNhU4
         +2Ovudu5C/W69xZlQvjYkiiBNGax2ngxT2ozfSLsU76rfzjv7aWJuzRTaL5FcivPLaxP
         XaPLyw80TPBRZn2Qlvl2WkgTXrIMeuOmxF0GMQykiWpzhF2csyoV2Y9moGMHgYOQr2Tr
         yK4y50i44+g0uCq39dgX/nrFaXpMsBywe1xqNVhrhrJyI3lVYhvmoCr+5PkvITjTNwda
         E3jLl5Rbaty8bzwbP4HrFVfW5W5qmYbREQV01wrKHg/O9aqk9Lxusti/tKSYusQsXRTR
         emow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763589369; x=1764194169;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=d0R591e8nlfjSijopWGB6gPehsri2lKNUdCvCOVwet0=;
        b=An6kptxH3Yoyi52Yx4XtAZgJZnDKwGEMoNvdt+CnypnTH5Xju+HqtAlrquFB3w67Wa
         EG1ChzHfQDPse57gcspA25hUR22xK23uycBsk5el7I9N1Q+d3I0Obix/dJhD460tuLW0
         7IDZnftzhNXiyLZs4aUKCra+lxILR7WvmzU2a9C9BJJBXBoss5pfSEfVCcX6uRvvrHsQ
         8VuUzH4GccmVerdiGXFQOsL+VlLI7B6eO1aiQ96xVP76E8+KTn+dJry/xnOFno0wOS+/
         /jFfXwmph+qkgvXpLJgDXtdrlCxAk4WFVyFHZCgDx57g6gg1xZY8Rlr3iJnozM2m+tk7
         j64A==
X-Forwarded-Encrypted: i=1; AJvYcCW9hS8Y5Cb5SHTAREDbl1oCilZmpc/+TpjTINptB+hkZEOY2xa3hnFZh9SR8MdusNxcADiXh2EfuUhJMpHoiw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxhrPkiQ5AaPozg3HKS2kyNx5qs/cDZOBAJasSmHI8K8N6wrsCB
	qXnrscRdRRKmlnAWc6NPGjdv+/bB2WJ0UjHvmaR0dKo8Azh2Q67iCatEUTmI2WmUOjjfkEKmEZL
	XgPIUu95qPP8yk2vVdWOX6umKtATM2cE=
X-Gm-Gg: ASbGncvz0H8Lxx1PwPKVPlt2+brI2b78D/bP4aAYv156sr/+h/eWHnEVpXR+s55zuwW
	VNWBpsRaoGKrMccgmT1J6CvUyjZbYzc4Rp0viFQ1J6Rkq198I+1k+6GKqVuaUmHwzkpu9UDj8iN
	fJmkX05qxV/ZvIvINn00MbAsIxUig38zMSCI/FJuR3snj7JcrXcJvzafAYMCCZ/6nehcWym6d0L
	WJwil8QuGeCLdzfdAss8djcH6WoPZcj3B2PiSHN9MXsQen8wf7+IYLwgzOVtL0miJkNYub/Duuk
	oY0/UgFFCL8JFCNEIpkv4+KeKbB8vlnlvO1l81UCephgVPj8VoluL9f2eJtsloRgEIGf2xHpSk5
	s5PcVcM62chNudA==
X-Google-Smtp-Source: AGHT+IFSkVQ+g/JGkZrc47c4PbD//KnrTsh/AHbzrEv2q5rfh3ujH4UBMytQNu5mgxG10fzHTQQrYNo0WRSPw69ELEI=
X-Received: by 2002:a05:7022:2492:b0:11b:862d:8031 with SMTP id
 a92af1059eb24-11c9373dbc4mr278360c88.0.1763589368833; Wed, 19 Nov 2025
 13:56:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251016211740.653599-1-lossin@kernel.org>
In-Reply-To: <20251016211740.653599-1-lossin@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 19 Nov 2025 22:55:55 +0100
X-Gm-Features: AWmQ_blKMhARRoAmC99agQvThctHPsh6wPA_N_rNWlCmV6VeGl72X5wQdil-Wyk
Message-ID: <CANiq72mpbRV9kuqjTpur67Eq3ofMQjSvq=Q64BuyAtvg9RcCCg@mail.gmail.com>
Subject: Re: [PATCH 1/2] rust: pin-init: fix broken rust doc link
To: Benno Lossin <lossin@kernel.org>, Guillaume Gomez <guillaume1.gomez@gmail.com>, 
	=?UTF-8?Q?Le=C3=B3n_Orell_Valerian_Liehr?= <me@fmease.dev>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Alban Kurti <kurti@invicto.ai>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Oct 16, 2025 at 11:17=E2=80=AFPM Benno Lossin <lossin@kernel.org> w=
rote:
>
> Rust 1.92.0 warns when building the documentation that [`PinnedDrop`] is
> an invalid reference. This is correct and it's weird that it didn't warn
> before, so fix the link.
>
> Signed-off-by: Benno Lossin <lossin@kernel.org>

Benno asked me to pick these patches up for him this cycle.

Applied to `rust-next` -- thanks everyone!

    [ The reason is that it is hidden -- I had asked about that in the
      upstream PR that changed the behavior because I wasn't sure it was
      intentional (and thus whether we needed to fix this and other cases):

          https://github.com/rust-lang/rust/pull/147153#issuecomment-339548=
4636

      It turns out it was not, and it has been fixed for 1.92.0's upcoming
      release thanks to Guillaume and Le=C3=B3n. So we do not strictly need
      this patch and the other changes anymore:

          https://github.com/rust-lang/rust/pull/147809

      However, checking hidden/private items or, even better, a runtime
      toggle to be able to see those on the fly, is something that I think
      would be quite nice so I have had it in our usual lists for a while.
      Guillaume is open to the idea and perhaps experimenting with an
      implementation on our side first -- he asked me to open issues
      upstream:

          https://github.com/rust-lang/rust/issues/149105
          https://github.com/rust-lang/rust/issues/149106

        - Miguel ]

Cc'd Le=C3=B3n as well, who I should have probably Cc'd originally too.

Cheers,
Miguel
