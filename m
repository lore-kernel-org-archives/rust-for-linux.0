Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 900842F8E93
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 00:20:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.215.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788222056; cv=pass; b=FIlCGEpAm3vQ1Xh2QT339dxCN97Z5nQoOmjq9sR6UK9fQVWb1/lxe4NzYO2UZ3ylvsfIhWEmlCmnHagtT3QNCFbTqgQy2nRYYmTaz64Zks+f6OwHsmIHkgfDSYmVWtKfyu9wGQOXA5eQABvv1aDJiZ8BV+OdlmGsL8cxwDlr1/Q=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788222056; c=relaxed/simple;
	bh=yKxhql/Y+4NXkktL9/Mk4ryjp/LtyC/+Dj6BrfX5aDE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=seL+N4KdPr0FQtsb0c9k1+L2iZDT0xNN//5VcJAOGvaKPyjbjRM/kE1sakE7+jp8FMWgGwfLaYbkCFKabjD+L1QG2huY3TSmrsX20kqhiX9ad5QlnBwdMB00tXbPWKytO+w359AoIJ0ANeLCOwE8WCPNggytDzihKRv3T7PcJew=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WJxlMvDo; arc=pass smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WJxlMvDo"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-cbe4592c193so749955a12.3
        for <rust-for-linux@vger.kernel.org>; Mon, 31 Aug 2026 17:20:54 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788222054; cv=none;
        d=google.com; s=arc-20260327;
        b=m2Tj8V2tQjArJKJnnjhz+sQq0H9ENLjoGf97EnLtVkcUMPSkk8wttCJ+M0bTgy32jt
         v6FzRVEMikcMxcAcSbLrkrtDQ4ksIoIHSNn/zpOLgbWv/jw95BZkg6Eh6R2nl8ogXcxp
         e3+N8noi702W3Wa7AZxv2YXlKKcAPYG3Fzb07u5o6OCrFEWMyElS1hoB6GUBSZxEBsus
         mWLH4HtGEPUfqOUzgE9TanqJtMczGrF94lApHRTL2auYk84I17lvI3SzpojWiKsxuDXU
         +Max4lanB8C71w1mCNZeNA9GZZXPlHmWvpWIoYYkFKZ5dqX0duq5LxFjID7I2WlfLEAp
         5odQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HCjqiWitUxn5vYaMzRgDhOvYDatdgxmQk7C3Sqhdefk=;
        fh=lKmly6V6DdBdYbmeG5fla1ol9wTmjUmQac150cj3mGw=;
        b=C//V95Ch/KLyY1sq1j8smhgdemkbis1AFEG8+Cw6qg7hib1nVyiN9iJStqa+mNg7MO
         cd+0fMqS62bM5+3Q9nhF17lsBYLmGNlg7snKC4q9QMwGaoChuxjefwLP2yB9p5RvtFUf
         jZORvchvCj2mSik41PcAlZhDMLl7Ho5ofmZry/M7rmEivsCDemJjRfRPhNpUx4f1n85w
         zA0xTcNpiDyRcnCCfJdH6KzpXSB/aUyO/fIIdVou5KSRe7zk1aZdi5nC3GKVVYdjwaVG
         iaA1/37UssdpoRYf9WdbRP0z7g/VXy8So6oUgWWhsJQL4Pd8scKjk61j7O4hX6/Nq6Lh
         UOMA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788222054; x=1788826854; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=HCjqiWitUxn5vYaMzRgDhOvYDatdgxmQk7C3Sqhdefk=;
        b=WJxlMvDoR9a311xxZZDeB8a4F/nzxsMuhSTJqXn/K8ec7KaVFeVvAtDjYrkKKuCnKE
         9SDRH6TuYry18qgXbTFw9gxRaNeepitz5lWsOmMamYKPSINW9ayIaj9e2w3/VijhTi1y
         Jx44GrSZ1o/TNhwcjQY8YfJ3sqoKbjGOuxCQ7phLYQiOPMfhr/Xp7omKdhuNB93saK0Z
         /9C0w4nIfCs9caEWru7yg0QKq4cWnPOLPKw+J6Wl3bCXMoGLjYNawDJ9Q4rlXvA32BS8
         wIyxqZX1slrL5+ydBsmfPbmvE9eYANwTZeMREMyNLR5BD6D930Y3vgoCmIDtTXbhJlha
         SPvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788222054; x=1788826854;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HCjqiWitUxn5vYaMzRgDhOvYDatdgxmQk7C3Sqhdefk=;
        b=JvBQjMZcYolDKkzAoX51mPj7Iov4LQE9xBLUcNBp+IgUYPKnGbpHio25xymYsyOxKV
         lWnwlEq9p+TZ/AdGRqpV/dwpCu0M4QN3CmNoZc8IyB4yqSQvEU82Tw0hDyjWrsOzQlT1
         AV4e2beBJTV66SqXVbXfB34wg7Iy2enNQwdcr7Xoxyr+IsTZxvwrL73+PbMTJoNvNjMp
         rbypzO01vorxbi9e3XV8eW91cVn0GRq9FwalCe5ExikqPmDiBqNDi0NBBh2dS9ctB7zE
         1a8WwfkE5kMud1Dvh7YUe2xxL7dUKzbUMt1JZq0sw41GXdR1vdcZPt5m3iyY98Aa5GIE
         ejEQ==
X-Forwarded-Encrypted: i=1; AKwUvBwaOAPnWqRZXWO/HJu0Rs/6Trhia+18EEvGbUtIuiQwILPxCAHIFK83qISAgBJijmRMktsdYpul3YgqvwRXAw==@vger.kernel.org
X-Gm-Message-State: AFuF++l+66P+q42pWeh1AlyPR4QPTAuMCk7ne92HLFt4e/vb/eUxJM2J
	88cDMtZBoM/cmrguSxcmV1z95IJ1ER1F7dS5bWnHS85jPbMtqrjSVYnrP0IoQEt+GS3UtD57KVB
	pgDzXXKdd5xSLbPXbZ6ypV3nQOVgPJ5w=
X-Gm-Gg: AYBFou07sy/zkvMNBC9Pe5RW640HzuVRP5qnwAPDeuS/e1tVfeZeWH8ZArYP6LlgyT9
	FrVpycf4ImVFKoHcvcQNpSVR6VKLWk0gSqG630rFbDNiM/bTDPwJhaL03H0mG6sJJ3YBq2zBd0T
	H9GaYrPSZO5IxsDcCkryI6DKg/Y/3PKi4gvTsPcnXcleWCOGHGTynvj1VlscIaPsfgpLG6EPcUq
	VZWcPJGNRdMI21JcBkxm1D5/FJZ3mWahzIdKfkI6fAuc3qpPU2IHXPLJaKLRhnR1NvAiCiOwncr
	2q2W1lA5oqU9UmKY6iaxpBeuDx4lew9vicMrgOEW83or0vVfpKq+DLMu1hYHLtUKevS/UtID/Ia
	wbNyonpkP5JZDAFOMC7HjI0Q6VE1PFdoKKxYa0ffEzam2nsr3wsbuuLoj/RmY
X-Received: by 2002:a17:903:3093:b0:2d8:d29b:c1e5 with SMTP id
 d9443c01a7336-2d8d29bcb42mr138133325ad.0.1788222053929; Mon, 31 Aug 2026
 17:20:53 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260828015148.221737-1-mehmet.mkoseoglu@gmail.com> <20260828015148.221737-2-mehmet.mkoseoglu@gmail.com>
In-Reply-To: <20260828015148.221737-2-mehmet.mkoseoglu@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 1 Sep 2026 02:20:41 +0200
X-Gm-Features: AcwNN1X5pai5UixP38pMLxKtm7ztEWzDX6RG0f92oKoJw41G7WeDrbSgeZIxUGM
Message-ID: <CANiq72mwh1XJO=9gDgxhtpdkRZ+S568MZE8LShQ0yDiddOc=NA@mail.gmail.com>
Subject: Re: [PATCH v1 1/3] rust: samples: add missing newlines in rust_print_main
To: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Danilo Krummrich <dakr@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Aug 28, 2026 at 3:52=E2=80=AFAM Mehmet Koseoglu
<mehmet.mkoseoglu@gmail.com> wrote:
>
> Calls to `pr_info!` in `arc_print` are missing trailing newlines, which
> causes consecutive messages to not be properly line-terminated.
>
> Add the missing `\n` to all four formatting strings.
>
> Fixes: f431c5c581fa ("samples: rust: print: Add sample code for Arc print=
ing")
> Fixes: 47cb6bf7860c ("rust: use derive(CoercePointee) on rustc >=3D 1.84.=
0")
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1139
> Signed-off-by: Mehmet Koseoglu <mehmet.mkoseoglu@gmail.com>

Applied (this one) to `rust-fixes` -- thanks!

    [ Reworded to fix the description of the missing-newline behavior.
- Miguel ]

Cheers,
Miguel
