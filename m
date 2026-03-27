Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B22373C0E
	for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 17:38:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.52
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774633103; cv=pass; b=Hx/nbI9MNjAAYi6ryL9+thBlnxTYeU5+TmUZf29lpAts0rMo5svODuu5UHKDksBcJYzCoUlqm3b/F8tEdp85KlJNkzyGznv3bNQJINGLzlulM+GnVgAPPzigaiQGxekKj2X5n5418C4RtGCeYdeAVizZqs0+YJAPh1c1Fkh4jiI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774633103; c=relaxed/simple;
	bh=i4XRoGQ8ciAxF5LF/eeAmJpc/qwTn1D2VGvZGqV8ZKk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XF+jaLrQj7tGJtdDBDDVfWXp3UZDn/c6yb4eQrMXVEvbmWNR6EHzq0fv4E8deu1uGXhc0v9OFoLz5lKbNZrAQTWvzu40+BOYUQyBU7MH/0fL8cvSeEqczJm108AwZzbyYiV/toKcJSD6nvarki9U3QP00K4ALDirA5PjKmWKiPw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=alhZHxPV; arc=pass smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="alhZHxPV"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-127148c2112so215491c88.3
        for <rust-for-linux@vger.kernel.org>; Fri, 27 Mar 2026 10:38:21 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774633101; cv=none;
        d=google.com; s=arc-20240605;
        b=TV77VeJITcoH9XVZI5htV8XnogrlDzmaErnio0dWf1tHUOC36D+Mb1am7bVOgJmgPz
         PRowelU9bioMGnzzEg8+XsOzDGelzRPQSQ3lxccd9dshtVu0usunmMPgkcD/u4b69sXW
         Ntog9tOSjMJ0HSfYBu5fkbXvd3eu9yNwVXT4j2JBCH2LLXDtJKKVHdKDRtQEZXnZ9YbI
         872KOPMWj2SWKXM2vaZb+gZ3wMlDu1Gw8QTHW98iKkjDQCAgkopF5kb2tWTmyqHL7KDM
         AiK1SPjlfX174c+tAf2ekjfJhgKTVjtiXFdMKMxCP1o/ABh9DuG6cBak92M1ESJ471ov
         kwJg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=i4XRoGQ8ciAxF5LF/eeAmJpc/qwTn1D2VGvZGqV8ZKk=;
        fh=ua2kaWi2Tuhe5gC5lepiZKf1CFR2m+ptryOJZN/8Hgc=;
        b=YepXCRd8RmB5DTlPoet5KbngcUHKlZ2T1MeylCe3tOI3T0QnEY7kFA2/y7AeFxwxhl
         +ViScUOdfM4MpmY0megqwYpC1TB4rurlIi2vYItcAxRs7vMz2W7FhwzhxlNDi5C3vA9O
         qAsNn1WUdyyoNHP4bwnY3PoEQoAmFSoF2okGWgCut2Y18kwENoPQ1B2OFwnOhDGQpZPn
         uSQf1kdylqv7nkv2Kt5jO5Iu5CYrJ9Li6CLAADa/OmPTXwTyjzf7A/Wb+5WwUQheTheh
         C67JYUGwVID7vmjokxMJK5SBygLPe0ZGUbCjoV1OXr935Ot2sAt9HO+yhBVwSYA+sy5L
         UdrA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774633101; x=1775237901; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4XRoGQ8ciAxF5LF/eeAmJpc/qwTn1D2VGvZGqV8ZKk=;
        b=alhZHxPV5T2fdatBwpj2qJAAxeRtPXJ0uDb7XsmPQMzRbOzf+FNggxXK/9ERofYKaK
         68wzUJeKMl2RQ3BFEWKdUeH5Wzxgn/AMCrYJxQ3WewbtyGNUN6dTgeyBHJz82XDf88xo
         tN8KKG+YkbO4pzVfiYFVJun/q5bwLGB4Xuhil81lq6s2QFGIXhlAVlbtRf4Yl2Jjibsa
         wHQKG6rSWGHIa/QrmPtAxDliATjiQ1K2nYH1s8wwMcZpFUFM3pQ1xyd1P3j5WvRikizy
         FOTR1/VE5V/jBwFY2NFUReT80NMyp9z/BNlvmscnh5SG2UmAtukhAaLB2orski9ATdtA
         SfrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774633101; x=1775237901;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=i4XRoGQ8ciAxF5LF/eeAmJpc/qwTn1D2VGvZGqV8ZKk=;
        b=MmqZZDL5mohoKyRgy6tHJBhMJpjXDKBljEgfT7mn1NsU+SlFQbGWLitS0HLKEYHyBE
         Zw9clYlNeimJdSBTlgENtFPw378jCWEmTDUBFpSbjIlC3+5AkgUnLagMhIl9e3rV4us8
         vJOxYPECdQ6/+EaKyOZxSux8T9xlIl8yNhegCq+j7slPzo4MwugTENWMsQehXposMCGR
         ztay6NJDFDWOr0IWviu+ock/1GfaxbQOCns3objktXlebB+HkG7lvRbJW7FPd3fDRBql
         2AGXIyt8GBVfgoD414GUET2l5y1AbXihq5O8TEmKBWXgncbFXSSWepcZm1xd9DHgU0Yv
         ZsBA==
X-Forwarded-Encrypted: i=1; AJvYcCU+vu3GpUnd7uo/EfQHMuXknOFHHTqnUNmn74W0wgOfPz8hzTl9rvn1S3h8JLQLmi1fnlQnPkL+ZCkZL1OsKA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwwG1Gm6+3Jzdobpzi34Ny0j/zRnJ5tTgeu36IgMqkh2FwpPZIb
	O7ghmoEDnwoNL/JVDWzHeIe63oF5OBzAzbXP/Bw6uzLUf+1f6fdlyUTz23yKH/Wk8euF1XQv2oB
	330vupFAGzA8dn/CtXcIYrmFjUWBUpNw=
X-Gm-Gg: ATEYQzzvoxzeRfqOZEeVcIgHCnOrVS8am7RZC3EOsvydLqDXvDQK4gAuchMYlXiPrdw
	V1EqyvClCougoOBQysBWFyHff11nQFhwyhjO7+ikCBZBhHrCf2eDwGJrnmO3QlZG9twhocPLKpn
	fcRFj1T0wWxurrWgMTAWmV/kMzD+DgnZB0fJ83dO4GamNCn+3I9XbcjmX/wISzGKwyJeOPE5CSh
	urftMziVDxf9ZPbEDd40U2bqy5j31olY/wxMtVs2Ff2UeTa0Wjd9aIgJDEC8hfis+fx+PTnP3tB
	UI2ravF1m4l8f+nZsfwFOz8JF1d6/glEdEd32yUyH93yRYYKHs+qj2GFA2sOv89BlKScWyKA2QK
	t0pdXRfgya8mXnr3RdRu71po=
X-Received: by 2002:a05:7300:3254:b0:2c0:fec3:fd2b with SMTP id
 5a478bee46e88-2c185f4195cmr868301eec.5.1774633101017; Fri, 27 Mar 2026
 10:38:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260223-clk-send-sync-v5-0-181bf2f35652@google.com>
 <DH7L09UFWGTK.2MT0OTWH1DUV4@kernel.org> <20260321-awesome-hot-kingfisher-5d9f55@houat>
 <CABx5tqJvOFEzmadeXpDxSUjkghviqtP0jo+kzSB5X6u_P_j2ig@mail.gmail.com>
 <CABx5tqL+G9i1ZW7i5AHaTqUFTVRDmBvP=RycUdwjG-GOp4uzBA@mail.gmail.com>
 <CANiq72=M3H-06L7udG_LqTwLykZkAjfy2d5NXQZn5TYRJ+N37w@mail.gmail.com>
 <CABx5tq+TdGvL+SCUe87qWFgeAq-1Zf5w63jn2hLe9+YTyz4sNw@mail.gmail.com>
 <DHDOH1FXTIZT.1QKZIPZ73YNLI@kernel.org> <CABx5tqJho=k88A1L0neVeaiYCXpLsc7UjzGSgAug73ZC_amYag@mail.gmail.com>
In-Reply-To: <CABx5tqJho=k88A1L0neVeaiYCXpLsc7UjzGSgAug73ZC_amYag@mail.gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 27 Mar 2026 18:38:07 +0100
X-Gm-Features: AQROBzDgjWTAFVxg45-x5LUiec7rwVNiECYCnGtFbz1GIQ6qZ-C218NzMZcOD9c
Message-ID: <CANiq72=E=fyCjr_5zEoiUoSOYnXTzfFjE8KJRGsDeEQN1cFY=A@mail.gmail.com>
Subject: Re: [PATCH v5 0/3] Implement Send and Sync for clk
To: Brian Masney <bmasney@redhat.com>
Cc: Danilo Krummrich <dakr@kernel.org>, Maxime Ripard <mripard@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Michael Turquette <mturquette@baylibre.com>, 
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Drew Fustini <fustini@kernel.org>, 
	Guo Ren <guoren@kernel.org>, Fu Wei <wefu@redhat.com>, 
	=?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>, 
	Michal Wilczynski <m.wilczynski@samsung.com>, Viresh Kumar <viresh.kumar@linaro.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Daniel Almeida <daniel.almeida@collabora.com>, 
	linux-clk@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	linux-pwm@vger.kernel.org, Boqun Feng <boqun@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 27, 2026 at 5:54=E2=80=AFPM Brian Masney <bmasney@redhat.com> w=
rote:
>
> I mentioned to Stephen at the last LPC in Tokyo that I am interested
> in becoming a clk co-maintainer.

Thanks for the context, that sounds great -- more maintainers and
reviewers are needed in the kernel.

But, of course, it is up to Stephen.

Another possibility Stephen could perhaps like if he doesn't want a
co-maintainer for everything is having a sub-maintainer for the Rust
side, possibly in a sub-entry (e.g. "COMMON CLK FRAMEWORK [RUST]",
i.e. with the usual square brackets we use for that), assuming you are
interested in that.

It is an approach that we have seen works well, because it is usually
a win-win for maintainers that cannot commit time to review new Rust
stuff, i.e. they get more people in their subsystem, they can use the
opportunity to learn Rust (assuming they don't know it yet) and they
can assess how often Rust changes are needed, yet they still control
the changes (e.g. in cases a change on both sides needs to happen at
once).

[ In any case, I don't know the context behind all this -- if I can
help with anything, please let me know. ]

Thanks!

Cheers,
Miguel
