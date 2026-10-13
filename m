Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C329E5237A0
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 17:27:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791912475; cv=pass; b=YwyqyOIqjUrRD0JyTksLHZ0Pv5mOvbb1maqWj+E6A8MPqzRrDIiQWISzH3ZHXVd9aMbGm7bebOhwV1UwSuJXRnRehntT4VJoVpw7s6RF645Bw1TCIkm00wwMfK6q5DJgE+emC0bSilP1HslDnLx0tk3fNsKl4a1rBfwPCP7CiGI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791912475; c=relaxed/simple;
	bh=ilrrrujzuhZYUhDmuASneSYXMHWG0KPeilbvwSqwrVE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=lA9UndPWdQzpO13CNfBgcvQlQ3Xh2MhmXqDZKG9yP3X+kqDDhrt0O8YjrrUt0WshQKzCgg/7+Rjg+IcvYtLse7yZYbJIaP5ezGCwb0dmbIR1P8KjvZatXUGX96WdG2HPU86g+A6oEFiwtWIB6ayPc8PStdclhFOMwswwf1Yw4Co=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=azDQ7a8S; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="azDQ7a8S"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33e623bd651so388522eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 10:27:53 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791912473; cv=none;
        d=google.com; s=arc-20260327;
        b=p8vbhk2mSQUfGtEMS/4qjKPpafsOy7IWboD5cdaShOejoUcgc7MtU05btRXJkY4hLw
         O6Uoykvcl0TaTHp4xTRi3Kkvf1vG0lLhky5dMze21sSLRgQa6BZl6VuapLL2ng56trge
         4fl6lkRdJBs649gyQYzTye/zzeSyAPdHFgLb5jNkjGFETNLd7hpFV2yrS+dMugKdGAa+
         vwSwrYFZbIPzLA2RHs9qcxFIyl9ERgqu4xWhfI8/d7FbNbX7qWFnzH2M++hH1qjddvHi
         aOryUUBJLfBBcZJv+ANRR93GNq+tZTscp62DgdujJOQuntPmC3FLyMPD1tU8iEzS5Q9v
         sFBg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ilrrrujzuhZYUhDmuASneSYXMHWG0KPeilbvwSqwrVE=;
        fh=PW6PxGIACawL8Vgmsaoj6WBk6zrXqtmqQD1xGq2teP0=;
        b=mT64Y5c8YBBcf+Lylo2rLPBTuWaXwiIw2FVZaLpi4FTmRfYAjgeQUZN33hGdci8c1+
         HSeZc/OInwMymSHLI4udEbFbRFRQFvZn+INCt8X0CcDx/tMrbEQbm55AOrjMEGqPHOLN
         ghOv2Ragsdvsd3YpuErhxb3y2kM/SIzWJUW4zuPktVhJK6lnLh2cVbOqHjc8daTKADco
         QTKOJpYUu2a7uQ+tOUootypszR8x91DUdl3+4itWQPQoSRkVmG+pNhzD/1qeM3Pw1LCv
         yPH2Daal2SaqTnwtU+itMbGFf6vhD7moh3SzezGGJlz2VL2bC2qk5yzHbl2QwU3gDtk5
         1+rw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791912473; x=1792517273; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ilrrrujzuhZYUhDmuASneSYXMHWG0KPeilbvwSqwrVE=;
        b=azDQ7a8Sa3twMNqZ8czmJdtWD1HR0weirSAFSvHzEbBpc8M+Rc2WI5pXWiYE7VOXYS
         Kg+YbuMtyUfZTnFNGXEgUm5tkeVkHOKbXGYZwldUZPcyMfNzM3L5VefwAqhIBx7XH7m5
         mdIYom8LmiZU61JB8LqWaMK2S/enl94/IS8HykPaLE1Y+cMNkBEm3DIJLmCCsQ17LfdS
         N1QFx4RO6tNjCtUPCh0mmENBgftZSED/UHrRpl9F63U59cIgCM8dttNdjzoKpa0Qk4rG
         aILsxcV45Svy7Ne7u/3zyfJcwsJa9OzioNrAS3fV8IhwrzEZ1IH6BqccJp2QMkq0ZWkI
         b+iA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791912473; x=1792517273;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ilrrrujzuhZYUhDmuASneSYXMHWG0KPeilbvwSqwrVE=;
        b=B0O03Cmrn3EPKpFsHd8oR1+LGQcKYZOReDazcCcyDs54Efh9ORy1YU1IixBoh810MS
         1sWNPpW7kU7ahMKp6KRShgyhj1IGat2Q5Mr/mC0dxRapl1ajYRrHB2elE4EZV7gu1+gV
         eoodjXzF9wT5KuKtdafC+9MRxsCJaiMNRwxjClFaS7GSlm3Pyl+km2KgSO3Bd4hAY0TR
         08QdTbhnRuPnZyXXbJMPGAl2JHCUKo7rJebmqDhCIrszr++UII/JPBWs1w1rcMOuKGj1
         lZJgsO5bZw+WqbZ+JIz1U0cwcVcc4bwlalDpjxcjK/cu4L+i2EMWub2GcH7YgKtIXNXA
         16Vw==
X-Forwarded-Encrypted: i=1; AKwUvBzCPz3bVqe3u0qQmmcqNg39hg2lJ+PXy3KUcFymwBcXoq5btIIzWGIoAG095sruKPcJ/jzw5jhnKHpEOjWE7Q==@vger.kernel.org
X-Gm-Message-State: AFq9FYK0zKgpAyyuBb/4GxBv1gp/piAwSo3IuFTLW2hjN40eeoDBWsN1
	j9gChtDJYG1dGWbJCS3brFlVgKF5tdOONfUoPbZ8oDl6Jmv3dSxPvLhZWK2y8mm3SDYb9shCukk
	PB6vlFbuKGq5kTBCQaNHoGqaRqjA2xbI=
X-Gm-Gg: AYBFou14vANqHXQM4hQfIDEHGv0YRZwqKuKWtPSCz0h+GdPPKEuzQxu4y1mtp4BN4L/
	YUVOAwm0E7a5VyzuzJ1O+dSOFyfIDW6uOfICe/Q0dmBbZgcpmTuZc/z7+P3YLQTy170vWzyCFcU
	Wr6Dm8lU0KE1PVrfk0WsG8UVCJkS+9ZICzW4Z4wK6ERUmHjFjOj1fV2xQHo7kDQm65kADPM2KR3
	i9arU76fx2HYPsdQpjvQRLKMwQ0IaEnyt050gxA/yKREvWViCbxkhGUgnY+tVcgtTwaNFYLZ99b
	vZmSr6nqgVwnvhuGlmb56JS2mvIycCr3mL2Tpc77eAFZeF6gbxt7L43x+94yY7U7Hop+MQn25aT
	SOQ2tJToBLy9YUsxOST5V2KgSflwD2+mUYqRblqSpiRBNtaaqaGozC2boCCwLPY02eRypgOfDpK
	rEAf3DrWdAZBHPAbeyxTAXqv7HablQg2kgr2LoeX4dHgQd7BQ3ifU=
X-Received: by 2002:a05:7301:5413:b0:358:c9f3:b055 with SMTP id
 5a478bee46e88-358c9f3b260mr22256497eec.1.1791912472660; Tue, 13 Oct 2026
 10:27:52 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260929-cpu-helpers-v3-1-e968ce5ee613@kernel.org>
 <CANiq72k-_LX5GVSKWQQ5EJV25GDfXOhOebv3TLqdA63tQHNd-Q@mail.gmail.com>
 <87cxtvb2qm.fsf@t14s.mail-host-address-is-not-set> <CANiq72kZh4a39hcy0g9sqEmzx3m+dcPRW=omOB2r5DhpRq3BXw@mail.gmail.com>
 <87a4ozas7q.fsf@t14s.mail-host-address-is-not-set> <CANiq72ki4Pc6y8og2ROLRSeRTZBbnpY41v5EC+qJaTiZWVhwAw@mail.gmail.com>
 <TlsfpzyqG6QHcTMb-dOQPUP6uXU2G9urfH8AK0nzNO3j5rY0QWjn2ni9zhJ41CpVeppXhpH2E_yJ3LgUTibqbA==@protonmail.internalid>
 <CANiq72nXsGHbSQ1LfbG1zYaMaZv3X=u0+XzT6vHh=9vxLE8QTg@mail.gmail.com>
 <87qzi8a4ds.fsf@t14s.mail-host-address-is-not-set> <CANiq72=j1nD6Qy9qKwNKjBw1gc8RPr8CmXKXSSNBp7mARv48VQ@mail.gmail.com>
 <N2kT-hptgLwPihxLElO65tqya2Wmnmv46TH2XIDsL2pggz0Ezs4mqNk2iHWS1zdaCIlPncbX20HMJuQ-Blrbmw==@protonmail.internalid>
 <asz-GkGHJYHdhDLr@yury> <87jynmcbb9.fsf@kernel.org>
In-Reply-To: <87jynmcbb9.fsf@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Oct 2026 19:27:39 +0200
X-Gm-Features: AclHuK_xYIAnmzYyuYJ5rCjlX6KfUWsXYacvmnfM52-EPolRLAsEIzx29APArHo
Message-ID: <CANiq72naeMk9tUq84ynuf=yJOLQtZYixw2T5AS7TCmESsvp_-w@mail.gmail.com>
Subject: Re: [PATCH v3 1/3] rust: add a wrapper for the `num_possible_cpus` C function
To: Andreas Hindborg <a.hindborg@kernel.org>, Yury Norov <ynorov@nvidia.com>, 
	Yury Norov <yury.norov@gmail.com>
Cc: Rasmus Villemoes <linux@rasmusvillemoes.dk>, Burak Emir <burak.emir@gmail.com>, 
	Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 9:24=E2=80=AFAM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Ok, thanks.
>
> @Miguel, feel free to make these changes as you apply. Otherwise I'll
> send v4 next cycle.

I think at least for this one (#1) it is best to have a v4 so that it
is clear to everyone what we agree to finally, and there is no rush.

For #2, I guess Yury or I could take it already. Yury said he would
perhaps take them (not sure if the Reviewed-by was so that I take it
or as a self-review, Yury? Thanks for taking a look at Andreas'
patches, by the way!)

Cheers,
Miguel
