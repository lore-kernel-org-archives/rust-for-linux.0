Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56186368291
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 14:13:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791900821; cv=pass; b=pZTQmMKYcKWDVVwdR89CyzVFbRPyMpPxwcYMvCPshoCeM5PyAeaCT61juswZFKOkSTejwkaWr7RavljEIZ2kp2/YN5/lfk2mTidXmA+sYpPWOXC6sem+7vN2pZRbWTPYaK5TRTWmlT9+cJTRCZwS5guPC0W/m9Q0hOH/70akWLc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791900821; c=relaxed/simple;
	bh=LBo+gm3j3VM7myxDHJop+NPUR8ZxxSNcMEpSSvadFCA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=htdDakpl2A7SpXEjV2K/GWfeJl6153eCLsZmzvXN/rPQ5tvuh9C8FipkUjEa3pCsiKi59F9Vt8yvqyekrLRTp7hPACNAjgaSGHp6XemFXghsY3KjAE7VzT2FGldubiOeaXrsfi4Bu2Th0Wo5Vhu2BKQf2fuPVVA9H9lZxv9MjYg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OgrIAS67; arc=pass smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OgrIAS67"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a19cba5c14so23820035e9.3
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Oct 2026 07:13:40 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791900818; cv=none;
        d=google.com; s=arc-20260327;
        b=U7hg9mjBNmIRhZZdcFaz+m9GxlbeIJDBjSaHJXlzs3Fl6C6VjgUZn0noveNM50l57+
         ki6uUVQAWZJG1euU9ShNB7CoO6qxpXv6gG6FEdQBPyKcDcPghyUkU2K+E21v1ygVah2N
         G5++h4f+L9x6kBI+bLYAzzl9JK+a7cGIs4+td4zT59eabiUeBPhEtbX5g+ezN3nw7xgU
         A1RPeE1q1SKsBWWs3WaA0MHFY9nJXJ9kBIowPUppbnpC1UqUnqOcQgTNOdl+mk+x8+sy
         2OPTiBWJl5KWCJaVc0bQeU8aUgNpIzg3wc+eUOk/NyqIEHUsE6SsSCptrKKcr+GOWOmB
         mKVQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1oU3+fnvsIsUPuUfSW3CY9TCTSfpntPjY/For+phGlk=;
        fh=HGNUS2E5ygr7bskAJcMso76rZvQISaxCZAcsg2DW1yg=;
        b=hwMYFZve5D74tSdtSFCYma+N8SEnzPkx0gGI4950r68rOn/0EAIL7gLevS+7ShZhH1
         rO0bNB0+jRzU2XkhUw6mZDkMc1lj3KjBGgYPRCuK1xRx7cI+Dr63phm7MwsL2cNLKM8+
         3eXGS84t93PE0rNksxxCAOYQoidHal1T7sC97D3NtyZjeG+TRnVviSJaf4+9mPAh5lLN
         45lUHtkT4uvTEf6vozkIJqmshu9BSFu86BagpKJ2ZOmflBGiUKiD2Sr6DsKLOcOQoNKd
         i5AIjq+QdWeIWGa1fy/7Mn9hFr9NpR0IKeHRYvKle4aUvH/KVarmPMZs60rIMQXY/qKo
         qqVg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791900818; x=1792505618; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1oU3+fnvsIsUPuUfSW3CY9TCTSfpntPjY/For+phGlk=;
        b=OgrIAS67XHcF9/QEyeFzYUBfI0nGQxPu10i2KcoKH0XO84QN92fmpd9a0qAJG9vfMt
         gXtj3f5qqoPcGQHw6fAZ40PC4k2AjwRKsClJagxqhgtPG6V6xmw7H0SQTJQu6he38J7v
         AzxkrHlPat216ewCfnS+PsDSQAPpbnvv/j7RlqKpg7d9dlHOYNVQPszuA+zxe1IwCNUQ
         9gZOytMgyi0duOHLmGWJXF3qbimBmq3vZIicAa9QUHHNzq/VIWDH0jarX97WRC9LGum0
         0cbZTmchT1uVbrqyw9Kk8Q7+3MQQPSQ2I/C4zx1jnIWC+ifdzEFyBaawTQIKCZ+whB+6
         nDjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791900818; x=1792505618;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1oU3+fnvsIsUPuUfSW3CY9TCTSfpntPjY/For+phGlk=;
        b=C6/Mu2JMLPPmIzcNBQTeBV2kDgocjFqBMtQSdEbFNYvqdUFU+mE3SyK7H6TUmcdrLK
         Ds7gALYnlDi1IQVdNk2nd+RAucEwHRycpOisph3D0P3LOjJ4ssEjGKGfHDw/Zo+Y/dl7
         hS1TntnZuNkd1yIMjrmyb4l4d/eKW/7wwEZrg0jc46vfjm2vH7k2VQfvIZxTWHuuOSaT
         uzwj1qLRNnNgHiaKVNXkq0h4Xa0ho+mu8mRwPhgYmY+CaHhRzC9iKocVdDNhNQAd4NId
         KMFfLEeZe0q+6O3W1WTeNyTvdN3FzDxCJ4NuVlPM0OE+KHLUiYfUm/2z0/SKnTnVjZrC
         Cn9Q==
X-Forwarded-Encrypted: i=1; AKwUvBxQemMQ90zTAadBaYJW313dqAc7OtBo4gA7HJ6Q7BOyXmQhewrrMEG2AmSLmIX2jE0GWUwbcfba06iWbYjb8w==@vger.kernel.org
X-Gm-Message-State: AFq9FYL8MQEhRhBEavz1chY0dlARr/RijnqVW73LLxZiE4lD8JMmNLQM
	Cm715SxXcVSdqb1/1MEakYrzIkW/WGDPe5pi0L66ApiGObJf1Ga5lxVhEoYp+yPXPTe8e9+Nmi/
	WmBbE9Sj9m2MdrgalLf+R6Pbc0rpyIcTsLAN4PT61
X-Gm-Gg: AYBFou3HvYYGTyQAc4gph9r3rxAUZNv3bFNe69gNzPktdtDgBQ/T1x/IJqiuVFmed6N
	GEu1pw6BJwaAIdhEV+bi0CfeRTSFehLHIhhzPc0JCkFCRK4ip7ob8bIq/7ozV/82MkMNIuUbTLz
	63I5u0FAj4EpEXLHaY3o04b1LHtBK6nKAS3LOLRy6uNxU2XglUJYWgctaRiggi391miRdguiMaf
	4SmVrYx94o1fJJeGAeHdM38TWf6TcgHNzZyGUqEiD4/Nls/aeU+My7sDtukfs6k2UP/wynBzNjO
	AyTP+4KmPIs5UnH94WI+IB1z+q4M69s+IurshN5wUTOrMWDUHkKvhObwxsK1siHMK5t6JLNhH1e
	k7g+80cZrZPmctL9WWIEKf6g=
X-Received: by 2002:a05:600c:4e91:b0:4a1:7ec7:a479 with SMTP id
 5b1f17b1804b1-4a18e4f56bcmr259716625e9.33.1791900816884; Tue, 13 Oct 2026
 07:13:36 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261013-rust-workqueue-system-fix-v1-1-e9ec616e402b@google.com> <DM3RIG8CD89K.1HR52QEO55IU8@garyguo.net>
In-Reply-To: <DM3RIG8CD89K.1HR52QEO55IU8@garyguo.net>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 13 Oct 2026 16:13:24 +0200
X-Gm-Features: AclHuK87fvpdr3oX5HLfqNciClAH9QoGGC3hFM3xSlDtUMWAcOLzXqxC9G8ECqs
Message-ID: <CAH5fLghXHoy_2yYyjf+GZ16OVqek52XbF2L9Da+3qWgpf5Fy_w@mail.gmail.com>
Subject: Re: [PATCH] rust: workqueue: replace deprecated system_wq with system_{percpu,dfl}_wq
To: Gary Guo <gary@garyguo.net>
Cc: Tejun Heo <tj@kernel.org>, Lai Jiangshan <jiangshanlai@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Alex Shi <alexs@kernel.org>, 
	Yanteng Si <si.yanteng@linux.dev>, Dongliang Mu <dzm91@hust.edu.cn>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Carlos Llamas <cmllamas@google.com>, 
	Marco Crivellari <marco.crivellari@suse.com>, rust-for-linux@vger.kernel.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Oct 13, 2026 at 3:58=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> On Tue Oct 13, 2026 at 2:51 PM BST, Alice Ryhl wrote:
> > From: Danilo Krummrich <dakr@kernel.org>
> >
> > system_wq is deprecated and triggers a runtime warning:
> >
> >       [    0.857414] workqueue: work func ...WorkItemPointerKy0_E3runB7=
_ enqueued on deprecated workqueue. Use system_{percpu|dfl}_wq instead.
> >
> > Replace system() with system_percpu() and system_dfl(), to match the
> > previous behavior of the deprecated system() and convert doc examples
> > and tests to system_dfl().
>
> system_unbound() is also deprecated (replaced by system_dfl(). It appears=
 to
> have no users, so we should remove it in the same patch.

I will resend with that change tomorrow.

Alice
