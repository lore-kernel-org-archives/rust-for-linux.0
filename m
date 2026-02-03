Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04072395D9E
	for <rust-for-linux@vger.kernel.org>; Tue,  3 Feb 2026 08:41:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770108082; cv=pass; b=qdcDaEZ1fn6jnrEdLZUs1bjwqtcqKtdMY0m32IOSFh5KU/mpR40lQJHTTbKUOhJVvsg1wzMRlmjeobbyaYpChlFjOLzxu/yaZPeORDZMHitfqnuJaxhBherI5VJtzo1nwxc1qPsZNhKB7ThbubAaAe8YjJFRzg5JBwsW/u5sOIw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770108082; c=relaxed/simple;
	bh=PMRxlbkEF4KFUzoptN2CxIOjsCTZ10JowSrQO6l1IcI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cG5kghjjAdJzVOIzAVk1T0sTgPrVMJzs2JQ/bXk+M8TpgAYh4FuZ52Zqui4ifQ+uq55i9EcfaXcuusFlbDYYy9C1cjBmVViGmAhpaVhunlmqj2fvXc+JI4LUSIcok49LgXIPkeoo2sbAIHtG+ovN94K66WZYlJrxUIPj8WpXNBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=Jm7IRc7H; arc=pass smtp.client-ip=209.85.167.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="Jm7IRc7H"
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-59de66fdb53so5027074e87.2
        for <rust-for-linux@vger.kernel.org>; Tue, 03 Feb 2026 00:41:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770108079; cv=none;
        d=google.com; s=arc-20240605;
        b=j8LmIeI0m8Y5NXrHwfoFAb0XySJwk21GmHdGkN0geucsQ/lstpaXLx7UTO4sD7BoX5
         5GFK/bz/EOc8afbfeX69XCpCH2LOIOexvljI1ns4VynBCW9u6LhlYvIqlXbKCcnxVGMX
         YVTT/vaabPSRDFOLKnIUqnuda4J5OqAgloQEvWlr7aj0vDft92G57CEGOKYgIcRNRdYN
         XdL+8fbu3oK/Zh15lgiY9QnuvDRrqJzOWDFvK097w+8obyU2AYUtKFauLdj74T2Bxlws
         iaBrSho9AqtzbgXBbnuu9eIpGgTx8OCdUDJlCrNE6HYEbF3Z4Wwg6eYgxcTGfeXZ5xW0
         KTkQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=NcDKsRau6HZ+Ra5LecblzQ+rM9+KKeh5X8nRygpe48c=;
        fh=BgddBE6WRQAFIvQxsSmCar5eygvXE4+vkDKg5mRMV/o=;
        b=apt9hvrCZe7BCSyON5Sta6Yg7RXbGuT/F1q+xyUukK8fo8uNDHsvq3zuzkfsdJBXhB
         g/37hxCwmgGhWFS6iQKfAgBws/wfDrtA40KWym9Ps4i1Ak/N+XE/fgzpTavMcCnoTqBW
         0XdFvpZsOf/mefb9DjdO319o+TwhZe04xX35p5qXNeDb9pG5IKpQOAIljHi+qHA3wzrd
         A04zC28F4AIUO4cW4fwYaO6ufD++pHDG735G4mWU6Z51TG3nTxwn53TYx45TUMvbrSPe
         Zd+pkXUPtP/tIfG8iEZTsxuF2gPpx/8jKVhhsn/wkFdS58N+8YTNUG3w+AD5I9yoR25+
         7eZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1770108079; x=1770712879; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=NcDKsRau6HZ+Ra5LecblzQ+rM9+KKeh5X8nRygpe48c=;
        b=Jm7IRc7HL4BkLlk98Wd099P5gg28xDcdWdqaM5WWrmLuvFjMW/OCf6tr1V2j1KYNgP
         KJlddT1ni9FTacLBNmRXloRjnLVIZMFlyCM8MPgTRq7leF70HOacxV3ClEKf+QaUmfQA
         oiCUi1v/6vwqH6pRnJeSk/YZHHLbZK7wXMMWEdlZO0I5QxmbPmm1t4h357JVRRL7Firr
         Oq+4P63DBnDxN7fea5B2AjfLMWlwJwxiToQC6quJZFDbmIMZA0YDPx0KdHN50TyLVfac
         8afu7puEjXef7ivOyvQIv+QbyrZ+aqOjGpUzFWfHP1ZdyFulLvqxCejT2NndepJXhbcW
         /8wg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770108079; x=1770712879;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=NcDKsRau6HZ+Ra5LecblzQ+rM9+KKeh5X8nRygpe48c=;
        b=PwmX2a8IZpBo5JW/9WkSyrdFCeUsgNaiwZoQR1qLsF8+6PmZjzPdA5l6fwlYvI1W/D
         GANlWornxo4MmU7Yh9DDyfbXiUGVuLSH7f/ujDUY3TbDxpMdQ0nGYuVJXsQEvOY37xto
         c4AiAZgs+F3QaXRuPimZtRokODbXPzNeGqkdDQoLRfzosLVYgK/rPxyceXfsc1u0r9Sb
         D1K1lDKb8aAjEQrxU2+w4AOklC1HiykliFVY+/YheuvNFVwLU3n6GR68ZJz+amrwwTQh
         cdW1S4J4Yy5jG5m6FEj3vhgjk12JDlIcTwAvzCoyOwjacSV6bsrXXwOihCOA+ckZTSvX
         X4HQ==
X-Forwarded-Encrypted: i=1; AJvYcCUSTcXHwvhe3+qz6e+d7qL3wh7BD4rCjxrnafo53X57M5KbPnT6WcfN4JEuPlSX3lSXgu+vBEQYyQORtPbL0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxiEwiyyOiAYL09yyO0ZeYkvArivlmkAyyzojgtGZId1aOB5k20
	mGPB6NYkLkROwukKSq3m99D35QlRBMyJpkRJ1rSK8dJ2dQA/Oe1v5YHbOq5kXQ5OYLMgUV8JxdG
	suA1T6waU1dgqLq716ccaZ1mtyCefEY2gCvzlg06a7w==
X-Gm-Gg: AZuq6aIPifJRYs6ymZZWQMW6BB+JiEXgfNpxvvLE6/u2tplJOR4kHKfNNXzK2OJpV8h
	azYeZ1nY+PzKNothSarjqM7QuyOKFRdMmucuuQUbdOXjQGVYU+RDkWtypXYoHJ2VPgY2E4DeE6t
	muUkSqomqXzdl3xveSQjvNqe59GFNHVDDzCclyenEBS6v+9Yw+tr+HlC37BA/DiAEZFUNOJbQKY
	7A14tFuYxEE18dp8R1w1XS5tNqXnTMXLs9JrlertdAwVAAC2ztAUARCDYwqtPY/3kWlDh46SJOu
	GQybIiZoa+sZzKdj93ykidk1CvOOyUNwbBwr+5c=
X-Received: by 2002:a05:6512:4023:b0:59d:e018:563d with SMTP id
 2adb3069b0e04-59e16430278mr5843792e87.37.1770108079157; Tue, 03 Feb 2026
 00:41:19 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251008151554.340806-1-marco.crivellari@suse.com>
 <20251008151554.340806-3-marco.crivellari@suse.com> <aOaJlHEPzHcAdcUx@tardis-2.local>
 <aOeZ3ho6SHjmaw_2@google.com> <CAAofZF76TADGfF36gMV7qpZCHpXUYY+aOi_mFwrE6UrnkkQKXg@mail.gmail.com>
 <aWS5Yg9xScOR51Q1@google.com> <CAAofZF58s-q4WxOFYk1K29x+ceiX7rjFuNo498VVqL5AZckkNw@mail.gmail.com>
 <CAH5fLggwRc51eVHAtKO-nUNKJt98PpMOGq2Nrnivh047AGPMaQ@mail.gmail.com>
In-Reply-To: <CAH5fLggwRc51eVHAtKO-nUNKJt98PpMOGq2Nrnivh047AGPMaQ@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Tue, 3 Feb 2026 09:41:07 +0100
X-Gm-Features: AZwV_QjUiAIa8vGSQdvGu2zSuvzaJXLseni5phl-SCrg8JLEHTZ1OtCOtIwRyNQ
Message-ID: <CAAofZF6jcCAdDjRp-7w7+_ZgOG4k3apxbSiKvGoUDVf5hw0GhA@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] rust: add system_percpu() around the new system_percpu_wq
To: Alice Ryhl <aliceryhl@google.com>
Cc: Tejun Heo <tj@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 5:23=E2=80=AFPM Alice Ryhl <aliceryhl@google.com> w=
rote:
> [...]
> > > Another approach is to add a new `enqueue_cpu` to the existing `Queue=
`
> > > struct. In that case, all of these four combinations become legal:
> > >
> > >         workqueue::system().enqueue(my_work_item)
> > >         workqueue::system().enqueue_cpu(my_work_item, cpu_id)
> > >         workqueue::system_percpu().enqueue(my_work_item)
> > >         workqueue::system_percpu().enqueue_cpu(my_work_item, cpu_id)
> > >
> > > which approach is best depends on whether you want all four combinati=
ons
> > > to be legal or not.

Hi Alice,

I was starting yesterday evening when I realized the 2nd approach
would be a better
fit for the work we should do now. I also think in this series we
should already convert
the system() users to system_percpu() (same goes for system_unbound()
=3D> system_dfl()).

Using the 2nd approach would just make the migration smooth because we can =
just
rename all the users of those functions.

I think it's better to migrate / convert to the new functions because
they are using the new
introduced workqueues. Sooner or later in the C code we are going to
have warnings
for users who are stuck on the older workqueues, so it's better to
also migrate the Rust code
on the newer version.

In short: I would like to introduce only enqueue_cpu() so that it's
just easier to do a 1:1 conversion
without changing the behavior and in the meantime introduce these renames:

    system_unbound() =3D> system_dfl()
    system() =3D> system_percpu()


What do you think?

Thanks!










--

Marco Crivellari

L3 Support Engineer
