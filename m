Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 762D843D4EC
	for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 12:12:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786450342; cv=pass; b=WbyDpNlaYvJ+hupERi+a3lx923S/cGyVZbdrud8rk6fEIekXQUh1XDTCUL06Yfo+E5+y9g8FGC4ZbvOEw5rCOvJtMLBBD8wjA7uLj/Vx6sHo2BWOVjiG8JqojmNnfF050ZiP408VAz98ipd6lTmQd/8tfARO866+N2mLBAarszA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786450342; c=relaxed/simple;
	bh=PIUnq1igHbM9QpSX+xU4mn+c1dccMUtp2c0HWqJv45k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=sCR+r5s0VBUxOlwU8zzDD1XVfOddeFdkrF0z3dJgDXbLmaqcd8ivFwfI1g4CBE71mK3yTyLbUnj4FV6JGRRVXjF0LwXD0B9ONCH0UJybT012G7R/AFtFIp82mtrdXqLiGW2HRpZzrwdKKWif5h4RRqD3CKBDsX5I0aKCL4gypKE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ga2k87UQ; arc=pass smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ga2k87UQ"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ccae46de39so3017685ad.3
        for <rust-for-linux@vger.kernel.org>; Tue, 11 Aug 2026 05:12:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786450341; cv=none;
        d=google.com; s=arc-20260327;
        b=A4/FB6Qc4l2UhRQDfbgtMu1Lf9kz3UbfM/BBX4QUJ0wGKy250KBoN6ObLgYv4yQKAo
         vQ+UtOsHyk8ohJ+LNP8zCmLnpnG0JQWlrNJ1K+tZM9A875ltRuHf9cqintmsQ8ZFoyTH
         0esVoWagY2QLureIaQ/0Ur9jJ/MrBjaP3Fz1s5E/SDybkJlFk5X+N7sfdCS1XIz8vXMW
         +wd/bu4LB308N7Ttrf8sYMz9srXFlXBbGioQvtRQSY66Ee8oIycjFiO1snUqv1llBYj7
         ewSPVMrudvPkeDfL9VzZr3XnEzDaOs372+vVJeCrY+MqCuq39NPSccdtQq8WaTf7Sfqi
         /iqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=1PrX3oMhgzL5kU/ehDAdHTIRMgST+xnXirGkVDz4tsQ=;
        fh=/L4xoFv+yQ0h1ON/lBUSkc347maCpcQ3lzukZV1fk+U=;
        b=CK87yRKVTi8V1mBk7lkWNo6dNttAGoHkQIuIQQwuecqxtyRiIwqp35vANbQJyn2eLU
         At8J2Sp7NSiHLaTclruqi7nEGOYh5GxSsj4Q5CjM41jms///+vy0P9xcbYHUw0wOmFcZ
         ywUirMHiNYLcGuTzJuQeSFj61ZPN/rC7Gs6X4MKfGzbTMh0wjNbhxLO//rEM5Ai9aX8L
         +ymlZ4GAUGBd2vziapnJWTMjVsa7ZaQOsCA+W9fOkAw/MC5BZ87o9JYFUIe6FfvjJfdG
         Diul15cLZ0bGMEYS11cvxemKoPenfxXfhn2QEBTBhFrC3lyNMYwmyhyixk1pcIb04H6J
         d13g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786450341; x=1787055141; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=1PrX3oMhgzL5kU/ehDAdHTIRMgST+xnXirGkVDz4tsQ=;
        b=Ga2k87UQ+iLl33tKA5FP5c/gneHY+ObW37W+4Rkgh+e5/Ium/5QuQxgbhKQ6f2nanZ
         Xh3s4bunwc3w0Zh/g+6AcZZ+8s0XPQYGBlC8kTkLK080cyaawAcbDaovxsQl2Rr08q1i
         /hqYiVQVlYC6d4KDLNtqTHOZbeK0KVbSq2i5JT73TLqiKQ2ZJdUu8UXaIQjh/rb8GvRa
         ILdVGNbaP8lwZYXbulul0PBvkW11+/XqDm8EiKOSlEYsNU3QD+Il+9W5sfbsNVT0ibhE
         63MzulYvI4bCeccGKNOgVSZcuHa975J2irPEoVQAsHVSO0R/dsRwYVcCSM98DV2Tnba2
         Jiow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786450341; x=1787055141;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1PrX3oMhgzL5kU/ehDAdHTIRMgST+xnXirGkVDz4tsQ=;
        b=bTsKTZB+mK9K+QweRayht0DuYGhdxmpGRnZZ7nuYc7vjjzFJDJnHQ7zyQkqUwYTHy/
         NoN7B4uyxzGnjRoBTnQUqFVkBFfpCSfWlMpZFOsXKMkeNTuk0zxTiVZoknGbOnB4lY/S
         o8OfCU5GDxwTQ6pKa+zniIkdBftYm+wtAwaeA7cb6a7cl8y4eT4yny2kQVIHvHptDWoO
         9LdEV4j93qibPWjNPM/qgWZoISZiN2knpRvbqXVNWQeqABgxzLU0vmvYZuFJeiWxF28a
         ePVKSBfD83Ju0YLDD44Q+/dcow0CbcpsfPsob2aOaKPbDmAjX791abKMOSu3oCaK9g8S
         8M9A==
X-Forwarded-Encrypted: i=1; AHgh+Rqh+ZtGVqLsYSogc4oh4UltRoz928sIkKIVWA4VR66ZygATrLcdqb1K2aA36Ij9qqdAGTLiHymQUBKu8IgzBA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzBODWMXYvV9cZijpPKeoS4gYLGsffhl1Zlc+UQN5K3VbuTfJ4t
	2RXOQw5zLL+jWmO7Ty84Ef+zlEaL1GYoZrsxwQigMqV6f173HOvebAQpJ8g0RTbZpYDk/1PFgyj
	nBYwvO87N85FMEorw4Ms+zDl+2vCaQeU=
X-Gm-Gg: AR+sD13YlyooUYnavk+qCsZSIlitPVcOo/ALQGWUKhFdqOs4decyypbNbJPEQ/xl0rd
	lG3VBoGo4wwsDsq+l4G5OL6Roz5ZiTLgGC/myj3hgPSgZfdnCK0SwnCOLeMvOhrhGZ8nvpLMKXb
	355FwY2dL8RBJ3aOrKNRmD48G2GxfpZkWyyB4urdrptUBRj5ftJQGpqro/uZNDSf33xRquCxg5f
	3aCnlJ54W+4iD24CQy4oa+G5YvIHD9Le3GgPYf11i7KZZ6+ij/IotbIxh6jvswpD0ex+pNa9lHt
	WHS5ATVq3+QT9f+5kOcFFmHB9CAsnkZqdP1v1VrsD8KxzS37c7SNM4DBUXEpOY22KP+hultHD1Z
	4dEGgFYdvMV7PWsUwpE2Tvx/KxplpVS2i20GUUKR8UOcbCv7qwbFhqepwujXb
X-Received: by 2002:a17:902:e80d:b0:2cf:9e90:8be with SMTP id
 d9443c01a7336-2d317ab0841mr24888665ad.4.1786450340502; Tue, 11 Aug 2026
 05:12:20 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260808062839.1159990-1-tomo@flapping.org>
In-Reply-To: <20260808062839.1159990-1-tomo@flapping.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 11 Aug 2026 14:12:07 +0200
X-Gm-Features: AUfX_mx2-7LiqvGaFVUtsaFzbmVsxEllNJuGQM6l_umGHownKEW-bfpWaUPQh1g
Message-ID: <CANiq72nhLVU2MqZMoVtM7BfmEmvXGf-oq13bS8fJpfw=oSWofw@mail.gmail.com>
Subject: Re: [PATCH v6 0/7] rust: use Delta instead of raw jiffies for
 timeouts and delays
To: FUJITA Tomonori <tomo@flapping.org>
Cc: a.hindborg@kernel.org, aliceryhl@google.com, arve@android.com, 
	boqun@kernel.org, brauner@kernel.org, cmllamas@google.com, gary@garyguo.net, 
	gregkh@linuxfoundation.org, ojeda@kernel.org, tkjos@android.com, 
	acourbot@nvidia.com, anna-maria@linutronix.de, bjorn3_gh@protonmail.com, 
	dakr@kernel.org, daniel.almeida@collabora.com, frederic@kernel.org, 
	jstultz@google.com, lossin@kernel.org, lyude@redhat.com, sboyd@kernel.org, 
	tamird@kernel.org, tglx@kernel.org, tmgross@umich.edu, work@onurozkan.dev, 
	rust-for-linux@vger.kernel.org, FUJITA Tomonori <fujita.tomonori@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Aug 8, 2026 at 9:44=E2=80=AFAM FUJITA Tomonori <tomo@flapping.org> =
wrote:
>
>   rust: time: make Delta generic over its time unit
>   rust: time: add jiffies time unit for Delta
>   rust: time: add Delta::as_millis_ceil()

Applied to `rust-next` -- thanks everyone!

    [ Reworded to remove stray word. Added intra-doc links. - Miguel ]

    [ Added intra-doc links. - Miguel ]

Cheers,
Miguel
