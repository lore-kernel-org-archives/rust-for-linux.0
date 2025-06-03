Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CAB771A00F0
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Jun 2025 22:15:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748988924; cv=none; b=BvoQdRqpotY8xz2NLiCo0rkHjxL2HFpRxv3cOmogJkntIXYDctMd7HSqh0gxgwOzwWwmyDD9IktwYWLDXj/zdoKQB8/+Sop0W15sXL9pcJiJwwYnPjObNpaL4+khwm/Kag/gw/bMeNM67GItm3yFL/tOrA1cDFAqPDqy6NiYhp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748988924; c=relaxed/simple;
	bh=3IETMVPDt3ybwyAVQHmf/M22BevGUXqw8TyrWTWmgiU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Nov2m00MGbkfXUADJKm6RD5XFUwqcTBVUyM/R1QN6A66Da5H9XlJUs1G3oN8zS6HTAuAIDw0ZlBYeCIVasYbnWQcnnd0yKbg1gTlWgfybqJLQ8jDFuZimAynItVYm8fItB3cvNvR38pvS793ZeZPSAY9gCGgfczJcu+qwKJ0JaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=W94cJZ8Z; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W94cJZ8Z"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2355360ea87so3447025ad.1
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Jun 2025 15:15:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1748988922; x=1749593722; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cWlcBvc5/3BMLTMprAlozjafsVQhu7nyTZfkjDJRHZg=;
        b=W94cJZ8ZcnFQ9KwKFhQON0wE/Xhk7ZgQ9zSITFd8cHGsZODIMiqsRln0AaORoHrW+P
         S4LkPW9VqrT/4aJMZfh+he5gAC2PiOGGgCLbSC7fVpJPexVngVFhWrl+NJ9HqceV+ZCG
         0t3iusSTXupU+pKu+TVetL1/R1oHDOTvx2HcGEJSsjcODVdS0L8DXfJLyq/SbrVCeqqW
         LnN/78N9jDYgiAVQL40pstR0wT4yLPi6NnXfRQKPqp2RJTpmmcHN/BZVUliK4VEP8e0x
         5WU0RpTR11iMsP5+80kiNuHaPbkKAsTCB+MNKZhcG7rmTDQcwEAs3RzbBWlXA7L/LqG+
         iYJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1748988922; x=1749593722;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cWlcBvc5/3BMLTMprAlozjafsVQhu7nyTZfkjDJRHZg=;
        b=oqRRf9q2NbQdanJDqMPgSnOczxtW2vN/QsPvbmWfFxwh1I+ZcgOxN7qDwLnjJquIOE
         qtxWz/mGi9HMoYqjEh9qq1hPP7Ot38/PaZFW4nMNsVk+Qssll8v72myPbcK6dQJ1kAgn
         +QdbPknogJvjAFn7264dkoPlcTxg4IKi/3Gb4P8F8/GPj1lcno+lSeUS01ztLXZQRXUY
         K+yOvO2GwZIMng2dHS6cn9xhwWE9+wyxt8Vtv+b2aIg3ebbWZDJU69pCY8IT5OvCCFPp
         mrDvz7raMucMgP6ZZP5RcX/NsVMjozEIkYTCyD3YS0gBtuDtJX4WMN5DR0svn8DPtUAs
         1RNQ==
X-Forwarded-Encrypted: i=1; AJvYcCW+U46w7gtFIlUJStqBfCZQg8BdQR0nfrwl2sa0kjURJeE//lYgpPHwL0ZKWy+sbjN8DEvoAe+Htzq1+h3aWA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzJ3v6tlcN1D0QVG86qwMCzbsbVk3qTbrHmS+97gH/pwzfr6g5K
	ESLeZhNKXhhq/dkkStzgLz8n8CBVq8LYZTRfhcQvVviV1yeHeY51XdrzQBP9BGo1dosICb8Awtu
	RAiDBhm7iCP2YkLx42X7YPRVnoMm61XP18Yxwg/g=
X-Gm-Gg: ASbGncvtH489rFtMtwLBJLI4/G3qVlErOSF8ezpfap+VIG+2SEt6cOBGTsahVsx9gV6
	NImfo+1jsoKQL1A0A9b5Q1lH9JjQOQMZzEsgtVZdHzLRJRf6tdzskxqk26ju60Mall2WhWjjfQh
	DUfzbxdULvUlXuEwyn1MM2hhd5Tod1vFvs
X-Google-Smtp-Source: AGHT+IFG75p1b0y7DcPD0WF2ELFwO1QDF98d4w7z3nttvnKDsN1OwBgaM5ZycQSrYnt1QBlmKkKRc/c32v+YGjmCykc=
X-Received: by 2002:a17:902:c412:b0:235:1ae7:a9ab with SMTP id
 d9443c01a7336-235e1122222mr2425365ad.3.1748988921927; Tue, 03 Jun 2025
 15:15:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529184547.1447995-1-ttabi@nvidia.com> <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
 <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>
In-Reply-To: <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Jun 2025 00:15:09 +0200
X-Gm-Features: AX0GCFstcYQ_94rJznPlAMjkSpdRVERU9Tev85iPJpg-Bw3YzyMLXbcv9H4_ngs
Message-ID: <CANiq72ncoP6oDbKEes7Lz_K6FAz-MZY1aZNAdsYK8Sz-pwyUDQ@mail.gmail.com>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
To: Timur Tabi <ttabi@nvidia.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "dakr@kernel.org" <dakr@kernel.org>, 
	"aliceryhl@google.com" <aliceryhl@google.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 3, 2025 at 8:15=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote:
>
> If the full path is not too long for you, that's okay.  It is too long fo=
r me, which is why I wrote
> this macro.  So if dbg!() were to use sfile!(), it would look like this:

Why is too long for you? Please explain the use case. For instance, if
you consider `dbg!` output is too big in some cases (say, when nested
in `drivers/.../.../...`), then perhaps we want to modify that one.

And if the use case is something temporary similar to `dbg!`, then we
should probably provide a facility to help with that, rather than
asking everyone to write all the time `pr_info!("{}:{}\n", sfile!(),
line!());`.

> That's the beauty of this macro -- it doesn't generate any code.  Not rea=
lly, at least.  The
> compiler determines at compile time the slice inside file!() that this ma=
cro generates, so all that
> happens is the compiler emits hard-coded offsets into the string literal.

It does generate code -- I am not talking about the codegen/assembly,
but about what the macro generates, which is code.

Cheers,
Miguel
