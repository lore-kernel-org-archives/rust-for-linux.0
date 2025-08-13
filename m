Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 668EF2D5A13
	for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 07:40:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755070858; cv=none; b=Vhv3pYwKzmU8rHLYYe9Wjip4D37KRg3Kp0P+gt0cQsTafwhvtQUUCnplFUh67cXowo3QWrQJURajm4SQ4bt+Nd7Um8VKiljIiSVOrWsVYQxIeXHHO1CrhkiIR4JIUvWeX9BRH8C+0yuZcAtqel21lN+J+pvIWlZFMQfBwKel6c8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755070858; c=relaxed/simple;
	bh=c9Ccc4FdRlKahKVue2t027gTXn3WFY4nUn/bdTfbFWk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=njd4f+HHBVhpCHPUCndLerXmp1T75xywgL2kZvJJ9UmkxTs0meWiOEEslho31HrDwa1rDKGbhSn0pD3ZvCY0ZzPKYXTozGU3MJ7bAXDmIqOjnsGK2WnzsnFWx7v39qunANmcgh8V/9zizSjyWRBZh+GnHGj8y16StYcb3sVVrVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=oYNS9sMr; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="oYNS9sMr"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-3b788feab29so3849102f8f.2
        for <rust-for-linux@vger.kernel.org>; Wed, 13 Aug 2025 00:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1755070856; x=1755675656; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=c9Ccc4FdRlKahKVue2t027gTXn3WFY4nUn/bdTfbFWk=;
        b=oYNS9sMr6a1jozHeEjf+SffWX8dSDvJxiFp8QIjNJr1EF9wwdkZQsblYzf+SIU/YY2
         4bxlhy3CpnZy/s2efNbWCnwrZeR2q9Ut1aWWoZ+TKwEgxVjN83WTgir9MozdhVEiopO8
         rf9S8FV5MgkKwSUp6zIo0999djvYEhsmEUvJUj65Zyp7aG323LL5AfelEN8METZ2t7P7
         WLruAOqR46oDWgVfGl78cbp1WyLUOmcVEUcSbk6wd7uBNflOO5KpmTezRTFid0QCFlha
         XyeLFPxICKNonexgxUOSBWkUURyLDjbiBFzhTyp3Bqeu067/Sy+3wqs/4veTwsL6dE/h
         LYRg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755070856; x=1755675656;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9Ccc4FdRlKahKVue2t027gTXn3WFY4nUn/bdTfbFWk=;
        b=bfWIA6nigXvX+3vinInfIH1e/6X6G36Y6uFg2cbSrj9bKUEq9vUB7bbn/d09cS44G0
         ufIZw/xOmTvO/HKQnXeo9UUHXOcEU8s8B6CRdbloV5wOhs9KHHm0DhCqQETujh5Abpzo
         h4+NzOJKOdh4RlNTHIH5UAbL7BMPr6gKTSB0Fx5iuQRzO8xGKeVekCzxNfKfpddmaxSC
         iG5YBD51JcSgElmNAzGRIKGVeFa3ZxQHfXAQrUWVuPz3GC4qbE58KolvCaEO+npcLk4M
         z2h6N+UPX7K6txWEM7UBuxpWf8mMmhUHpFlGQ1FoAyNH/IRyH++yg94y7Hnu4wbS9fFU
         H0cw==
X-Forwarded-Encrypted: i=1; AJvYcCVebW8aaZlXXqwh9BuINXKeS4c+brhb7rN3KddyPBDA5udRI7QVlvh3PP+OJOAoC9k/4DpJJ0t9gZpAeoGmOw==@vger.kernel.org
X-Gm-Message-State: AOJu0YyaeSxqF/In/6qs0YxEjm7zZrNtzsT8HNJXY0+5mhi2vJkjxyX6
	pSHavZ7pZMkupedDTcM3um6VO+RNPZGBzLfLiHGZ0F7X8zMLQg/S43Q1W/rMC51plZ75AlMffVp
	efdCzJnz2K321NRPAugYvma5R7YD2wU/4NwUj07oi
X-Gm-Gg: ASbGnct7iHQDuWW6RZ/MsQ7lqrTdFbFxwhkuIjY1mbvUkop03vTaYJYr2ys/jLk6rNe
	gsAnOTgefp8mVhld4Wa9nUCLQC13D6bgjrOnT5dm+83A2+7Pv3vB+kpgJX4e9GuuKjNADseR33A
	At+HqAe5OPkh1vBUXynXSdfgKCrdWuKCLPwfCoCPFCyv0+FSqLz2M6cmDIhMwT+gwCXNgbNfu7q
	iL4AQ3/t2tga15d7vtiJtRwi6Q3C3brreNkY36+0EgYQsjvKpv0DaRx3iw=
X-Google-Smtp-Source: AGHT+IGGtpaH+it538UfR2iaRDBz9X7fJpT1gAY6RgW0EDKE5fzEZ79ezay15oRdLHx3Xf5OdtuQ3FdbihxaglEAAsY=
X-Received: by 2002:a5d:64ca:0:b0:3b7:8fc4:2f4c with SMTP id
 ffacd0b85a97d-3b917d2b0f8mr1196666f8f.1.1755070855659; Wed, 13 Aug 2025
 00:40:55 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250812144215.64809-1-baptiste.lepers@gmail.com>
In-Reply-To: <20250812144215.64809-1-baptiste.lepers@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Wed, 13 Aug 2025 09:40:42 +0200
X-Gm-Features: Ac12FXx8h4Xky-40CstbMiW32Dc7_qYQSYrfMREs0zT_bsEsb1sqx3OupPHpEcM
Message-ID: <CAH5fLgg6eFYZ906GPFev_nha0axsUR71yC+En4X_fMjSn85UiA@mail.gmail.com>
Subject: Re: [PATCH] rust: cpumask: Mark CpumaskVar as transparent
To: Baptiste Lepers <baptiste.lepers@gmail.com>
Cc: stable@vger.kernel.org, Viresh Kumar <viresh.kumar@linaro.org>, 
	Yury Norov <yury.norov@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Aug 12, 2025 at 4:42=E2=80=AFPM Baptiste Lepers
<baptiste.lepers@gmail.com> wrote:
>
> Unsafe code in CpumaskVar's methods assumes that the type has the same
> layout as `bindings::cpumask_var_t`. This is not guaranteed by
> the default struct representation in Rust, but requires specifying the
> `transparent` representation.
>
> Fixes: 8961b8cb3099a ("rust: cpumask: Add initial abstractions")
> Cc: stable@vger.kernel.org
> Signed-off-by: Baptiste Lepers <baptiste.lepers@gmail.com>

Only during CONFIG_CPUMASK_OFFSTACK=3Dn, but yes.

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
