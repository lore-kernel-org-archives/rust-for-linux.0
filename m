Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ADD56450409
	for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 13:53:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791726820; cv=pass; b=WhAlea1i9Re0E3ueXIIaooxWmZVR5Q9ZLzWgwh8ud5FP7HS6SAxYUtWSS5RKhSXK4lsswGeJ/1dNmV5lCTtRSC3MTI1vXf+MsWMrICyfHbTMpyUVMDICy8iH1ipa4Ubc/1vix82Xrj7UfKDeD5TH0U+6cvgSc8Tev4msdg2OiJ8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791726820; c=relaxed/simple;
	bh=OBMgnNwbLIUmOMsL8sUSTbTR/61EiCyt8GG/HSPY+Qc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=m2jGB0V1/j4xC1Pka7aUYohAjsBxbFGH9gqy/GltqhMu9HdRi85L/KmOoewg/gAr/qm61ZlJ9mDM+Vtkjl+gV2joGFkmGxh8vNZNLC6iT7gQ/rergMaW/T52dILT1ecGwI7xbrCBp/ls7rElFsufTAUZvuLYGYAOiIhYiC2RoP8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SH+Pe/aU; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SH+Pe/aU"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-355724d032fso124206eec.3
        for <rust-for-linux@vger.kernel.org>; Sun, 11 Oct 2026 06:53:39 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791726819; cv=none;
        d=google.com; s=arc-20260327;
        b=TawyAm1K55H2KR+2a3r5Z7qNg6Hn6lAKVjhiPJgj+SWvGd3/jRcYXa6lYCWM/MhH3Q
         rIXPDij4w0zvbb46rQIruXKiBZ7kKNFdkDDIsdWU0CYuIeQ0rivwCa6a59ZCfO1KER65
         SyVtwZ2NomKBrzxpwLHpMrGhkh4ot3s8iGAGQIz1uaJl3aL1LXkhnddHcrGCVfp65zAU
         zROVuQiM6amSKp3oRck2/8vQ35M6jf0K4GgDrQazWwpL4Qx1glgUik2Whm5lQUALHzBd
         YkufmD36v2fUcalvU6w1BugW5uQyh3AnGKBMz8fPlP34YzVVxYcoMFsoASdWFf1lPuCl
         KPbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=OBMgnNwbLIUmOMsL8sUSTbTR/61EiCyt8GG/HSPY+Qc=;
        fh=uU8ZMwOnrqZquO0HobpcDof39cREEGM6Jm27AbfTcAs=;
        b=qZztZUQCt40smzBEnbMqXIYvACTW42Fhe/0QHEemylOtf/FgipuPPrz1MbMzxN/cis
         7n42X/o6dJD+r66FK4YHM/cSsuoJPh6yUAfZ8wLXpq9VCTChG3mxl4BMY9EXuVoQ0WPV
         WCJgLNYr5tkgRyVPTdJjWIiS8AmyimAg0FUTbTSnG9VGTU63n8EFLCXTOZUSTSbiMvnS
         fhBneFZjfsUgcTmVUiIU5DhZxTA8Zn7xja+y35lgxjFmLxp0UCoWHYgIbtsHeIq6jcJ6
         R2ONTgSMSKUurbF9g1Fkc5o9YEoYxAKiGqJo+Qy96yt95thiQGxLa8vWAMumiG6gXgUe
         wL9Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791726819; x=1792331619; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=OBMgnNwbLIUmOMsL8sUSTbTR/61EiCyt8GG/HSPY+Qc=;
        b=SH+Pe/aUfQCWst3dbXchKKtAUo9gEOwW1iCr+xG8aALurikgr0hIyAaO+toqveQtob
         xytSX0OdTcb6mm7t2vOTFboCoP5Io5tf1mM0lE0rnMDveRdaoG9Geimn1U4SKM0dhxUz
         ftD/e8eSiUHkd+H5U3au9qwox2T3/5IvJjuKCN04VIkqF/UKV3zbV4x80To2IfeJNt4n
         98YH05Lv7WFKC9kaufq3kUo1uIemXxhFf+8WdJO1jZqlUkFfD+chaCs7fAQon2I0ABVZ
         Mop2GTVl4Grx0MaLllfGhqMT8QFmCgaMWsAAZA/qDd7wgU8KHDzoVEdsaP3Kj8UFXVDq
         1kGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791726819; x=1792331619;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OBMgnNwbLIUmOMsL8sUSTbTR/61EiCyt8GG/HSPY+Qc=;
        b=Lgbm1zOfu0U0Qirz9Ji8rwIGmiPald5sa17Ckp8TbdQy2r1FSMgMgA74hC4c7UvKT/
         YYxEFpjqQz8MMuegKdEo+cRUbLvTg0pmccx2l4STL5NiSUzHlnA6fiTZ1H8V11z6tHzf
         TGDIKlTH1T81GrkmeCihWm4nBTaLMjAMQNvkTZDoOs21IlzHxQ2GDSN/uRjBPw/iBEs6
         14jGfhEVuS/vmH96DKGFVAa98iMB8agVeqbjmMG/zFJIoRnJIuTMMsafUXHib3vw91MX
         eQKxsIF7gnW7e2/bYxNLwC55YjiQP89Hs8bmnmbL5d/MejHQU//f6VcpIZfPLlYUmwcV
         oFAA==
X-Forwarded-Encrypted: i=1; AKwUvBwegW1QoVEKe2ZSFppS1ly5H7gxcNgJMI0lBRA2OQPXM7daqDK/KGj4Z4k6ymIzwuFavL5AvKtUlPsHiBuelw==@vger.kernel.org
X-Gm-Message-State: AFq9FYI2k44WU9ZGP5TTFEQcBF3yr61XUrKpXeuBWUh14ii/aLIwZdjn
	AgZxrhpBXRIWyW5PJzWb7lI++vDA+JZpTukiPpnZhXwfXcPJSnPICE/agt4A5AESaabQBfRMYhM
	R4VZLBKfK1OTGkwGXckGANCWsZWxm6Ek=
X-Gm-Gg: AYBFou1z7z/tTb5gpY/jVQJd/e5uXbM20CcppGOAdBeKVhHbikzBBEXnY6YbeJ85c5M
	NtUvFdcc2rvsUyEs54kzPxyv/+3Wc4i8dDvSTGj7jwwjoDRrcQythYBY0hrrl63hB3TBB41T286
	DOjcczgB4boc7dJby0bHkLU3xAFINr9SuCbfPTRVFgnE9b3B9uJiqjDJ5BPwr++X3StgCHRtZ+6
	vU4N+8XNCdFhgACjb7zsdmXgbH9kClseNotX3VAB67X5t/i4AEvkXqFXazAKVUraIjsSf3AIzr1
	W1s6zA1yUAhi8vdsudTrpAnb0n96p9TWzjLg0y5PdHDFLGvB+45lqUi4yeH9mrCPw0CsrWKcfYR
	r1RDaUUMB8kzO6/HPpdTkMyN3Sqcnau45FMJ7v/Fp51fbhdsjq7rrLsGKK9b9Jr7lvkFmS+ssUx
	pR8toiI4rYotspzDQvXBQAE7FcjPj0rwAU0SiWBAvBnE6Hgf+nh8U=
X-Received: by 2002:a05:7300:c8c5:b0:351:7e15:9c59 with SMTP id
 5a478bee46e88-3537dc89f58mr15242775eec.0.1791726818852; Sun, 11 Oct 2026
 06:53:38 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20261011-rust-dyndbg-v1-0-832e4039b71f@weissschuh.net> <20261011-rust-dyndbg-v1-4-832e4039b71f@weissschuh.net>
In-Reply-To: <20261011-rust-dyndbg-v1-4-832e4039b71f@weissschuh.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sun, 11 Oct 2026 15:53:26 +0200
X-Gm-Features: AclHuK8cVNPlyOorjrRhhdDkOJWkbQbDeGyNyJbJMfzEHu0iyDdJ7u6MM6NTRQ4
Message-ID: <CANiq72nN-X6pZJ8NhUOyLtXNPJWgh7oA7-kU9KaVnvjv-u1gOA@mail.gmail.com>
Subject: Re: [PATCH RFC 04/11] samples: rust_print: add debug messages
To: =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>
Cc: Jason Baron <jbaron@akamai.com>, Jim Cromie <jim.cromie@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Andrew Morton <akpm@linux-foundation.org>, Will Deacon <will@kernel.org>, 
	Peter Zijlstra <peterz@infradead.org>, Mark Rutland <mark.rutland@arm.com>, 
	Lyude Paul <lyude@redhat.com>, Yury Norov <yury.norov@gmail.com>, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Brendan Higgins <brendan.higgins@linux.dev>, 
	David Gow <david@davidgow.net>, Rae Moar <raemoar63@gmail.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-modules@vger.kernel.org, linux-kselftest@vger.kernel.org, 
	kunit-dev@googlegroups.com, driver-core@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Oct 11, 2026 at 2:53=E2=80=AFPM Thomas Wei=C3=9Fschuh <linux@weisss=
chuh.net> wrote:
>
> To make sure they are actually printed, enable debug assertions.

Hmm... why do we want to make sure of that? i.e. users can configure
the debug assertions, and the sample may show them if they are
enabled, just like any other code, no?

I guess you may want this for e.g. a CI, but in that CI one ideally
would test both cases, and assert that the messages both appear and
not appear depending on the case.

Cheers,
Miguel
