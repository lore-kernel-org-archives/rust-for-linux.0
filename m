Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0D4E365A11
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 17:34:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771608845; cv=pass; b=AKCAnZiXwwfnMXYwnWyKDMSD0rD62YeLdH5ka9hJRXlLU4kavskn6rtbUsSoEUjpxcVUgDfIKredWWNO/2TVbDo82GC4ISC4WVjxzsiu6hi7hlJybQ4PPUHfFTAhcrBlmyNAS5E4JdLWdcyAAQx+29Q5niR8aWXTIuf/p5pCZRI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771608845; c=relaxed/simple;
	bh=dW69iUku9IRFksYkhFKb49OwK2nuvLOXPied0JTmtvA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=HH1V0TmtfhafVvWeq14DE0MDgTVz2j4vf58XlqMw6bEurZOwUuM9WUOtjQCDnSlhsLeMeMG/KLLhSq3CkDcUHFfKWT0nMKPYjomc5YYPUchNVR8A/8+8PuRIRfHxg/2mWhpXCfzoO4gx1VI5VGR8cGU6FVpZ9ZRaZ006fVC+pZ4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GUmovhQZ; arc=pass smtp.client-ip=74.125.82.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GUmovhQZ"
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-127148c2112so221445c88.3
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Feb 2026 09:34:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1771608843; cv=none;
        d=google.com; s=arc-20240605;
        b=BfeN28g7uDqu5/SZTXJ0TlyXQIzWIzRGH2CuxSPyohLJXMP94D+xhk5jHpmBjpg0or
         gavl0Jkk/VFPUK6en0fQc7iABIExFTSmjIFoT1ABJm8EpnFYjYmUncMXpsFP75T4VO9A
         DEiRp1RxoiOeSAW6gFdPCw2tTsMfHJwEkQPmzKy8Id4AupKhmrfvGgC7nVGNvLWWm1Zk
         mdpPtQ1WS+3G0ctibkST0sjzdvkV1a4KRl2dJXxXcWrI7M0/jxNiNSSHTgv1xd0iRfmj
         7y0q1tPYw5jNzYDHBKPKz7L2Mr/zh7DgLr2zBmqGcg8juJFVvwzC4bGPUodfe9Dq58vM
         +/vA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=B3RiLfffpu7Ffa96sGXtUyFTXMqhEfmtMEWOofkZHzs=;
        fh=morHQOBdY4zNHFErlSGK4hCggCIEMmXy9HhBS3xJmzc=;
        b=CTuhYZPxn6M0IFjs7WTWFtSd5DbafkDwBrzdcmQfyWOy8H0tCONij0+Xgc4WxyWQX4
         8hSFxyUR+2vOqUm5BJ3/zHWYtFx5TenZkFdEitSji7cdprI2bXG4ipEiFcYXAOfFVzQ9
         RZbkIu6KYJA9L+/yUtuF5XD4nhmqjMLtU9rK1cnZ1ihHrl1KO3u2qoMTGn3/bsnnmEvD
         MQDnLySArxaXpzeetRCFcXNMdpojvmdgElqyU7wX3y2FDPQLSwA867r/3bvpHlw19dnW
         CjHOi5d5Zylwr0swD6CdVFsW8Qgl0BvTvEIH8xagbYxt5TvNkSggPawLxVcsl7nPHF4i
         0jFQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1771608843; x=1772213643; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=B3RiLfffpu7Ffa96sGXtUyFTXMqhEfmtMEWOofkZHzs=;
        b=GUmovhQZ0/gL6Csm9lB/oZvXQzoRbh+uVmBzc8YSv+cMKg9Uubues33H/9RyfdILfj
         k+zc557ufFVnuu02HgkHoFuAOrYPjf492rTJMSJs+Y14GZdZJ6vatA+cSh9f6oo963Io
         d0+6cjq3IXdboW94NV5+1nI2XbXJvpX520Bj2HNaDdIOD88O4E6cx87O+l9159ye1JVx
         z5ECFYUXaEaFv94IyKrGZwFgzAl9mjpRAIoxg2VDDG4MXRpqli7BRe0VZzFziNXygZdF
         C5HOej3GIe0ixLu5QAUeJFlzHR9sfGixz9LuDB31Pak32LJ1sCx/7snoqduumBjN/l3T
         gKng==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771608843; x=1772213643;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=B3RiLfffpu7Ffa96sGXtUyFTXMqhEfmtMEWOofkZHzs=;
        b=Xvk73Y85SyTd5owq+5aHfjI6x3Tozkymq5BwR69eeW4GWBBUGOLTjVJ07Iu+AsvBvr
         hvfGo9nttdZVuiij2MvWc+csOvw9Z0mW02RN/pzYFthS3xDYivz4H01/x77o/G4UdDql
         MOdMjEU6yBzIQgcrnqK2GDZgfbkiqVp12Z2DWTEKDG+WP6Q/16O3cB9xBnY2A/ScnsZ/
         TrH1aupQaklI22AC2YBvTSGtaLmiiN6s+OrULFZNC2TIafWyfmpiaccQEo+maCMGnD4e
         xmqSWnSanOgPYA2wz1sKwhq/SrZigee+8TtWJwnfDdP+vgM6AjI3CZaC2hwSHAHmADlN
         WRqA==
X-Forwarded-Encrypted: i=1; AJvYcCVRQGXNJo30nm38LfQGkb/MUoG8hnyXmqDT3ZFaZ9QgwAYYrl2VOf1tsNxh3W3Yn+8feZmn1WG03bYoKAqpZw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0v21Vvka5AABfL1TVlmf0ogoDlFqJCic/21bmpHhaxYMjscP+
	IKHH37a3YPZX8yOIooM2AFDZoo5qkyHDob/ZquWpE01hslK6HWVvZbjBB6pyZxB/DcxMOpQDfgl
	XwVOdDc6XvvvzeuPicFPyMFT44PSqQ+I=
X-Gm-Gg: AZuq6aK4ystrQD7ki8JkmkDwFsLaOLu9WShXkcesBukWP6n+NlpZi4TpnEAng3L/MMi
	aGnnuAfwKYn8Zp2Wpk0HzdqNNx/byEZJuuenWBFa6ezFxOEU1Ag65a4iVzBt+xceEQb4twdTqMz
	Tur8Lqmxxiu4bwyg3ZZS2DYk3JbNmjDXhnrmtEriVPiuv9LX8F/TmYAwvcPdhidNFbB+ExM0t9G
	ig/gCCHWWizbjUJ2m1A/APWc+mF4KE40ETNvYY3pUvrYhNo9KQVgec5SbjfNQWgDG8d23nRXvcF
	E7R0z3q4KNAD3A7zrTceGQfjr/FUY72BBAO27sQkglKPIOV7f7pxoyFPd2UB+X0YR1vijJSUZLq
	nII5LU3BFRvcsdu2dXHspJqL2
X-Received: by 2002:a05:693c:2c17:b0:2ba:674a:dbe8 with SMTP id
 5a478bee46e88-2bd7bdbce7cmr74947eec.8.1771608842904; Fri, 20 Feb 2026
 09:34:02 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260220-unique-ref-v15-0-893ed86b06cc@kernel.org> <20260220-unique-ref-v15-9-893ed86b06cc@kernel.org>
In-Reply-To: <20260220-unique-ref-v15-9-893ed86b06cc@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Feb 2026 18:33:49 +0100
X-Gm-Features: AaiRm53lo0keI-FayfnRj4AYfVuM2jzmE06bNyAO-n4MO92LWSUkvblDHz_tCFM
Message-ID: <CANiq72myc+tCEHm0WtZspZHWwsSzvesxsmUvk31=GCdUN_zVNA@mail.gmail.com>
Subject: Re: [PATCH v15 9/9] rust: page: add `from_raw()`
To: Andreas Hindborg <a.hindborg@kernel.org>, Tamir Duberstein <tamird@kernel.org>, 
	Benno Lossin <lossin@kernel.org>
Cc: Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Christian Brauner <brauner@kernel.org>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin.linux@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	"Liam R. Howlett" <Liam.Howlett@oracle.com>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org, linux-block@vger.kernel.org, 
	linux-security-module@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-fsdevel@vger.kernel.org, linux-mm@kvack.org, linux-pm@vger.kernel.org, 
	linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 20, 2026 at 10:52=E2=80=AFAM Andreas Hindborg <a.hindborg@kerne=
l.org> wrote:
>
> +    /// Create a `&Page` from a raw `struct page` pointer

Please end sentences with a period.

> +        // SAFETY: By function safety requirements, ptr is not null and =
is

Please use Markdown in comments: `ptr`.

> +    /// `ptr` must be valid for use as a reference for the duration of `=
'a`.

Since we will likely try to starting introducing at least a subset of
the Safety Standard soon, we should try to use standard terms.

So I think this "valid for use as a reference" is not an established
one, no? Isn't "convertible to a shared reference" the official term?

  https://doc.rust-lang.org/std/ptr/index.html#pointer-to-reference-convers=
ion

In fact, I see `as_ref_unchecked()` and `as_mut_unchecked()` just got
stabilized for 1.95.0, so we should probably starting using those were
applicable as we bump the minimum, but we should probably use already
a similar wording as the standard library for the safety section and
the comment:

  "`ptr` must be [convertible to a reference](...)."

where the term is a link to that section. Cc'ing Benno.

I have created a (future) issue for that:

  https://github.com/Rust-for-Linux/linux/issues/1225

Cc'ing Tamir since this is close to the cast work, so it may interest
him as well.

Cheers,
Miguel
