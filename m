Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5B8921638D
	for <rust-for-linux@vger.kernel.org>; Wed,  8 Jul 2026 07:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783496430; cv=pass; b=d1deNDM6DUPh0lErG9v0TPfwki72Ikdr+LPU3bj60u119GAXJndu7YAMwgPG4aF79wI80JIYybcaZfGd+lH77MtY/awqmAQG1fAiixF2Pjkc5dJlS6yDR6tauNzl+139mXZk6v7Ut1IaqueraAhQs74F8taK5Dc7H+GAPaum4Rk=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783496430; c=relaxed/simple;
	bh=k7R0qUyTIFqbXf5ujvRb4ZUFFnp/oQMwal9T+dJXCBw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=Mo5X2M5PesVIHeUt/JJoencYBr0e/JqNnB3dLlAVjeRa9r0aFcxClraWNhc0EuCQZrrKTmiTB5g6Ms4ISm3eOn00q0D5fjm5vtnGBxb3lOFnYwH13+YhGoQBFKkK614tqHw+c7it96yy5NoQhuxn6PtE/MiwwXbWm3sgUQpsTfQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=OzmrpjH1; arc=pass smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="OzmrpjH1"
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-5aea9d606f0so378533e87.3
        for <rust-for-linux@vger.kernel.org>; Wed, 08 Jul 2026 00:40:24 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783496421; cv=none;
        d=google.com; s=arc-20260327;
        b=q7eAJr6gxtCWa1IObD3z03+qAIXNyayKVugC/7NQQa9DNzFK1qkYCoZ+59H9TCCmY5
         cPYY/pR/SSvyIIlZYjdDwvDcEA1EuO7OKmwqSeuoDIzA9y1HB30tSeee4a3e8ttMT+jG
         aOQ+KGHXn2gXqeb1ywC6KkJziXdddbMf06zpPQh39IjOKrTuRJKVbT7h5fz18b1PUgBo
         fAxTbk2KeLWO0KspEKQFLxrsiingJ5l0FPhlJtCKqtT1XaYppGx+kb74x/DuI3RCimV1
         DeaUeYE3OmozpWiVst/p6TL0006Iv4OEgMN/i4RPT78Ee2p6D9g+FAZYk/xxaSUup2cR
         Cjyw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Kl/WO1EOBxmFOy9xRwmHnAzjyxHj540H0PpJZ08MHqw=;
        fh=KBQK9Bvh15pSSVlxWbgPyq1YojpBgpnkaflksXuiQh0=;
        b=oPsfY/STFlgJVN3ksBkbfSlK94ZB7QRsqaqmNVtJ0ZefbbDe1XrbnAhEOO6Q0psh0j
         3+hQ8PJ1UeY/SUY+Z9CvTyHQJitmpLnyB1rr+fV10SobxBIWcHkbBjIwtMMuYvN/zA1l
         bBGSBHCpkF48Iw9P8j8ere3PchMxl/HH4PrcVaNDqYh/xt7MWJ7IEtm09148evya1vM1
         HtjPmexa3s0cILcYFsfChlQHHYm5wpOBofmQAhXyltLdldp/8VstQx3iI0vyVwHpF7LC
         NjOMu6rQKQmc1L5f6kHKzzeJTYK16SuyzdCqog6IXFqcgOAOUTEW8sLoVx99/VJJXzNX
         uXpg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1783496421; x=1784101221; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Kl/WO1EOBxmFOy9xRwmHnAzjyxHj540H0PpJZ08MHqw=;
        b=OzmrpjH12Is+He6ovZFoCWXxDHHLNdGh4ZqQP6ZTO8NgPfqSXBuGd9luw2wRd2LPwa
         5SN85C31g44+r3580jXfmkHJHALYWVWGunUOlX183EkQFPn+3878FfLYVk9z3piOvUt/
         Mt9uWO16AqvhQlTmfimA7D/sv5jrY5+OG1BUqP7nInOaQhs6nkenz+I6VI2xYXYjQBdl
         hMWJUBusOeNbWJtf4UdRqDsIabE1+Q75Fi1A/0dch5Wx9Jg4hOUEnm7NRicFCpgPf3W/
         EZx+mjw8ByXKr/WZTIBFGuSRBWKBMCZkshTHo1Qykw3MwVMuZju7gQulsQhSbE9UCwHM
         k65g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783496421; x=1784101221;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Kl/WO1EOBxmFOy9xRwmHnAzjyxHj540H0PpJZ08MHqw=;
        b=NzrSWwGbNmmEdp8MnZoOwnSYH8E9h1gZNSvG9K2MWGfRVgjReIr6vJMrP/eOe249LS
         YvLmpmK4eDZwnZRZd4JTWF73Bu8ZvM2LHyrRxvDLnV5W6YD8XjtDsUsoqQyTx3ICwA1B
         ++toWouWrIE1SvbtsWm7YSvWioVOktJ0B2x7oATaNvAPb5Mb67kcIZawSEd6A4Bkrsry
         VIsTxOUfFbx/WAgUxVgyj2+C71YLPrbOSN1qzMLFIH5vlUk41kVBRQvL9veUgLP2LS3p
         6ug2RYGR4HTf0rO1EULec37jSGOGyFZk+lXXes/ZaxNhB8INs9EnUrHYgOmBTe2VMzjo
         r5sA==
X-Forwarded-Encrypted: i=1; AHgh+RrkmNX0b+fb/mUAtgVu8XX8R/3pm/f8SoQxMm4zhivCb2/5UBIlkLhTA4ya6tGCQHaQ3x720gxGqLXjLNwC1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YyM21caHbCFkpexa0uYk/baLZ5Nvhp8ZyCiGICb7PYaly8ALtBO
	OCpqbbeB9A3KhZ2BiVgr5PBNJHas5t8u5AqUgA7XCh3Ncid5MUzQ2NaZmG1+uVO0AXfAiwUi1DI
	6198yZDYbSnnYBujb1uVMJkCKAWsI59t7OjSD05ZglQ==
X-Gm-Gg: AfdE7cmqwMcp4qBRGaSknfVuw+VJ3gG4iq8f/s+epG3Tc4vSaczc67lfYC6QN4q8/AS
	kyIZAE0+CAIsc06wrPkiXQiG4ZaGOvqOQYTLIkbkTq/wF4G1InhYkuXOIdL5oWSN2oqO/dVFEPu
	Q5g/plnuCn0X4BpB4WtFLei/NmZwEnTP4zmWtZezSxk6Z+2IV0BH9GMCrwpbbSUDIjcRDsqUWEu
	X0GHcyxlByakGP9n4XvdPykShReInW2WXcjx34VHncAeGn/WTl6jNNQfuNnhvXrudQA6LvGHyM8
	DoWhsotxloN/swFYaFQYU5h2s5SFofFQQDwS2gU+
X-Received: by 2002:a05:6512:a34c:b0:5ae:bfd6:1b8b with SMTP id
 2adb3069b0e04-5b01146d4a5mr267043e87.44.1783496421080; Wed, 08 Jul 2026
 00:40:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260204155037.325482-1-marco.crivellari@suse.com> <CANiq72mmBmdKsXDZuRvcm2_MfjHKzGphdv8_n1FvoV20va4dPA@mail.gmail.com>
In-Reply-To: <CANiq72mmBmdKsXDZuRvcm2_MfjHKzGphdv8_n1FvoV20va4dPA@mail.gmail.com>
From: Marco Crivellari <marco.crivellari@suse.com>
Date: Wed, 8 Jul 2026 09:40:10 +0200
X-Gm-Features: AVVi8Cde3yvY1sQ7Cw_Ost4FUvnMbFFgGOgXWplaFHdxrNiistBllz2OwCo4cXk
Message-ID: <CAAofZF7R=A06gz2pnmrNrpakZsMfcCvMWpKNxpTC61OqHmcS-Q@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add new workqueue wrapper and enqueue on cpu functions
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Frederic Weisbecker <frederic@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Michal Hocko <mhocko@suse.com>, Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Alice Ryhl <aliceryhl@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Sat, Jul 4, 2026 at 10:04=E2=80=AFPM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Wed, Feb 4, 2026 at 4:50=E2=80=AFPM Marco Crivellari
> <marco.crivellari@suse.com> wrote:
> >
> > Recently the workqueue code has been changed introducing two new workqu=
eue,
> > system_percpu_wq and system_dfl_wq, as a future replacement for system_=
wq and
> > system_unbound_wq respectively.
>
> The C side merged the warning, and now this triggers in on of our doctest=
s:
>
>   workqueue: work func _R...sync_completion_rs_18... enqueued on deprecat=
ed
>   workqueue. Use system_{percpu|dfl}_wq instead.
>
> Should we move forward with this, then?

Sounds good to me. Would version 5 be fine?
Do you have other suggestions?

> (By the way, please run `make ... rustfmt` on the patchset).

Sure, I will do it for v6.

Thank you!

--=20

Marco Crivellari

SUSE Labs
