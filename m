Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 448F0263F43
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 19:29:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749583763; cv=none; b=HF11/6Fw/jLY9pPKfUzIsLPy9AQnbs2josChsvUqbwIdmVNt9uJwj8+nQ5aN+pTiYQGUacu+DRMTUVkebK1aKntv24xhBbG4uk5cVEws/a9+0krAYeUi+/wUSJnqJW65UdgdtazGbSG4pizn74PUizp2uAUApnKIyhFehk1Ii8E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749583763; c=relaxed/simple;
	bh=jy4g0+v3lGcyxJwWalAYbDr7KY0ttpKPBCGlGJsZs/o=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Yyxn5VOABFlzV9AXZHa84Wcb2z1+waFkeg918sI5uYkL6VX+ZtoR3xn1mlBzVjTRg8G4iae1G5e9iCS0fVbSgkyq9pE3ErYkV2JkLzPI8HNFEi3xCv7vhExaZybfSU8x7A/7yFLpsr8N/OZ01kWJpAKbLrPgrLIo6RXll0SvXF8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Y9i7QPP1; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Y9i7QPP1"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-31384c8ba66so481152a91.1
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Jun 2025 12:29:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1749583761; x=1750188561; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=hQmVjslvxXQiZK7cMhXHAry3DqlW6G7Fi22A1QokJHM=;
        b=Y9i7QPP1ZyDWFDmkDU4tboXbLy5OoLOvYhGt5+eOcxtTgYlbhT5zoYChKdSOvse2AX
         5hLta0i3lLWa+flLrZHlkvaSZN1XVM1kdyM+9zIn1Rq/LKVxY0yI+2geshsyNhC4qaH6
         dKaukN3zPNRWcm2koZNO2Bu4bNUe2T/ws7T+LJuOPe/d4muQ65eseUbxMY2EGX7lr4fO
         5sr+lLwZAPZElaeatmaN7vuSDSfmWbybN7eaPAngZbnz6+kkuNDUATCYo1mT/uht6zLA
         ZIpIQzd7ALvcUDrYIBX4171s4JKg8fueM0IbArw1YlcY1Df7KVmd8xk9WEKCyD5OxTJN
         GHkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749583761; x=1750188561;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hQmVjslvxXQiZK7cMhXHAry3DqlW6G7Fi22A1QokJHM=;
        b=n+tK4DZindCDPjV5kPN8l7hrP3O2ACKMqGKJb0ypn8GmPmhBVLHvd4UTUCRX6bOl7G
         J2m9LmzFN5zOhcmdYNcix7UzCqLfH5ILQqIyvJB89kha8opzG7mtgqZMcxOWWGlvhufj
         drM7f4Mldm50laxrbsSJTb/q82WKMB2KrorOwMcpH4tP1qBrkQM6/033VGEQBWAzQVkB
         vJ7fBymCp9BQH7Ql1OVhB4zqc/k2R8/io1bnYg94En0SNRE8ae89s3xjktjgvdJJ5y2q
         uI6imEzDbBOmGJ+5Q1P5anFg0r71MCcBEQaXjhGkFFAwC5o5N++nMPHcFHaKiTAS8CYQ
         wn8w==
X-Forwarded-Encrypted: i=1; AJvYcCUwaRUG4qyD7MofJhwOqw0Dxfq7VD+6VoJxIV3KW1uh8VCPbXzGr93HZGezigaHrSWNnjZS777hX4rCzQxcpQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyyxehKsh5cB9dgelI3zhvOZJFBDXUXr4P/4BFVgvwIjjdV1Jx+
	PXLjJNl4EOXFOcin0ro8H5XIQglkLN0n+cafzoVKmtbhav/vmyjLWw7g7U6yt4b0wozoXEyX6GT
	jabrg9GD5b3UnPH6fo0sUaovzp8A7fxKOb11C
X-Gm-Gg: ASbGncsv6lZW8PxdHVP4fltg4kMV1jvbnN8KTCQM+sn9A16J3LzzyxN6CwThFTVQVK2
	NSm168DIEoFcV99r8bgnbKwy7vz9DAhBZydPJmTEh6jpthXf2aBKz41YwW7YNPZ1o+/7j8A+qae
	ZhZDKN1MQVOBfK5CXM9RSd9CDqEt3q0ALBIlB5Q4GBXOM=
X-Google-Smtp-Source: AGHT+IE7twfbYkDqTXvzxmhlDh8BXs5ysys9sUZ0FbTc5uHcsq+9Tx+KAbQ3Qc8yDDEKfTCPD1iqJ840BJfcvAk+wP0=
X-Received: by 2002:a17:90a:e705:b0:310:8d54:3209 with SMTP id
 98e67ed59e1d1-313af0f97eemr428439a91.2.1749583761545; Tue, 10 Jun 2025
 12:29:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250609223606.2897030-1-ttabi@nvidia.com> <CANiq72kKamUJTJX7PxmSdZWCWwFHsOoXakjRzmmX4+eQ679ajw@mail.gmail.com>
 <57295c32a7f21488da7e5e15e77d71df2188c80a.camel@nvidia.com>
In-Reply-To: <57295c32a7f21488da7e5e15e77d71df2188c80a.camel@nvidia.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Jun 2025 21:29:08 +0200
X-Gm-Features: AX0GCFukZb1jRDl65SkTg97SUKcVPByFuATc6t6k5yYHpMYQXb6xcM-_E3vvbt0
Message-ID: <CANiq72mEs9ZGFd2buWkBikUD+FFjwMAOCrto=iPoJQNmXGzXtg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: introduce sfile macro for succinct code tracing
To: Timur Tabi <ttabi@nvidia.com>
Cc: "ojeda@kernel.org" <ojeda@kernel.org>, "aliceryhl@google.com" <aliceryhl@google.com>, 
	"lossin@kernel.org" <lossin@kernel.org>, "dakr@kernel.org" <dakr@kernel.org>, 
	"rust-for-linux@vger.kernel.org" <rust-for-linux@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 10, 2025 at 9:18=E2=80=AFPM Timur Tabi <ttabi@nvidia.com> wrote=
:
>
> Ugh, sorry.  I have another previous commit in my tree that I use to assi=
st in building the kernel.
> I don't see any way with --base to ignore that commit and skip generating=
 that line.

No worries. You could use e.g. `--base HEAD^`.

> I'm also a little confused by this line because 4bfda16a333b9f00a139050b7=
c6875922961a15d doesn't
> exist in my repo.

That is definitely strange... eager/early gc run?

Cheers,
Miguel
