Received: from mail-dl1-f48.google.com (mail-dl1-f48.google.com [74.125.82.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3126C3A962D
	for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 10:24:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774952677; cv=pass; b=H3IT5+wmh0ds/0LZjP1/1/ere/L1LNaJPskRAVvErE2PF9EMvN8Pqv5PvXokv87r932xC8aqZC+l0rLqXY0/vWc2MkTi1mHTeynXhvjFHexv/Ub+m92H+MQNTqMySuoGSk3YKMtZQsAHBcMI21i7v/xQ1zAykNPk6Oe0N2e3TY8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774952677; c=relaxed/simple;
	bh=1Qmw9byNshsl5Ek+SuY0Ua+iEQldLrxcvn7kwes9YQs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=biE8I3UrD5XmJQM7XBbDUuCbjNTHIHAhBbUD1svVqGmdDuKpk1M3wdYkK10cXqQ5MnOkSVGbq1LP3f8rDOTcAL5DMKUJyeEYSPYundmmvBynrAefbbuyq6GcsW3LS/UjYt7IQEoaxkEv/XNhBVJe4hAnpeZj1v+TLaSMIcu7C90=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PdkAHpr6; arc=pass smtp.client-ip=74.125.82.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PdkAHpr6"
Received: by mail-dl1-f48.google.com with SMTP id a92af1059eb24-1277863a912so673052c88.0
        for <rust-for-linux@vger.kernel.org>; Tue, 31 Mar 2026 03:24:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774952675; cv=none;
        d=google.com; s=arc-20240605;
        b=J1NfXxQO1RX8q5vdVqi2FDY47drqrFdCV3jktDiIfUkJZEAr6seKgOugcdQQgqZsmj
         2JUns7HCdDrtp997qdTL55+RE/4Dm755Ed65ke/IO2aLuIAg9sBctcKb7QctHrzFtzJf
         uZY9Rcl+fq4s5hhnAz9oqeaViRyi8Y83VLHvr7WrhXU2u0NE4nnnPHr6i156vcSWTBvp
         yTVnVE+xCBxIZJ99mznjyc6f+1XIBIP8FNzM0W7xQnFw0/wtS3FYysJIkvkMHik4Sdxe
         N3c0w8dKgoup+hVVV9gIl0QhuHuOFCp9Tlm+tyWWTp+K44UffhfT89NGbU+CjYO3HF3p
         Snjg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=RkQLaa4N33PxNizM+moxW/zX9YC1HaxO3oZsl9kHDkY=;
        fh=e+0dzhEugC/MYhKolgW73HW0cq3PKOIuoBwCojcRJB0=;
        b=cC2iKaansroVE+uUc+j8FbKQK1Fg2rhCCNt0NZgfPxSH3+1349MRqw9bmhFAG+Wonr
         tOJyX55FquFWF4s+bC4g1TgfGH+hce+rWNwS8lpQwZ0uTmi85ElvB1z9DX6sZpnYGWcC
         CDqtuwB4XdtzzhDSKJy7gC+SFV1vuyeNb2AsS98LsrlOVjIcjkk3TQF8UlgD7ezArhGV
         3xudjx0frixH3LKdP8dPCkhJKyPjQKJw2B/YRLJCaqehxbvnceDMUMsjkwo2VNVL4u2n
         5haAz40jkt5ni/kducgSpCJL1egryxFYdRobnhHsbtDqi6139B3dxsKZnKYKJe7w87sY
         VE+A==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774952675; x=1775557475; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RkQLaa4N33PxNizM+moxW/zX9YC1HaxO3oZsl9kHDkY=;
        b=PdkAHpr6efGlpEUFP1oNNjTzQmq4WqM56xoOfvu9CTGc25aLJ5TZFZTUUusVCm9adV
         2bouON2heaKEqhudN1Sg/fYVOpHRjWVgcuPno5PoSQ1tCIMILbuKx211947+7fgUxSrZ
         XXGLnikjCDkB93eJ1ozvDAxj/Sh0ghas6cqmsmEJXJ41OdJrkgK9VUEyRpBQpj76P6f+
         hXtOoTsaEVv0Lv6aXaVLMWiX5JoZ1yeNF7ozZXc4FIcGurp8m1PlJ9fFl0FqpW4KBfea
         JsJcgoBnLtmuz5qJhx/OeJt5/441+MGKWF4KFayvEkpqrC4h+plp1YJehxULYZ1/ZbAn
         tEwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774952675; x=1775557475;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RkQLaa4N33PxNizM+moxW/zX9YC1HaxO3oZsl9kHDkY=;
        b=jIEbk2eKjSrRloeRRFMi6DEM2xa2hoFQXudEFkC1CLTu2CjURsbHwoJXB3A+dHmdG2
         SCrIBk4XdC2X08csXUEFRjvL+BnK5WjASLaVxFQJG/g9q5ywS2PK92fTZy6a4JWIAB/4
         DPdQ9nGimoJ7ydXlo1W0Y+Bx6re8LCE/PXo1Cs4CC9LmRDnYq0B+i7qPMKWrqC+ZLDn0
         O1jNiumsh0NEpJ4AMwoHtLtTMn3DxsquV6lzwlZKgJvrhho7cPn/auhcGEd/9hWg7Tbq
         qSOaSVfsCjLmj6Iv+N9s+NeualPxYdR3/ZNgmVTviFYjUAusiWbPF9nHnGlWXjhbzQb6
         HMhw==
X-Forwarded-Encrypted: i=1; AJvYcCUcvmPmAAjH8+6GJE6cVYwd7XijTyexMhprAMFiPnNXQAu83+mrewpcFrqio5aoguOVPiOVNN5sunZKXJmheg==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywi1fiQ8dOKqxrsKBYo8ztaQ3NEvKcM7t1qIHqd7gPzQ1p9tQfS
	fceWvZPuEwY33MVpJLwu65raOBiz+UffpgEYUWdENdqvkw3/VyCnCgNtcnpiN7WRMEyYGPRK6pZ
	GBmVVW/HT9oDaySjiQnSXlqshw/7/Lb8=
X-Gm-Gg: ATEYQzzLfD0fDlTEQLk/raNfeWc/nEBmZhsudIzNTlDveW1g56HlOl0t4sD72cyZ0Wd
	ZszXE9mCqGUUwIKQnf9pD9ECfH/2LhjtjSWPtR7pZTjwp4RUXjoVPTQyN60E8qg4cBQU1gsP96L
	nKVFkSu/NZHTgqQtBBcEcUyYSwrBkReTasVEyxkXz1NxAdWzWGcRbYR2FzWjoTbBzT+I+SF2ZgF
	+r09ui8VoqsmLp1pOR5RHGJsiDEmonVgvyZEqQ6tMOjqJ/C/DQpWk6bae7kRXB4kNCBjCUCb6sB
	5CEg4iuBIVGxAIM3p8ny18VA/9gLcCPaBKwSz6VbeEA0VJIa0Y2qKPi9HerdDtoaug/quVQ79NH
	lT5K9byS1VNLx9MkYuInJYR8=
X-Received: by 2002:a05:693c:3008:b0:2b7:ff3a:af82 with SMTP id
 5a478bee46e88-2c185cb6ea0mr4123066eec.1.1774952675209; Tue, 31 Mar 2026
 03:24:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260326013902.588242-1-jhubbard@nvidia.com> <20260326013902.588242-17-jhubbard@nvidia.com>
 <DHGLXL0DVBAJ.2M58T9RSK5OO7@nvidia.com> <dc9aea56-d95c-4cb8-a94b-5195d16eb4a6@nvidia.com>
In-Reply-To: <dc9aea56-d95c-4cb8-a94b-5195d16eb4a6@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 31 Mar 2026 12:24:22 +0200
X-Gm-Features: AQROBzCb2KUevTsk_zzd-lSnT6Z-WN5sJmNRjnlpHNOmb3cj_mjURLr5wGufUps
Message-ID: <CANiq72mrfavWkAz0fAqVFcGF=fXRuD9w20mbQqoT4O3o0mkdjQ@mail.gmail.com>
Subject: Re: [PATCH v9 16/31] rust: ptr: add const_align_up()
To: John Hubbard <jhubbard@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>
Cc: Alexandre Courbot <acourbot@nvidia.com>, Danilo Krummrich <dakr@kernel.org>, 
	Joel Fernandes <joelagnelf@nvidia.com>, Timur Tabi <ttabi@nvidia.com>, 
	Alistair Popple <apopple@nvidia.com>, Eliot Courtney <ecourtney@nvidia.com>, 
	Shashank Sharma <shashanks@nvidia.com>, Zhi Wang <zhiw@nvidia.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Bjorn Helgaas <bhelgaas@google.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, rust-for-linux@vger.kernel.org, 
	LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 4:36=E2=80=AFAM John Hubbard <jhubbard@nvidia.com> =
wrote:
>
> Actually no, it's the opposite! Rust for Linux code overwhelmingly
> (I counted ~200 cases) prefers the "put it all in one line" style,
> in examples.
>
> In fact, I did both grep and AI-powered searches, and failed to find
> even a single example of the one-import-per-line style in doc comment
> examples.

Yeah, it is because it is not decided -- Andreas, for instance, had a
case a month ago where there were many imports for a particular
example, so it would take a lot of lines (if not hidden) and, in
principle, merge conflicts shouldn't be an issue that often there:

  https://lore.kernel.org/rust-for-linux/87ikbn2x4n.fsf@t14s.mail-host-addr=
ess-is-not-set/

On the other hand, consistency is good (and simpler to not to remember
different rules depending on the context etc.).

Thoughts/feedback on the matter would be nice to have -- thanks!

Cheers,
Miguel
