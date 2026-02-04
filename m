Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 793D727F163
	for <rust-for-linux@vger.kernel.org>; Wed,  4 Feb 2026 15:16:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770218183; cv=pass; b=JeMs4WnXOkueGFQio4WfJjjb8g3lS14yU9H0pgU5Kxd/rvdKj70Zp4H7/xux9a+rW5CRI+7ao1mLU5w1sUNyhoRxVduZLeCAsLWW1t+qj3WwI89XlKCRVmj2Qcnv1924valWbRwVQ6J+7lP0TcKOSS2qn1T8CeZy3ASzo2D53EI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770218183; c=relaxed/simple;
	bh=vOKxHR5Pn5XjhsA6S4hosR+O4Si1x3TbaI0Q9Dgx/hI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sBKEc+3MQ7jxZ0cR3QxPYeo7Z3NZQyZ3KVdMmNKTqKJZw/HCHU/4UO/1iRO4Y/gp3huPDsRl4O/Gb2IpS/yeet7CbWGEyjrTgRQUCFoXTgKNY3A4ymZiH2TTljmxu5Za/OHZdIihjvE39IbX9DQRrd1+mQnlDdo1YJaQFpDNEoE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=VvQvG4Ah; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="VvQvG4Ah"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-59de0b7c28aso7858036e87.1
        for <rust-for-linux@vger.kernel.org>; Wed, 04 Feb 2026 07:16:22 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770218181; cv=none;
        d=google.com; s=arc-20240605;
        b=WqZJncmQtaMXzUnchX3vKyh+aSlTemgRFYwAwOJEyalqvJkxX+O7Lp9dfQL4a1kNPC
         hhU1hw0uKw5xakwsiK/khUQBuzkrK/pI6eZCCJjOJl264789eFPooJz5j3oybAoW5uFb
         XHJ0WsA7k8AwAfuXSiTYGXvu4YaZ7yZmmG4DUssdNwxPzd1TG3GVtq8wRTUqmxj8GGN6
         eFYZeEirpmYknUxitNBVWl2JcfZo1+F+7w/C2jiLXRrrIzjwzg/aSmPIx9SeUc5oAedt
         SLphmxtCj9SIzYQorMzwV4KTuCMeFaQqOfZnm/xkm447Wc2iu/zsQOdVXPFrzpic3Vpj
         RlsQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vOKxHR5Pn5XjhsA6S4hosR+O4Si1x3TbaI0Q9Dgx/hI=;
        fh=lQeXuxZ8DSWlxdzyAw40HTp/MCteRfHMSNtTao9zmCw=;
        b=Uo4yd2RsmF1GsW/Zdylvxs7svzfyu5hNx7e0dv787RRmp+PLIHRClUNcu+vcXcq+x5
         OpnES7ddOpKzdifOd9WGEDpcCd0KmqW/ZJ220xrAIXMECHzDsAfJGRF26uAyN11ZpemF
         pn/k3R3UabYx2jtWHB41t760EsFwi9fOB7+hJ6PG3y+8D1n20XzdJimu51uIH+TlMCWV
         vW+AK6SZRkoldsQ9JRtmTxENnmRQiE7NxcuxtMFq2+rH0LnyXuNdzQlUdqBe7SsuMBMm
         qwngCO8jKxWuqhReFxdLrIzM/0RPcgYUnWg6C1BdcRQI2QoZ8uXEh2qso64hSel/g+3w
         okeQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770218181; x=1770822981; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vOKxHR5Pn5XjhsA6S4hosR+O4Si1x3TbaI0Q9Dgx/hI=;
        b=VvQvG4Ahq5V/oypA6V2Uho3ls4aJn8gxnq4v25XSqvM8dBNm1FcO/ycqqRtTlmIa5n
         XiS1crGm7gy08YHMrdmAby1UR/QVl7CVn2o9rEXjOuqa+xG1pVWugy9oq/00GmanPgi7
         dlM/k7Uv5FaKfIyVQc8fg3hC3r6o5Bo+Lj8+lkyLyokKntl20w3isO3TkSqNiKh1I4+T
         xkcVN29q0chO3TXcLEH8HpHojuQu6/8jeC/YKf06rhEhkUoiTpiLIHs/iLcFuKaO1GW6
         hmXYXcCq85n6y9kI9690Mq1M5isXKezy53J7YLs1Gf2LJcxLJE7hAm6rcaX/b10yxBD9
         o/HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770218181; x=1770822981;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=vOKxHR5Pn5XjhsA6S4hosR+O4Si1x3TbaI0Q9Dgx/hI=;
        b=TuaY4anlVMchpyAsu4A0DSIDFOvqenshpvbX+8dvrkuVfCOn+6/2vO1dXhTJSZbQzj
         LyIwtvFGCzKN208Mr35K6bIAyTvrcXrkX6zjx0DCqTad+v0yQQn2RdjVF7CoTXizlsOX
         SH1x1IStGS9ZAnxsrXVSR9qS6bPxXNBl7ZBx/5jXzrAKJeD+bMgWbvnR23oXB8/dd9Cs
         LN92u90a+shXJ7hELYFurZ7ydZmbuHkQGT0RdpqROTej4rHpOp2TZ8qCS+N/IBmFV7zB
         /H1lIz9LKmyIWmz8mtk5+WLV+EcpMEVjb/BZM896Pry5wKM8VyC61fkjoCQkmy6B54iW
         pcOQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7Hu8XXTAbS51OYD7HQ1ONX+PsLuVg2wde8WZ8tR7uaGajRriPaZa8/2Ro0bUp/YpeIvBI6mKbTKpNpcfM3A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyDMwYsVsD4dQK+NPU1h5clU53Bp7y6jnQK/YMrwYUC55zuy1vo
	gMupIdBN6D2Eb20dJDy4CeW15w6Lsv6nSBC7VM5oyoOZ4CJO4PMbLnapySmehDpdxbhDpTOjUf/
	zcOQ8uoEclNQiilGDtEUTtApHzywjLoKjlUdZpSZKMQ==
X-Gm-Gg: AZuq6aKEtUFcDG7xN5CVa+5AZrdd2YUEGJR29eVLic7fPiGPwWCglj9LrCgF2VliVzc
	s0PgudOZuvoMxTjsToQxqH97kNI+ZeYMT07eFohD3IibSvc27SyG9vZq+bYZOmKw1Ms9xpUMsAh
	tg8E9l7Nru0kzYYgPNPGoZbC88M+0rsOjb8pHW0IjKEQASelt8su3IWFtEsiMM6KVCNGE192nPz
	Fg7R05j1P9dUOuIAyq1gLTRERnLE/TCyEb978Z6CIdw21dokoI3rdCN+hJMNKeLqXQU+3RRX9qt
	AVbjsTLip+mbL8AH5HhJoqOVIxjr
X-Received: by 2002:ac2:4f0f:0:b0:59d:df1d:acc6 with SMTP id
 2adb3069b0e04-59e38c087bcmr1391957e87.13.1770218180647; Wed, 04 Feb 2026
 07:16:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260203152818.317806-1-marco.crivellari@suse.com>
 <20260203152818.317806-2-marco.crivellari@suse.com> <DG5G52FJ0I1F.1OHNFAXKXOZ1R@garyguo.net>
 <aYMk5skDB0Rk7vWS@google.com>
In-Reply-To: <aYMk5skDB0Rk7vWS@google.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 4 Feb 2026 16:16:09 +0100
X-Gm-Features: AZwV_QgJxSKjreUqxp5oJC_TK8Odl1hq22mk1HwoT5edXYU2pj5JpV-BndFE9As
Message-ID: <CAAofZF7FPnDtNigBZ6UjWKPQ2a3JX6bm_N-uDxpD3Xnv5jwoYw@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] rust: add system_dfl() around the new system_dfl_wq
To: Alice Ryhl <aliceryhl@google.com>
Cc: Gary Guo <gary@garyguo.net>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Tejun Heo <tj@kernel.org>, 
	Lai Jiangshan <jiangshanlai@gmail.com>, Frederic Weisbecker <frederic@kernel.org>, 
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Feb 4, 2026 at 11:52=E2=80=AFAM Alice Ryhl <aliceryhl@google.com> w=
rote:
>
> On Tue, Feb 03, 2026 at 03:53:39PM +0000, Gary Guo wrote:
> > Is there any reason that we cannot migrate the user early by just retur=
ning
> > `system_dfl_wq` inside `system_unbound`? (I guess the question also app=
lies on
> > why system_unbound_wq cannot be the same pointer as system_dfl_wq).
>
> I think this is confusing. Let's just rename it here and update the
> callers. Otherwise Rust gets out of sync with C naming-wise.
>
> > Also, I feel that `dfl` is not a very intuitive name. I searched the li=
st and
> > the commit history for a while and cannot find the exact explaination o=
n what it
> > means? Does it mean "default" or something else?
>
> This I agree with. dfl is not a good name. Let's at least call it
> "default" or "unbound" or whatever.

Ok, I will rename system_dfl() to system_default() (to keep consistent
the name with C).

Thanks!

--=20

Marco Crivellari

L3 Support Engineer
