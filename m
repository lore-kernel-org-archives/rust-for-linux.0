Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC8530BBAE
	for <rust-for-linux@vger.kernel.org>; Sun,  4 Jan 2026 22:55:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767567350; cv=none; b=PX0Lxbe6596sXFc8vhCwnIJTsLfp0wQuO4MRHEghPUae5BmD3AnKF8i1XMHk+t/wPglQnxboYaFR05bW6kOqMT3lYG1ZZw6VerucwS7EIuDO8juuZ4bNwrDgqjdZ1yj/vU38UgMm2Li2yZR8f0PxC5wXEmOBSBqxZ04i4Ov4Qfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767567350; c=relaxed/simple;
	bh=efqzaoTQEP4Bq5uhlTGDT/0HLNMZjjNrQHMiVxiMlNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H4PCvKkdLw+rf4+16Xsho0GxboMmK4wS7+qZMGzZo/a2rQBWwoVV6aaobF0VNLz/kZK8lhKn2E12Q0DbRNhnJ2PLd+qpuJKHjgrrHYoYE2JnC16JB6MZwAuHC4pTwiLixPThYmKs6feWhJLMi9hF7eT9aPqhFzygPa5Mu43/VCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YU3RV5FE; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YU3RV5FE"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-34e949d6416so1573143a91.3
        for <rust-for-linux@vger.kernel.org>; Sun, 04 Jan 2026 14:55:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767567349; x=1768172149; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=10/+mTcHz7XBs/pRCf+bTbjRc3EekhzL6LhERpIlBms=;
        b=YU3RV5FEXuKuH2Y57BpwsYOMfoFJ9Ip6DPORNa5hgGnLBtfX8TAwLAxPlwyxFS762o
         3iFu3ouoPz1bBf/4I9fJEGX3Ay60HtVIEbk06XAzviTWVKO5556osl5gp1/Vc8RpCmVH
         Oqsgvq4CqHJkkZ2T4RyEFDfcNIATo1Kn7lrji4YusfcclL+EFVuBWa1DitddBzTfs2tk
         seIe0LV2vs8Ib07b7UV8NRENr/czWJYSHmZyf+/XRkZkD2QRmHS4YJgdeKkQb4A7Hpa4
         cTWl6o97hP/56hTBnUYYD7qw+rOVMnWE6P1Ckpz51MpFu3d0lb4g9K4wA9L2fuzz07xI
         Lf0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767567349; x=1768172149;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=10/+mTcHz7XBs/pRCf+bTbjRc3EekhzL6LhERpIlBms=;
        b=Ko8MYhIXo38pYD541v4sMt2NaEuF1xGsh2WYdsKVz3KmR0i3xuCbCuUuB/L/oQ5NCU
         5DwXO5K6gW2JzAFIsvfz7ZIhjaPxxpExJVXXqFh1W8pFBUsoOqnbnwpsW+AzON778SH9
         iWeoKCPwkLiQkvEQF0u9W23fSlSyn/PxBO/jfw9fZut3JNj/fIgrc/SxEQXHqCr29pqZ
         TTVWbfaQZy58xvpZlLxH1xveXaxvrBtJcdpHS3UzUv7twf4WsevFITrsFRxw4vGf02Bu
         a3UVzA2ksHbdPR/q4n+QO4lOERAVO+c78LISw/MVZCdZb/RlhKtOMfG0+7boVLVhVhrv
         +/HQ==
X-Forwarded-Encrypted: i=1; AJvYcCU0FxZhfmqlYxm8dLwlwl0HIfG2Fw5cA4N+AyyJtilbKzKqaFU2RNrpVZCq0hiEv9uH5fMSbdpC2m7byBoNog==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw26UV4DTpGh/mnh3/n7iN8DT59tpEmUYphD2ZFHJD1kF+MX5xB
	ehKq6ChOOC1ehiepgQWSP+P1BD7dcS1k34V040WQNoEkBEXrVuhdMBAM4WI+PHg4zN/kDQ75Fbj
	iNJSog8Mbdtv6spreX8aFN2EBlLhnSmo=
X-Gm-Gg: AY/fxX6WNT0wvzmlHuSUXtLZKBC+N7RE2puVZ7SGhnBDvQ76jdQDoo9JrIA/T/6ribk
	QEVxlPfEEwYE0UaS4su5uXr3ZhbL07J7nvs6MieRjinlQ5AFOr/zXyJH0d0UWgmxTm/OsMkOIQA
	TYV+4BBtE/rguvqGYce7nku7WzVj+lp42uWu2JorCSPd3e5aTdSbIwSp/7w6Pdi5uIiH8KxyYtp
	79uyLssovUKLuuWdgwNkM2EpV0PLYUi3cdfRP7CDzLJc6Xo3baKnoWpopCKTtb1uB1HrAgB86oI
	zhxCySwjGuxA/hCE5riqjYdt2zgwpCDBIiDU4rq9wFLbUM7VWfgXXfleZ1myTZ32krnl/E2i/PX
	hOT0RVlncZ6PP
X-Google-Smtp-Source: AGHT+IGmw5IqtYm39FozCvGg0QOJyzchEroGkV/xzqJOp3k+pt12LbpUSkYBwM6oeYSg5pjXHvVekS7mJMru8d2I7dY=
X-Received: by 2002:a05:7300:478d:b0:2ae:5e96:9d1b with SMTP id
 5a478bee46e88-2b05ec30b31mr23733045eec.5.1767567348674; Sun, 04 Jan 2026
 14:55:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251223113538.1016078-1-fujita.tomonori@gmail.com>
In-Reply-To: <20251223113538.1016078-1-fujita.tomonori@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 4 Jan 2026 23:55:36 +0100
X-Gm-Features: AQt7F2oanHTICBrb-Msf-fUuY-bZfJc795USeYAolOZ2DUI7zB21NR6LeNAvjho
Message-ID: <CANiq72m_p3oUjDFo8aJjHVy10S-QFsodmHfGtKD-pAhoF3BBRg@mail.gmail.com>
Subject: Re: [PATCH v1] objtool/rust: add one more `noreturn` Rust function
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: jpoimboe@kernel.org, peterz@infradead.org, ojeda@kernel.org, 
	a.hindborg@kernel.org, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, dakr@kernel.org, gary@garyguo.net, lossin@kernel.org, 
	tmgross@umich.edu, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 23, 2025 at 12:39=E2=80=AFPM FUJITA Tomonori
<fujita.tomonori@gmail.com> wrote:
>
> Fix the follwoing warning:
>
> rust/kernel.o: warning: objtool: _RNvXNtNtCs1ewLyjEZ7Le_6kernel3str9parse=
_intaNtNtB2_7private12FromStrRadix14from_str_radix()
> falls through to next function _RNvXNtNtCs1ewLyjEZ7Le_6kernel3str9parse_i=
ntaNtNtB2_7private12FromStrRadix16from_u64_negated()
>
> The commit 51d9ee90ea90 ("rust: str: add radix prefixed integer
> parsing functions") introduces u64::from_str_radix(), whose
> implementation contains a panic path for out-of-range radix values.
> The panic helper is core::num::from_ascii_radix_panic().
>
> Note that radix is derived from strip_radix() here and is always
> within the valid range, so kernel never panics.
>
> Fixes: 51d9ee90ea90 ("rust: str: add radix prefixed integer parsing funct=
ions")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>

Applied to `rust-fixes` -- thanks everyone!

    [ Reworded typo. - Miguel ]

Cheers,
Miguel
