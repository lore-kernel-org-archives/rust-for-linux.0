Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.197
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794264403;
	b=xq0lTL30vl6pI6tB6tpy/JFEWrY+TUDhDE+/eLBd77Z5FoVXFDsUKP2lt8yQccKYq518
	 3/2vUD1zCVDyzaQuyG1G6+JHtebtLgf7Wglue9VjscAcl+oqbdt2jeAhJGwmbO9317rE6
	 BhBi0MCILINfhASw2O/QrdydjfE6MPR43rjaHfLO7rWm0k6U8Em7a5V3nvnXdjyDLLGx9
	 WetwiSEwKeNuwea7us7K4caiM9nT7E5UHSbN7kUXp3nDObdf19NwYrp+Zs4PoUu8RqOyU
	 BCdq0rApqKOakGAg6lTqWm+DEcDt4HiDCunnGg2/Jwqz7RtCPoO79QF5dJkSRMKH5bQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794264403;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Received:Date:In-Reply-To:
	 Mime-Version:References:Message-ID:Subject:From:To:Cc:Content-Type;
	bh=cpHV4pQiI8EZUKNTXc7X8urga4axIAaNowcZYHhqBwg=;
	b=B55Fpk5IaSHGA7sIyXYzQnAJl5FOj8i+6Zty9Hi9FLs/8t8VkJW1JUBH13PQELy2z1VX
	 z1p+RAb69hADufOa7zZOcnbmXbJFa9DQFY/xMc5njH3rz5AqT9qH+/Vuwf/O3dq8+LJZN
	 bpvMVJbb7ctdJ9oQkkHr8HmI42eOxyK+7XOLix+0XJBnuEASouL9bI47jsNSsfh/wF5dl
	 fAnzNQUH+k/fi6d454JnQoX390fwkdn7B305eG8ATPwfxAvPU0Go6KlDPVMU8d5EAQj3b
	 wFQp3iqQ7vz40PR63ihVQ5YPrei4TPOusHWfNq5PG6MPksnE8k9weKmmcTjF9XrEBdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cs3+w6Ls;
	arc=none smtp.remote-ip=74.125.82.197
Received: from mail-dy1-f197.google.com (mail-dy1-f197.google.com [74.125.82.197])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F1CDE60A2604
	for <rust-for-linux@vger.kernel.org>; Mon,  9 Nov 2026 22:46:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org F1CDE60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--chriswiseman.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=cs3+w6Ls
Received: by mail-dy1-f197.google.com with SMTP id 5a478bee46e88-341eff9e381so3304299eec.1
        for <rust-for-linux@vger.kernel.org>; Mon, 09 Nov 2026 14:46:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1794264402; x=1794869202; darn=vger.kernel.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cpHV4pQiI8EZUKNTXc7X8urga4axIAaNowcZYHhqBwg=;
        b=cs3+w6LsFgfZRzeWv7Fuqb/31INY4tYYsUa8IPrtzQliRZPc9nv50s668gGIg+ugor
         gdFwHeAGsvcWE0Di4nq0xAExDCH/lVzKtq8NSfj0jUyyPAFssH8UxpsPTsgATI6qROrw
         Lnw8jkHPQWRceWbKH9zrLgHsM+G8yY8NEuJFOXnwHVHAeQ9Fm1I95vyLAr8OaMQQFgOT
         ONjsPlk7tPVj33JD4x9W9/zQFO8fp46Fscji+x9UGTZBZQ5pGPMAy5j3Zses5M/OpMb/
         VCcn3Hi7lZifQ1fpLJfbAervjDWegoNJULNmH+BnjHgr18D0wfSXr1LHoxMi4wDqTRKu
         UK7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794264402; x=1794869202;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=cpHV4pQiI8EZUKNTXc7X8urga4axIAaNowcZYHhqBwg=;
        b=b+DVYjgPfNdd8Om5juH6GeB3X4Ymxozk+O0u9/RhHFtVSDRsPBKmtTAZ/HPaFWfs5z
         DlL1izr5nox9OGRyiPSH5Xi9cM3O3iXjDuMbwhSLj6oVHydlfSCWm9tZGCQRuE2BM/Ak
         Oo+fPCB940OHGHTl1S250PnWqBPA+TTZS2myssv4m7UTh6fEQCYrZTsZGuM4yeVbmZc9
         fMgeRL/ucv0IDv1SzcmDaOWMp/7Z6U0yGYudjARlfgf84T6Ltp8+kDJLviUWJFpCwBJ2
         lsPVa5BkLr7HtFzxxKohAWYsNauKj3iJXIA8TXGWw0l/pQNoZd08RsuSncSdK5j2WaXV
         xA5g==
X-Forwarded-Encrypted: i=1; AL+hErGvGqRuBr6gMxt95pJvT8gLGMS2zBsg5VFQBGAe3EeDoeM2cpyg+D/0X2Hlf1ebarLpLy/LbWjLUeJUP1Tp7A==@vger.kernel.org
X-Gm-Message-State: APuU4Z+ztiXErvBbhOYvMrh7jde+ihTB949bTnqqcAGkDcR6+VoiR8xg
	zg3bhBBbj6aLMvDpLnGyGc+l4jXueRaKDsaA12eH0j6dtetC+832nrbEd6wbDW6/jzFgFgy+6Af
	2QyQu1mZBvrjF3WWx9NbuSZ4gE/oEtA==
X-Received: from dycc21.prod.google.com ([2002:a05:693c:60d5:b0:36b:e6dd:b513])
 (user=chriswiseman job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:7300:ec8e:b0:36e:ff7e:e57f with SMTP id 5a478bee46e88-3751ef77817mr902291eec.19.1794264401697;
 Mon, 09 Nov 2026 14:46:41 -0800 (PST)
Date: Mon, 09 Nov 2026 22:46:36 +0000
In-Reply-To: <CAH5fLghTUOHcTAUC9_wqtP0xB18AWsca76xgptN9=wBx6mXUTQ@mail.gmail.com>
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
Mime-Version: 1.0
References: <18e61a85b0d13e9c.3137322e32332e3235332e313736.9c152.0000sendgmr@google.com>
 <18e61a8cb2ff887c.3137322e32332e3235332e313736.9d011.0000sendgmr@google.com> <CAH5fLghTUOHcTAUC9_wqtP0xB18AWsca76xgptN9=wBx6mXUTQ@mail.gmail.com>
Message-ID: <18e681f787fa9e86.3137322e32332e3235332e313736.1b3581.0000sendgmr@google.com>
Subject: Re: [PATCH 2/2] rust_binder: account for deferred work size in Thread::read()
From: Chris Wiseman <chriswiseman@google.com>
To: Alice Ryhl <aliceryhl@google.com>
Cc: Carlos Llamas <cmllamas@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, Chris Wiseman <chriswiseman@google.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Nov 09, 2026 at 11:35:28PM +0100, Alice Ryhl wrote:
> On Sun, Nov 8, 2026 at 4:11 PM Chris Wiseman <chriswiseman@google.com> wrote:
> > +                    deferred_size = deferred_size.saturating_sub(work.size());
>
> If deferred_size is zero, then this evaluates to zero. It'd be ideal
> to avoid calling size() here since it's a dynamic call.

Good point, no need to pay for the dynamic call when deferred_size is
already zero.  I will guard it with if deferred_size != 0 in v2.

Thanks,
Chris
