Received: from mail-lj1-f181.google.com (mail-lj1-f181.google.com [209.85.208.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 076B7326952
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 21:46:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768513591; cv=pass; b=daOrXdt0TuywmAi8Ym/M3KCWIxXs23uTyPgtoDvY6wQ7bSan2zl3imXsXrV60KLh1z/V8ZlQ2B3+WdAg4FGOAN6ZvimJhNfgsGzPATz0ulxYONuZJNqdjcxI7km90IqHNxqEiVvXMrpGthmg01MtRS3PuiOhg/Fd++VmxtNXpxk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768513591; c=relaxed/simple;
	bh=HWf8s5uprJIZnr6Jzedk0zUuGVWzZJnoqgZEBgVShT8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XN7ri/JTiBvAMZWKKe1+2tHc9rJ7FmhTF0yaNb0zY5QXGwlh1gSK9GkSp7HINLQ5I9eZNOK9svFPGMySVmDsF3F9l/LjIuQ97U8OuPAj+COuQ8L8BuTEkoW19NDCerolMDFZWLHEqJrU3AvH257DVLzDODiitJ8EEobJaOmxA7M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mnSRc81Q; arc=pass smtp.client-ip=209.85.208.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mnSRc81Q"
Received: by mail-lj1-f181.google.com with SMTP id 38308e7fff4ca-382fb535b73so11805761fa.0
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Jan 2026 13:46:29 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768513588; cv=none;
        d=google.com; s=arc-20240605;
        b=SfRSl/GGSKNjxd4Okp0c9D1EZxCb+AHPap85OPf/lNpEiRqIiCn58RTCIyZVh+cRTz
         yOGCHjnKg0T/mRxYsQ4106aUs7T/u+KQGxY1wjKTZbGwdr5uBk6vLUIlrNRIxrCnBFDx
         LqDgBptHiccJEnTJbjYGxcVkP+i6seaHo0kiPk0WK0cOwtgfGz39/a3f5gvd+D42XvQ6
         hHbmciUXWItAOPGFZmdLRPTSRMkXZO5Qw9+GfrrGvoduY5UHlpgTSjZ2dVSBmgC+ZLul
         yYm4Gp8OXlo+gHVLDFobljdEfxHhJkodwME3k3RqndF6ZyT8KFd/P0VApWrGRD2drjBK
         oQaw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HWf8s5uprJIZnr6Jzedk0zUuGVWzZJnoqgZEBgVShT8=;
        fh=6kJRABJzIizVj/egpxAw7P1E4T9rvTj3ve1srKP8JOU=;
        b=HBb2N9WTE85Jsb/LefaFUb/XG5lnomb68G0HxEHQME7xuBTSovaot3EECb/mm2OZ+l
         Lk16+UqfzljxYHhIR0hDF4NZaKPY9aP/r7cZ8ntx0jsGjdL6s636Jx3aHR+1NZH/+Vyh
         4lnMtygE4WzOYWcWYpXWOQ6VAgyV7hAlxyEoeLMtgYRGHyJDs8f6RfPK5QcvpMrfHMdl
         WOmCKbSZY20bQ5hzRtpcA9CxY0HUMgYnLCt21o+nl4tBtqss64Tc6SYJQv0xNmUKSl8Z
         MwFIqRnYjAc4DaO6dnjFUpvRR86MoxdcVBr1ckQvXbc/rtTwAAj8qmjMCr1r03aeV4Ow
         J+qA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768513588; x=1769118388; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HWf8s5uprJIZnr6Jzedk0zUuGVWzZJnoqgZEBgVShT8=;
        b=mnSRc81Qc7ZYf2M7UfbS1JBi3g+uQn0ZYZxoLJT5HdmpfVbAr9h2XG1p5dNBAbOXgR
         C0f57/mrM6y/BfU5Jk9zk8YKRQakUexc3bpU8fWNLX/LG5SuYZZ7wzv1Io8Ww2CwEF3t
         M5DLNIjR89IZp+fNT0C60vHwCsO9XSK03OtpoXoMhAwnsYlySBInlHoeKst8lUFYoZ69
         HEGRheGUtJnsBLiGUozsstH9T5LWZUxJesjUE9DnD7L1GpiPD/N4sWKrupP6XDrV42Pk
         cGsfGrxqL61iRTk7ibzR92BuA4G2QRMuDlYQ4i5trGWJSZhdt83I5tnRzHeW9mWweYVa
         gQbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768513588; x=1769118388;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HWf8s5uprJIZnr6Jzedk0zUuGVWzZJnoqgZEBgVShT8=;
        b=DSB133YHWFijbCWXG7iDjUldjELPaudFEa/ZEeNIp3GfxTXytwNdEsNUAMeNUOP75P
         wAoA0+X28jzQdi0cPw4cufAsg1AjYpQHlNf6ThLEGPxe6h6q65W2SXZlm3AH4jGsHgMB
         KFL/HXVGD888FaVOXw0qzdpqibLpT/blCCubIWUiRZPOm6vaq+8eq/rCHBM5xHI3VsyL
         MQIRWn2h+hnaQKX5jE7HIP/Q396jy9DdwBbqdG5/omWgTO+2cHEaBiiTLTwtopAeMFri
         lRsaalUzmJbcZTOZ6kcsKJFnMtO5u8/BF0JIWwOTYVl/31f5Rmeu0l5DzVpOVd9hLpmO
         vucw==
X-Forwarded-Encrypted: i=1; AJvYcCX5fja9E/VKCwiyJ8T7HS/3GSqHwqXOP+UPxQODNPe0ijau44T5ILbbvQxkDw6TRsZO7pKcMoNJTZO934j7Zg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4VNsTMxmKkNnCIkLE+GQVVwG4ur3VngHSjpePpPLXcQTpltSd
	sWn5OlTZYojzVrKFC012RU+P69vdLCd+3OYAWZstwgR3PJef5244dwPHgIpw6cOIvnJCsIjw1gi
	JNw2DCCUB3c9dgX4N5WMaxL+aDAWg2Uc=
X-Gm-Gg: AY/fxX62mzcyhVbcY8dhNDPkztf9cGEtvsjd+FPISsIZAQLVPm6pk321LA85slaoeT8
	zSxwqmCMG8A5fpy39f0S/gitLIgrZ3wPNREE97m9tL2FnTugPfAWB2CLT5Jx5lGw0Aur/Ho05T5
	QAd3o0Ztro+qSJGRQmFDWw5Nd+vPg4yInqq1dckjS6kMv64oZ8QsHg4UxMw3Y91AAJCQZax9PwC
	DTKibqVn04PlWtH1TUsl1AuNkulypaj2Jf1MStVjCkrNZQweC/7Xhe7t1rUthMeX9sRgWZshztR
	JP6M/k0hiIixa5qXJW4NW7c1YlC/Kl30dBuaXhw3rZNlu7OdoTcAWj4f5Xpikv5wA4SUKU0thph
	wTP3x+cD8+ZhlmZjfeP50glGoJwSQa9haPY8/vE84Wg==
X-Received: by 2002:a2e:a805:0:b0:383:547b:fa00 with SMTP id
 38308e7fff4ca-3838416b923mr2585551fa.6.1768513587832; Thu, 15 Jan 2026
 13:46:27 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260114181934.1782470-1-lossin@kernel.org> <20260114181934.1782470-10-lossin@kernel.org>
In-Reply-To: <20260114181934.1782470-10-lossin@kernel.org>
From: Tamir Duberstein <tamird@gmail.com>
Date: Thu, 15 Jan 2026 16:45:50 -0500
X-Gm-Features: AZwV_QhKZSCkn5GwZeTAvjQTL3obTX235a3UB0MaNDJArdzucKJD2L-xBlzm8pg
Message-ID: <CAJ-ks9=kvTBHLzepFUqtYn_FOroP3CU0QhyNwBRyH_tHF4p50A@mail.gmail.com>
Subject: Re: [PATCH v3 09/15] rust: pin-init: rewrite the initializer macros
 using `syn`
To: Benno Lossin <lossin@kernel.org>
Cc: Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Fiona Behrens <me@kloenk.dev>, 
	Christian Schrefl <chrisi.schrefl@gmail.com>, Alban Kurti <kurti@invicto.ai>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jan 14, 2026 at 1:20=E2=80=AFPM Benno Lossin <lossin@kernel.org> wr=
ote:
>
> Rewrite the initializer macros `[pin_]init!` using `syn`. No functional
> changes intended aside from improved error messages on syntactic and
> semantical errors. For example if one forgets to use `<-` with an
> initializer (and instead uses `:`):
>
> <snip>
>
> Tested-by: Andreas Hindborg <a.hindborg@kernel.org>
> Signed-off-by: Benno Lossin <lossin@kernel.org>
> ---
>
> <snip>
>
> -#[cfg(kernel)]
> -pub use ::macros::paste;
> -#[cfg(not(kernel))]
> -pub use ::paste::paste;

Now that `cfg(kernel)` is gone, can we also remove it from `rust/Makefile`
and `scripts/generate_rust_analyzer.py`? That is already done for
pin-init in patch 3 of this series:
https://lore.kernel.org/all/20260114181934.1782470-4-lossin@kernel.org/.
