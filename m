Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 187572F7F0D
	for <rust-for-linux@vger.kernel.org>; Sun, 17 May 2026 09:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779011302; cv=pass; b=WJGezmF8yU+qRTaEjeddoAp2sP3yIFMQjMhHYYIOThafpYWPit/OUIsLf9TgA0XjibSzajlTziLrB5076CMlr0XWEy9QG8jX62We1zZ+b4WPqfPOOwXMhCBnid7hkUlChto7gAPDI2M9n207ZHxS2mtb3PRLxti1kQHJfDnu6EQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779011302; c=relaxed/simple;
	bh=fk0uhQwp4prrEBPZo/QiveKATOKm2IGlddgiGbufK3c=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=nfx7pHzbdOYI78pda9EG/09gsYwh2qiFTaON4m+ABMUmErZILq9kA8GIRDzgGjs03t96lZe0pwtltxbCJ80fqxo8K30LLXY3glKkNOrKjHbbo8NffxSQAolxod0CWU9BaqnYUZ68vxf5HQiFkExokmpvoODo/H+F/XmAXKaBO7Y=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GCfhkVbd; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GCfhkVbd"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-12c8cac037cso67070c88.3
        for <rust-for-linux@vger.kernel.org>; Sun, 17 May 2026 02:48:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1779011300; cv=none;
        d=google.com; s=arc-20240605;
        b=JqcCI54YUFUVF/qPGDcc1AfCDA42kQvHulfQHBxQhsCQsX3WUaT+t1xGS6l3vnmBmp
         VXsXEP3+KrL832IumJ4ak6xpyEtz1CKzwXGaoP3nJ+Uw4NLRXaalqN65ARVFeIVScI6I
         euWhjVlVSbUAHrZLsebj2h58q4L9UZ252RNQt9VWO8XkvqBwHC/RuON6EPhS/CChQEyT
         fuqhHgSS59pV+wR5MaqqI0vpCaAU5NVRp6aHHP9Lzfz9SBJWxT7Q6KLXNtKU4qeDZ65V
         eQg5g2PhKLU0sMs7zlnTUGrZXyeKSoCWtbmqP4xWv2YxmLwVhWsSuMoQ/9FztgKYVlsU
         6MCw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sVUqUYkBeY1XFxEA4ae3wa4R5g8DYhw2jdF14zFrc4Y=;
        fh=x6/oSPoO7PDlzCYOLHECgxurH1dzJBFFfhdWQOOThOo=;
        b=lSYxRa9XzWKd+5w8F2SajYtfdvsNIWYcUYDhp8Up+szZDvCVERcaTAZgv8/gerBZPS
         agQjSMP2pdCjCqEMYmxsY64ACZY6CzIKNSbBTeWu2hZ0xt2wemykHjNplNMMewBpEKvA
         QgJGyhqXPROe3F0wBS2jsImz+LsE9k843owOp2S6bE58eyUXgXHQ9xfV/gY4Jpewa9kL
         0fNGkcHUnvppeKs7fqhWdXqwnpash+9yIAYCGVMky4m5oa9ArwJFwGSaG73AXq/1Ya5p
         ocFPTvgEnsX/jxYp2OP4qJVdcERFwY0b3WUFUn87FXBnTUPsEjmghtkM5PeEN6vaRVyj
         R2AA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779011300; x=1779616100; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sVUqUYkBeY1XFxEA4ae3wa4R5g8DYhw2jdF14zFrc4Y=;
        b=GCfhkVbdOCQN8/igHWR8gZVhwCFhk4HQztU4nNEwUtkRUFgb49b11z6YQPohHl3OX3
         WxyAr3A7XAqkB5i+XyOpcQ28F/Wx9pnc7+B7hHpWCcfuCe1aSl6XaDf/CuKuDRE2fsdw
         VAXz4MbsZtgrKiH5jRywsoeD8mhFZXpauULhtDE/MY5A+yD6vorEZ0vM+Ocms1j762im
         X4jYdmF47TB8PgA3x6A+Z9o3gNpkD7v2DBFzZ6mOEZ7hr1NHNtTftmVELNomnHr6+yE9
         X9pS1Fu2cmyKKPSx25Jd0UvJA8BvuOqoZHwSRxZuRz8Q3WOdpc41dqUYeqgNqdjLwFgK
         9GWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779011300; x=1779616100;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=sVUqUYkBeY1XFxEA4ae3wa4R5g8DYhw2jdF14zFrc4Y=;
        b=NG42NMYFuh6kYTZHDlJJGx9s+SO+QEn6+6gYa8q0MRzZnxYwwDe3h+5NuhjgXNeXeV
         hxkBy4JEXRQsYHeyh1qdkxMdnh+779kTqRh/5edCfIF7tAmDlJHThKiXdGSDmDPTqB1P
         uAGOJZClECEU4jbGYjlyXaJBiluzwkCI7/HP0pEi7k1GSVY77LPPTdkKt8Wm0TENyyEW
         rUO1owg/3rAjVUICCO6ODsuHVmyTkopnkRfwp2evlrPmsuOMZaOhQteBNcfjKOV6zsAG
         AHggWDibK03TJ9nwQQh/ly0HAbaIS0bFSKdjwbn2Ig0AAfCxJYZxnP5diL6vmvXqletf
         exHA==
X-Forwarded-Encrypted: i=1; AFNElJ82SBMF2iLGm0isGcpuzceqHd6OpMFC+7ogBpZElDKR41Zzi9Wq7wLyV9WVLS+UcdDL1ELyU1V6JUsdMvhYeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpYqZw5ZlMyNxd4PHdxlEsvsiOCkUy8VaAhB1sALt0dwG5nWOt
	Uk9tqHdbAIBAjgxdDZcU25HlAvGiYrTDtRSyAlJin8KbXs7IHR97PZ48SfCwmc/mKTx9G2yHItI
	JXS2OBvlkBPXnbU0qT8PuKOf9HQM6HKo=
X-Gm-Gg: Acq92OFedTF09sviQ5kiZ1A51ECdWGhaJzLPmpKvR1GMplt6ICViRjmJm3aqNJtPi+R
	ocgAuPeP0AEUyB8sU+zAXEjXju5e5Y8Tj092GdpUSbZi1AgJTIh+lsMzLsjIgUwoRYDVf98V6vn
	PVbwJ0aFNE8prNV6Q5CKTpr9ENQZFh8SHdFKBlIHEzJcbESpw5nF3nNWfqG3jF0uOyL+teaIXD6
	VmgUrTqs98t9S2nNzSyjRglMB7dgy1k14SYEgPewVl6I9LDF0s8Hfq0Bm+KvQhTHIqsTnY0Eujw
	450ifn/kqFqdooZ4HVgn/xPpCDvHiFBdYsuGS4LZxUBteG8tH4ldVcYDSBkqJ/P/s551Gj0Xpf5
	IeZ5OOhPhOCpTVl44yfKN1Hs=
X-Received: by 2002:a05:7301:6448:b0:2d3:4252:b13d with SMTP id
 5a478bee46e88-3039868bb9emr2318584eec.5.1779011300185; Sun, 17 May 2026
 02:48:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516215354.449807-1-julianbraha@gmail.com>
 <20260516215354.449807-2-julianbraha@gmail.com> <CANiq72kr=tzvEitYj6xyT=jGnKQZK1dmekSU3us7MWGTrv0FNA@mail.gmail.com>
 <615113d6-7e90-4d54-ad1f-a6833474e8c9@gmail.com> <CANiq72=9nxRgfFf1WzWgp=TP9or=Mi=wLyME9-f2M4hti+ZNcg@mail.gmail.com>
 <18809682-aa16-4ab4-b615-cefa525c872f@gmail.com>
In-Reply-To: <18809682-aa16-4ab4-b615-cefa525c872f@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 17 May 2026 11:48:07 +0200
X-Gm-Features: AVHnY4IqZjwtBaQ4bjp2dDDFDM7IN9UCZH5fs8MV0fMtXZ3wLSajt2Od6R0WmJM
Message-ID: <CANiq72=2CFJGPcO_zP1wbgXiDAL=gOUcHRMMP_bEUa1U0rZB_Q@mail.gmail.com>
Subject: Re: [RFC PATCH v3 1/3] scripts: add kconfirm
To: Demi Marie Obenour <demiobenour@gmail.com>
Cc: Julian Braha <julianbraha@gmail.com>, nathan@kernel.org, nsc@kernel.org, 
	jani.nikula@linux.intel.com, akpm@linux-foundation.org, gary@garyguo.net, 
	ljs@kernel.org, arnd@arndb.de, gregkh@linuxfoundation.org, 
	masahiroy@kernel.org, ojeda@kernel.org, corbet@lwn.net, 
	qingfang.deng@linux.dev, yann.prono@telecomnancy.net, ej@inai.de, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, May 17, 2026 at 11:33=E2=80=AFAM Demi Marie Obenour
<demiobenour@gmail.com> wrote:
>
> That's true.  Some distros (Fedora, Debian) don't like that either,
> but that's a bigger ecosystem-wide concern.

Do you mean that distributions would like to package this tool on
their own? If so, I don't see why packagers would be blocked.

Cheers,
Miguel
