Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4C04219E0
	for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 12:38:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768912685; cv=pass; b=d9RmNCdJpGJjiIzc7dT7RrPbd70rLoQdWmCfMeB+Vz5m4yTqHp1depWHuiCnVhXDsyvWpY90I0BQHfDNy0Kd/4c+yrsAtw16x6IVHKJArsHEOmdYrYmho218EPgYaad7iFhNgK5KaXJ8FEmuqxpnVgvajlSvxeAHCE1wkzS17fA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768912685; c=relaxed/simple;
	bh=XabWEXYJYC6RPxsEMgc56CkUR5OrSTTK1rkR925uFNU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=PVvfj8r1bHVgAJ9d+4R/1tYjRbOQReBtZ0rkXue4bn7ntwtB5NFwR57uAkszBUHCNfu7O7kzhBFca6cJ6VMRRHhdcGtkavgRXnyJv0Vd70LO6R5wc9H8FzkOOUo+foDLZUhyb5gWIwmUiXk+nUXar9IVlpG2050B51pkTzmZvOg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YtVAg3P0; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YtVAg3P0"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2b703e04984so42699eec.3
        for <rust-for-linux@vger.kernel.org>; Tue, 20 Jan 2026 04:38:04 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768912683; cv=none;
        d=google.com; s=arc-20240605;
        b=As3CvummtxLlJ7/YsBkNAi7Y5f7fuEWTQGH6kRxx7ry33UHcBaqA58jfsKzFCon0qY
         HHmqncJvDPYBl8adA2B2r5r6S8J7Yy+7UTGSdsodncUVkcdpc3uyShdUjwv+IYL6zAnD
         bki7/nziJUFWpiHgwidmguAAHbqMC+aoK77AaAmCiE6R1WeDFOKHNS69FnOFNScSUncB
         cUKAyJf9Cd4kOO/FYSYMuLKtDeTEJKxfT69OWImMOnu5DbXgehlmrM1m2DFGiqgZdIuA
         L+ZZbGv27mLvP0lKG6OH0j9Zaco5Cwt3Jnp1Fpd/HR54aDyjh4lnS+GIvWRevXU81Rw4
         ioGA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XabWEXYJYC6RPxsEMgc56CkUR5OrSTTK1rkR925uFNU=;
        fh=SxWa9Rrf17g866k0wOFl53ar1QNDjTioSXYt65PGWmE=;
        b=DWlDyoSFpXcJFkcq9JaS1przxJ0pmfAy5yMahG7tb75DRT9Dq4AX6y76LM7rBTm5Q4
         b+PX6OD72CbfR8KJDJRBzCTkJdHqIJwjkQXEWkd1iLlOMHBBhMFVscRGk0of9+GFZWvH
         GGo/m5lCUY2DrnsxYuOld/BJOGvufpfbaQ6D1f8uDi0lmuhX6tYvEQuzshDpSuf+MtVZ
         vruQFxMkgYBcfspscRo4CZfyanOZ5nNMijvpj/fKAMED0GMGP5NQZofSF2GoFhi8I6eJ
         Oh2G3/knflPFoMTlvqCIe9b+1vecB85tCqhM3sNgzBh454lSJ8n/OEAPtk/1b93Ax7V8
         pULw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768912683; x=1769517483; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XabWEXYJYC6RPxsEMgc56CkUR5OrSTTK1rkR925uFNU=;
        b=YtVAg3P029BPyjgdArxsEaCmesyz2l8VdXjuLW0hyJ2s8YABugECxfWNemHG2kffNr
         pbdzyJCLcxVYo72jqOulsg7DqZpwkKAsDBksn3fQyeIDvxhreP+rotCjtjAcaxU6xpeh
         zY1bcHLv5D32cdPLKiUXJMrtIsFZ0NerBCyt3sq4f+CJNyGmCS5MT3vfPK0P28zbnfSA
         B6imsaHOm8AtKvn6CLOM4XlLgQPmXRzWuYnrqPOhMUUMWKEdLINbCfaePOXDBER7z0yq
         rw5AOvHknC+z2sOuXcuAAwpjcnr0UIazwU02rRryrMUrpKrSN8FpItqxHDtVmkDqmRNj
         KUGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768912683; x=1769517483;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XabWEXYJYC6RPxsEMgc56CkUR5OrSTTK1rkR925uFNU=;
        b=GZcY4CSvGRNT+rNeUTNniuWTRA+/XlxIvQX3U9qW5WxhalOdtxNwX2495gnNmr4ekx
         CVtXZsmdh5LPd6TxMP6XEQoHFYrPQ6BJUffwb4odsGl2zroo0PChBRcml4zCHcnpZSmx
         IvClz3nxiFJaqY/QGbzZEDygt/AdRflll0r2wFf4ehFmYeaATL7oVYM3apcHwriGNo4B
         STeEAp5hbZBUkIj5cj5NQU5qvw66ZWwIvSND/HQvEiSBHWpBavPjW+Pic9lJcj+2jKWk
         5XZQGrA01ihZO64QNhPzQ2U7ivml0aI6QL9M5TcoeErD++ZDdbfPSBd+mZUI9q1Px0sO
         g7mA==
X-Forwarded-Encrypted: i=1; AJvYcCX6inH6F4rycvngS+bPBY5kMP2SPQexR1Sm37j/1YaMTfEw2Mn2QGTTAvUJ+u0xfrMhH+Ib2uPXqbMd8EE2zQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw7wlue+8nmF1aT7S8OWG7Ql39j3YK+evx1eKfAIepTRh/Jq+pZ
	KwdAvwEnUFyLvCm6WFiOnBkDwIwL+kZR5S8v5Pgp9wpFXO+xDZnoUyYo/kaMMcbTZo317D4vzbh
	Me0mWv/ncL4AWu0weeEEM7EPcXtll/5I=
X-Gm-Gg: AZuq6aLPy82MjeN+HL+SXcVrkR6VwWxYR4ntoL6WIWRbWSpD56eE/5olf2xzacgq1K+
	Qo/dssDR/N902obOcnOMzXoA0entLO9HJuD8U654lshYdLXOqysc6OaYkamwJyY4S9Hds+RA1yj
	o6TBkOqxlpbMjg9t283IhbPJXaJ2Rsjt3/TFJSlmAHLtPrkz8hysj/hDX3Mxump+aPw1y27eqKs
	bzv3Mpru422Bg7WJqDb3eq11uhQCzfmjMTFnG+T5yhDp+HxFS0tdAkBr6AxUy3hY7mIIU15+STz
	dmGZkJUYNCQbUKBMCfrZKTJiVMKOKz1U3B/iovo32JHPAdLXqLOwOEPRTwYm98jXObIavJm/u3z
	WPRevnIMUdS0J
X-Received: by 2002:a05:7300:dc85:b0:2ac:2b5b:a567 with SMTP id
 5a478bee46e88-2b6b410771dmr6229692eec.6.1768912682852; Tue, 20 Jan 2026
 04:38:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260120-register-v1-0-723a1743b557@nvidia.com>
 <20260120-register-v1-3-723a1743b557@nvidia.com> <f12b84b7-4972-47ee-a79e-61e8d1ad49b2@de.bosch.com>
In-Reply-To: <f12b84b7-4972-47ee-a79e-61e8d1ad49b2@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 20 Jan 2026 13:37:50 +0100
X-Gm-Features: AZwV_Qjc7AOARjhMFIEnp4nMkIVcUDTO3r0NuwyCvPyt59Uk1Gsf3RL5I6aMAK8
Message-ID: <CANiq72kEVrYWbs9zOtP-h83TTmrOBBqkKEETUqSLZJ47=L6sFA@mail.gmail.com>
Subject: Re: [PATCH 3/6] rust: add `bitfield!` macro
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Yury Norov <yury.norov@gmail.com>, 
	John Hubbard <jhubbard@nvidia.com>, Alistair Popple <apopple@nvidia.com>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, Edwin Peer <epeer@nvidia.com>, 
	Eliot Courtney <ecourtney@nvidia.com>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Steven Price <steven.price@arm.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 20, 2026 at 12:45=E2=80=AFPM Dirk Behme <dirk.behme@de.bosch.co=
m> wrote:
>
> What have I missed?

I think the patch is missing enabling the (already stable by now)
feature. If you add it at the top of `rust/kernel/lib.rs`, does it
work for you?

Thanks for catching that!

Cheers,
Miguel
