Received: from mail-dl1-f53.google.com (mail-dl1-f53.google.com [74.125.82.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B7DC28469F
	for <rust-for-linux@vger.kernel.org>; Fri,  6 Feb 2026 20:58:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770411528; cv=pass; b=DMs+p25Fzk5D6xmu6o9CnaJs74i3WHL483NmoNlscVjQBc58xMK2P1YYlnsYxgxVJ1Tz+g6fsGpIj3QmSA7s/l8UPfTfzvWIRMSa0kuta1K2HRpBqalgxK0J8TPf19bm6k6m46G//3QD7aZVp4aL2Il1egWyr+Yg9qhjYLJD/UI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770411528; c=relaxed/simple;
	bh=9Vj7+gNg+Rff5ch0nT6eI5MqIw2L9AbA2OQUscfwkE8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=hc5sfhV/LZSb4xokNEk4eGhHSxJSVMQM4akG2HhzFyFCRsn63p2Ar5nE7dekeTR506dtxSdZNFSTLv8j2ZP/2gSgGpZuLKKCA4YpKARe8OfJMhKYLhpTqLR5a8Hyw7+CRFOADmLYppttoM5AMxaDTt4tiTXV08Os1XMbTffrqaQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Tzkenpvu; arc=pass smtp.client-ip=74.125.82.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Tzkenpvu"
Received: by mail-dl1-f53.google.com with SMTP id a92af1059eb24-1244bce2c17so179976c88.1
        for <rust-for-linux@vger.kernel.org>; Fri, 06 Feb 2026 12:58:48 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770411527; cv=none;
        d=google.com; s=arc-20240605;
        b=S95pxvG1RhK/iaxRDEQs7SBTbLIaf451+pmnBJ9DvpmjZHyzXGsTlXEdHSDwlrfaBH
         gQ+Gf4xoEOSr8V8HXd/LQI3RqaPvO5ZtjelQo+9yxoxDyS6s1v+SqaEF01HACVeRmIYA
         sI+t6ZrxXaOJMrhVPjh4jLxdKJKBQxZ7EE5q2V0Cy5wpM6mTOM89PbL0Nrd0j1xVvGAU
         t/gD6B8oyFooKYLHgQikmusXQlx/nEtpCjfQ8SX5jIyqWEDIRiZWcyvq/7X5m1B+0AAX
         e1GqGdVQojyalJTyJfgdrGBwHX5QsvsLFz7n94ezJ82urB2B9ESRnWPnikCl+OLhxzJC
         Q/NQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=XiLzMc768cl15yir/Bv2tnr2hc7r4QX37903QHVCto8=;
        fh=AGrAa2BNKDP+Ps5yzNFVClmsDWB+AlbRUFtjIXX6y1E=;
        b=Dn+DNi0ZTc2SBeTloDXAevcg/dgAsyj4vfmvFlU0ZoJ+KxPPkkAJpoj3YmAlvEvuVc
         4XDGXEJrXnKPdc8corVI0wBkhHzRdFUL9NsnBHI3aZSG9tR2H7ldjeeVRc6ds8M7o5ZV
         4BTTpR0SIVGny7O9iP3X/SqyjyM4q3BvJtswVIPa+GPXr3d8r+7c9i9v0/fbA4x28iVs
         4h/T6UuFyG0LeFlCB8YO76/N34gpHdb9eKN4u47G9Gg1P9rxdbyYR3Kc7R9wjVEBccFf
         HFIa52lCAerMZbp0ZiFRKdIPQN/GWg0JNwLqtdXtb2QzUqZ9ljrXg+7IKe9tSyPgzKhE
         gsaA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770411527; x=1771016327; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XiLzMc768cl15yir/Bv2tnr2hc7r4QX37903QHVCto8=;
        b=TzkenpvuDn4cfMRbodGHRhtGOZtc1QPjvUpZtfu2KAMqE7ER/CCfYSLsbF9jeg+Ca7
         Q7ZU0qv7jDgdmujZfKtEKwU+vmnfFAzxUUDTOmnaf+81zPW0cQBjitDd4dpT30qPR73n
         j4HNuMR12JtsMQt5P/Z6OXTBiyWTcurigrrWXBz35jr9iRqEhbNkt+gbAuknP1E56Svn
         ANux+25YckW9HM41sMgqF0Z1daHUS7uTkjC2oB6jo26EUmJ0b9CzLH1q/qCOWdQz4XpS
         GQ3kuudAEuDlApJcXjco3/hiwluFm+RExKaMdWCPI305yfIpD3QPKRVuazadtWFNvALx
         sCAQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770411527; x=1771016327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XiLzMc768cl15yir/Bv2tnr2hc7r4QX37903QHVCto8=;
        b=jnZ+JYTTRmd8NT2CqAR9Jj9hJvN+y2f2Y9RQ1Zks+7VnTgseZqlxjrjVmID/hyWMfC
         9RX2z7HpRXdzbwygo9VmpuBo0PXUeGhIhFIocJozSh26KotetIfEopE3sEOlaZEkelBe
         5JmpqM1te0v/7Qb9Xu6E2fqW2iIiRK2ZjfUMe3f5OAVoMKGKZ/BzTGYbOQr2FENy1rrO
         ZsApmwtXzMHSfSQZTm5oOkw/SVWeiJ1jFih4qZqGZXV6wc4vE7pdlQf5xdXgfcaNXyQu
         NURN3EKXXPy0yYR2lyj/ZU0xlVU9EdsVYwWcc+SZMQWa3LvuBPyYhx5uhiBQIBpMMclo
         rD1g==
X-Forwarded-Encrypted: i=1; AJvYcCXuPkVZZH5hDIuFOGPOZrt7/J+VDpeymFAVdTxbGw/EjNBKkCE8sqSAhID4LyZ1Y5ytdXGJ0HsijUqPlXBipg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxd7J+hM2PsLY0Egxot2jKpFpd2nbpcPsJ+OEy+8pZD431RNpgA
	/Rf6u9FRDa/TVt8Oa4Zldixdv7P3rvXbYbHTGhogdIX3F4GH7mQvn8+amiWSt8NT5Vj5Gb62DJz
	k/EnelhkcO9MqVGL/I87o+iy3JlLd5FA=
X-Gm-Gg: AZuq6aLii/blUrtqS0zJOJHtuhYNlVCBvtMtnqzLKDTNziSi7w5Z3019bZCvAenLnMY
	LGIEi2I2nzfmE0CB2wiQUm6PMxmBt5BLZ05Iu+y7hPVQr8BUn65qF1+e2eVdQ/p6upzqQQ1xNbU
	BFF2HCpJiBuEoDB1njvDX/KGrc0QCp+joSjPnDM+tU3S0jK5l2x4GzcY9gd66ptI7tnbgMmERjf
	U+bigyLxMrhGmjaN+qpQOi77BijPMrPJlyLYdjsikTD4eEb6A1EnAPZYjy57pRRKRXIbwI5EPa/
	P0oUbndK/IxiRZ7b0hR3TH1ZSxHsxJ0Utfh7MQjyqSLeRfouNMupAl+JbEo8G4WhQcv5fErhpZP
	UWYLN+fHro0l41vFiPheLm6g=
X-Received: by 2002:a05:7301:1f05:b0:2b7:fac6:a9f4 with SMTP id
 5a478bee46e88-2b856a4c965mr894233eec.4.1770411527540; Fri, 06 Feb 2026
 12:58:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260206204535.39431-1-ojeda@kernel.org>
In-Reply-To: <20260206204535.39431-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 6 Feb 2026 21:58:34 +0100
X-Gm-Features: AZwV_QjnlqMiABU0YrbzCweRFmE6MMjSKa8gYyl4g5kYhVu4C4USU974IEBp7uQ
Message-ID: <CANiq72mnw40Ha19CuoXCVncdx1N=VafuxC+ZQ-1vTNba5iorDg@mail.gmail.com>
Subject: Re: [PATCH] rust: kbuild: pass `-Zunstable-options` for Rust 1.95.0
To: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>
Cc: Alex Gaynor <alex.gaynor@gmail.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nicolas Schier <nicolas@fjasle.eu>, Boqun Feng <boqun.feng@gmail.com>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kbuild@vger.kernel.org, David Wood <david@davidtw.co>, 
	Wesley Wiser <wwiser@gmail.com>, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 6, 2026 at 9:45=E2=80=AFPM Miguel Ojeda <ojeda@kernel.org> wrot=
e:
>
> Custom target specifications are unstable, but starting with Rust 1.95.0,
> `rustc` requires to explicitly pass `-Zunstable-options` to use them [1]:
>
>     error: error loading target specification: custom targets are unstabl=
e and require `-Zunstable-options`
>       |
>       =3D help: run `rustc --print target-list` for a list of built-in ta=
rgets
>
> David (Rust compiler team lead), writes:
>
>    "We're destabilising custom targets to allow us to move forward with
>     build-std without accidentally exposing functionality that we'd like
>     to revisit prior to committing to. I'll start a thread on Zulip to
>     discuss with the RfL team how we can come up with an alternative
>     for them."
>
> Thus pass it.
>
> Cc: David Wood <david@davidtw.co>
> Cc: Wesley Wiser <wwiser@gmail.com>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://github.com/rust-lang/rust/pull/151534 [1]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

For reference, this commit is the same one I gave David for the
upstream Rust CI.

Gary would like to have it in `linux-next` for Klint that uses Rust
nightly, so I think I will put it into `rust-fixes` soon-ish to help.

Cheers,
Miguel
