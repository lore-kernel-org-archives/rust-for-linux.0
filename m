Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A17EB432BDF
	for <rust-for-linux@vger.kernel.org>; Tue,  7 Jul 2026 21:40:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783460453; cv=pass; b=a4psM3pvbKNX9jPu5qSC0UzhEPa2xWiplCch0YvnS7l48NEsjjBk2qLMPGsGMxZpzkNcmpS/VF2IGhIxXtvS1fUtEHRVnsIQCMINNiEmxQ906MZShQimE8nphJUE+fPMih4Hvn/wYzkXKXkv9XIhnkaM9Ci5FpNUZRXINtswWno=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783460453; c=relaxed/simple;
	bh=7s0j3gs1q8B0kvELXLVyzmwUipBlWc1iwp8X7x5EAP4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=WDDoHmGQRaUQ+f5dH3qavJgyXwR58d6HlcLY6fmPaY8yBgo+2hcLWN4z9VikHhW4VuEhCJA5Qw41J+3AOPgk51qCt1fISvB0nec61Ibu/1wABxNgyCJx4WSaixdpvxbkIdk769ButS6CVdCobyPoawT8ImT74TRnSYPYgnzZ9eo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Bj1ouXvi; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Bj1ouXvi"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-4629051c9d1so11349f8f.2
        for <rust-for-linux@vger.kernel.org>; Tue, 07 Jul 2026 14:40:51 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783460450; cv=none;
        d=google.com; s=arc-20260327;
        b=BpTga9IlAFmPfIFQSK6+dViOZlwes8aJ4hOEQRV0Wp3wXDNJc2Eix3PEvDc5WU2tuy
         ROJ5ATp1Wx8+y2XHbrPp512K3qkw6/Ob+PHi6VtHSNG/P1zFYmMfxpe9CUIUj1FwJTTb
         XvD7EQiPaWCncQOfMJB/48rKooC4mIn2QAMc4AKbn05qNh9jQdpWd6QfwJTuomjH81Oa
         fHivK9d7HNVPNJJfFOSAuK+EwTOk4vOqx3NOE3MM6U5Wy4JUlU7/U8QcGDSy/TbPNzHN
         E4TJdfEyYqr84zj0ld9yGR2REcAwYjEtoOfUwxH88mCJ9mlgA5+KQvxOjDROkcMsgDb7
         bAKg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=F+Ok+D3VRtxGi9vtZTj6D7dsuUylLhpT+aE8x8yKCk0=;
        fh=Vzs5hjKobYlA7YpwGehOXt0105HLJZW0CiMcw279cz4=;
        b=kRUdhqmo/QbMvcXNWpZRPdqqlqXDPw19n42ydtbWuNYhiTwi27dBfwOwOi/u4BUXqa
         LwY6oSfZEt7ZqP/orUvMxTmKWwVmolx03O0t59pHyrbl4UM3UixdW7Gbuov75UTObcN7
         Omc64hARLV3a0+2byLIw4WPT5JiMJaNFUuU2MajeVvUh+r24MLZA2xJngf+Vmgz8QUBE
         q6+yZbpiIJrFRQFAFiBfdAgeqDwQfvYQ6z372mBHNCl5cbrINpOhqVAoiwz2euWh7Mj6
         qUT8h8cXtvHvteGWMdTBObKnq+jdSxKo9nXkawqnhDtjB8dZg2ZHQZHv0z1QYYTdzzdr
         d7Ow==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1783460450; x=1784065250; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=F+Ok+D3VRtxGi9vtZTj6D7dsuUylLhpT+aE8x8yKCk0=;
        b=Bj1ouXviKQhPARvNlmOCUKPFeBmCZEQqS0tNDUQN0HhxTuVwDlMO74CRcXdCdgLSRN
         9m06Z+e5fs2pCv45gZpKuzTTUZpp2KQb//dQpAXslcelr6dfoxZBCE+kAqxBpspnXfuR
         4iA9YRsIhhKTXpZFKrzQeNvg396CTpg7WmKglmhlchrzq+tIss3NNA/ET6SUpke/UXlp
         RHEA9u1rlS759AyKjMjLjyguXYll5fANIswitRM/wSlLLDBMxNQlFBneoh+2ihYe2brN
         tQIyge8+e5wfDaZ9Wwc6GufDCkQzngxli57QPQL78gGmOqxOTCbkPYkcPXaLlYxfq5en
         XfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783460450; x=1784065250;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=F+Ok+D3VRtxGi9vtZTj6D7dsuUylLhpT+aE8x8yKCk0=;
        b=AxLqWGRG0Q6Punwrx/TeA2sZYCUZJxQcsu1i9LcS4xZP/oxxonOYIshUXrEMzrTtRO
         uhoIe8X5uemSkwsNAojSav51LV8xklZUzj1p1yMY96DzfLZ/5wvQHrDn7VP1GEry8uJA
         55DUkNI3DW6KvihNnrLvqsc0OGx/GtJaJXaabzFX9J/hmcm+UDBVE+VpJTdE6W50FbA6
         LKbZp7265OAMY+OeAosNyichIs8Sau91fz9SWT3vWmTGTt0LydEK1S+lIaQLesEataIA
         SghDVN7Yc6zCqDQBIB2q8CxNsAlxnBh6tFUsuoZtxtKLXAbSbrZnlZrAi6hQe99VHLIh
         F6PQ==
X-Forwarded-Encrypted: i=1; AHgh+RpCKEDdt+B5FLR7spoTANYyzFLFoXOmbgAZjt+BlB/gvhaAhgHI9WEJyjikKePsKvWJpcjC55clMsNH97s/oA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwZoqQv3i/K5ym9ukw/ehyBDZtD6nkwyEsNBNMGcgNQgiJsx+H2
	3+tUIcx9c8HhDVRezyc778HR/H3Xl6mUMjzwmF35D8pyMWdrkS0dNHvbO+HFqSicSoVb2RxFJXn
	grGw2SJ0f7wL2jnop8mbXlApSmQVTNhJd0Zoo0bLg
X-Gm-Gg: AfdE7cmEK+YkCrHqMLZEbmAMejgc0y9InuYhJabS6hUnLzGR71z7mg6jao+IctJpcBa
	e2UsBBKikzafgRRiznxzj4BYHE6Z4XhFVZ+VrU8yI4V5TezHeHrkGW4B2yKT5H8DQ6ZvkLAoWh6
	iAt3E+TaN5Ndew1gEv9xo6SJXTnP8V+mkwcIaJhFDJbfFo3FN1xfmxtyaykYaz+Hcq9aTpUKvbH
	TtGX5+Onq0vHJKBhN15tj4AsXEhrUfnzIsXhLMVkSAvzj/m9nbMyxEzTe4cbP6KJTbvKzkqo34e
	kUZbJQ1ckUE9o7tVjxFMWpP/TUY=
X-Received: by 2002:a5d:4207:0:b0:475:f0f0:9ecf with SMTP id
 ffacd0b85a97d-47de6723eeamr6198466f8f.58.1783460449777; Tue, 07 Jul 2026
 14:40:49 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703-remove-task-euid-v5-1-c90c7e2ddf54@google.com> <c49545c6c69225bbc7e93cac58d58cd3@paul-moore.com>
In-Reply-To: <c49545c6c69225bbc7e93cac58d58cd3@paul-moore.com>
From: Alice Ryhl <aliceryhl@google.com>
Date: Tue, 7 Jul 2026 23:40:37 +0200
X-Gm-Features: AVVi8CfXuyQpigqlnMZkCqwD23ax4BF_tMVmnmNSZP3qMxiXiu7h20uznVvLHgE
Message-ID: <CAH5fLgif5aEVPeD+-jq3e73OVX0uzcEYwggMyF5v_DbZ=3f_Og@mail.gmail.com>
Subject: Re: [PATCH v5 1/2] rust: task: clarify comments on task UID accessors
To: Paul Moore <paul@paul-moore.com>
Cc: Serge Hallyn <sergeh@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shuah Khan <skhan@linuxfoundation.org>, 
	Alex Shi <alexs@kernel.org>, Yanteng Si <si.yanteng@linux.dev>, 
	Dongliang Mu <dzm91@hust.edu.cn>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	Gary Guo <gary@garyguo.net>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Jann Horn <jannh@google.com>, 
	linux-security-module@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Jul 7, 2026 at 9:10=E2=80=AFPM Paul Moore <paul@paul-moore.com> wro=
te:
>
> On Jul  3, 2026 Alice Ryhl <aliceryhl@google.com> wrote:
> >
> > Linux has separate subjective and objective task credentials, see the
> > comment above `struct cred`. Clarify which accessor functions operate o=
n
> > which set of credentials.
> >
> > Also document that Task::euid() is a very weird operation. You can see =
how
> > weird it is by grepping for task_euid() in the history - binder was its
> > only user. Task::euid() obtains the objective effective UID - it looks
> > at the credentials of the task for purposes of acting on it as an
> > object, but then accesses the effective UID (which the credentials.7 ma=
n
> > page describes as "[...] used by the kernel to determine the permission=
s
> > that the process will have when accessing shared resources [...]").
> >
> > For context:
> > Arguably, binder's use of task_euid() is a theoretical security problem=
,
> > which only has no impact on Android because Android has no setuid binar=
ies
> > executable by apps.
> > commit 29bc22ac5e5b ("binder: use euid from cred instead of using task"=
)
> > originally fixed that by removing that only user of task_euid(), but th=
e
> > fix got reverted in commit c21a80ca0684 ("binder: fix test regression
> > due to sender_euid change") because some Android test started failing.
> > It was since fixed again by commit 65b672152289 ("binder: use
> > current_euid() for transaction sender identity"), which uses
> > current_euid() instead.
> >
> > Signed-off-by: Jann Horn <jannh@google.com>
> > Reviewed-by: Gary Guo <gary@garyguo.net>
> > Signed-off-by: Alice Ryhl <aliceryhl@google.com>
> > ---
> > Originally sent as:
> > https://lore.kernel.org/r/20260212-rust-uid-v1-1-deff4214c766@google.co=
m
> > ---
> >  rust/kernel/task.rs | 9 ++++++---
> >  1 file changed, 6 insertions(+), 3 deletions(-)
>
> Merged into lsm/dev, thanks!

Thanks!
