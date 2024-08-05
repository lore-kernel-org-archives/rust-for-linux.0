Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7B571514EF
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Aug 2024 11:45:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722858329; cv=none; b=q5KWlMPM2h6oaVO/1Q2F3cJ9nfPARxGoZzZ1mX+aSUTo0cA+oxDOdadW+t5ET4SAQQpnOOohlYcup6UYPMkK7xNeQNN+hfdXEmuqYXm1eCLccy36BQ1YsnJFgG8q12PiDLARO1VjaZDmmDHZEWOL2oh7T8582LHIRO4Poi2Wc0U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722858329; c=relaxed/simple;
	bh=v/XhuVOqHhCyqG3Md+UxY+wjwulb7qOpa+j5CkVVUVA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FnBbqyAXc+sx1ASU6FlUI5fNAbudPZo3VyWPPn1cITFc8qRlE8Cpom1LqY6wrzcrZanBYxDWlwcKZBiOONzhccGigd1BApiBrc2gQPBFQSPNoF654owv0O612l+Qm4vKCzIviOIE5nBO31ncPqsFdjeoCAeyyxeq2+baIuheyfE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YH7VrezA; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YH7VrezA"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-71871d5e087so7898279a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Aug 2024 04:45:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722858327; x=1723463127; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=675jfYELlI5zkzX4mIXvH0IP6Fz6D0rztiAgNJguviI=;
        b=YH7VrezAwB9s6gJk93qUTW9vCm0CYYyKoz0pMTDUW5DiuqCdpQrTUQkKY/qNcXzMSg
         YOzmu9r1xTJctfjP3R8e2lJbEt0OQYGrz+3pULDxYW36Mi5TMq1aZorssC9YGgi2emDE
         2tRzXqTK4HzKu/sochRaoYnn4eyKMzmBpm8Fj3PUq3DuUUeQAeOudHcutaf9dhUSaYpW
         mkhPd3o2HhBwPTpags/lpOa6DeQVo2mFufaXrTE5G334RpmOpU/R/01ixUaXc/MNtT/G
         AwdNr/1ZnNSZFHSAMKfj/WqToDGQU/BnDlTkU+LhkvSwQfrlnFpPWRMJrmgvYurMQZY0
         UcoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722858327; x=1723463127;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=675jfYELlI5zkzX4mIXvH0IP6Fz6D0rztiAgNJguviI=;
        b=wbSn2Qvskr2A8FZBc9+SMXj9v1Sji0taKrpT1mLD8mPmY9EYm3+7bNaKqHO4Yx1Ah3
         2H3ehLk6HWbvQFY+RTE4yBsGbqCTCTep5D1JTWrRXyWhBq3EE/fOqdCnxVQTMW4PyhYZ
         CxGg4yFSw0sE2aPC3RYKJgjE6r25S2qAAoIxkGKmMcTAJTvfz1EaQv7pOhap16xaj3hX
         A+4evLQVR/vEc+hEshJj7Ay6h2UdWCWvD+WV+r+pugb5LDCjNcPoks52fqvqwPa6TmBF
         avm/M0cR+iNvCpsVRJWDHWLwnEWrlyZzG9TyIHTz0UuuRNjZPUXDGkOWzNntzwo+D3cC
         r6jw==
X-Forwarded-Encrypted: i=1; AJvYcCUSRnJhfHuzWTagn6TvQ+RAjt9ykAObnPDO57IHO3Ol/dRsev5EHjDOcjiZESI91Ujh/VOCWzsNNs0GpgWHRY6Ap0FZk8zPw0bf0dluLU8=
X-Gm-Message-State: AOJu0YyXdpzv/kjUcq7Bp8kQlBmoT0/JVUY3eGQQ9WAEpiHNFETrUE+6
	UDG82nvL8aK5VjG4wSHNF/JOaDyPNUH4ny8uBAWrALPtqvbjwFALe/IBXDErajMOjD5PNVqqzvn
	0NHXj/GOIkQCp0+bak2plk11QuKo=
X-Google-Smtp-Source: AGHT+IE+RYttLTbryHzAfGO4pKtXN6new10tY/WJNtqw/Fztw4ilwp+TqDnbSB/ZG7zzG1y4s4H9lFhdlDBLXuqfc/k=
X-Received: by 2002:a17:90a:640d:b0:2d1:530:ba47 with SMTP id
 98e67ed59e1d1-2d10530bca4mr4164745a91.32.1722858327172; Mon, 05 Aug 2024
 04:45:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724172713.899399-1-sarthak.singh99@gmail.com>
 <CAH_eo809VXLGVf2vs9gVGr9r_9y0pP+4ku=zoZv05U_ZWbnaHA@mail.gmail.com> <CANiq72nHyuQ9+59qDQw9PbRf-Tm299JNrP_WjsDBrahM3g-HiA@mail.gmail.com>
In-Reply-To: <CANiq72nHyuQ9+59qDQw9PbRf-Tm299JNrP_WjsDBrahM3g-HiA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 5 Aug 2024 13:45:15 +0200
Message-ID: <CANiq72mx2Pc+BqPDg1-BPW5c5MCvsuopg9OjSykdnaHwy+wknQ@mail.gmail.com>
Subject: Re: [PATCH v3] rust: Support latest version of `rust-analyzer`
To: Sarthak Singh <sarthak.singh99@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <benno.lossin@proton.me>, Andreas Hindborg <a.hindborg@samsung.com>, 
	Alice Ryhl <aliceryhl@google.com>, rust-for-linux@vger.kernel.org, 
	Dirk Behme <dirk.behme@de.bosch.com>, Lukas Wirth <lukastw97@gmail.com>, 
	Lukas Wirth <lukas.wirth@ferrous-systems.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 12:44=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> But that does not seem to be true given their  docs. I guess you mean
> for combination in particular, so I guess it it is fine.

It seems I had a brain shortcircuit here given the several typos.

In particular, I meant: "for this/our combination in particular"
(rather than in general).

Cheers,
Miguel
