Received: from mail-dy2-f43.google.com (mail-dy2-f43.google.com [74.125.229.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A573392825
	for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 18:22:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.229.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790706173; cv=pass; b=KxuyLDofTNNWN5uv6yPv4vUFpjvR2r5EkMAW6EbbSvDwsn7hCSU0gK75r8yh2rp8q+WfwpyKOFwL673mrXur0Kp/dPgcyvIyh1vcj86wgKje3bgrmKHQkRr3M5QzwuPKaKvqIqbLui/ywQpt83kswZDbId90gWa4RXsyDYVNaSM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790706173; c=relaxed/simple;
	bh=qPGluM7bzSePKiKQ5DuyHlAjjz2yzbTaVlylrRpHwbc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=c3GktBOD31yssCOp22wKf129InLJF4azIKdyR+9wj2zS8CtIfYBBnrBoYexWtfaEd8uEwXKt9YG/XVWv2RbxyiCwKNLkNsW0S8NyPYSfHw6h/+mqH6yBdkYZ9T99O5UDRkoTqzBk2BOKPeLzzpXa51YjqFpZcLw8KU6W+0thd6I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=J59pIGBY; arc=pass smtp.client-ip=74.125.229.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="J59pIGBY"
Received: by mail-dy2-f43.google.com with SMTP id 5a478bee46e88-340d23b6a9eso336687eec.2
        for <rust-for-linux@vger.kernel.org>; Tue, 29 Sep 2026 11:22:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1790706171; cv=none;
        d=google.com; s=arc-20260327;
        b=bKUCJbUclToZ4xA9M7BYACwzI1FFFuPSz2rByDMjVMLXBSLlbzj6LzzsR5qZOPP+fW
         RClL5lF9FgtWQK2ZKsZFT7QbLb4Ts7nnjVFH1wYyoSUDXZrKm9weOWIZzVhr26WrcRlu
         40AGp2ISgjf+vb0QJ932wZ6V7WvhwZclAXBfTQBgZRNqE/Tu1u5l8Pa0boIppBlDU3Wn
         CW0Z7gSB3XjjnUIBsKkRIJm5JD9SYsc5TYh62J7O3v2zcjky2RwRdSgXJBzEx2Bh8LXP
         6hGB6r0EvTeTxRAAP9GkUxpNr1Spt8nvT71xsOTVZJU3bjH0v4l1+MkvOo1vigK7LmV+
         pqTw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BxHirEPLUOp/ZKbmsPq1boQV/ZhC/S1eh74CEczWY6Q=;
        fh=Jrm6HAebxKdx19Eg42rCN3UhT7eo5vwqysaJznlmWqM=;
        b=Npxw37TW/1mqgXjK6FiOU20ozJNbNdiSOTZ7lePdPybHRhYxh/vt6D3xXoA/b9VT4/
         kF4WKX7zdUJOpFQcpF0yTZrIBxrLSmKp0fZU1Mt/fnUAv5Gowl20E3fLeo2T26B79qdk
         HlWiou4Gq9n6bc90G/tXYw5h18zynpWfBe9wPUXGl9RwtR7jYm7/sZppUAMV+qdRQFly
         b0QVi+Bgn698gNGRQTyYbt1iLMbpwTyOySM2Jz/3k9Zs554TPPshuGQA/qtrFZXPPP3Y
         Y40Cse4PCL7aS4tuTZcYlK5XQS+ZMBGtXPLIxCVwyWMUEB26AtX0e42WcpEuoioVpE8K
         lyfw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790706171; x=1791310971; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BxHirEPLUOp/ZKbmsPq1boQV/ZhC/S1eh74CEczWY6Q=;
        b=J59pIGBYrY7EetPeWcLIVhBvXjhMMm5f5SxFGni8mj/Y5csLu/nvZAefkUrro6GMXi
         +mZ22/qd3hj2UMb6/wlJMvZ++9fLY/fAmtiR3JwLC6ttO43NoKiRjOR4VF8Gvm26n1KJ
         Sk5BdGv0/GLa20yzKFf4iZgeM/27pBhRpK1G0r8bFL/bOgbxSiefDSBmxfwLQ4QvdHVl
         ZAXiPukTGLOAvtbuiq59Z+fAe7FDXN5MBCakjXMwDiNfA3FM8t8Y0Irea4ohMf420JOI
         2e5eZm+WBRe2O552AkXpGy8ObYR0gf+bScITaqHC4foewC4mZZhA/7HAf1i33+oX+dmi
         sHTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790706171; x=1791310971;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BxHirEPLUOp/ZKbmsPq1boQV/ZhC/S1eh74CEczWY6Q=;
        b=a+QRdPG2ZevGwAQwCOuD7vzvogFYrzA0NYtp3fDWT8VCWUeWfEtJkGk7mlYhBeVZRZ
         7KpbQSJ7EtV9K7q/ukBf5C7fl7/6IXMXsZB92fLU1hOGyakDRzRqAH/5Cg33CNogbE0Z
         JOSYS5yDA5N+TYo/Yq7o0eRR26GT8wu/0Cz7Cf6vDCPH1soB8dMkfFDqufquNGUzwjAD
         fItJbRJ1mkH6maOnNFJHdc1tA4GL08JWMvBRm+uGlfAgvnGDzUvDG0m/aClbUjhBNQzx
         GmMDoTFaFIgZh/TeOPY4fiFMSdV9KjKfTmG7BIAU2ZBD1E7LCG1Ue9vMzTVEq4S5lRZZ
         CUBw==
X-Gm-Message-State: AFq9FYK4YsGnstdgjlT+B6sxCxbAlZ1/vm0HqHZEEFfcBugeSVuoqQ+a
	vJu37ACnhmTQ1sc/t0RhEWDinU606O7VELzwfBdTC/qtW8eh3n27M9tdhzQLjXkstfNaqHffP12
	GeI+qzARhMxNqjh7h8CfohGrtUygyFtQrifEuJEM=
X-Gm-Gg: AYBFou3i4hmmc2uaLwsHNdHQdr9seAquCFiKSE9UJICTYUcbvJpkv4MuVEOnKevzMBR
	nog2iDszUvFldruLgmCJdgYt67rV0lmDZ2vkDGTOnGUwj21V5h/iT9F5LAxe/eyjNB2W5zsxPef
	hATzPloxwNlmH66Zm5mhC38gLH/pGTKGlyzJlNWBRjvFPI1fm2iZMg7r26nrh4TfnUt29z7dFUh
	QfZB9bUySr05CUSuRIHeULrjpZ1dlSLefWBxRng346P8ZtzvkfFnQvA1YCVER0QOItrOTY8bK80
	hE71AsXgAfH5FasQJK3J+ZKK0/5T38al3iS6guqrv7mBYNSp9g5nB97DMI0uk3+ymveG/7pYkCA
	f+Fm64EPToOkmw+4sxTyuw0FAuC3NtHDd/Ae+Lnfrsoyi7RhsQpabPFLB2PaF4NtnKLoex11nKJ
	meUYZmrjO/6w27aFJGNdg8bQc/pVt+OuToSn4WeWTgNmbAC4xF1xhHxvis5USu3w==
X-Received: by 2002:a05:7300:54c3:b0:340:f698:fd56 with SMTP id
 5a478bee46e88-34c65e57c85mr277407eec.2.1790706171050; Tue, 29 Sep 2026
 11:22:51 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CAGchGNvUS43DJGdFoUCUtvS+Gk64=n+GPdAyt+0=n6ejAUhFRA@mail.gmail.com>
In-Reply-To: <CAGchGNvUS43DJGdFoUCUtvS+Gk64=n+GPdAyt+0=n6ejAUhFRA@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 29 Sep 2026 20:22:38 +0200
X-Gm-Features: AclHuK9ogD4IG9vdvePLh70NOwGewYYMIYY1Art0RKxLlpE4Og9ZAV6met42EKQ
Message-ID: <CANiq72nhKoT1GkHLQu+sRmXOvjCpNVFxSwdWkhxO8Pgj3JLnkA@mail.gmail.com>
Subject: Re: Searching for net subsystem rust abstractions
To: Lane <software.research.development@gmail.com>
Cc: rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Sep 25, 2026 at 7:32=E2=80=AFPM Lane
<software.research.development@gmail.com> wrote:
>
> Hoping I have the correct group.

Cross-linking your post on our Zulip where you got a reply so that
others are aware:

  https://rust-for-linux.zulipchat.com/#narrow/channel/288089-General/topic=
/Searching.20for.20net.20subsystem.20rust.20abstractions/near/626973899

Welcome!

Cheers,
Miguel
