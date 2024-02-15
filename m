Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0408B129A98
	for <rust-for-linux@vger.kernel.org>; Thu, 15 Feb 2024 17:36:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1708018569; cv=none; b=ufOlI8W/STzSxiFMrtz3aLQcv3wzFdghGsutwP+yq1LM0Jn4X6DrL+ngSkDMQv20YgHwmgtgBr9kGG7CYDpz9yojXH8qNcthxWNld3JaEwQnxRu3wqdgUpiMllj76vnScHXiyBsDBOViVUYCa2ZreuRiHvaq3K22uxvFhV6lGtU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1708018569; c=relaxed/simple;
	bh=ifHek5nWENT8b/azA10n7ejQlaAeAGWV1ocSIZlz31E=;
	h=References:From:To:Cc:Subject:Date:In-reply-to:Message-ID:
	 MIME-Version:Content-Type; b=iet3F6xGek29lu1F3yDlL+WIEIAcFqM26/fA41ilttOpx/fjeN2VzhOzQW+YyZy1TWTDsSaEovqisY7w2ZRyLjyMu+t0uvBy7lA2X+pWfdmJbS2sfL3zp5H9zW7JirzUVeVaWQaJmLZ7aXC0NxfggOTlCpVfCCqXAjLBmEYq+Y8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk; spf=none smtp.mailfrom=metaspace.dk; dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b=Mf6pZikM; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=metaspace.dk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=metaspace-dk.20230601.gappssmtp.com header.i=@metaspace-dk.20230601.gappssmtp.com header.b="Mf6pZikM"
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-51178bbb5d9so1286740e87.2
        for <rust-for-linux@vger.kernel.org>; Thu, 15 Feb 2024 09:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=metaspace-dk.20230601.gappssmtp.com; s=20230601; t=1708018563; x=1708623363; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:from:to:cc:subject:date
         :message-id:reply-to;
        bh=U3Urv1LBctnrQ6y7j7vRQ+FBqJAxlz+xspUUZIIK08Y=;
        b=Mf6pZikM4qDqmIqVMnlcRAhsvZWa2jrW32kxpyBnHJDuecpZHUHPrh3frdWNZxadV0
         Ix/RZ5hgFBWB4Vs8HqQ0hVXH4usgjQ26lZWJkuf+KoP+XNTdqnV18EzPtmapZk2Lbyfh
         nwg9vKAGOI27ZcT98LatteAoLnsbjcfBR/qb1pNwHQnUPFtFFiGroY7kYkIh7JtiE5ZX
         otZrgRk4JdfA3Vp/w4F1jTuMaGX8zOTqGE8pb/Op719J/MatyFJY3MN+HPbLOm13JS4d
         Qea3cr/3slkBAVTeUiofb5FROp9gks9X+f/7lnP30H1WeieiKZOqD5PY+oegYSiR3U7Y
         pkLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708018563; x=1708623363;
        h=content-transfer-encoding:mime-version:message-id:in-reply-to:date
         :subject:cc:to:from:user-agent:references:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=U3Urv1LBctnrQ6y7j7vRQ+FBqJAxlz+xspUUZIIK08Y=;
        b=jfUy4s37bKOdKaiVfAi4WH+5AaZmHhxghzrAEs2GaI/8E7QyEuFOgooBjhXAPpw3nD
         YgXbVM9YRkPGQ3LsNDK1ztg44p9cxi8YA1+/5PhbEY5pMy8ukJQ3MZZnZG+zeEfSkKpQ
         Fw+W50wFZVndVDfSEnqbNQ7sEyC+/FhXZHVdQPLxZ9ynMDwkB+IVdIuGz8iKlhM/Oss+
         mvFkFeefWu2hRE20t4etV2Yz6HSHSBONvJk150ZNoXsRAIiCiuFBINkVKa8jyxHUtWQO
         TK1tujD0vhssE9IQN6djqJqZtAVT9uZPNDnSjIgsPHtq63fpvrDxVWoAxY0mobQSgpXq
         jklQ==
X-Forwarded-Encrypted: i=1; AJvYcCUKRiLQLlhhs2jRNftetyqWhMdPt8NtKc9iNWssZgOFSYb8YgfNrEHdCM8p/E9ViCnU+ajGvnmHhnapB0zkISJHA7OxXuFh/9k9M2GgxlQ=
X-Gm-Message-State: AOJu0Yw15rR4i0erLf1BP1jB9+sWwo0hyzLCCr7kNwOfmUWfSYVPOepB
	spUrFhtkffNLd0he2q72IBzp5vOZE/Dw50Sdqtp9RQs/cZwSKAu8Hbe59fqDj2k=
X-Google-Smtp-Source: AGHT+IEfusafB+/WeqbAPCrHHkOhLjnaX0UI8fQJkKLKRFISELxiwb/NXTa7hJhmy9nny+DrwQnrFw==
X-Received: by 2002:a05:6512:3b21:b0:511:64e6:115b with SMTP id f33-20020a0565123b2100b0051164e6115bmr2603553lfv.2.1708018562679;
        Thu, 15 Feb 2024 09:36:02 -0800 (PST)
Received: from localhost ([79.142.230.34])
        by smtp.gmail.com with ESMTPSA id v9-20020a1709061dc900b00a3ce9081547sm774256ejh.39.2024.02.15.09.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 Feb 2024 09:36:02 -0800 (PST)
References: <803d666dcd5b1f927590719c10bdd90ce2ba6dd0.camel@redhat.com>
 <CANiq72kQ52nMEhe_-_vxRjV0-BOBU6DbfYUni_SCEaAyrZjc5Q@mail.gmail.com>
User-agent: mu4e 1.10.8; emacs 29.2
From: "Andreas Hindborg (Samsung)" <nmi@metaspace.dk>
To: Philipp Stanner <pstanner@redhat.com>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
  rust-for-linux@vger.kernel.org
Subject: Re: RfL currently does not integrate very well with some Kconfigs
Date: Thu, 15 Feb 2024 18:29:32 +0100
In-reply-to: <CANiq72kQ52nMEhe_-_vxRjV0-BOBU6DbfYUni_SCEaAyrZjc5Q@mail.gmail.com>
Message-ID: <87zfw1ocjp.fsf@metaspace.dk>
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable


Hi Philipp,

Miguel Ojeda <miguel.ojeda.sandonis@gmail.com> writes:

> On Thu, Feb 15, 2024 at 4:24=E2=80=AFPM Philipp Stanner <pstanner@redhat.=
com> wrote:
>>
>> Recently, I've been trying to accomplish some work on the rust-pci
>> branch in RfL.
>
> For the `rust-pci` branch, please create issues in GitHub, ask in
> Zulip and/or contact Andreas through Zulip like the website mentions.
> It is not code ready for upstreaming. Please see:
>
>     https://rust-for-linux.com/branches#rust-pci
>     https://github.com/Rust-for-Linux/linux/blob/rust-pci/README
>
>> So, it would seem there are some "deponds on" entries missing
>> somewhere.
>
> It sounds to me like there are missing `#[cfg(...)]`s in the code
> (i.e. conditional compilation), rather than missing `depends on`.

It is likely. The code is only tested with the NVMe driver. It is not
polished at all.

If you find an issue and fix it I would apply your patch to the rust-pci
branch. You can also send me error description and I will try to help
solve the issue. Email or Github issue is fine with me.

>> Is this problem known? Any plans or suggestions how to deal with it?

I am aware that there must be issues, but I am not aware of specific
issues. Again, patches or bug reports are welcome.

Best regards,
Andreas
