Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 30E0B2153EA
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Jun 2025 10:28:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749032905; cv=none; b=otwd6yEFUaH7GG4WGsVpNgYP15yUZlqqhEn7zDGxK5S1zwskgIIPTZhQvHaPNIKdY7Z/hFDpn9whBAZjjhv9pmwrlUJMbIGR9OMMb6btKgd804Qlq9jojUdGazUY5qw3j3uWAoMUSb8Ch8CDfE6+I3vjODUXqN/XnXZNrgIzwvA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749032905; c=relaxed/simple;
	bh=n+FZxSfBPaIu92FI7GtIEwwCUSLMd6+dxxRWyd7MgPs=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YttBzqhkiVcnlQyH7sVZzbMjuK0HtCP/hHtLdlSGt7cL93uBaS7YZsBdRTNbeausbjek3rQhj1+VaxpyH5wHep4zaBk3PtA3OHLSiFfuPZmAZ0qwcz2NnM3HGp+4bkDoA3qgQOQMl3V121mjGoeLrKwG1M5yDhOt2pjp64SdkeM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bCcK+BU1; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bCcK+BU1"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b1276984386so484900a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Jun 2025 03:28:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749032903; x=1749637703; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=j7UEatUxSFea36JGIxvQCvPItf8MrLKAa5U4HxMzGEI=;
        b=bCcK+BU1OZSMYxMAnaoWxQXozDhTD+tUobxSmFBZc9yBXtJVppusjYna7BYe89Utvx
         KfnWg7S3M8RWRZ0l+Od/6Oq4WwPHdicMPGyaJd6IQs51HHl27djTK2ovQlg/eSSQy9lT
         arKjRQgKN5eoQohujrHQIClGqYDszBp6kdrh8HpBmeePxi3fQx/sTicEsVXp68diH1pS
         W0shijYG+xLpDTQxWn4Jjqe2K2tvEoZZECV/2nsB9y2n4rlUPVYGaVVUx3M571INfQIj
         W72oK2R2YR7pgtL8kBke1IPlgl/txkm+A3JUCP22aoVFjqOfcFtVNTyt2VXf6I7/jSEJ
         sDUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749032903; x=1749637703;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j7UEatUxSFea36JGIxvQCvPItf8MrLKAa5U4HxMzGEI=;
        b=VhfFGE/wqUUsfjd43zSnOni1czxdnZrzOsYeduUoNuB9Z9060hCzGjFDvGcK1I+Koq
         /cfbt5LciBUD4LHRr0lB+Ozkep1MKDMJpG4+QQXVNz5JVyQlXLR2IYiaz2G5Tuf7xQdN
         +ErsOsLqui7sDXQs13Ko37aIAYQAtOK2J05s9vQrQA5XfrcU46rYsJwoz08vPrIneyqH
         M+dP7eQRAkLTB8/eey9Zf+nBug0f3WxNpAgh1zFcS8Ul/ymFlavM8z+LDqr8hmQeZTDF
         avKt9BGBSG/84ecETxuRvp8cc6+Oi8IoBheWzLJH2ogbHiPkatIf0BIvzUqPEgCfnptJ
         jrng==
X-Forwarded-Encrypted: i=1; AJvYcCVid6xYAkxLab5cXIJe1mik6H8R949i1QDKCoRaJn4n7SXfwnldX/+vSo7Q0ksL/DfTNGwtnvCSRlY4Tc2LNw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxG3j0mG/GO161P50ZidP2zH8litWJQulxpIbQuD8uRsE2HwJ7a
	r41JKdLF8D0Algir7t4MT+ptZAyxD+WWPpvXyR+8Z/iRfcYSJlZCOp5gu7Y33Hlw7/Ju4MxITwD
	De5lRth7CO4PGr77trVv3nMfkl99Gd8Q=
X-Gm-Gg: ASbGncuPvZD2JTwVDtXhXFered7r+F9qI5YpwPnTsyT0TBto9RGexNDqrmZOtHsaOmW
	BUD5Z1ab/E3pKHR08kUfm3szzFSksJ64Lj56MMo5BPbPJw6f2YibFVFRXH/WyXqLUPjccHhUvSS
	bBlphm+Oy5A6igcmF9rrcR+WQx6MsqGjSc
X-Google-Smtp-Source: AGHT+IFMrmb+m3ljZmY5Vokyi6F6hMmcBqCFzGCfEonNEiJ4VOFzcusnYCbqNj08vdokYdQGaF+3c/dPKT4zMqKmjAI=
X-Received: by 2002:a17:90b:2ec3:b0:311:c939:c855 with SMTP id
 98e67ed59e1d1-3130cda9d5dmr1303665a91.3.1749032903356; Wed, 04 Jun 2025
 03:28:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250529184547.1447995-1-ttabi@nvidia.com> <CANiq72mqPRMXG3mR+wmGd8M61rWfti1JN7Bgke-TOMtTzFWagw@mail.gmail.com>
 <0602b06ba5fbd640b6db50165688c026911ed7b3.camel@nvidia.com>
 <CANiq72ncoP6oDbKEes7Lz_K6FAz-MZY1aZNAdsYK8Sz-pwyUDQ@mail.gmail.com> <7f644a70cc0c91bb42badd1ac747518843bb1ef7.camel@nvidia.com>
In-Reply-To: <7f644a70cc0c91bb42badd1ac747518843bb1ef7.camel@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 4 Jun 2025 12:28:08 +0200
X-Gm-Features: AX0GCFuen8IhwKzopLXGuI9GtM3hfThSnseDfqkPM84hpCj7VNI2MqxuvS-aMiI
Message-ID: <CANiq72mLEFV6iEX43=+d+5P8g9HT+Wip7eTBgPgqXQ--=dQxWQ@mail.gmail.com>
Subject: Re: [PATCH] rust: introduce sfile macro for easier code tracing
To: Timur Tabi <ttabi@nvidia.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "dakr@kernel.org" <dakr@kernel.org>, 
	"aliceryhl@google.com" <aliceryhl@google.com>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 4, 2025 at 1:29=E2=80=AFAM Timur Tabi <ttabi@nvidia.com> wrote:
>
> I didn't want to change the existing behavior of any other macro or funct=
ion.  This is my first
> significant rust-for-linux contribution, and I didn't want to be presumpt=
uous.

No worries -- things can be changed, and in particular the behavior of
`dbg!` wouldn't be too bad, in the sense that calls are not meant to
be committed anyway. A CI checking for the message from the sample
could break I guess, but that is not the end of the world.

> I could add a sdbg!() if you think it would be useful.

Yeah, that was what I was thinking, though it is sadly one more letter.

We could also shorten a bit more by not printing the column like
`dbg!` does, which I suspect many may not care about.

I wonder if we could make the `dbg!` the one with the longer name
instead, i.e. to keep the functionality in case someone really needs
it. Sadly, that means making it not match the stdlib name, but it may
be worth it if we expect everyone to end up typing `sdbg!` all the
time, and only very rarely `dbg!`.

> Oh, I didn't think that would be a problem.  I will move the functions ou=
tside the macro.

It generally isn't a big deal, especially here since the intention was
temporary use anyway as you clarified, but if a function may be useful
in its own, then we probably want to take it out anyway, which also
"forces" us to provide proper docs and examples/tests for it, etc.

Thanks!

Cheers,
Miguel
