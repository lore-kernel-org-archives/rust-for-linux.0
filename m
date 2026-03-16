Received: from mail-dl1-f46.google.com (mail-dl1-f46.google.com [74.125.82.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B6219280A21
	for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 13:42:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773668576; cv=pass; b=ZI8p3effkE5ijpe+iGvQ/wYgPq95rDjqVy724ff7+voru85xdQa5WfgRs3SJ08yhFQMI/uT7ms8ZG4nurUsVkobXja+1fOQC8WP75kU3QjOQ6aT3YCsy9d+3p4/don9iFvbJvqR4V/w7zRrcN2chTh+pwqOUxUKRcQRkqPQKriE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773668576; c=relaxed/simple;
	bh=UGXywQp2Z6F4UsVZuss/tTPRAQ9Jwo4akIrTzpCcSh4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=LSRJjtKD/E+t8YksXsMph0lxjQWKDK6LVKp+/NTOP7r2U7UmQwVgAmsUXd10OfWcG8Lxi5ArIGX8siMcJLLOungg3N/FP14Hl/4W5t8DLxzAnS8Ta/XvaPXmM+gFi7GEZiY1Yruo8LOxB+/JXx6kzEVzx1W/EerrijvoNkOXePE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KVqBNAlu; arc=pass smtp.client-ip=74.125.82.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KVqBNAlu"
Received: by mail-dl1-f46.google.com with SMTP id a92af1059eb24-12714f01940so243471c88.0
        for <rust-for-linux@vger.kernel.org>; Mon, 16 Mar 2026 06:42:55 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773668575; cv=none;
        d=google.com; s=arc-20240605;
        b=S3jMAIxiJwZPuo+r7r3J3ddJvUp5th5KMzLz9r0Udk40yUgkHwH62Yxamdipdk0mml
         3+ZrGHY8oVxOT+W2bdtDg/oWA4LASWLU8q87Ny3Kvdf+ma+m6cMy0tQYW/GfxbYMC5M7
         nc93nHsN9MhVdgL/J9Ptu3pfGIqBsiIImO/aefHS97DL9V3wxTTLt1y6C9/VPzC5u6rn
         ttEEcI23IhXL1f24KdjbRrsv5E0mWiKQsOK1lujmY0YGTyrVmvBV8bB+yzmhKMeLqlY7
         QMk3n4jPepTQMT9tJ919+UKNvQCEMx85bEP7lO67ioAsujLYnUmmqnuDjnoCbiDuX8lU
         33oA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=m8+K1sW9BSF5n+0C12GtQpV/icnD/37T6P2UnmEpBVg=;
        fh=4W4YBqkorY5Eysp8gXm42p0/vS6JiIznj1Ir94PxCHc=;
        b=NgyfGc+34pTFyS0bseIfR7BKvRipdWHnAcbcvNs37cAxmrnlmew4tkJbz5c9IcVvNj
         GK1dcpS+pB9hAE35PnXjAxWNT2N2w9uypuKHHc82gHIdGScfZcFcvE0becHBe6o3BHlJ
         aCeLkEWGgz+0omQq+MNDt5ht/YrvrAc94pfTk0k7LvOBRrkYVfIQrWP/TxeLu7KOesXH
         Uo7wJSs7cqcJHWCtOcGEFDQowdbfmump0YJ68FQ264T/03hrrLTmU0GYqqUGs2QlYBUj
         gRFSzijjfdf/T5wWk3UFwv8u5kcZn4toySA5shIG3FW7vn1s6gGUpQHfHTs3523xQJsf
         3pkQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773668575; x=1774273375; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=m8+K1sW9BSF5n+0C12GtQpV/icnD/37T6P2UnmEpBVg=;
        b=KVqBNAluXb7Q/mglti1RE8M7lp9QqKak3dPZtHviNR+M0BnAE1N0ILQx7EYryAyBk8
         8P6tEInyunDTD0bzCwcfaXY1v19noSH76j3Qpi9ZtoS3zk1/+l6HJgs0nKCwSPzJrOE0
         gz07SuZQOzgjhamO8ocMJzkKEa2t98/MgYVXdN3yt89y5kUAuwQLhfkA9iSIO1qxrccF
         TLsSHUpMx+RH9tfKyGMwgCwt2ENtB21R+kP9N/Nf+UFUO6gxdVv0APLveRxstCjSaGhZ
         2irp+LSu4ORsU5AfyxdhVqn9BfhXjMlB0iIPxy7spnTPlcafSrDk1N7+16CvZR/0U3Ms
         4QKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773668575; x=1774273375;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=m8+K1sW9BSF5n+0C12GtQpV/icnD/37T6P2UnmEpBVg=;
        b=ddlMUUJzmdESdc3jDK8HD0kMeJuvEDuZPw4n1HnB18WU7TpkubdeRidvgtpF3Vok19
         8KNvi0qwfsvZdvh3xrO4TuBu/PWwl8bjqNz4SuthRmSUZHNxWUgJSOXPeMYUjQjjCQSv
         XXSew2JxWKBYGHIEWQZ1cFQzXi1WGHMgllqc3wYuAOSt303cQQSxx62OoFtD1kq9GgyQ
         pkboFMyY6j99Ikvfp1k4+TdMBr2brDhLrNsnXOYXrB0+c5JHJFw8JxhLbs1jYADwpM7c
         CMPx4HWRrT+/zKFGwm8JnMy1dwr9YvOFd3iYX4Szwh/RygNgmiey41LEztRwJ1TlPiA2
         k6SA==
X-Forwarded-Encrypted: i=1; AJvYcCVsRIbBwltXl5YDGqeiMyu0fpu0uKKhB9nm/1YHNT/caKYB2oHq3wR9R5Xu6btDEXEs8Wh+UgfTcDCRW14fQw==@vger.kernel.org
X-Gm-Message-State: AOJu0YygI0RD/V3OStPJrMF7AmXfbWfWvNWrA3FJ+8pocxxex4ikI9TO
	KUssIsq4TLIqmdPxJdpfdtEn8HWxvGdfirWov9Ake5qqAL4yHKliAkXyoSTFQQcwGdVOosBa1lB
	Zn5kL2zQW8OR0Kp0HvzHyzvKUwUNmi8Y=
X-Gm-Gg: ATEYQzyNf4zPvHWA7cA7fyXYKbi1XqN4YJnTHDDNseHsJPbm6wXjHcs/9XmHoted+Rg
	tZaHZ7gJrcpxDmec0S08lsedQYL+njHO5P56WvWcbWCAqI1mK9fMAMMs3TNb0sJeIXZLvn8Oj8S
	HMDML3PQPZHAXydtT2izcxQr7OGV37vq4y2UV1HM+bqYE3bcL9dC4VlXq5FxqXaqettrfonRH+y
	l5Uw34uGm81v7NDR/KU4BxVTBi/yFHKQWMBsrPuDdVvTCgBf0lz9B0OZlcyTF979FdqxdTKXDCY
	uT+gsm/RojZ5lZjfjOB4s8NbEPU9Mj/nHQQjW8UmkYnYdOWQVIBWzJGZPBKmxpuOPyU1mH2UXTP
	rDObQw9Jei8KdiuuustmQPnKO8bHXErO7kA==
X-Received: by 2002:a05:7300:72ce:b0:2bd:fa8f:77f4 with SMTP id
 5a478bee46e88-2bea54e9348mr2776762eec.4.1773668574749; Mon, 16 Mar 2026
 06:42:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <CANiq72mWdFU11GcCZRchzhy0Gi1QZShvZtyRkHV2O+WA2uTdVQ@mail.gmail.com>
 <20260307170929.153892-1-ojeda@kernel.org> <CANiq72=drAtf3y_DZ-2o4jb6Az9J3Yj4QYwWnbRui4sm4AJD3Q@mail.gmail.com>
 <abdJE4BsrzGDTVZT@sirena.co.uk> <CANiq72nXMbP2ZbyNE6voWXrEXg85s99pXLj5LeybZry4eAyzEQ@mail.gmail.com>
 <ffd14e81-c64e-42fa-aa18-60c8036f13e8@sirena.org.uk>
In-Reply-To: <ffd14e81-c64e-42fa-aa18-60c8036f13e8@sirena.org.uk>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 16 Mar 2026 14:42:41 +0100
X-Gm-Features: AaiRm50FoteeJbrCo_ESw2Kb5ArFolVqU4b04Mp39bjrwMxArbZfy8ruQyWMPtk
Message-ID: <CANiq72m0v1Pq6xRb6SjPOgqyYWndeC4WWkgJmWeS0e2YN5C2AA@mail.gmail.com>
Subject: Re: [RFC PATCH] rust: kbuild: support global per-version flags
To: Mark Brown <broonie@kernel.org>, Tamir Duberstein <tamird@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, a.hindborg@kernel.org, aliceryhl@google.com, 
	bjorn3_gh@protonmail.com, boqun@kernel.org, gary@garyguo.net, dakr@kernel.org, 
	jhubbard@nvidia.com, linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org, 
	lossin@kernel.org, rafael@kernel.org, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu, viresh.kumar@linaro.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Mar 16, 2026 at 1:50=E2=80=AFPM Mark Brown <broonie@kernel.org> wro=
te:
>
> Note that I've not started running with clippy yet, currently due to
> Linus' tree having:
>
> error: current MSRV (Minimum Supported Rust Version) is `1.78.0` but this=
 item is stable since `1.79.0`

This was fixed in upstream Clippy in Rust 1.90.0 due to a request we
made (thanks to  Tamir):

  https://github.com/rust-lang/rust-clippy/issues/14425

I would suggest to allow the lint locally (perhaps once at the top of
the file). This will go away this cycle since I am going to bump the
minimum version to Debian Trixie's.

Alternatively, we could use the patch above to add
`clippy::incompatible_msrv`, but that is more involved, and allowing
it locally is what we did elsewhere too.

Cheers,
Miguel
