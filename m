Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0623F478865
	for <rust-for-linux@vger.kernel.org>; Tue,  1 Sep 2026 09:20:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.177
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788254409; cv=pass; b=HCyNJn/vHSXWvajFqnw58PqCr/KiuadfaJiIYktQGbo2WSxUNs0AVOrbHB/asXehD+duqe+9REsMODCvh4zyT2VCU/MohKTWuiI7/tCx6QZXqRJxOH4Fm7l8Q1mhHZMama9Hc1INwuuouObwYYQcpf1wZkpTMVwBeGchZ9uFTUg=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788254409; c=relaxed/simple;
	bh=nmI/77SFGyfm3GM8Abio9q9oeCxIRFo7FM6gskJPvDU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=cQyDBgF38eK2Ulu7uGfbkhJW/hDUg3G0PGz2IGRvGl9ND9GC10Ur2CayFMFNGDzIGiSqBYe3py6wYlnmiQYhcEdT++iWBCabsZ6vdHsucB8mJGnNpPKPNOoyYlTwc8S3ji8vwJR6EV3obhxGZeQxSVkd1ciDnYVTCdE77GUekXk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=sdMe6Trj; arc=pass smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="sdMe6Trj"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2cace91f112so37159685ad.0
        for <rust-for-linux@vger.kernel.org>; Tue, 01 Sep 2026 02:20:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788254407; cv=none;
        d=google.com; s=arc-20260327;
        b=e164uxM3EDhtpFTRg2BI8XYH5QO/NYYugh9PwxUWULc2SzutXw2Ffm3hCEICwe5C3f
         KO4ogehoBfUH7UUb9NOQJdHdOK2IICui54NhS5z1tYBq4yc5SF5NuoKwmObtmuIDzkm6
         4VW5ZP8YJIqmKxfDeiMmtB0UYPvkT3kinBElST/KX+p3EOUPlaFr6FDfiH+H6QiZaPvR
         yDwUkwbljkWHVYRDHFGMNo8Lcx6qiIEsQqz5P1dFPX1CDY2QcEbLQ0ww8uaGg7RYsKgc
         tJYbawCeg+n2fOyZk8M2RGECf5Nb4OzwPTtm4qB1E70weHH0OxyLkDuhrM7b4q+nyCGx
         xBHw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=sI/CANl7QmNb+mh7kgzc5dRDC2wdwbiqEX9BJ0kTKjU=;
        fh=My5JD/AMawH4uiWo9lkbylTC2vMpoIlkAzqEDC9eDtc=;
        b=UwWBAA+1l5nUrcYFw8tjqA/QicyGyXSS5Z21g99rOgYIY7lGFwaBWYoVh8z5CGSWIL
         BxzcioapzrlSxBCHoiPlSZrnEAA90oCzxG6FHNLZw6HZIL0mxkn1gAZl+J+HlkSI3fgk
         KH2sVg6Pkxdkag9VSD8Ef4E2sktFd0BxV9jVtHO8nhtDycCkB/kOE+dbv6AhnOPQ9g3/
         Q7DqQORPO4O8UUZN62Jxvc3sW4vU5nly1t5jEefhijiob/v10x6xKbtpezcFxHneW+i7
         k5Pw0COAQrPNj6l1+yYkvCnxsiHgnuIagWxbadrfWPpwlaqyW7ulVskok38AxDOob2sg
         Xnyg==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788254407; x=1788859207; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sI/CANl7QmNb+mh7kgzc5dRDC2wdwbiqEX9BJ0kTKjU=;
        b=sdMe6TrjrWI+BIdgVbLRLLLhHyGyV3QjzKHRCRTb0LDfM2ZxgmkKWLfGZPoKkr0D4Q
         sx9GS9JSrZPsE+SdbGEEMtdKRHnJ1b3QESU7wXtTdpKq9KyFmlhORZUNUia7IMm5hBmi
         T86hoy8k7TqOj2/g5Ge2igqxii+ZdtFULhHybp5mcw8lWKofjQVNUVgKAe/ZAjO9vu8O
         7MH7RX5ysbwSbslI8aMgSwQ5N8mNfVqQbTgE0RaQBhnW5FWpxDufixU252mijRGjNkFu
         aIB2nSB1/Yy6eq7aqjOZkBRPMkEpOj9VJU+oI6gG6XeKa0Z3i3Tw7++moPmKeeywh1oA
         cI8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788254407; x=1788859207;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sI/CANl7QmNb+mh7kgzc5dRDC2wdwbiqEX9BJ0kTKjU=;
        b=CLHmvYXJxWABfGcD9QnFnUD3LkfSK6ZCrL9WZDB+IeBEXSZJcH5SyV5+ec6N/BBrnM
         xsNAmuOdJa3BP4Q4aKpRFOuubY7SHQeMUbmRrld38qA9GpnoiRFss6d8DjBnUefIWXrE
         mBD1B+zAHckz/8pvDoCbFNwHK2U9IWSlDJmR/RVDaw/8ZdsbcSAGY29nMeMwoQWxxWOe
         bS6XFkiVBWWgazsbx4M4mxIdqy6rRDCKv8nqfmKuPf6AbNHn0kfMdN6oS6R5gr18FI7V
         iIevPi6O3RSR/+gsdZbun0K2isG5JJfZw4Dye48lYBl+i6eqbjlvQ7w//BEF4fAcRaht
         bomA==
X-Forwarded-Encrypted: i=1; AKwUvBwF42WHz5Xult2zJu7bCHljvcScplUcftd7HpVpCNaCRF3jDJ/U5jRPzCsyO3UavBzcGe/Pl9PMLzKT8T5oYg==@vger.kernel.org
X-Gm-Message-State: AFuF++l1FqdgKEUrCMzxqPFrJL6SODgkMmpLZXEnT2fDfZQE+Q3BlWYT
	KxVwYVMpekoStkCZrdFMuAfsOL+dc2XyBxxhqZ5yalmr7nfnq5snmp/3czkX9uD1MT6bhtPXRIQ
	vz3W1vjwST/NxFiv2sGJs3I9gfrK5BgE=
X-Gm-Gg: AYBFou02VAtR2kp79FqNWj0NWDbAu/GaRf39kkotcRWx+VVxx5cpAIRPwTjOwbBSYZi
	pYcGzuhsdcyYvCtUN4yvUJuYrcSH07THeoaD1jkEnG56qE6Vk+wZTZ4Hap4FiVnrUXeisCb/dS4
	z+oH53yRA6dJufE2gMV7Tr/oFLLJbh4beuNvnR73PqlduO9JicDApFRUYAw4rfTlUt9JrhNM0Lh
	yQt6xoi0gYE83z2Wl97SKYosoYKyzh9EIDW/KYSTZxnK2eNI9IgMMWPVUlUmNibo21b/r2dwCVX
	qD25dONSBk+1cv9oybQSHT38QkA5DB0aWIK4VCWkIFPCtoWsUAu5Uo61jRPyKUPLgmZE97sWZfc
	Ej/k=
X-Received: by 2002:a17:903:1590:b0:2d8:d4dd:24c1 with SMTP id
 d9443c01a7336-2d8d4dd25e1mr339218155ad.22.1788254406482; Tue, 01 Sep 2026
 02:20:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260824-lockdep-kunit-v2-0-36a6fec9f72e@gmail.com>
 <20260824-lockdep-kunit-v2-1-36a6fec9f72e@gmail.com> <6fd0143c-4afb-4de8-b65e-3ab9a8042f1a@davidgow.net>
In-Reply-To: <6fd0143c-4afb-4de8-b65e-3ab9a8042f1a@davidgow.net>
From: Malte Wechter <maltewechter@gmail.com>
Date: Tue, 1 Sep 2026 11:19:55 +0200
X-Gm-Features: AcwNN1WZNqnOudoYVq_CHOmMGoqbPS_Z0rdDZaQuD7N8OP5JO0tNvYMsFDnvdrQ
Message-ID: <CAPB1Bzc4Pf4jp27=JzfWquEVbTxK9Cv+31-rfkwtHHBDQ4Ymzw@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kunit: add extra assertions to KUnit test cases
To: David Gow <david@davidgow.net>
Cc: Brendan Higgins <brendan.higgins@linux.dev>, Rae Moar <raemoar63@gmail.com>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Daniel Almeida <daniel.almeida@collabora.com>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-kselftest@vger.kernel.org, kunit-dev@googlegroups.com, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Den tirs. 25. aug. 2026 kl. 13.00 skrev David Gow <david@davidgow.net>:
>
> Le 24/08/2026 =C3=A0 21:32, Malte Wechter a =C3=A9crit :
> > add extra assertions for each individual test case, that checks that
> > both `debug_locks` and `TAINT_WARN` are intact after the test is run.
> > The assertions are optional behind CONFIG_KUNIT_EXTRA_ASSERTS.
> >
> > Signed-off-by: Malte Wechter <maltewechter@gmail.com>
> > ---
>
> Thanks for this.
>
> I'd prefer to split this up into two separate changes, one to check for
> warnings, and one for lockdep issues.
I agree that this would be better.
>
> There's already a patch series to handle lockdep failures here:
> https://lore.kernel.org/all/20200814205527.1833459-1-urielguajardojr@gmai=
l.com/
>
> It's pretty similar to this, but may have some good ideas in it.
>
> As for WARN, we have a new feature which allows individual WARN calls to
> be expected and ignored. This works by having the WARN() macro directly
> check if a test is failing. The difference there is that the code only
> runs if the current thread is part of the test (so it wouldn't be
> affected by a WARN() in another, non-test thread). There are advantages
> and disadvantages to this, but it's probably sensible to be consistent he=
re.
>
> Take a look at this for more details on how it works:
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3D85347718ab0dd7ede9c3e1dcff2d604c7073df05
>
> (That being said, the current implementation does seem to work pretty
> well even with the backtrace suppression, so continuing to use this
> implementation is not necessarily a dealbreaker.)
>
> Finally, I'd appreciate there being some more documentation of this, if
> possible. In particular, it'd be nice to extend the KUnit documentation
> in Documentation/dev-tools/kunit to mention this and provide some
> examples of how to enable it. In particular, it'd be good to have an
> example kunit.py invocation which enables lockdep, e.g.
> ./tools/testing/kunit/kunit.py run --kconfig_add
> CONFIG_KUNIT_EXTRA_ASSERTS=3Dy --kconfig_add CONFIG_PROVE_LOCKING=3Dy
> --kconfig_add CONFIG_DEBUG_KERNEL=3Dy
Will do!
>
> Thanks again for looking into this!
>
> Cheers,
> -- David
>
>
> >   lib/kunit/Kconfig     | 12 ++++++++++++
> >   lib/kunit/try-catch.c | 23 ++++++++++++++++++++++-
> >   2 files changed, 34 insertions(+), 1 deletion(-)
> >
> > diff --git a/lib/kunit/Kconfig b/lib/kunit/Kconfig
> > index 94ff8e4089bfb..38801f7493669 100644
> > --- a/lib/kunit/Kconfig
> > +++ b/lib/kunit/Kconfig
> > @@ -142,4 +142,16 @@ config KUNIT_UML_PCI
> >
> >         If unsure, say N.
> >
> > +config KUNIT_EXTRA_ASSERTS
> > +     bool "Enable extra assertions in KUnit tests"
> > +     depends on LOCKDEP
> > +     default n
> > +     help
> > +             Enables all extra assertions for KUnit which includes ass=
erting `TAINT_WARN` and
> > +             `debug_locks` from lockdep. A KUnit test suite (and test =
case) is inserted
> > +             at the start of all KUnit test suites. This makes asserti=
ons prior to running any
> > +             tests, as a pre-test integrity check. Assertions are made=
 after each test case which
> > +             asserts that each test case did not trigger either `TAINT=
_WARN` or `debug_locks`.
> > +
> > +             If unsure, say N.
>
> A few notes here:
> - I'd rather have the taint/warn and lockdep assertions separate here.
> - A more descriptive name than "EXTRA_ASSERTS" would be nice. Perhaps
> something like KUNIT_FAIL_TEST_ON_WARN / KUNIT_FAIL_ON_LOCKDEP or similar=
?
>
> >   endif # KUNIT
> > diff --git a/lib/kunit/try-catch.c b/lib/kunit/try-catch.c
> > index d84a879f0a789..7eea3af4c9671 100644
> > --- a/lib/kunit/try-catch.c
> > +++ b/lib/kunit/try-catch.c
> > @@ -41,6 +41,11 @@ void kunit_try_catch_run(struct kunit_try_catch *try=
_catch, void *context)
> >       struct completion *task_done;
> >       int exit_code, time_remaining;
> >
> > +     #ifdef CONFIG_KUNIT_EXTRA_ASSERTS
> > +     int debug_locks_snapshot =3D debug_locks;
> > +     int tainted_warn_snapshot =3D test_taint(TAINT_WARN);
> > +     #endif
>
> Nit: Let's keep the preprocessor #ifdef/#endif lines un-indented here.
>
> > +
> >       try_catch->context =3D context;
> >       try_catch->try_result =3D 0;
> >       task_struct =3D kthread_create(kunit_generic_run_threadfn_adapter=
,
> > @@ -70,7 +75,23 @@ void kunit_try_catch_run(struct kunit_try_catch *try=
_catch, void *context)
> >       put_task_struct(task_struct);
> >       exit_code =3D try_catch->try_result;
> >
> > -     if (!exit_code)
> > +     #ifdef CONFIG_KUNIT_EXTRA_ASSERTS
> > +     bool extra_assert =3D false;
>
> Please define all variables at the top of the function / scope.
>
> That being said, we don't need this extra_assert variable at all if you
> move the setting of try_result above moving it to exit_code above?
>
> > +
> > +     if (debug_locks_snapshot !=3D debug_locks && !exit_code) {
> > +             extra_assert =3D true;
> > +             try_catch->try_result =3D -EDEADLK;
>
> Why are we setting this, and then never handling it?
>
> > +             kunit_err(test, "Test triggered lockdep\n");
> > +     } else if (tainted_warn_snapshot !=3D test_taint(TAINT_WARN) && !=
exit_code) {
> > +             extra_assert =3D true;
> > +             try_catch->try_result =3D -EDEADLK;
>
> -EDEADLK made sense for the lockdep implementation, but makes less sense
> for WARN(). If you really want to keep it, please document it.
>
> That being said, it should be possible to do this outside of the
> try/catch scope, as both lockdep and taints are global. And if you fail
> the test using the hook mechanism (like the warning suppression does),
> you won't need a separate check afterwards.
I believe that installing two additional hooks (one for lockdep and
one for warn, possibly a third for the initial suite check) is a
cleaner approach. I
will move the assertion logic into KUnit hooks instead of having it
inside of the try_catch_run.
>
> > +             kunit_err(test, "Test tainted kernel with TAINT_WARN\n");
> > +     }
> > +     #else
> > +     bool extra_assert =3D false;
>
> If we declare this unconditionally at the top of the function, there's
> no need to have it in an #ifdef.
>
> > +     #endif
> > +
> > +     if (!exit_code && !extra_assert)
> >               return;
> >
> >       if (exit_code =3D=3D -EFAULT)
> >
>
Best regards,
Malte :)
