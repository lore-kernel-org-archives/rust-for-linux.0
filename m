Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB9BB339714
	for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 08:20:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768810814; cv=pass; b=SM17BZSwgynm4o2YLl1ccbQvfVKA+wGbVVnxYorUQR4bkHHbvAZK/f7vK43hO7n+R6oojr6Kemi89J9+95rnu/wOdZ1wRN5VJGyFB0klaiPsCHtHocfEc0vVgPbfpJDqWFmZNkJL2TBaTMHFcYhq7pWQhcHVD6hh8pO5b+UCoQA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768810814; c=relaxed/simple;
	bh=1OYoSnQPQ6tygAvVT+bdbhRQI7JtOGMwYUUCyliHotM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Rav9kl4kGu++mLZtyxbO1HDm8Ku7M/4I9rBAcymOL3K5IkeuExa7r1iirhDEjLL/Dqf6auh4A1mtt2Pdp/xi1hN3qgmRv295doEvaYAOegpt9wujWFcPOguyZFN/3/HbqpTrE6eZ/EwZoWtkXHgaj759g52Fgoj+TwJrfjzzqX0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CRiSVeWn; arc=pass smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CRiSVeWn"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-2ae5283dae8so248340eec.2
        for <rust-for-linux@vger.kernel.org>; Mon, 19 Jan 2026 00:20:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768810812; cv=none;
        d=google.com; s=arc-20240605;
        b=fO/WlHioUD70j7U/YW6RwMNOM7mWfoVu/mW7mno9fjO4Z4HeC2ogMmGq8WGLJi4+Om
         ZvKMODXDhwmZvOylpflMlsM/KnNP3u2b3kKCuFEhWNaLOHFdZZJg89l0/PLA4gaZEoqC
         VQZJIs38HB2535WF1f5sZD1wQ447GfnFkNd0plgX3WDhsX+cYtl/m6IbDPQpYtVHy9g5
         juRzlyu0WIRry2aAUiMBe9idW/JRpY5fulv2NDGAHYad0RCsWaMxsl8QLMWN/LIne2ma
         Plpi7dAykXGJ0l81rRYEPidah/hYqI2n/jdoGerAq8qNWUdHR4O249eKhbVYz5lcDwpb
         dxJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=W4qwFK8ioKelkojLIJh2X9LVVg4pbqzpYUCaeu6PnLY=;
        fh=rPwoKF4HCB6fbJdzICW8QPybvzM+XjnN5xVrUVB9F88=;
        b=R5uTT7wHLPeQiCvOUUpeiyB1V95CiAEUj8seutFDuAY5dTdRDbUEJEPY2jsdTucxs0
         cQTm1Vww8FvzDlTLPaUAYN+nNm/o7UU6/pE8CZ6DsIvqLJHc4+Dz/srS8LV+2NOvhv0u
         1aXaepwEofv7Yxt6dDvzqtxNM13iW5zSHA5gEQBryYOx5KqTfil8QWYsJf7wBIY/T2zH
         i6llawaDLJ0OoBt86aAZzK4Row8aXwVj/WdYUmb7CmWvwPLwNRIeyVqtjRQsvEgoLrYh
         NNKn0/jOVxjpynEzzhOJHHLgRZF8xYoP1VhfmEqSS/N+SYA4NVJnTe1EbCK+Ya4VR9uH
         rdHA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768810812; x=1769415612; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=W4qwFK8ioKelkojLIJh2X9LVVg4pbqzpYUCaeu6PnLY=;
        b=CRiSVeWnI66NeHgEmY9JPjeyk9loebw0pCNF5Rpbov0OnMVS1yPnthleOm3g765guR
         Kuc7WPFpfA86plbxg9Fms5pKQbyyj4tF5KsjiJ8Z9jt0faVj+ux8JqZCCgUWc4he+nxq
         1/mPyRUsJY6s4U+RPsDfrrXrnqxj40hautBt+Ww1pWl3hmhf+Q/WjFL721EfK3rTcJi2
         XiOhCIb23jSiWnun2C692LsTScD5FFULEVnB8aG/sSv2p4Q2osUt/xu5k6hSysaF2CSk
         SlBXEZlOV2Vw0zxHv/jUrExKt1Tqi8+cdCRXnjIPFIcCXtUqqS1CDUSuXwggF2cch/Ox
         jhJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768810812; x=1769415612;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=W4qwFK8ioKelkojLIJh2X9LVVg4pbqzpYUCaeu6PnLY=;
        b=wFwfegkc3W41UmZL8qoNXQiJ8/gY6lcGPM8Ckh79yo2HTLwxM//HAfWO2oP/IiRbbx
         unr2DfMeCY+Tun/D2vGs3CdyaTSU7Z0XdvDtFdDmU7W1k/nexw2RMLxysZQd7JBW7abE
         wQkiCJQPWDm/gBrDw1cDRlCr71REwu9Swrj70xKMG0KWVuLne6V3YtRV4yr1e+ugbJzT
         APbBaO5xMtTjRka/KsYZYDm0Y3p+/up1b8hpnGjME37/gLh3G5QvNkagHw+FiGl1jZxp
         slKxWi4YGzQVBSklGX9DqEkPwOXrCHRet+05FeT0K51SYmESFx1Gnc42avXaNJ38Rjgz
         d0eQ==
X-Forwarded-Encrypted: i=1; AJvYcCWQmiZBe5hoAwWNJByQoUEjTLX76B33hYFgI6fnW+zqOPxTKFsX6WZg37G8E1cVO1WsDY455TsoekJ3HlDlXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxKwonmmhAMODwaNUQLX9ElIdBeu2WMyos9DRO1LIb/qlVkEt5R
	lecq1DgBnpFy+/Gy3HQ9ey0jFTohy/b82XPnVfnhBvuqTetGTbg7vvtLIWvgH3V/AMgycjvL/k6
	OaR1kAhL2Dl4JEXdF07qKKTPRJR6Xw+Y=
X-Gm-Gg: AY/fxX66DbrDzRP8r2hG5q25AE/J/eNjj5lol/Dgno6iAZvJqILFv7B7xw+7+rrqGhY
	eY2Fw7wSRSJu/OIrLVOf6te9WEudLe8IN8rwOL3J+7c2ruJ0i2Ad+DMsNVkWLHUr7Qixnk9QxFp
	TNK3MsMoQythOWMGx2s9rB1W0xU1qvX/p2TFpaUxMJMrO00yNdVAWPQR+8+zacR2aqgpMOqjpla
	fKa6NTKdQIh/jEtLm1AIkbOq9LzsMT/5fmxiCttNhyCOjN6KzY8MjhWUdwbHrkS2OmoOSURyMhT
	xtitaXoNTXbX8QGAzQC6/ZwmtpWpDi2R8OmIMPuOrd82pTD3dh8QVosdKnZhoePV6AwvEOBTHII
	f1Y3YSzh14YlYMIBbsGAIFtg=
X-Received: by 2002:a05:7300:f18f:b0:2b4:5d92:3e7f with SMTP id
 5a478bee46e88-2b6b3918011mr4284330eec.0.1768810811849; Mon, 19 Jan 2026
 00:20:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251208-io-build-assert-v3-0-98aded02c1ea@nvidia.com>
In-Reply-To: <20251208-io-build-assert-v3-0-98aded02c1ea@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 19 Jan 2026 09:19:58 +0100
X-Gm-Features: AZwV_QhxAiFaIcvwX8h9uKf6H4azma3UhOyTlcnZ27Zijuat-yr3VdVO8Qat4vs
Message-ID: <CANiq72nDtcSQ=GPvGUObaxqA6WaOGM8oUCqV80k-Sxm3zT5G=A@mail.gmail.com>
Subject: Re: [PATCH v3 0/7] rust: build_assert: document and fix use with
 function arguments
To: Alexandre Courbot <acourbot@nvidia.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-pm@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Dec 8, 2025 at 3:47=E2=80=AFAM Alexandre Courbot <acourbot@nvidia.c=
om> wrote:
>
>       rust: build_assert: add instructions for use with function argument=
s

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
