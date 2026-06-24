Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4BAEA3BB671
	for <rust-for-linux@vger.kernel.org>; Wed, 24 Jun 2026 14:03:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.175
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782309790; cv=pass; b=NhXUrNzdNlKqAH2E/0A8JcPWTgbUbZI8O5g5+zgo/CpWQX0m68DzBTiMPy3T2E7LO6qDr6pKO9u+y+h67e51EbjRBCA5yyvz5jyueFOrc0e9skCHWJULgRpbW/1quQuBL2ZntvMv6cnzFfKD/3scqc2zDUYIOx0g9w57YcYm918=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782309790; c=relaxed/simple;
	bh=ksijtf2IRLNHsT3AVS8XAMToSq3zWqz1VXfdch2/aYo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DNEskCTdSN6BFzS6D9m7ehguj8CcMRMMWYP+yMwpQl9r+UIbWppMyRnOC/lRJW8DyIMu1GjrhElOyll1eOv0u3xWbOSk27Lu6e8cPQucsJKRt8KXHFryMpZkiMPtioXuoRWVatgb+PP7Q+6XrL69Vz/+ENZbdZAzb8wgMw4m0DQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bOD/uamh; arc=pass smtp.client-ip=74.125.82.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bOD/uamh"
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-30bb87c90deso164477eec.3
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Jun 2026 07:03:09 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782309788; cv=none;
        d=google.com; s=arc-20240605;
        b=AB+3yl574twW1Pk+V7EtIYFlUKiaVSYB5a1EJQEOlfX+KKCpPL4LBZHCH7MZmbFZj6
         BvrbiI0Htj6+yHM6i0XH1293EtWoEj5t8t2rdqMvkwBBZVEnXnH2HgycQP6rEvINgskz
         pqB/SkGPXMRpHgvhavtadd3sG2j0T9oyphhqBAzQYvPgd4B8w7J8yaMN5QaYurE2IZls
         fvXHprn2EW/AtU0LHjZckYtg2bCHeVsO9VS+VD5jju8PZScHKE/a2Jo4mbI38p8Fyb9z
         zwyyNljtQYKiVhzavYfQky9Mv2OinRFscu3Gh+aM1A4JWOIO0j16fzYvgZGJcwREH4BI
         3O8Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ksijtf2IRLNHsT3AVS8XAMToSq3zWqz1VXfdch2/aYo=;
        fh=STATSZKlxHKTY2DpkcwNnPLcZcocUMjDW6kDKzK9ky4=;
        b=Xu7fUCp4aZauUZPVVqwsCku9MC+jP8hXa+f+RcyN8rc5+04gHwqmkKkLgiE+MUR8o5
         vphiiuMyo9Vifdh0E/wJfLa7fr0Ootw/0ZsKhmKu447RwqooamhYTVgdT24qRH7TqWI5
         PT8A4uURHYiB2pL9zoZpyBTpV25w2diH68ZuSJS16Y4yK9Kr72TT5Xptbq8LQZJTsKcF
         huamHfL6cyV99aJTi7xqqwjI702dZSZY2lxHYyudsh6BDGNzV4VmQeOdUU9Se9i/tj0R
         43B4Y5zR3gttV77IZgFmt5Zf1pVPKhAjAQj7UCWXqH+Ar9+8CNWNvFqCmaZf7y8FusfL
         mWlQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782309788; x=1782914588; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ksijtf2IRLNHsT3AVS8XAMToSq3zWqz1VXfdch2/aYo=;
        b=bOD/uamhEpcZJyswv53R84IDRMeI6M5+ChYBgjLyvLfT1fQ65r7lzzwQ1gmCC+wuEn
         2vpGRI+m5uC/gsBm7DblfDULWdfIY9ZSe05VXEG08w57lGrNtLwN60ZcYfsqhVWvylng
         bWEK2eVdZJ0Tmb5pCGX3UXUiIh3E+i6++a9NhVOOHmx/n5nJ0rOXw2ASWQ9fgoOTVTCB
         3/28G0P4l5fMK7R9as4EUjduvq28vuDMkk4OmSZZcOF7jdfBx/hM62MM+5WWYAjBBcyO
         /vcLrSxb4845JDcnkXx9wDzYjuWeHm0U98NS/Wqidu+uHZFS1rgP3ozC2XHYFw/vXnIx
         udvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782309788; x=1782914588;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ksijtf2IRLNHsT3AVS8XAMToSq3zWqz1VXfdch2/aYo=;
        b=IbXIuibLwkrbirLuX8DYClehcdRtE8v12F7wVeO31lUOt95sSatfontn9zVLXU8isu
         WJhP/kre7zbVhTrewndPEjb2TpWzrfTqPQXOAel0aN+4toPyhZmxCd0yzFPJMpmmgslw
         Znj+SUlwgrLU7repP7Qk2K2juPkC8yc4g0mge71kKMDEXylmb6L7Yk//8WxXkBXp0WhC
         ZNFuY/wEPbeoXURKBHy1QYRVgGb1vQGGOB9RpyNuBuls/qU/Hj/K3V54BUFwGzJosqVU
         Rt226ILT/ltfevuxfePg5mgo5l3yAphkx83tWD2tTUCeQR/ByYdpCZTfp8QfR0IZhrvC
         d9aA==
X-Forwarded-Encrypted: i=1; AHgh+RqtFOactDVoTENNLX24DAtkmEKdAhYpHQvGs1rOunbhMmFpeKHdphbjeJh60l29wgC+p01674rFW87mMQPi4A==@vger.kernel.org
X-Gm-Message-State: AOJu0YyO3k2NJKqHz5mGV2niqIiwc9U9t6+7FqXWYwuiSs7kK8Ahqaj5
	oOlvwNRnagxaEloSn0g3cZsrfrzKVy432xGRRTQ8zLYb/jSs46WSFlWNiK01WyIGRS6tV7KIRxj
	HTio2o7kzrVSW277nYOhfO4x/FhZB+Ls=
X-Gm-Gg: AfdE7cmDoaRkezxwKNk/WOUFK6Ussfzmj5nfJjwmmxVxvtBzPCdVviOTHxElzjyNVX7
	0nAEczqiQJJ3oBkYdr8DaMLdB4WDzUS1oWAg2EydIbZIPp6UCUkj10EAvA48wRtjroF2C1hwKlU
	HCq0rw9fsHHT9REu6Dx5Q9Y8/xcNd4FwcygkiIHDGcZmc0t38Mo81oT8Ge8rmLYmz1B1j2QlsN9
	UY5q+b/ruCfyiXOsmB3r3U7Y9R97UmNP3qCcCq9dBEDWLHmF5ArzhJ1EW540TVmJH5OQND2XHe3
	XCQEI3Lw4s1LjOyaqPZN+bQWvSqE/RqLfKn+aF1fgm8ufsT7iCRPwGnaTxjQBblCQDUOZb6fjOU
	4WS7GU3Jy5WLN
X-Received: by 2002:a05:7301:658a:b0:30b:c8bb:588f with SMTP id
 5a478bee46e88-30c5240f7damr3538472eec.5.1782309787929; Wed, 24 Jun 2026
 07:03:07 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260624-fix-fops-owner-v5-0-aa1cba242f05@linux.dev> <8ea21b29-9baf-4926-a16f-7d21c5a1a1b8@suse.com>
In-Reply-To: <8ea21b29-9baf-4926-a16f-7d21c5a1a1b8@suse.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 24 Jun 2026 16:02:53 +0200
X-Gm-Features: AVVi8CdZJD474qdF4GDgFLlfJ_vD8WsFaomaTI3YSRH6pluhcoRUR51gh_iz4VE
Message-ID: <CANiq72m_LakPxHt99+3eBn2rXokr3vZbdJf=Wk-Yi8_ufQ2mvA@mail.gmail.com>
Subject: Re: [PATCH v5 0/9] Fix missing fops.owner in Rust DRM/misc abstractions
To: Petr Pavlu <petr.pavlu@suse.com>
Cc: Alvin Sun <alvin.sun@linux.dev>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Luis Chamberlain <mcgrof@kernel.org>, Daniel Gomez <da.gomez@kernel.org>, 
	Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Arnd Bergmann <arnd@arndb.de>, 
	Brendan Higgins <brendan.higgins@linux.dev>, David Gow <david@davidgow.net>, 
	Rae Moar <raemoar63@gmail.com>, Breno Leitao <leitao@debian.org>, Jens Axboe <axboe@kernel.dk>, 
	Dave Ertman <david.m.ertman@intel.com>, Leon Romanovsky <leon@kernel.org>, 
	Igor Korotin <igor.korotin@linux.dev>, FUJITA Tomonori <fujita.tomonori@gmail.com>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, driver-core@lists.linux.dev, 
	dri-devel@lists.freedesktop.org, nova-gpu@lists.linux.dev, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-block@vger.kernel.org, linux-kernel@vger.kernel.org, 
	netdev@vger.kernel.org, linux-pci@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 24, 2026 at 3:23=E2=80=AFPM Petr Pavlu <petr.pavlu@suse.com> wr=
ote:
>
> I would only suggest adding the new file rust/kernel/module.rs in
> patch #1 under the MODULE SUPPORT support entry in the MAINTAINERS file,
> similarly to the other module-related Rust code, so that the module
> maintainers are emailed when changes to this file are proposed. I think
> you can change the existing 'F: rust/kernel/module_param.rs' to
> 'F: rust/kernel/module*.rs'.

That would be great, yes -- thanks!

Cheers,
Miguel
