Received: from mail-dl1-f45.google.com (mail-dl1-f45.google.com [74.125.82.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5F97243387
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 23:20:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772234454; cv=pass; b=c7hYz5wS6dsVT6NcnWgIKD/8U4S/7E5zkOERKmgXUD+wQfNLusxfXNy9dWTFFdkmx9+5YhnUxdSGiBYiKixIHAsTmGVz/F1JZrYpQyNTp3kJZb9pWEfU/0H0PXXlPQnthpWLsIY25HhtXcvCQd7fe7vwsnJmv+oZJ14EQBUEMTM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772234454; c=relaxed/simple;
	bh=/Qcz7f2pthU8lTgt1rEV54dmfLxU1Qjc7LbtUQvjGWo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=FQ6NoVySqu+zWNSpAAyBlCgKMXCJhk1jmpP+4oPyULGFSZSn05ycg27OCiDav3r1czMTTCaizz44iTHScxvmXwJHmkaFcVucvamyvyCcr+a9NUuxeYDHbvoAdI0/8HpQ+ghx6/O85nrAFdJvNhvnNWJsdMEkjumTmjjuB2oA1Qw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U1aXeKYj; arc=pass smtp.client-ip=74.125.82.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U1aXeKYj"
Received: by mail-dl1-f45.google.com with SMTP id a92af1059eb24-124a5810e41so180702c88.3
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Feb 2026 15:20:53 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772234453; cv=none;
        d=google.com; s=arc-20240605;
        b=DbD6aphIY9SYtr4Rlo13R5jKwREsfZW5z6Avx9VEhHWKkwb9bOVdnZSRfj9abFTbct
         jzuvp7JKQAJIdfMUeteUD3OgUHywDs428ohF7Q7pk+lVXUmotJ+WFMQKHwNrSGXSfrY7
         n25l5+eO+YA1YYAiyg6LnSZpE77ytBoNetktlJq8x9MCd9NXIQ+7Gjtr21uHxy7OtA48
         iY9APaAQi0H8UjPXYqrQ+8RmYEzk5XE6WbcH36pWtr605Kp+PTzMwyr+zmUDWN40nTXQ
         HcTs+jPj7WLg8gSul3EyrISlOzWgBlz57ZDQBrDavp4+5zGH78RYFolbRAUovoLrDmnA
         kWRg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/Qcz7f2pthU8lTgt1rEV54dmfLxU1Qjc7LbtUQvjGWo=;
        fh=+ut1r11SI5fYFK9seyt17ZZtDWm0Ki2a5jkkdoeZv7E=;
        b=dD6OYjSow76fRpTn2a42ar8P5wZlBc9zaLCbt+c7qkE6A7/Oc3tyVsmeWe0xdQCk42
         dv893TDeaZ260EYX4dA7f9zwhSo0LUiwpXrtS80KaniuDTAIaL0xaBRPWSD2UQVkqwxY
         phaf0gLN+SvYhKUTBu1lr846ygDlrR1yr4G1QnaQcRJi+iKtyMgiCDNXnVix7gInRmuG
         vrOQZ8xcLnaYqn/MVQ3YFooEw21oStiai8KF2OXiNGCw3J2EsK33FU0DxdZumIfNKCzf
         ZeMtmzN18+UUY9U3jtOcUtXCw4+C4mNBBUmmBWe8xDaJCO0VCpamUk8Y5tSKx6Mf0iTQ
         tvrw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772234453; x=1772839253; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/Qcz7f2pthU8lTgt1rEV54dmfLxU1Qjc7LbtUQvjGWo=;
        b=U1aXeKYjy/6c+PMIfF0QL7fQrKxnm8XtO8Ekmi4PyGNRMpg4TA4Tz1lwWool3OCui2
         oyn0FyK4ozF5eyQy9PhLSk6Qu2V5TqxuzrHoPI2nuJIyPVhg17BOA993zejk5h61g8ff
         AXKRE2V2qtHeJ8wKAqb1CDmC3YWNVRCek7ZjYG1phbEK2rxEimAjRPGQhLWSkMMaNZCw
         /qltML+WhJ+uNrlCHNgIBPOkmta0bsOQ/8RlWJcSP9T/CC0sqyk1rXGUFrBCHC/rD1K6
         +xL/XPDS32R3lj1CPqWWNvX4KA3PRiWx95auIceO5YKPI99fE0R4EzdFfV3b4Fkb0c1c
         uYVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772234453; x=1772839253;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/Qcz7f2pthU8lTgt1rEV54dmfLxU1Qjc7LbtUQvjGWo=;
        b=fmo+B8IwtxtWx+dmmV9g24tQne60YpxFbxvt1aauGXZWumIRwaxAGd7dhiy2BqYgEs
         4IMvjyCOdpDdzmKKa/uKpls12eUa9W9BnYD4eTVC53Cjp+1WPrgP3PKk5xqf58GP7lG9
         GJ9TQDxAfg9hIdu7g8IlVXpyHaiTaYNb42h6PqZbhnmcl7YB4nbN5WdWMgBFzCv4EKPZ
         HFf5UbkrwiQt12P5M7Q0q6Y3tuq5Vuve8xE/6jL21RMhZ4JJVmE3/i13WLy6FqiOm6Gv
         n1+kJqh/gmVG+Y9rgGybMW9gje6mHr/MvONO2DEbbM7kSAZ3xpidLpyLiBzEKvAz8bEE
         c8HA==
X-Forwarded-Encrypted: i=1; AJvYcCVDQ7B9ue3cqSPxO7G3poaymWwAGfnxOcVYK8pf8T+slygsOnBoBRM526mjGjEsR1C+RHKGkbI+TopxwIcWqg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzxWF7XqhAc9NHJ1dll8TXTVen8e6I8lNJXwrakZy0LYNCdH8RB
	uJ/QYGUMTXdS3TMNO5SCBulUvQ6uHr33fNNvcpfkoEHQcEdnGkWeEWVhcPgBrfwtGvWbAYQOE0g
	64fYfUYjSqOxAQ4D2qwtFVF9XnoG+TN3qIqBU
X-Gm-Gg: ATEYQzwKlYJH0OD9vd4aukEOdFsdjEQLu97TGnUrXrw06b83q8zUB45y6aIGDM2lUj+
	7QlelyH20zgbQchC4s/BmlXuoLZbi2b9TKrWTpDtg8Nel7E6LZ43cKJ4UyKeJUqbgl2bpY48ZtN
	nhnffIww/R7gGZ7fIhGJzkXIPlQl2eX6O+Kb6ANI4trviPnLUohES3dq90DgoL/r8dSZ9sJrgid
	v+rV0n9LwlY7WyJSh0nK0VBlpIjatNivPZyX9PUB2AhnYg17LzFntCKUf0k9ShOTji6SfqTJftS
	f/rHSYEZ6aWXC4Qb3ahGmi2egygXml7d4pIgDmnw87rRdJlJCdMU5+1cjqfQNbYoI/socE6Db1y
	zDN/By0n4Pao+ciPfY/OaIcV+Qw4g
X-Received: by 2002:a05:7301:5781:b0:2b9:1375:b551 with SMTP id
 5a478bee46e88-2bde16b7286mr839706eec.0.1772234452768; Fri, 27 Feb 2026
 15:20:52 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <aaBWxNYF4g5jRzzg@sirena.org.uk> <759447c5-a2bd-445f-a245-8772f9ea1316@sirena.org.uk>
In-Reply-To: <759447c5-a2bd-445f-a245-8772f9ea1316@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 28 Feb 2026 00:20:40 +0100
X-Gm-Features: AaiRm53TVPi4EVXDe6K3cBUaQBzbK14mP_f3T4ajURZcsJVD8i0unSqMmEzCd7s
Message-ID: <CANiq72mjO1-WkEDaYUbrBuNnykeM3XCAx9t_-zaZXS4vSYnVwQ@mail.gmail.com>
Subject: Re: linux-next: Tree for Feb 26
To: Mark Brown <broonie@kernel.org>
Cc: Linux Next Mailing List <linux-next@vger.kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 4:03=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> I meant to CC you yesterday to let you know about the additional rust
> checks - I'll add other checks one at a time.

Thanks a lot for adding the checks and for the Cc, Mark! :)

Even just `rustfmtcheck` already helps a lot, and more checks are very welc=
ome.

Cheers,
Miguel
