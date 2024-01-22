Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A42A33B2A8
	for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 10:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705919300; cv=none; b=buplwmkd0r2R63VqovgucOYtvEJXbe5YvSCGR8K3IbaVbKImEXNy8lVPx81wQVDJQx35UC1YAGmQgb93GSC7xDc6pHpno9D74S3VSsy4l70rLIhSDMEh01ssTxcFYk5P0GoI+fKi2U7cpZcHRJsf/3LCkExNZuHHnVEB70FRKbA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705919300; c=relaxed/simple;
	bh=iU/5AC6542ajwCJQczbV6Yd/h8VeAVE8l06txwlhGeM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=NTKUWQaGZxZGH8E6IA+UEHCtUf1CdcHfJJT/nxUnfUnHoNeZtuFEILs6FKAsbPpPRUiGlidNLvqudUPuzDZwrGlGBR4+V1GbgM3QDszEZyiCtRhIPyZcnlKD2YUs8Tzx6p2MX8GFy0uHaeUIwGYGVh28TmsjcukmCkiJoy1d3tA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu; spf=pass smtp.mailfrom=umich.edu; dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b=E+cJs7ns; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=umich.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=umich.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=umich.edu header.i=@umich.edu header.b="E+cJs7ns"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-5ffb07bdce2so14700807b3.2
        for <rust-for-linux@vger.kernel.org>; Mon, 22 Jan 2024 02:28:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=umich.edu; s=google-2016-06-03; t=1705919295; x=1706524095; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=pUQFvO9D/dB0aEAQnOWxneYBE4KVoKkcF+aH34UQn2M=;
        b=E+cJs7nsLcJMT5DCBDPYOiWjlbsB4XhyZahCYNyR5Wr+qVblEsl1+kZWjZzXsVjAVi
         oxjc/aY8JfyUCG7UCdQo1NEdGSws9l2NuQ1ym15BSrYkIdzZOEy6I11q/7Qg4Uri8mnr
         KBXCXNAP3+Yg4N4vyudkA5VXFOYqo+cDaVPIVkKSaWJ8ebzo5nQz42U4OjWA0DM2R5CK
         lyCmI0OCGkpSHYihLKdbAfGpaCy4IPnsgsA//Uv4DQ441fNSEKEVCVUCWgWd+f3pbewk
         M/XOO8Bf0Api1+8MiynifGL6KHgl9UaNaSiXNX0b96WyJxcgnwdTsRoNGQ9+Zq7hExKi
         IU0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1705919295; x=1706524095;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=pUQFvO9D/dB0aEAQnOWxneYBE4KVoKkcF+aH34UQn2M=;
        b=pzwHdimpoV3Cn3DmUAXyXI2nJG1+Njabn6O0+wK7zqr/L+nc2wmaHZRunEjlhOWVmo
         HZj0d0tEzhOctxNWRBYR5ROBt59whJ+wZGF5A5Ks039K88Vvu08pTF6BkpU4EuTvu1yR
         yp+ke+2StksALxPVlcxNfGrImo+rqJ+f2qXpwHE5SNEdPUtzwjDlE+UphlVcbqaPCy8k
         sAUDHjXWhULbrFF+QNLFEprpSxdJEiQh8zxhK4jW12TPRPWn5++9cpo3jYoo75630XnT
         /UKa6SirH2+s+Kv/LUvp5HSUIKzYNJtJnGgEK6rTxOwIoNVGumKxOAy8lpmeAYxRy2d2
         HBFg==
X-Gm-Message-State: AOJu0YyMEnkWec2Nt2rvu18Gw7dVaISM8yL8NgKlKhYom/kVCHnQggNQ
	A571RH9y7kt5Qq5o6xoxE9NgYq865oOgsUZtV/Ngo9Byu5tuw5X5V7ftpxFW35wGOHp+pTrOAB0
	VCMgW3q6fnsRbmi0h41nxp7+wH82fsqva3iKqAA==
X-Google-Smtp-Source: AGHT+IG8LJEBHXgFIpnl9Bry0CTXFTLluZr06x+3dW4YTSo79rBDnmIAZRN6n7pdzgte7L8cR0IRUacnAG+VYVIS4S0=
X-Received: by 2002:a81:4ed0:0:b0:5ff:86e9:3d62 with SMTP id
 c199-20020a814ed0000000b005ff86e93d62mr3863494ywb.59.1705919295479; Mon, 22
 Jan 2024 02:28:15 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240122054219.779928-1-dirk.behme@de.bosch.com>
In-Reply-To: <20240122054219.779928-1-dirk.behme@de.bosch.com>
From: Trevor Gross <tmgross@umich.edu>
Date: Mon, 22 Jan 2024 04:28:04 -0600
Message-ID: <CALNs47sEYzgvM6wN_+dDmZs1E8WHduajsrhi5NitC5pNotd=6Q@mail.gmail.com>
Subject: Re: [PATCH] docs: rust: Add description of Rust documentation test as
 KUnit ones
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, Miguel Ojeda <ojeda@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 21, 2024 at 11:42=E2=80=AFPM Dirk Behme <dirk.behme@de.bosch.co=
m> wrote:
>
> Rust documentation tests are automatically converted into KUnit
> tests. The mainline commit adding this feature
>
> commit a66d733da801 ("rust: support running Rust documentation tests as K=
Unit ones")
>
> from Mingual has a very nice commit message with a lot details

Miguel? :)

> for this. To not 'hide' that just in a commit message pick main
> parts of it and add it to the documentation. And add a short info
> how to enable this.
>
> Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
>  Documentation/rust/general-information.rst | 94 ++++++++++++++++++++++
>  1 file changed, 94 insertions(+)
>
> diff --git a/Documentation/rust/general-information.rst b/Documentation/r=
ust/general-information.rst
> index 58283f4894ea0..d68460a2fea13 100644
> --- a/Documentation/rust/general-information.rst
> +++ b/Documentation/rust/general-information.rst
> @@ -100,3 +100,97 @@ Additionally, there are the ``#[test]`` tests. These=
 can be run using
>  This requires the kernel .config and downloads external repos. It
>  runs the ``#[test]`` tests on the host (currently) and thus is fairly
>  limited in what these tests can test.
> +
> +KUnit tests =3D=3D documentation tests
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +Rust has documentation tests: these are typically examples of
> +usage of any item (e.g. function, struct, module...).
> +
> +They are very convenient because they are just written
> +alongside the documentation. For instance::
> +
> +       /// Sums two numbers.
> +       ///
> +       /// ```
> +       /// assert_eq!(mymod::f(10, 20), 30);
> +       /// ```
> +       pub fn f(a: i32, b: i32) -> i32 {
> +           a + b
> +       }
> +
> +In userspace, the tests are collected and run via `rustdoc`.
> +Using the tool as-is would be useful already, since it allows
> +to compile-test most tests (thus enforcing they are kept
> +in sync with the code they document) and run those that do not
> +depend on in-kernel APIs.

Maybe "to compile-test most tests" -> "verifying that examples
compile" and "and run those" -> ", as well as running those"

> +However, by transforming the tests into a KUnit test suite,
> +they can also be run inside the kernel. Moreover, the tests
> +get to be compiled as other Rust kernel objects instead of
> +targeting userspace.

This starts describing the benefits of being KUnit without first
mentioning that they do run as KUnit. Maybe something like

```
For the kernel, however, these tests get transformed into KUnit test
suites. This means that doctests get compiled as Rust kernel objects,
allowing them to run against a built kernel. Like
```

> +On top of that, the integration with KUnit means the Rust
> +support gets to reuse the existing testing facilities. For
> +instance, the kernel log would look like::

If using the above suggestion, then perhaps the first sentence could become

```
A benefit of this KUnit integration is that Rust doctests get to reuse
existing testing facilities.
```

> +       KTAP version 1
> +       1..1
> +           KTAP version 1
> +           # Subtest: rust_doctests_kernel
> +           1..59
> +           # rust_doctest_kernel_build_assert_rs_0.location: rust/kernel=
/build_assert.rs:13
> +           ok 1 rust_doctest_kernel_build_assert_rs_0
> +           # rust_doctest_kernel_build_assert_rs_1.location: rust/kernel=
/build_assert.rs:56
> +           ok 2 rust_doctest_kernel_build_assert_rs_1
> +           # rust_doctest_kernel_init_rs_0.location: rust/kernel/init.rs=
:122
> +           ok 3 rust_doctest_kernel_init_rs_0
> +           ...
> +           # rust_doctest_kernel_types_rs_2.location: rust/kernel/types.=
rs:150
> +           ok 59 rust_doctest_kernel_types_rs_2
> +       # rust_doctests_kernel: pass:59 fail:0 skip:0 total:59
> +       # Totals: pass:59 fail:0 skip:0 total:59
> +       ok 1 rust_doctests_kernel
> +
> +Tests using the ``?`` operator are also supported as usual, e.g.::
> +
> +       /// ```
> +       /// # use kernel::{spawn_work_item, workqueue};
> +       /// spawn_work_item!(workqueue::system(), || pr_info!("x"))?;
> +       /// # Ok::<(), Error>(())
> +       /// ```
> +
> +The tests are also compiled with Clippy under ``CLIPPY=3D1``, just
> +like normal code, thus also benefitting from extra linting.
> +
> +In order for developers to easily see from which original line
> +a failed doctests came from, a KTAP diagnostic line is printed
> +to the log, containing the location (file and line) of the

"from which original line a failed doctests came from" -> "which line
of doctest code caused a failure" or similar

Would split "to the log. This contains..." into two sentences

> +original test (i.e. instead of the location in the generated
> +Rust file)::
> +
> +       # rust_doctest_kernel_types_rs_2.location: rust/kernel/types.rs:1=
50
> +
> +A notable difference from KUnit C tests is that the Rust tests
> +appear to assert using the usual ``assert!`` and ``assert_eq!``
> +macros from the Rust standard library (``core``). We provide

"A notable difference from KUnit C tests is that the" at the beginning
of the sentence could probably be dropped, since it's just talking
about what Rust does here. Or add a sentence about how C does asserts
differently.

> +a custom version that forwards the call to KUnit instead.
> +Importantly, these macros do not require passing context,
> +unlike the KUnit C ones (i.e. ``struct kunit *``). This makes

"the KUnit C ones" -> "those for KUnit testing" or similar

> +them easier to use, and readers of the documentation do not need
> +to care about which testing framework is used. In addition, it
> +may allow us to test third-party code more easily in the future.
> +
> +However, a current limitation is that KUnit does not support

I don't think the "However" is needed here

> +assertions in other tasks. Thus we presently simply print an

Comma after "Thus"

> +error to the kernel log if an assertion actually failed.
> +
> +To use this it is required to enable::

"To use this it is required to enable" -> "To use KUnit doctests, the
following must be enabled"

> +
> +       CONFIG_KUNIT
> +          Kernel hacking -> Kernel Testing and Coverage -> KUnit - Enabl=
e support for unit tests
> +       CONFIG_RUST_KERNEL_DOCTESTS
> +          Kernel hacking -> Rust hacking -> Doctests for the `kernel` cr=
ate
> +
> +in the kernel config system. Note that these options should
> +not be enabled in a production system.
> --
> 2.28.0

Overall notes:

- Testing probably deserves its own page, this could be a good time to
split it off

- The section above this diff talks about both doctests and #[test]
tests. You could probably put the #[test] info into a new section and
merge the existing doctest info into this patch's new section.

- Regular rustdoc has a surprising caveat that doctests are not run
for nonpublic functions [1]. I am not sure if this limitation applies
in the kernel, but I think it is worth a mention either way.

---

Content looks pretty good, just had some optional wording suggestions.
Thanks, we've needed some more complete information about doctests.

- Trevor

[1]: https://github.com/rust-lang/rust/issues/50784
