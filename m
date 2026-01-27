Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FC5A359F89
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 13:40:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769521241; cv=none; b=TMQ70BA/WEfv/i+Oao/6j0NKQAxEqM20l9IvnpbmWeLWRSXzEAtA2qJiyo3Xx5ZMMILAPbL055cPKCsep01GV3dPIMQh0AG8KtX2o59BJR9EBX3J1lvWphlS8g5fz/J71V2RqQCSh+X8seYEcARI/WeD9hhd/YSZkAtBdIDYCG8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769521241; c=relaxed/simple;
	bh=ty3BaGxo3jogvBtV1830InuxgccMUAA38N2Dj+93OLE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AANfl0O9Y8zTQOmvC2ACPk2XRohfhUP+Nfk1mxQjGiWHvfJHpawazkNCU/YiVbDLkwjuBgpeq4UIVhZmE7cSXYsqhcBzJDP63eKq/kbUTK30vekAZEzSZqE3FnuAoociBxD9S+Yr6hSF9H2FW5+ETsf71V3TQE8QG3FUdihOYKY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VJSyokqQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VJSyokqQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 759DAC19422
	for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 13:40:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769521241;
	bh=ty3BaGxo3jogvBtV1830InuxgccMUAA38N2Dj+93OLE=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=VJSyokqQ33WUc9zfeKIcA7aPjwnXASoGkB9Yf6/lZMkwOrJ3REXttW3+g2+9hGKh1
	 lSs6wqgU+PEcwDyApBr9KE0oCzij4ZjVKP84fqxIA6s/pa2BmEhfdYdtT8AeieVbqS
	 k6fkGrRzsgpCS1VfwxeBot19GXVWsZJGGF3DRk23UizA/TQC7S6L4kU7pU3U3jtWCz
	 fCysqe9sk4vhngekwJUL5lx1cvCc08KTF2QYY5EC2AMkOSXFjkFfJYK7pvHWflsDjB
	 /4dr8EbpX9geSzY/k0JOTXkGrTL2l7XOR9JjztKeuReO8Xk1ok173OLpjKi63wQ/FW
	 s5udMgd/qVxCA==
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-38316d0c26eso46969441fa.2
        for <rust-for-linux@vger.kernel.org>; Tue, 27 Jan 2026 05:40:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCU8XE2PjWdE6eCd9xegLjtuelatlFqsHUAyJDR9yh+tlYb4lUQWmem7kEpYG3y5aBDR0BNuNN8zuf+AnVkUsA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxySrO/ZVRzWlxlRVeqbARrSHEsgcLV+y2eUf/TiNU6SqaxyoZ4
	YfBEhIByu79u9veXIsKs+o4XNY9DBb3EoOOx7RZ8ifZy9qfU26wCukl/LXbpEylcjWcvV7GT4Fs
	+9YyNOcg4YDQgOsRspRTY97jrYJAVwEY=
X-Received: by 2002:a05:651c:509:b0:385:d0fd:df80 with SMTP id
 38308e7fff4ca-3861c923399mr8118091fa.28.1769521240197; Tue, 27 Jan 2026
 05:40:40 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260126-tamird-kernel-org-v1-1-b390d329b0b9@kernel.org> <CANiq72mX7fozY3Jpt8uy6Wf1ZmbuV=xHF7gfape5N1VaEdxGCQ@mail.gmail.com>
In-Reply-To: <CANiq72mX7fozY3Jpt8uy6Wf1ZmbuV=xHF7gfape5N1VaEdxGCQ@mail.gmail.com>
From: Tamir Duberstein <tamird@kernel.org>
Date: Tue, 27 Jan 2026 08:40:03 -0500
X-Gmail-Original-Message-ID: <CAJ-ks9=UC8UCjzGE7ot+y4BG6OXrSza82Zaz8bbHa=uK+_j4Ag@mail.gmail.com>
X-Gm-Features: AZwV_QjqqAeKNa4SYNfyxmHTWbKmufMuWNerbHXn41tVpqQyhyFSkXOCGfYwLbw
Message-ID: <CAJ-ks9=UC8UCjzGE7ot+y4BG6OXrSza82Zaz8bbHa=uK+_j4Ag@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: mailmap: update Tamir Duberstein's email address
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 27, 2026 at 6:19=E2=80=AFAM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Mon, Jan 26, 2026 at 3:46=E2=80=AFPM Tamir Duberstein <tamird@kernel.o=
rg> wrote:
> >
> > Update Tamir Duberstein's email address to `@kernel.org`.
> >
> > Signed-off-by: Tamir Duberstein <tamird@kernel.org>
>
> Applied to `rust-next` -- thanks!
>
> (I wondered if the prefix is right, i.e. if a comma should be used
> instead, since I guess it can be seen as two independent updates, but
> it was more common to use this pattern, and I guess one can see it as
> "updating the mailmap-related concepts of `MAINTAINERS`", so I left it
> as-is)

Thanks. I followed Benno's example in
https://lore.kernel.org/all/20250519143952.11412-1-lossin@kernel.org/.

>
> Cheers,
> Miguel
