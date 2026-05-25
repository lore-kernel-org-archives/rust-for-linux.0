Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C0042F7EF7
	for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 17:54:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.178
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779731679; cv=pass; b=NOOX177vpSrf0ktL+bkuw/MyfucTz6XILenL03p4XkPvtvfZwluMNk2M1jYKamvD8PZxkb94bCFBwbjwiLg14IXBVO3lfuRXkdv5OOi/WA3+8ZdcEjnV5YLXNqS0yJczHxO6JbCwR40Gn6AhhFTWX1w5PZNRMvoH22f8dcLHO0o=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779731679; c=relaxed/simple;
	bh=bz/H9v2w9BAdKdxqT9kaijtZ+oV4WRf/xfsx+Gz1C/s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=eE5vaeldIxOzDGPcNJF/iGGDE8WLxRHXSUNL3if44Kmfiuf5K2wiXZhdGOcHpHkYmpeU40eeDhQ/cH8W4eJCjGK5/jQ1EBDJj0QA6AtHUQb3dEBNWWpPFPFsyvgIIgR5pI+RrjghVde/hl2oSAGrZz6TCXM4heH4VWh0CZsWVSc=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DeFrdmQq; arc=pass smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DeFrdmQq"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-30436e8f582so453558eec.3
        for <rust-for-linux@vger.kernel.org>; Mon, 25 May 2026 10:54:37 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779731677; cv=none;
        d=google.com; s=arc-20240605;
        b=JUmZdfbuCXwUA4rheBzkquc0ZpIr6HsiA6j6ios+SwTqaoXtFQgXbX2lxX6xRnshnD
         0UN3szMIOaVrPaBEBKX81mw7FjDLQ2iQXfvmse0ON0XMJ9vFIG6p959Ei+ozweJWMrcI
         sskNdg6AjXn0TkQQSFHheP3VP8WHH8GAltmsEVzEeCPEg+PrXBAoG2z7WMEAFPev/nRS
         qc2/s10u9Eevm5mBc2WxBQM9EgQs1Pe2rhYSGh1mkd5nO3Em0PVZgY5xZIcs3dnKkAnW
         AaocFGANgu6P2+p1Brk+WXycx0LXN/pft2vRvQvjyp4iSFUD3fk7e+tP6DQtyx4CbZX+
         8g9w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bz/H9v2w9BAdKdxqT9kaijtZ+oV4WRf/xfsx+Gz1C/s=;
        fh=BIGjUI4YugCViT9y6zaf2YCd2IygkFeEfKjRUNRjBTw=;
        b=cKE4d6Sg6YX+XVDl+0SbmDmPfh73PtKlvE7mxwf5bq8xXAq2N6004YJEldTCpcJ5Wt
         e7uWLTxiXXmru0/C6gieCFEFvopz3pe/F6qz8yrFtIqCsOJ0RO76KHf1IDkHkTHeH1Ja
         kEtg4xwtN2UTc/8zC/jjSRvt6GQIJspZ61ueudkvbR9RfnZh5t0M2Nhilb/g0Z8srO8r
         hspfWhaq40QUQoopK7zyCys6Y8fg8ogEk3rk3YWpVY1Z5wsv1S16Nq1xrCJZGZlVIjS3
         Qsnx4Dwk0uczy3r9OhwNxDvDFWwDev7aa/TaSDn6altsEdtbZSIa2WwsHNUZv0qMjKYv
         +yMw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779731677; x=1780336477; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bz/H9v2w9BAdKdxqT9kaijtZ+oV4WRf/xfsx+Gz1C/s=;
        b=DeFrdmQqd4zN0ATwoyDpxzBTg86lTw8TR2q05LBiu5ymCSizeQ01NriwJAlLarweNT
         udkssp0m2Z3mH76BhJFVUFEpC3H84Crrgm0Ec5AoALmM3yRwKsR6r9zgZ7abih23LuQM
         u2d3NgVPI9JimRnsc4qHzffxIDT7iV9V20Qf7xQb26u0N/epoSlTcO6x6hmRfSrWhI4F
         5l0Zi2aUeTR89oe6etXIHv5GglTFnDN7bC/R0hGmozpURttNrH8xCajjoTdu5Ci88iOV
         cC1TWHUaM6nAmp4eganBOCsPfVsfE1eL9QdXzmoC/vJ6kQcEyst3Bm1lg6e10s9aiYpH
         6GjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779731677; x=1780336477;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bz/H9v2w9BAdKdxqT9kaijtZ+oV4WRf/xfsx+Gz1C/s=;
        b=cYUZeyNU8QOC4iPLq+djvwChtAiMsKrhkYV5VuLVuOWqDuHsv3Dnjz7b5A3F0T5pZR
         0O/agDVqrnvCpJI70PcTgNFVoOi8wQ3CaAniRLcA6B2H9rbgATmvESUUVct/4mqZ7CjD
         fLEb82tpm1IX0l3X0r8TbQSZUd4+JpECSJS0olMm4KWrqvZSmH70waCqBqxPIHxCJzce
         XPZKs84gi3dMJcQs6eWiFYVdVDDbloVsIqkJlhhFECb7FJ0JFOihjdM6oKqYZ5UCI/z3
         IY3SFY5IBr2sVl26Shq3jbMRVpuiQpDIaZObSff3MSs5meNO2WtKfSrNVIc93T8M9E1B
         ZcpA==
X-Forwarded-Encrypted: i=1; AFNElJ9c73psTe6xYMENT/+XlY0rd0LAmZsXtf5rYIsFt6PelJqiITdW6KB8QkEmymIjM/n7Pe8Iwa5vluXVxmam0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxk/AuGwVaBmdNWKhBwz/xLSZEVT8PSTdHRr84TS/hX5uaB3AE8
	wNpWVRHIgtjXF4LIHhyiZshBea2GHSVQNem6yFFqJJyUADuHRUZTCUd6HOiKN9k+KqRYGm6Pm4x
	kr+9RsMQATvBzCft1umTQ+FqByAgd8rY=
X-Gm-Gg: Acq92OG0n41V3ACdhgCEROL+eGko2H+Rz1m9KW6EgPD4UXcjrN6hu/Nx11mKVvcWN/e
	md9FaN8rlhswuYfNyDlSL5tA74zIGICBLvuxZme/1B8dEk8+gA2B+i2iarX4CH6wnX/x5FR4kUz
	22bx2pYBuGzZhh3bd/wyISQspifDh8s01BI8sQkUhXh1njMHDJ8JinTY0a2jRPgGTON1jqIT/S8
	ciL88gFyYjXjbvRniZw5e3URbIVtW1uyQjNxOnju8hekBbs3i3no2FOn4AipspOIaAiytjyqdqh
	xAdZaHGD4kWLoNLQ8dY8Ui+yFBQr+yGDR9o5ASGB6BGsX72g30FMU6ghyZ2K6nYQ/LTzLztDyJp
	tqOUjTsoxNqJA7tNcy0tp0gI=
X-Received: by 2002:a05:7300:cd97:b0:2f3:3835:2005 with SMTP id
 5a478bee46e88-304490ec25bmr3433668eec.6.1779731677094; Mon, 25 May 2026
 10:54:37 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260521-workqueue-v5-sent-v7-0-fb4b4dde35ec@multicorewareinc.com>
In-Reply-To: <20260521-workqueue-v5-sent-v7-0-fb4b4dde35ec@multicorewareinc.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 25 May 2026 19:54:23 +0200
X-Gm-Features: AVHnY4K3FwO83puO89bBNRtwf42M8VNgNyOLEI_JxPplc22Jpq8_NeFwMRcio0w
Message-ID: <CANiq72nhvmRuqY6MbFhFa+50ayOEpTQqGozjVOi1GeX401tcSA@mail.gmail.com>
Subject: Re: [PATCH v7 0/3] rust-helpers: add workqueue helpers
To: aakash.bollineni@multicorewareinc.com
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2026 at 10:54=E2=80=AFAM Aakash Bollineni via B4 Relay
<devnull+aakash.bollineni.multicorewareinc.com@kernel.org> wrote:
>
> Changes in v7:
> - Fixed KUnit and rustfmtcheck errors reported by the 0-DAY CI Kernel Tes=
t Robot by correctly restoring the `arc_count` function and removing orphan=
ed `#[cfg]` attributes.
> - Added an explicit `depends on KUNIT` to `CONFIG_SAMPLE_RUST_WORKQUEUE` =
in `samples/rust/Kconfig` to prevent randconfig build failures when the sam=
ple is enabled but KUnit is disabled.
> - Fixed an E0277 trait bounds compilation error for `TestDelayedWorkItem`=
 by utilizing the `impl_has_delayed_work!` macro instead of a manual unsafe=
 implementation.
> - Link to v6: https://lore.kernel.org/r/20260408-workqueue-v5-sent-v6-0-0=
dc184c5343d@multicorewareinc.com
>
> rust: workqueue: add safe cancellation and status methods

I think something went wrong here: the title seems to be placed here
after the v7 changelog.

The actual title also somehow has a dash in the prefix
("rust-helpers:") which is quite strange too.

Cheers,
Miguel
