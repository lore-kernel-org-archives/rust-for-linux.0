Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43B702BDC0A
	for <rust-for-linux@vger.kernel.org>; Fri, 30 Jan 2026 07:43:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769758997; cv=pass; b=mQHtZSB4URn5E/Xc9WOYo8QmNopmT/pPAKbM691GIbeYbjVthieI4yhROKc/aS6/rs7IjmT2TODDBUXZ1BvfhIRAtrl0dUM8avdIcDd23PDNz7MQOSX6vNhRq1mrYLTfxzSITH4Q5JBRyjhfu8fYrTHjNKmN4CiL0njox80aoaM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769758997; c=relaxed/simple;
	bh=qGqm9vwZ3JXiAyTpYBYbWxRb9ZTNQZ14xM5qZn1Fi2E=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=RvtucGsLRfDhZYefyC8Jp6k6b+OgDp/FJEuXaPkGOjrZZ3QFWmM9zGeLbYco5exK3iLKbC8DYF1o29Y6eiWKBVFfPhbpuhqYGIY5vo+aQTDbR/pVJagzXPxssetcTgjZLYTMOaBR7QyxqPYNQVmiQ9LkRKPc8RlYIgSoWms/CiU=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=tSfD6snk; arc=pass smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="tSfD6snk"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-4801d7c72a5so13690175e9.0
        for <rust-for-linux@vger.kernel.org>; Thu, 29 Jan 2026 23:43:15 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1769758993; cv=none;
        d=google.com; s=arc-20240605;
        b=ValjYEfx07Fxfu+MfF5EDOnh8TZE++Nm7XsEyoDhcyG0ii9pGsL2AC4zVM3Y8zG1U5
         aV5cTRu2lPz9JfI9z0XiHjtoqZKLJhvXDPnRrb0ksibKjS7I5MkDaZ+arBR94zYP8uVH
         uPPpwezc3mg5rMc2z2xPKYaTXHlwYcKcUbZK0LTvCPbQIckP4koo83K1ZjHgLWa7zl6/
         PqhGyYwQyB8TgOR4cjX9UhY2SizjH18sObNc3AP0QdffE37DSW17QtD/+O0aH7LASVy4
         5JltOcp/ODqaqHR9VbT3oZC0BCgTlr1MPvzZq5k1tZcukRAws9GYVcJa7NFdDl5JV/LE
         5flg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=Aie1HwLp74q87DizHgs7IV+dPUPmJsMau3chdywfMhk=;
        fh=5aYPS1Ew3kSB9ncarnODMjRbbNRYu4Yn+4GGGQtDWFQ=;
        b=PO17Mr+VPOMO4F/KRxmgtQd3b6D9xhpGD3R5GmHl1o0b0Z7ubO2J1rvgEY6hlV5swo
         JhqqRbqrB6bHeGCKVQsHTZC96GRT0QGA7P1FO//459RF24wxtsBinjCWNmH0GubwwJLA
         TxQ53oDGtjU372esWNEVapfLc/YQ3fOB1rBBU/of+hjMJh2cCG7veXa65rpOMLhAOeKa
         t6VscNOGMjZP9k375zvWrQMym0ScLz0oy3V2+jqTZkO5JoMzHIRpX2R8WSm1uEExbCNK
         +u2FAVZXfq80hNNwBRxDVTaAU+DKIBXByUk7K8rcbiAkjHPSZhEErT8B6Sqv0UvFXIGl
         bgPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1769758993; x=1770363793; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Aie1HwLp74q87DizHgs7IV+dPUPmJsMau3chdywfMhk=;
        b=tSfD6snkJ+R0qtqiqjxsLZ8z6PuAYtYXqyCvdwE7cL8rf18mgpnLvbMjElTo+2T8sO
         M+/jfVogNEAGc3lqMO4gfOJbyhN95mPGDcYjMoVxru7hrAd/SWc5T5Bd2eZ7tSM4f/hq
         IPd4iH41j7ZoOVRIFs/+uUPm4IzXiLxcyCbp98oenElWNvBToYENs2wOjlI1sZVI9+EK
         i3ZcuJIHmCj2iJqALOiVbU3Yx1CpqXkKZ8AEWUUDVnTYFXnvzWNH2nzXq3A+WKR6b6Ed
         jE3uRUkSdWk7QoDTclRqy6n/IC8rtzAy+wLtTt/rMOyEUQhgKNvaTjy2j2dDxGqXm/81
         Dp8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769758993; x=1770363793;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Aie1HwLp74q87DizHgs7IV+dPUPmJsMau3chdywfMhk=;
        b=OGKQGYWHmS6iYBMQ5uTjuqStY4iyXdEEcqZlPB/99S6gmRKCxgF1X3rfHXkpDYXArw
         zSM1XoV36WYzDaLeagA12RKaomlf9xocz60pbNM3MPow9Cl3s3GF7tqHvx0xQ6wB80rm
         AVwt7CT5Na0Y3RUp3RWBbqnccIsyngxcr9ywEm1nYWcatNlKVseCiLLdAVBnv80AWUM9
         DIFKK87AzqNyKC/w3Ta/0I8RYU/LkC0kYXC/3lyZHhM7c6uUvfP2lbQc7yul/H2MgSaY
         R7bMYy8NEVYFaxiTTC+5WhtTKtuDNLSQBS+D2Vs3N05QEEaejkCAd4X+1gMRFnm4osvo
         gw6g==
X-Gm-Message-State: AOJu0YxG23BByAfK18UZ+0dyaGZPTrhIas9CS4p1C+xMNfx6IHH2VE+q
	Rt2jBvDz4xlgG+ogCAghXdN/+eIwXuEtcyeSFw/zAAzUKDzE/onrTi3NjrscScd9gMlRMjPy2Hd
	UnsKa/aIuD6Z/q2nTUjNFHd5zGKI3H8zV86hhPTQ1
X-Gm-Gg: AZuq6aJ37U2ez+eVCqA1Szb1MbvYrOBqB+0AB+3GLKn1rUZbQy+xom0LG6OSenGak0n
	tjMJUgQxYJF28YTRv9J6Ox0aKM+Z5nLRJGoFXncPhmHDcGv4qA/wqyfzx4G7XMWdgg34dE/yryX
	YP5k32ELpc8lsnHOZqKvo9X18KSHEf/NaBcrxypI8f2qHBTdjDNHk57RXdEYUo2be62eGLalkQj
	TAz0BoIzKDdenEmU05rb9q8koYgflBqnMvCbjdCdRUnqN/JF0hfP/Vgs47FSqDPPLj2+w==
X-Received: by 2002:a05:600c:348b:b0:47e:e779:36d with SMTP id
 5b1f17b1804b1-482db4d826dmr18678235e9.23.1769758993363; Thu, 29 Jan 2026
 23:43:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260121223933.1568682-1-lyude@redhat.com> <20260121223933.1568682-7-lyude@redhat.com>
In-Reply-To: <20260121223933.1568682-7-lyude@redhat.com>
From: David Gow <davidgow@google.com>
Date: Fri, 30 Jan 2026 15:43:00 +0800
X-Gm-Features: AZwV_Qix_tOdpHs2A_-d_t05BDfAxPRfya-QHo39WowvL4WjNlhpatQYJUsdw1I
Message-ID: <CABVgOSnXP_7dR72XtjiCUX5L8s85KZ6DzeqsOVV5RGE70yZ6og@mail.gmail.com>
Subject: Re: [PATCH v17 06/16] irq: Add KUnit test for refcounted interrupt enable/disable
To: Lyude Paul <lyude@redhat.com>
Cc: rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Thomas Gleixner <tglx@linutronix.de>, Boqun Feng <boqun.feng@gmail.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Alex Gaynor <alex.gaynor@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
	Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Waiman Long <longman@redhat.com>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000002c4211064996204f"

--0000000000002c4211064996204f
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 22 Jan 2026 at 06:43, Lyude Paul <lyude@redhat.com> wrote:
>
> While making changes to the refcounted interrupt patch series, at some
> point on my local branch I broke something and ended up writing some kuni=
t
> tests for testing refcounted interrupts as a result. So, let's include
> these tests now that we have refcounted interrupts.
>
> Signed-off-by: Lyude Paul <lyude@redhat.com>
>
> ---

Looks good to me. Not sure if it'd make sense to move this into
kernel/irq/irq_test.c alongside other IRQs, or if you like having it
separate. I'm happy either way.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David


> V13:
> * Add missing MODULE_DESCRIPTION/MODULE_LICENSE lines
> * Switch from kunit_test_suites(=E2=80=A6) to kunit_test_suite(=E2=80=A6)
>
>  kernel/irq/Makefile                  |   1 +
>  kernel/irq/refcount_interrupt_test.c | 109 +++++++++++++++++++++++++++
>  2 files changed, 110 insertions(+)
>  create mode 100644 kernel/irq/refcount_interrupt_test.c
>
> diff --git a/kernel/irq/Makefile b/kernel/irq/Makefile
> index 6ab3a40556670..7b5bb5510b110 100644
> --- a/kernel/irq/Makefile
> +++ b/kernel/irq/Makefile
> @@ -20,3 +20,4 @@ obj-$(CONFIG_SMP) +=3D affinity.o
>  obj-$(CONFIG_GENERIC_IRQ_DEBUGFS) +=3D debugfs.o
>  obj-$(CONFIG_GENERIC_IRQ_MATRIX_ALLOCATOR) +=3D matrix.o
>  obj-$(CONFIG_IRQ_KUNIT_TEST) +=3D irq_test.o
> +obj-$(CONFIG_KUNIT) +=3D refcount_interrupt_test.o
> diff --git a/kernel/irq/refcount_interrupt_test.c b/kernel/irq/refcount_i=
nterrupt_test.c
> new file mode 100644
> index 0000000000000..b4f224595f261
> --- /dev/null
> +++ b/kernel/irq/refcount_interrupt_test.c
> @@ -0,0 +1,109 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * KUnit test for refcounted interrupt enable/disables.
> + */
> +
> +#include <kunit/test.h>
> +#include <linux/interrupt_rc.h>
> +
> +#define TEST_IRQ_ON() KUNIT_EXPECT_FALSE(test, irqs_disabled())
> +#define TEST_IRQ_OFF() KUNIT_EXPECT_TRUE(test, irqs_disabled())
> +
> +/* =3D=3D=3D=3D=3D Test cases =3D=3D=3D=3D=3D */
> +static void test_single_irq_change(struct kunit *test)
> +{
> +       local_interrupt_disable();
> +       TEST_IRQ_OFF();
> +       local_interrupt_enable();
> +}
> +
> +static void test_nested_irq_change(struct kunit *test)
> +{
> +       local_interrupt_disable();
> +       TEST_IRQ_OFF();
> +       local_interrupt_disable();
> +       TEST_IRQ_OFF();
> +       local_interrupt_disable();
> +       TEST_IRQ_OFF();
> +
> +       local_interrupt_enable();
> +       TEST_IRQ_OFF();
> +       local_interrupt_enable();
> +       TEST_IRQ_OFF();
> +       local_interrupt_enable();
> +       TEST_IRQ_ON();
> +}
> +
> +static void test_multiple_irq_change(struct kunit *test)
> +{
> +       local_interrupt_disable();
> +       TEST_IRQ_OFF();
> +       local_interrupt_disable();
> +       TEST_IRQ_OFF();
> +
> +       local_interrupt_enable();
> +       TEST_IRQ_OFF();
> +       local_interrupt_enable();
> +       TEST_IRQ_ON();
> +
> +       local_interrupt_disable();
> +       TEST_IRQ_OFF();
> +       local_interrupt_enable();
> +       TEST_IRQ_ON();
> +}
> +
> +static void test_irq_save(struct kunit *test)
> +{
> +       unsigned long flags;
> +
> +       local_irq_save(flags);
> +       TEST_IRQ_OFF();
> +       local_interrupt_disable();
> +       TEST_IRQ_OFF();
> +       local_interrupt_enable();
> +       TEST_IRQ_OFF();
> +       local_irq_restore(flags);
> +       TEST_IRQ_ON();
> +
> +       local_interrupt_disable();
> +       TEST_IRQ_OFF();
> +       local_irq_save(flags);
> +       TEST_IRQ_OFF();
> +       local_irq_restore(flags);
> +       TEST_IRQ_OFF();
> +       local_interrupt_enable();
> +       TEST_IRQ_ON();
> +}
> +
> +static struct kunit_case test_cases[] =3D {
> +       KUNIT_CASE(test_single_irq_change),
> +       KUNIT_CASE(test_nested_irq_change),
> +       KUNIT_CASE(test_multiple_irq_change),
> +       KUNIT_CASE(test_irq_save),
> +       {},
> +};
> +
> +/* (init and exit are the same */
> +static int test_init(struct kunit *test)
> +{
> +       TEST_IRQ_ON();
> +
> +       return 0;
> +}
> +
> +static void test_exit(struct kunit *test)
> +{
> +       TEST_IRQ_ON();
> +}
> +
> +static struct kunit_suite refcount_interrupt_test_suite =3D {
> +       .name =3D "refcount_interrupt",
> +       .test_cases =3D test_cases,
> +       .init =3D test_init,
> +       .exit =3D test_exit,
> +};
> +
> +kunit_test_suite(refcount_interrupt_test_suite);
> +MODULE_AUTHOR("Lyude Paul <lyude@redhat.com>");
> +MODULE_DESCRIPTION("Refcounted interrupt unit test suite");
> +MODULE_LICENSE("GPL");
> --
> 2.52.0
>
>

--0000000000002c4211064996204f
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIUnQYJKoZIhvcNAQcCoIIUjjCCFIoCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ghIEMIIGkTCCBHmgAwIBAgIQfofDAVIq0iZG5Ok+mZCT2TANBgkqhkiG9w0BAQwFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSNjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMzA0MTkwMzUzNDdaFw0zMjA0MTkwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFI2IFNNSU1FIENBIDIwMjMwggIiMA0GCSqGSIb3DQEBAQUAA4ICDwAwggIKAoICAQDYydcdmKyg
4IBqVjT4XMf6SR2Ix+1ChW2efX6LpapgGIl63csmTdJQw8EcbwU9C691spkltzTASK2Ayi4aeosB
mk63SPrdVjJNNTkSbTowej3xVVGnYwAjZ6/qcrIgRUNtd/mbtG7j9W80JoP6o2Szu6/mdjb/yxRM
KaCDlloE9vID2jSNB5qOGkKKvN0x6I5e/B1Y6tidYDHemkW4Qv9mfE3xtDAoe5ygUvKA4KHQTOIy
VQEFpd/ZAu1yvrEeA/egkcmdJs6o47sxfo9p/fGNsLm/TOOZg5aj5RHJbZlc0zQ3yZt1wh+NEe3x
ewU5ZoFnETCjjTKz16eJ5RE21EmnCtLb3kU1s+t/L0RUU3XUAzMeBVYBEsEmNnbo1UiiuwUZBWiJ
vMBxd9LeIodDzz3ULIN5Q84oYBOeWGI2ILvplRe9Fx/WBjHhl9rJgAXs2h9dAMVeEYIYkvW+9mpt
BIU9cXUiO0bky1lumSRRg11fOgRzIJQsphStaOq5OPTb3pBiNpwWvYpvv5kCG2X58GfdR8SWA+fm
OLXHcb5lRljrS4rT9MROG/QkZgNtoFLBo/r7qANrtlyAwPx5zPsQSwG9r8SFdgMTHnA2eWCZPOmN
1Tt4xU4v9mQIHNqQBuNJLjlxvalUOdTRgw21OJAFt6Ncx5j/20Qw9FECnP+B3EPVmQIDAQABo4IB
ZTCCAWEwDgYDVR0PAQH/BAQDAgGGMDMGA1UdJQQsMCoGCCsGAQUFBwMCBggrBgEFBQcDBAYJKwYB
BAGCNxUGBgkrBgEEAYI3FQUwEgYDVR0TAQH/BAgwBgEB/wIBADAdBgNVHQ4EFgQUM7q+o9Q5TSoZ
18hmkmiB/cHGycYwHwYDVR0jBBgwFoAUrmwFo5MT4qLn4tcc1sfwf8hnU6AwewYIKwYBBQUHAQEE
bzBtMC4GCCsGAQUFBzABhiJodHRwOi8vb2NzcDIuZ2xvYmFsc2lnbi5jb20vcm9vdHI2MDsGCCsG
AQUFBzAChi9odHRwOi8vc2VjdXJlLmdsb2JhbHNpZ24uY29tL2NhY2VydC9yb290LXI2LmNydDA2
BgNVHR8ELzAtMCugKaAnhiVodHRwOi8vY3JsLmdsb2JhbHNpZ24uY29tL3Jvb3QtcjYuY3JsMBEG
A1UdIAQKMAgwBgYEVR0gADANBgkqhkiG9w0BAQwFAAOCAgEAVc4mpSLg9A6QpSq1JNO6tURZ4rBI
MkwhqdLrEsKs8z40RyxMURo+B2ZljZmFLcEVxyNt7zwpZ2IDfk4URESmfDTiy95jf856Hcwzdxfy
jdwx0k7n4/0WK9ElybN4J95sgeGRcqd4pji6171bREVt0UlHrIRkftIMFK1bzU0dgpgLMu+ykJSE
0Bog41D9T6Swl2RTuKYYO4UAl9nSjWN6CVP8rZQotJv8Kl2llpe83n6ULzNfe2QT67IB5sJdsrNk
jIxSwaWjOUNddWvCk/b5qsVUROOuctPyYnAFTU5KY5qhyuiFTvvVlOMArFkStNlVKIufop5EQh6p
jqDGT6rp4ANDoEWbHKd4mwrMtvrh51/8UzaJrLzj3GjdkJ/sPWkDbn+AIt6lrO8hbYSD8L7RQDqK
C28FheVr4ynpkrWkT7Rl6npWhyumaCbjR+8bo9gs7rto9SPDhWhgPSR9R1//WF3mdHt8SKERhvtd
NFkE3zf36V9Vnu0EO1ay2n5imrOfLkOVF3vtAjleJnesM/R7v5tMS0tWoIr39KaQNURwI//WVuR+
zjqIQVx5s7Ta1GgEL56z0C5GJoNE1LvGXnQDyvDO6QeJVThFNgwkossyvmMAaPOJYnYCrYXiXXle
A6TpL63Gu8foNftUO0T83JbV/e6J8iCOnGZwZDrubOtYn1QwggWDMIIDa6ADAgECAg5F5rsDgzPD
hWVI5v9FUTANBgkqhkiG9w0BAQwFADBMMSAwHgYDVQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBS
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
Dxz3AgMBAAGjggHgMIIB3DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1UdDwEB
/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFHZtY3XkWtC2
e2Idfk+0JyK7BLzzMFgGA1UdIARRME8wCQYHZ4EMAQUBAjBCBgorBgEEAaAyCgMDMDQwMgYIKwYB
BQUHAgEWJmh0dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQC
MAAwgZoGCCsGAQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWdu
LmNvbS9jYS9nc2F0bGFzcjZzbWltZWNhMjAyMzBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5n
bG9iYWxzaWduLmNvbS9jYWNlcnQvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3J0MB8GA1UdIwQYMBaA
FDO6vqPUOU0qGdfIZpJogf3BxsnGMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFs
c2lnbi5jb20vY2EvZ3NhdGxhc3I2c21pbWVjYTIwMjMuY3JsMA0GCSqGSIb3DQEBCwUAA4ICAQBo
hqjbVaHxZoT6HHUuwQcTlbgXpuVi59bQPrSwb/6Pn1t3h3SLeuUCvOYpoQjxlWy/FexsPW+nWS0I
PUmWpt6sxbIRTKPfb7cPk32XezfnA0jexucybiXzkZKTrbI7zoMOzDIWpTKYZAonB9Zzi7Dso4An
ZOtz/E3yhdR/q1MK30d5fiCS0vorEd0Oy8Jzcc7TJ2HGMzEEXiFFvVrJYJHvfYOeXE4ywAG6YWO0
x78+bXeB9vkeWHhOYKyYXuAXrnHASddEICg1QlJCHDAISMC1Wn/tjqTMTt3sDAe+dhi9V1FEGTbG
g9PxPVP4huJEMIBu/MWNMzHfiW4E7eCHVPrmtX7CFDlMik7qsgQBbO5h6EcxBamhIflfMgoISsRJ
Vyll2E5BNVwkNstMgU3WMg5yIaQcuGFgFnMTrQcaLEEFPV3cCP9pgXovYDirnB7FKNdCZNHfeBY1
HEXJ2jIPDP6nWSbYoRry0TvPgxh5ZeM5+sc1L7kY75C8U4FV3t4qdC+p7rgqfAggdvDPa5BJbTRg
KAzwyf3z7XUrYp38pXybmDnsEcRNBIOEqBXoiBxZXaKQqaY921nWAroMM/6I6CVpTnu6JEeQkoi4
IgGIEaTFPcgAjvpDQ8waLJL84EP6rbLW6dop+97BXbeO9L/fFf40kBhve6IggpJSeU9RdCQ5czGC
Al0wggJZAgEBMGgwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2ExKjAo
BgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMwIQAYQLf/BIzLow9kWqD8My
PzANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgF8eZJ7dGnXJOQViApVfsNTijB6NR
60V3RcRF0okoZpkwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjYw
MTMwMDc0MzEzWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAMjWlYSA9+vY34agM76OKlTOHSHaYjZOYFyfHKJX42/pl+ywggunsmlzamHTuCVPi
+d0OsChETUxqlsYgRTK21YG/CmqeLjq3kt21ilZgNlPg1nQlxJdtGRbB60LLyVq50ZDpL/pjGHtM
+TC2fIbEs91bYxtJi/EC+DNZBMzMEEII5F3dqHXzxoQrXLg51rsStDQVOgKrtK36s4z8ASBBjabK
PHtYRLDtNZrmHlew4eUHps5wE+YzR2KQmZBcq9Rk51yJFBLu4BmLxivT4bRSd/riJOQ+2iddnWrM
HLWVy1puZRqoKWgp/OSpa7Yyw5lMy+bXvUu2EcA2GVWtD2c+Og==
--0000000000002c4211064996204f--
