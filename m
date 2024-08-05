Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EA4C113A271
	for <rust-for-linux@vger.kernel.org>; Mon,  5 Aug 2024 10:45:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1722854731; cv=none; b=WdgNgf/rEvg37owY1liSK22NBXy0se5nZmJWfPfNWSUeS2EUQzPQQ6OEBngqQPPf1krEpHEBHKGM6l1iJrlnVcuyNnauTjQ2yC9k6Uo9Vpj5PawwYfqdENxbmlOkvtnu8irlBX6siR+sIQhvXBEV8p3T7sxxcFMnPD4FXhE7SDw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1722854731; c=relaxed/simple;
	bh=l77nowgJJLqx+Xpkk4YB4ELFFPcGXrmJa/5fDWwiv3w=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DtaZxZAH9s7E+aHVlKyjdjNZClEOx/NCYaEvMIeB4O5x+IDqlBYQYojaZxPCcNSnvel7rpN6xHS+nqUt8a5qFEHLhhS2ajDg5RWWYnDZPdHZkPi4Nu14FAM5MCTl0xENal9u0l6BYhKeKdEi9+m7e1Alp8x7yJf1Ox4/j7IZ2TY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HGsopt9E; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HGsopt9E"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-7b594936e9bso3198088a12.1
        for <rust-for-linux@vger.kernel.org>; Mon, 05 Aug 2024 03:45:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1722854729; x=1723459529; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l77nowgJJLqx+Xpkk4YB4ELFFPcGXrmJa/5fDWwiv3w=;
        b=HGsopt9ErV+z+bOun8nHgstMClBlBd1FICZOWfh+nvbm3Um6ceWVgPMqS7djWwk6K6
         BwD8MJSVAG9BPA2/2qkSYqI/egg/66zNvBa5k6ebVSguP+NsPO/WhdoSL1CsMuWkywZD
         qII/DfZuajH4IBVLInpYU2NCmiazrLUAlxWhAeBHCwKBfK0WzmFUBCBubGWhsVzxg7JH
         dO1qs853jIKjetZS9txDNYTJ2ddT/w/r/obI0lzhtv+/9IzXXvYnPr6k5oNYwgKTxJbK
         g9NNM9g6SHDTWpdB8e7d/JelCz8He17ciZKQBfEPkaazHA40XCWudh5RWb4BpzfrPBLb
         ghug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1722854729; x=1723459529;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=l77nowgJJLqx+Xpkk4YB4ELFFPcGXrmJa/5fDWwiv3w=;
        b=a2XjveGnhFFNDCXRy83JNXtoWrp0VeOv7CYIyM808pFWdXyJ7ncfICby/upkbKSk4g
         vhYPRVOUnCduljKvoecn6Q04NIMmeml9pD+vLJRcrRDDb0iv92grtzaXWLoEutyNLOeq
         8flIcTspDYCmk/sVrSjqnPk3rByc/ToqEchaCDHpSVEj3EH6PzXYzv8NXx/ji97q+LXd
         qzDverjNizjzpLYnlc8aE0EsaFZ3wf5EZuAHdA1kWUKk6ThzVnKXK0dY16qBT7LkHS5x
         +4RClY7JpEfIiCpT0HyRbq4QTYkPVlpBOWFB9dtdPH+HJE5tHd29uu/HAIa1UD7jItut
         DwOw==
X-Forwarded-Encrypted: i=1; AJvYcCUyrPd76/8h+PEiRW9MDB33RV3zyjyx7qGP6XRuLFO+3uQ22W0Ga1rpwFiJwVD+oGNn5M/yzBh4mDGWdE4pjijjhK6CY97UMqy3DMkmrfA=
X-Gm-Message-State: AOJu0Yxjgz65pZ68Euxx/Q3sD6mJN5GGrjeQhqiR5j2ai1+ydOP3Jljs
	Eu0hpwMsRDxKxL9o479EU8/96AT8cMPlB6et6DyyY0HT7+SOD20alaEUlfwO79ZyiRaQ5jvUK8b
	bDw8POioJYbhNQPfYE2UsinzTL8g=
X-Google-Smtp-Source: AGHT+IFTSaa/k0ozlxGdViV0oGDrMsgcMVtV3yNY8lunkz65oam53ZEodrlDMg4z2zeK2zpkFM7uKQUcHzObekA3Qng=
X-Received: by 2002:a17:90a:a417:b0:2c9:6f5e:f5c1 with SMTP id
 98e67ed59e1d1-2cff93fe5c5mr10724366a91.10.1722854729273; Mon, 05 Aug 2024
 03:45:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240724172713.899399-1-sarthak.singh99@gmail.com>
 <20240731080021.195732-1-sarthak.singh99@gmail.com> <1faa08dd-1fb0-45c1-b542-775e131bcb5a@de.bosch.com>
In-Reply-To: <1faa08dd-1fb0-45c1-b542-775e131bcb5a@de.bosch.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 5 Aug 2024 12:45:16 +0200
Message-ID: <CANiq72kKT0Kub49bAr-To=azcUvedcT7N-zCseGqjq=fjcppPg@mail.gmail.com>
Subject: Re: [PATCH v3] rust: Support latest version of `rust-analyzer`
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Sarthak Singh <sarthak.singh99@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, a.hindborg@samsung.com, 
	alex.gaynor@gmail.com, aliceryhl@google.com, benno.lossin@proton.me, 
	bjorn3_gh@protonmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	rust-for-linux@vger.kernel.org, wedsonaf@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Aug 5, 2024 at 12:41=E2=80=AFPM Dirk Behme <dirk.behme@de.bosch.com=
> wrote:
>
> Would it make sense to apply this to rust-fixes and/or send it to Linus
> as fix for inclusion into 6.11-rcX?

Yes, that is the plan -- it would be nice if someone else confirms it
fixes it for them, though (especially if they use another setup than
yours, e.g. no VS Code) and gives a Tested-by tag for that.

Thanks!

Cheers,
Miguel
