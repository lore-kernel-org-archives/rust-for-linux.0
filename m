Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F234A2E7360
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 13:04:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.50
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783429501; cv=pass; b=gYlqZSVB9VoWM1UWcjZHljgAGuZhdDzypgkMcItTXRU47Fiz4MQmTOJkCXuCb7x6aKIsCfpJLAF6kFRppU9/xHrU1UWR7JZ3tXLSFC5aQUURA3hZKk9aexX6ST4sK3wAp5eG5ewXdDUHDPwnaW8j8qTTLRPdW8PfexmW4BGnmUA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783429501; c=relaxed/simple;
	bh=Qa3HvUOBiikHOm2hv7akwkWqjggqpxhg4jyWQbcbbM4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=TrrGfTVPqJHUz5nT4xCj+Eqxrx9XudmeaZ2mMk2Ut+KSl79D+CD7hK/+D9ZDhdjcexHVzaicNy68W9kAcABGZN7vx7iIQIF9abfW/kxzKsmt+pzOF4asdPY4M+BsQ5nguTcwIAZ2AD2RABQI1kUvV8Zy4904IN1kgFfFlqY0kyk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=nwFqpWQm; arc=pass smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="nwFqpWQm"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-493bfe9f886so22847155e9.0
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 06:04:59 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783429498; cv=none;
        d=google.com; s=arc-20260327;
        b=Ew4Jn3IrBsGQRPTpssOFxf5oYFCzycLugmW9AhkQDASeN19CxXVqoE0ovPs/oJOjsB
         5nfvOovRejJGX+U9vMN/vS0ny9WCShKRL9o4jCGa2+89FJ7yzwEN8LzTjRnY4DImQW1r
         ptjMpXgc7p8kxeAb0jdGXoms7FPTmo/sGB6i9LvEIW3Gd1f6WYsaN2JIp72vqoebLdq3
         j9EyzBkxl/5bYSwMHEC3ZbF0ceOmTSFsNsztCpaoJGZyJNvj3rgS0Jk8iUuhH1cmmaEo
         nVVZKudkB1PBztfVSHo2rX4oMiv2bZlGihpV6NrqU+D67UVq3r93zj92sNuj+US9v7Af
         w+aA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Qa3HvUOBiikHOm2hv7akwkWqjggqpxhg4jyWQbcbbM4=;
        fh=q2TGOvSkYZp5869Seo4J6RxaYFvNMjVq9tMFWw0nei8=;
        b=WxCfj+dwPjYJM87EPRSAe9pbk3DDiK1rwY/y7qT49qEM2bar8SyQXf4i0cvtI87VJd
         JDD0Yq1ZzPMB8JCPMsmNeH+82+TNJO7ay6JQv9f3rzxdml+hpbVFhpf+LKcmrgoBJ1Zt
         lM6sXIXRfpOw5NxRUM7lc7iDH5vXxY7Xb9TCMklu1nQr1DLr3WNoaqcMk9M0oQP7UXkX
         EegovJhIujN5jrb6+hK8XxPpiGbWUFSO/hDbxZq03EnojmyZo+9Z3labdJPfpJjBlT5T
         oFbWLNMFNdYbv2tnTZ4mO4tii9r2JxcbHOZjQapmmDjPPbAePffG3H4CTdOV4gseGJjg
         zXGQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783429498; x=1784034298; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Qa3HvUOBiikHOm2hv7akwkWqjggqpxhg4jyWQbcbbM4=;
        b=nwFqpWQmjpkhT5N166ROjlsHRUNBKTRpXMHaTMJhkX1rzisW+j8ZNBgqb0gt0uMyFK
         kJBGogIRdGOCv+IfwKTap7nCADTIGP8KSe2axCh/K7UPtN3Y/fPn4dG6mxglUfb5sjDe
         z9wuNw/bh4mOjkdHneFd2IGooWxjn53QI3Stm22mJIjhjpbdYFfbUmPDdJ+o5ujoCGZU
         Eb2D+u6aPJP/dPUUL3BCwxU8hiDgJqf3hxk/zmzS8CtdaNnPAk27A0y9mKwZuZGJ8UZk
         RsXJ0igYAos9Lsjb5CO7DSUU9QppF9kBmRG78Ibkhp9dKy3x75qDooky2A3617Q50Udn
         s5oQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783429498; x=1784034298;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Qa3HvUOBiikHOm2hv7akwkWqjggqpxhg4jyWQbcbbM4=;
        b=UouMzWLcbOH7rjG/bYk4cUt8GJIxXOxcqH3T0Dc61OsePhawW290BbKIfAjWd2YB+5
         Kruv1OqPcyv0CRU7mwGesIIhYhFYFdJEuH3GT0urqYsuHlG2Rv2b/CUTbYpGHIItAL20
         X3xPC/uED5kRcd43gNBchykB1w43qSUQ3pyfTCg/1tZz7bDh7pQzJVsWFh2o23edO+F7
         ZEy/CCGA5+tvgk5SimBv479SpFWq3chRpMcFwWeA09y38fJLiPeYoqzho8psunkZuoya
         dNATu75MsR5OWlONjV0rSbdx78eSKWbocyIiLRPSsdDrq+UOAj1DTRul1dfGk14gDq4H
         jMvQ==
X-Forwarded-Encrypted: i=1; AHgh+Rqm4a7yyqFFI4lQgrClS9DPePvjZ38M393i+ZWCtawceiA+opXdRvWHmWBDK8F7mZ09oMQ/6xlaZiFH+aKFzQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YyKWpccoMRRDKnk9pvV7IxLRtEq4UkwnOnRcxPVr5R5kwhpKZIv
	TDHKl4SjLXDxTZAQNF2tchWjLvc8akjQPLxw49dZcwZbpXX6AgpF6l4bwdMSyIzfioOlEYMcUNe
	oExCU8odbmFUShd7hT6G/AyIfmhPrlNjYTkp6j3Gb
X-Gm-Gg: AfdE7clAWPJXbKi0kyGmSp7VDB/zX3ZjetR6KQSp+3iKwkxmGFeSF1SSpOrWCY9IWg/
	3FRSa7yBgo4cxPDZl6kNV5J/gpwKIknynPY2emYZ9n+gUvHjvcSd5HSk+46L+RWQjx+msqNBBfB
	WYnazbya10Jat5bje0MHdGtSLQiKr/L+6Yy6Nec15rml+UQo6kSEmoQM00mYpUDiXeRxvOn5hg9
	5XrFV7pOFbJheh8nN+cxL8/tQSaKm/ozVp9RRs7XoX/+VcdQA5C4C1Pf3x/zeVzho7FildGJvM4
	PHug6DFAyALVB7l/6SFvb/kBOsw=
X-Received: by 2002:a05:600c:8b70:b0:493:b6e4:fb2b with SMTP id
 5b1f17b1804b1-493df06e943mr52096855e9.25.1783429497735; Tue, 07 Jul 2026
 06:04:57 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260626-unique-ref-v19-0-2607ca88dfdf@kernel.org> <20260626-unique-ref-v19-3-2607ca88dfdf@kernel.org>
In-Reply-To: <20260626-unique-ref-v19-3-2607ca88dfdf@kernel.org>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 7 Jul 2026 15:04:45 +0200
X-Gm-Features: AVVi8Cd8GrEsrkEwxzhRkanTcpbMUA7MU6OpTudOnt7DIfIGqhosSlF_BI7LYTM
Message-ID: <CAH5fLggMeHUgXj7JGYSJejUrR2PdWymOOb+3E1VmHokzcox4hg@mail.gmail.com>
Subject: Re: [PATCH v19 3/8] rust: implement `ForeignOwnable` for `Owned`
To: Andreas Hindborg <a.hindborg@kernel.org>
Cc: Danilo Krummrich <dakr@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>, Vlastimil Babka <vbabka@kernel.org>, 
	"Liam R. Howlett" <liam@infradead.org>, Uladzislau Rezki <urezki@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Lyude Paul <lyude@redhat.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	=?UTF-8?B?QXJ2ZSBIasO4bm5ldsOlZw==?= <arve@android.com>, 
	Todd Kjos <tkjos@android.com>, Christian Brauner <brauner@kernel.org>, 
	Carlos Llamas <cmllamas@google.com>, "Rafael J. Wysocki" <rafael@kernel.org>, 
	Dave Ertman <david.m.ertman@intel.com>, Ira Weiny <ira.weiny@intel.com>, 
	Leon Romanovsky <leon@kernel.org>, Paul Moore <paul@paul-moore.com>, Serge Hallyn <sergeh@kernel.org>, 
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Alexander Viro <viro@zeniv.linux.org.uk>, Jan Kara <jack@suse.cz>, 
	Igor Korotin <igor.korotin@linux.dev>, Viresh Kumar <vireshk@kernel.org>, Nishanth Menon <nm@ti.com>, 
	Stephen Boyd <sboyd@kernel.org>, Bjorn Helgaas <bhelgaas@google.com>, 
	=?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Pavel Tikhomirov <ptikhomirov@virtuozzo.com>, Michal Wilczynski <m.wilczynski@samsung.com>, 
	Philipp Stanner <phasta@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org, driver-core@lists.linux.dev, 
	linux-block@vger.kernel.org, linux-security-module@vger.kernel.org, 
	dri-devel@lists.freedesktop.org, linux-fsdevel@vger.kernel.org, 
	linux-pm@vger.kernel.org, linux-pci@vger.kernel.org, 
	linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 26, 2026 at 1:55=E2=80=AFPM Andreas Hindborg <a.hindborg@kernel=
.org> wrote:
>
> Implement `ForeignOwnable` for `Owned<T>`. This allows use of `Owned<T>` =
in
> places such as the `XArray`.
>
> Note that `T` does not need to implement `ForeignOwnable` for `Owned<T>` =
to
> implement `ForeignOwnable`.
>
> Signed-off-by: Andreas Hindborg <a.hindborg@kernel.org>
> Reviewed-by: Gary Guo <gary@garyguo.net>

Reviewed-by: Alice Ryhl <aliceryhl@google.com>
