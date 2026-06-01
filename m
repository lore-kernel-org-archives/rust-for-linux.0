Received: from mail-dy1-f180.google.com (mail-dy1-f180.google.com [74.125.82.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8160A340A6F
	for <rust-for-linux@vger.kernel.org>; Mon,  1 Jun 2026 06:22:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.180
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780294951; cv=pass; b=bXWJ8iD0HO/TBV47i3aJkB1Wwmp4V1IbMMHRoLRYjug72+Jw9IqgOVln22Icst5nf1htCbEXi2gHSUeCPTZOGealbQEfL7VCyO8xPDSxeSK9s35hIAm/bJzskiI7qa5oC4NjvDvKMW1Zf+PezclKWfp7H+d15ogVBy3+RbNEnfw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780294951; c=relaxed/simple;
	bh=rDizJErqrmQNdM5KasAdxwRqqjmYM+IPstQR76bgPHE=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jLFYPdmcXBNN3DvNDRwMp/1MYQO9DGM9v6Elqsg4pUEsDJiLgkUU3umYJQX9j6Hp/UUc0LUWDGxdX0mnwqorM7PO/u6fGCFckssECTzjlEGj973j1+fW0IyOGrWXOntIwjzqB/3hwh0eb87bk8+iDli76ozfVKYL5yyZPJS/DI0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D8lc/XjC; arc=pass smtp.client-ip=74.125.82.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D8lc/XjC"
Received: by mail-dy1-f180.google.com with SMTP id 5a478bee46e88-304dc707c7eso257757eec.1
        for <rust-for-linux@vger.kernel.org>; Sun, 31 May 2026 23:22:30 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1780294950; cv=none;
        d=google.com; s=arc-20240605;
        b=foCn0IPXmz3UY8eVhxSgON7ZBzlN0OKmOAUkCuDZwMfkWugHVXKPlevKyo9Y0JdWo1
         LDANWYRTfZ0fm74XCInGvtrYBtOeUAYRmKbG9/ROjYd9MwpXWfmCpgU8abtnugw7tFyy
         cG0y4SkWr5t3UYBD1Slwl9w0KgvoubPruVoTcRc51ksfDWiDn4Bw6RxLsQ6IR7Gb65dC
         IgPm7lr0PYl5AntPHHYIFK+K9xQsQprRJq6d1Bf1GXMd+E7qFOGZSzyIM8rb4xhyufTR
         q+MncIBjmaaT4Q8HkDRF0XK5pEoj6BNHsv76Gcxqj2mFt7Vvl/hX9gQ9Jd24uA97TXCm
         fhlQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=nGx73QraS4d3NwxPqGYPl3kROHfaW+2ydJcmeDAJZc4=;
        fh=Rbog2qXDPN5Xh1D+63i2j8ZMSeUPRb9bNBRlJayltAY=;
        b=kWjxmPv4b0Aa+FaYo2vp5xYryFB1zRWhVbKdmpLz25FyoAVHlvWeAKiGuintbc3SZr
         hjds+0Xmb04yzWSMyGO4NssqTP/2DQAQwleWgB+p72SoG3ZkxdZgkQpUJs9P1SFMChzw
         hs4SfEEOG9usgRlzx7GqwPHnldaTfVK8CrdlzS/lkNHqRnCKhoDvIQWsoK4ZQAbMF5rd
         S0Js8FMsH8r7Gfh3joDVhr5mozVHnHxyLEk6to9Sl+qsuqZym6BMFzkE5QNxJE6z7IwO
         CM5QY4NIMyj2cT1RpwjBrtgsoMAJvN81yrdG9p/+r10O1iqfpWrSz9osAQF1QOIGRp9E
         8r6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780294950; x=1780899750; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nGx73QraS4d3NwxPqGYPl3kROHfaW+2ydJcmeDAJZc4=;
        b=D8lc/XjCS1sX/vOZDYtCPJ8o1w/4xcBFBLkVfIazdmjTuj9cVvzswffeSyNT315ydC
         mLfinRIVj4VBbOdbihJdQQwRjYYOhUza7uCfLjQnu9VEJAh8lMBbZ9w9Ynu8Tx5XqO/A
         5udKRuHdIGThJlsCcwheP2d2GvmH9pteG9Q5H9A12ZbRQDXlIPQ90WbozHV6rSI2NnHM
         rRY+Sn3gFwu7Tze478imdtSZRMm+yx5knO2tj9Lvf4JBSHY8PvfeAcWhLqb2TmtRnjRk
         9In2SNAyCavOjt1hiLCze2ScyTalzLPTcQ9Qhuu64PKJT8YaDP+a3KhKfVSyPS52NGnz
         BBFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780294950; x=1780899750;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=nGx73QraS4d3NwxPqGYPl3kROHfaW+2ydJcmeDAJZc4=;
        b=EQZd1lywLU7FKTrAoW1gSxkU7AuKNEv0vmTYDL4ktOWd+AysODYu2p+MBzdZHg7QhU
         hrd9NTHLWAHH3fMjcO9CI0Yos8kByVi58uLbM8whys33uOsqFpNEgfP8VMDMRfzhv0cv
         m0H51jCohTuLwZT8B02k8Mh+jlUvbDGYN338KhujtYyVBv8/A6Ius5mscwfbxOK61qaG
         k9/I98tJSEXSlrhFpi5TbzQV34a329Y9/W7FdgRJvzn2Vtek8ercA0AQaU7JCZjrvU5w
         WoqJzW3fzDj+EsKxRPkFfaZL+r/IdgIknsEKZ6eFf8PuykhU7MQB+XVB/IaMgTOd1Dar
         tSqA==
X-Forwarded-Encrypted: i=1; AFNElJ8nlL85OyO2ZTTJoPhG04WQeQ2x9MYdfawtmVsEMiU16oHaI3IC8UFh9kKUmNxeO0NIbTv+aqUaEGGkL/b5pw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxNruue4hKyjkCDHe6Rrc6ctlSLT0B6pHZdH8Nje7j94k165ZlE
	GAyVx2HiAntZ7kRmIAYCoy5IRLjlWr9VFhiIo2IFL4qAnfVqDO4Qib6Bq6zLydfd/mI1NttR2WH
	zJ+sRLe9BOclWfdmIxsVFC76sqf1Yq5A=
X-Gm-Gg: Acq92OEp51LAz/ESSkUFHCk0Cr/bczYh03hPM3IBYg0CLkAZgVnRFVDM/m7B7fK5gjR
	bKJRIOyP9j0wlUwD+EZu2QM08jMDBeBL2f/1YNil1krVTifRWehdlbyqAEWSKz+/SkidUKV+yCs
	ESWgShphtDTYk1y4D3WSc0WSfaIDARU70T9IDzflnQIe2c+X8OVt2wXB5wK1HTzX/FpbFSEJw25
	FvzO6H/fuJ/u8TAWkTrAF0EqVMENl/pn3qrAXXxTNPAmtSomZtuoz5vhxQmPtEJ+LjOKw+doayv
	N6YSZ0hf4vQlurR/vWc/egsoxunBawJAtzUHwjhJKDMdFeq+of0hYA5MFgYwClj7SKz40QJMGBZ
	jrltdBO5LxdfeJQ9W8vaii4tFuO1C8sssuA==
X-Received: by 2002:a05:693c:2c8c:b0:2da:b05a:5a7d with SMTP id
 5a478bee46e88-304fa31c4a2mr1997529eec.0.1780294949513; Sun, 31 May 2026
 23:22:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260530095809.213611-1-ojeda@kernel.org>
In-Reply-To: <20260530095809.213611-1-ojeda@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 1 Jun 2026 08:22:15 +0200
X-Gm-Features: AVHnY4KP0YOUaR4NJ1WZ9OpAGjVDV2NNLjYAMpqZXvWh8Oba9IqjlLwbsWvbpmE
Message-ID: <CANiq72ktxVkvECrfK-y-+YkOANXjV_qQfzPSOJYzwZwiG6xA6Q@mail.gmail.com>
Subject: Re: [PATCH] rust: cpufreq: clean new `clippy::map_or_identity` lint
 for Rust 1.98.0
To: Miguel Ojeda <ojeda@kernel.org>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, Viresh Kumar <viresh.kumar@linaro.org>, linux-pm@vger.kernel.org, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, May 30, 2026 at 11:58=E2=80=AFAM Miguel Ojeda <ojeda@kernel.org> wr=
ote:
>
> Starting with Rust 1.98.0 (expected 2026-08-20), Clippy is likely
> introducing a new lint `clippy::map_or_identity` [1][2], which currently
> triggers in a single case:
>
>     warning: expression can be simplified using `Result::unwrap_or()`
>         --> rust/kernel/cpufreq.rs:1326:60
>          |
>     1326 |         PolicyCpu::from_cpu(cpu_id).map_or(0, |mut policy| T::=
get(&mut policy).map_or(0, |f| f))
>          |                                                            ^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>          |
>          =3D help: for further information visit https://rust-lang.github=
.io/rust-clippy/master/index.html#map_or_identity
>          =3D note: `-W clippy::map-or-identity` implied by `-W clippy::al=
l`
>          =3D help: to override `-W clippy::all` add `#[allow(clippy::map_=
or_identity)]`
>     help: consider using `unwrap_or`
>          |
>     1326 -         PolicyCpu::from_cpu(cpu_id).map_or(0, |mut policy| T::=
get(&mut policy).map_or(0, |f| f))
>     1326 +         PolicyCpu::from_cpu(cpu_id).map_or(0, |mut policy| T::=
get(&mut policy).unwrap_or(0))
>          |
>
> The suggestion is valid, thus clean it up.
>
> Cc: stable@vger.kernel.org # Needed in 6.12.y and later (Rust is pinned i=
n older LTSs).
> Link: https://github.com/rust-lang/rust-clippy/issues/15801 [1]
> Link: https://github.com/rust-lang/rust-clippy/pull/16052 [2]
> Signed-off-by: Miguel Ojeda <ojeda@kernel.org>

Applied to `rust-next` -- thanks everyone!

Cheers,
Miguel
