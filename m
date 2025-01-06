Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 085641DC9BC
	for <rust-for-linux@vger.kernel.org>; Mon,  6 Jan 2025 13:38:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736170730; cv=none; b=b0vbm/EUApxDLGqhZDkpD489YLlBzfTYl1WbRR3PavQaybS7bTnYmdiq/QAetKWt+n/RgIVpK5Rof2G1kFCmP3RJI3pf+Nyg6iz/FBBNWhD45UGJ2pRYThKDL5RrSDybgmGaTQS9ErKSAotyX3PLhQShSJ5hvoTnkbPe0Rk7zMo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736170730; c=relaxed/simple;
	bh=E6J/0ZJPK+sD1A9/R50Sozew6nFS4EbGxSlOM8Z/x/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=VAUGwIAP+KIOpB46q5o/sJSb1lTqiZcnZBbvLlF7N0EgWWyu4rkqFRrY77ZFYBLV/VuypI2bBQix3DNv6GtpGypCml50sWLe1/jJhcw68YRk8cvrGPAoOn0CvmVZgYvPK+FBfX6/0Z+sFPTPsEI6FJ0x2F2WW4Hg/Aw9C/hDYZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lSdrBWTj; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lSdrBWTj"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-2f44353649aso16830911a91.0
        for <rust-for-linux@vger.kernel.org>; Mon, 06 Jan 2025 05:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1736170728; x=1736775528; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E6J/0ZJPK+sD1A9/R50Sozew6nFS4EbGxSlOM8Z/x/o=;
        b=lSdrBWTjAqXiitQHQcRPb4EPZviF9cwStOsfGc79iXAudODCyVh9HqBJWZxdgIRMK0
         n82ZyM1C3zAd+AwllbZywv9eZwrTBs9+ioRVcBusxId2UcZR8fQnXTzHZoll6oeQG/MN
         qDe8t4S1hb/9JxoNOLtjdUn/W6vA+P2Xxuw86PmgWBWBeK2X/sTsOm/oB4tnUEnm+bqa
         9IbIqNyXl1gAP5jfUiekqr+LlKPbv/n8O/FotKCpQX5qhunrxPw8FM9GQ0G4uTiYuqdP
         HYKRcoGKzS94edAZ4oZQirOL3C5fP0m6VORQfLX7oTSjTWsBgTyryiZNcykM5hLNzhMs
         S66A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736170728; x=1736775528;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=E6J/0ZJPK+sD1A9/R50Sozew6nFS4EbGxSlOM8Z/x/o=;
        b=C/lHr7FfPhSQI1nuCaIPvevE+yNtnJ2Hf1LH43aOt0wAA8Oahw9oGzO5ZFx8Y0GJTN
         qEpFgWOy1vf6rca6cAFnomb4HIxVvwZkpBZwOi0Z4I5+lSfYxYO9YMU+4QiV27TZqTqh
         SBFBjwo3m6MLi/2af5tMhXWvDa53krR8Vjy9vc4B+5H2LCW+ekFWcxUUXGD4G7/mYPkC
         PbsvH8+hpU29MCKy16f9jTDxI07msmtGTEJLADYRZTGN0hl/nD0iUqaauMgXFXJ+erzc
         1ayTJACF5DVJYPQ0AR2QgjlxFjqj03GMdxSxCi0eQPHH/gJXpFBUpBY11KKb/NpRr88v
         4PKw==
X-Gm-Message-State: AOJu0YyYBSTTsI789gOvaFW5pvlSFlZmF3Ignnv3bbmhBId8dkC2xGPs
	qZztEQm59sstkPFK2J9RQh3LJZ7FfrwRerraGx3breKvJvPpf3Htf4OAo67uIEF68019gWAv4kA
	hgqSiop9UQE/KFWbXfj4mOTx2Fln1PKTBl2VYawUCSOhVtnOCnQ==
X-Gm-Gg: ASbGncsCT6n9C1aG8ex64OXzzp9kmlyn+bLsiBXOewJD6H4ndg8vh+bGneay2gHw4Jz
	4kIZRkBICfKkxJAUE0Ta1BfyYVRBYrE6+ufprkV0aXg+AVHNsuRhWj9t1Q9qHWfKcjUey
X-Google-Smtp-Source: AGHT+IGSVZEU9Byyic5zovZ7jQPA2TV0MAnGkPmM5ktmle4SikdAbhS/+Cog5H5NFl/4nhINyLfomO8oK++Y41Y1bbE=
X-Received: by 2002:a17:90a:d88d:b0:2ea:5e0c:2847 with SMTP id
 98e67ed59e1d1-2f452e4e81emr74803435a91.22.1736170728162; Mon, 06 Jan 2025
 05:38:48 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAH5fLggS+3K8WHV7mrgTJQhGZMNni5gj9=huQtezc4GK8bk4HA@mail.gmail.com>
 <20241203205050.679106-1-dingxiangfei2009@gmail.com> <20241203205050.679106-2-dingxiangfei2009@gmail.com>
In-Reply-To: <20241203205050.679106-2-dingxiangfei2009@gmail.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Mon, 6 Jan 2025 14:38:33 +0100
Message-ID: <CAH5fLgjw7mbv54aVOt7chLpqwvLrK2eAZzL1gOyMWC6KH0vSGw@mail.gmail.com>
Subject: Re: [PATCH v2] rust: use derive(CoercePointee) on rustc >= 1.83.0
To: Xiangfei Ding <dingxiangfei2009@gmail.com>
Cc: rust-for-linux@vger.kernel.org, ojeda@kernel.org, 
	dingxiangfei2009@protonmail.ch
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Dec 3, 2024 at 9:51=E2=80=AFPM Xiangfei Ding <dingxiangfei2009@gmai=
l.com> wrote:
>
> The kernel crate relies on both *coerce_unsized* and *dispatch_from_dyn*
> unstable features.
> Alice Ryhl has proposed [1] the introduction of the unstable macro
> `SmartPointer` to reduce such dependence, along with a RFC patch [2].
> Since Rust 1.81.0 this macro, later renamed to `CoercePointee` at
> Rust 1.83.0, has been fully implemented with the naming discussion
> resolved.
>
> This feature is now on track to stabilization in the language.
> In order to do so, we shall start using this macro in the kernel crate
> to prove the functionality and utility of the macro as the justification
> of its stabilization.
>
> This patch makes this switch in such a way that the crate remains
> backward compatible with older Rust compiler versions,
> via the flag *RUST_COERCE_POINTEE*.
>
> A minimal demostration code is added to the
> *samples/rust/rust_print_main.rs* module.
>
> Link: https://rust-lang.github.io/rfcs/3621-derive-smart-pointer.html [1]
> Link: https://lore.kernel.org/all/20240823-derive-smart-pointer-v1-1-5376=
9cd37239@google.com/ [2]
> Signed-off-by: Xiangfei Ding <dingxiangfei2009@gmail.com>\

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
