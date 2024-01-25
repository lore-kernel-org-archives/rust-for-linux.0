Received: from mail-ed1-f47.google.com (mail-ed1-f47.google.com [209.85.208.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 14948111B6
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jan 2024 07:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706166579; cv=none; b=KX4qFq7dOiCn7PQsYOUNoUAfRqxpND5/5lx2os9GYabO0rp9jENtXWe1Z8TC2ykNg8pe1TWWLBOKF6zxWBsJ8Qk6Vn5goh16LaNRaWQ85djCxAsI7J7z/HrC34cb2xNA6cQsWOqp6wcdoQe7iQbDAJH5BQv7ca8QkHnG+NFywK4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706166579; c=relaxed/simple;
	bh=81KcjNZurVx8iC2Otgtd7hU0/OuFykjRaAVqThRnuGI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=GX7dSLrjZnpKSnwgyDGIahpltIPt8SoRzD1qBFg7MOXx39MAQDlAAp1qTURCpB88sX5GkvRcnFd3tL9xHTnoJBO+ldOua3fIP+iAJCA/1tJTR0I5mebYuDZN8EfZFcIXDdIq4rmzk2KhOL/xVa5Liz+fDNm+MI4TAtRTVVw1q/8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yWJcViMc; arc=none smtp.client-ip=209.85.208.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yWJcViMc"
Received: by mail-ed1-f47.google.com with SMTP id 4fb4d7f45d1cf-55c24a32bf4so9128a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 23:09:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706166576; x=1706771376; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=vAJs6BAkgXjKs0hPj5tuEah/wia4x4V6qBL9Mcgmfzs=;
        b=yWJcViMcG4PDNl7aPaH1yrSwS6kbq1gx1bFKvI5rRhR8reuN0FbMaVF6DS05RR+UGN
         1kgl4+gVhVDmceJPXTFCnYa8g6Yf1LSUjEkdbDXx2Fv6ZFmdZfOpwm6c+Yxvoc346Gim
         uxV4ZuF3rfWq3b4IfI3dXqLPamfgXGYlZz38QWMFMNhhEetdD+AQllL2lXK2nWSvdnZJ
         043p70MBEQazeS8WTLkpDW594+K75UFmDQy9+n4GPxcbX6Do8mJ79lH7S1lP01QzddZF
         71JDAek2KIn6ZWAaQz2HZ7RfmVYGpCeICdGA5g0FKf39FtYKLC25CfRQnAsRgfipfW5D
         3EqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706166576; x=1706771376;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vAJs6BAkgXjKs0hPj5tuEah/wia4x4V6qBL9Mcgmfzs=;
        b=TO42Omw7bbJuwz1T6832tcJuhVNNkecrqTWVkI6jqdVXEnfqsyapxGBE6rataHzunb
         5LNoEylhGX2RhNj4yqmGLj22cafu7UEOfgTnj9Du1d5WWpeCE08Mm0I5QEBmkOydcJcK
         HGhfk0kTdd/LmM4XgUBhoT+zqmEx2BKt0L4159UO/N+qCVJi2iKBYFMrJHxrg5+j+gYb
         1IyNodkjbdbmlssBpPB0hciaETioWNMl4dV++/5VNKtRnk+KG2/c7hnyxVueKxjsorom
         xmD1rKOruBC3tL7SjjPTTV0lVAXiqegMBJBDa/Y9Wjimo7TtsWR7gKAXJIqBrZ+JiMZ9
         3y4w==
X-Gm-Message-State: AOJu0YwUbx0ymSrTYfqbAvYq4+6N8vkIUMCsyS6Wbvx190VcIAC+Yd/z
	BUDUc3jEp1UmNTORTOjuiH0JpfcMiKWSIawsDFsnybbHQiVWb6AnSGT9jvyGYbGjww5SfCXCEov
	pmm2WL4psJpfVMzo3zBIbSq5GVFi+IPvzav5cT3JBhSgvJF6VPZ+E
X-Google-Smtp-Source: AGHT+IGEBQJEOrkS1tF4vNftYWfUK4nEZjDBee/LzePqcbxYFZ+85yCTT4eAi6/2BnwuqM2KFH/+4WwAbkDHSQdHZdY=
X-Received: by 2002:a05:6402:c08:b0:55c:e50c:c66 with SMTP id
 co8-20020a0564020c0800b0055ce50c0c66mr140982edb.0.1706166576207; Wed, 24 Jan
 2024 23:09:36 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125065551.2436403-1-dirk.behme@de.bosch.com> <20240125065551.2436403-2-dirk.behme@de.bosch.com>
In-Reply-To: <20240125065551.2436403-2-dirk.behme@de.bosch.com>
From: David Gow <davidgow@google.com>
Date: Thu, 25 Jan 2024 15:09:21 +0800
Message-ID: <CABVgOSmH0Wy6q+8fx5+7iVLbj7f6vx7WY_10s4GWM3jt4khbHg@mail.gmail.com>
Subject: Re: [PATCH v3 2/2] docs: rust: Add description of Rust documentation
 test as KUnit ones
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, Trevor Gross <tmgross@umich.edu>, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000ba8443060fbfdc69"

--000000000000ba8443060fbfdc69
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jan 2024 at 14:56, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>
> Rust documentation tests are automatically converted into KUnit
> tests. The commit adding this feature
>
> commit a66d733da801 ("rust: support running Rust documentation tests as KUnit ones")
>
> from Miguel has a very nice commit message with a lot details
> for this. To not 'hide' that just in a commit message, pick the main
> parts of it and add it to the documentation. And add a short info
> how to enable this. While adding this, improve the structure of
> the sections.
>
> Co-developed-by: Miguel Ojeda <ojeda@kernel.org>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---

Looks good to me. We'll want to update it once we have more general
KUnit bindings (for something beyond just doctests), but this is
excellent for the current state of things.

This is (with Miguel's Signed-off-by, of course),

Reviewed-by: David Gow <davidgow@google.com>

Thanks,
-- David


> Changes in v3:
>  * Got the '?' operator link to work :)
>  * Rebased against v6.8-rc1
>
>  Documentation/rust/testing.rst | 120 +++++++++++++++++++++++++++++++--
>  1 file changed, 116 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
> index ba8a01015abad..4926db9d19592 100644
> --- a/Documentation/rust/testing.rst
> +++ b/Documentation/rust/testing.rst
> @@ -1,11 +1,25 @@
>  .. SPDX-License-Identifier: GPL-2.0
>
>  Testing
> -=======
> ++++++++
>
> -There are the tests that come from the examples in the Rust documentation
> -and get transformed into KUnit tests. These can be run via KUnit. For example
> -via ``kunit_tool`` (``kunit.py``) on the command line::
> +This document contains useful information how to test the Rust code in the kernel.
> +
> +There are two sorts of tests:
> +
> + * The KUnit tests
> + * The ``#[test]`` tests
> +
> +The KUnit tests
> +===============
> +
> +This are the tests that come from the examples in the Rust documentation
> +and get transformed into KUnit tests.
> +
> +Usage
> +~~~~~
> +
> +These tests can be run via KUnit. For example via ``kunit_tool`` (``kunit.py``) on the command line::
>
>         ./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch x86_64 --kconfig_add CONFIG_RUST=y
>
> @@ -14,6 +28,104 @@ Documentation/dev-tools/kunit/index.rst for the general KUnit documentation
>  and Documentation/dev-tools/kunit/architecture.rst for the details of kernel
>  built-in vs. command line testing.
>
> +To use these KUnit doctests, the following must be enabled::
> +
> +       CONFIG_KUNIT
> +          Kernel hacking -> Kernel Testing and Coverage -> KUnit - Enable support for unit tests
> +       CONFIG_RUST_KERNEL_DOCTESTS
> +          Kernel hacking -> Rust hacking -> Doctests for the `kernel` crate
> +
> +in the kernel config system.
> +
> +KUnit tests are documentation tests
> +~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> +
> +These documentation tests are typically examples of
> +usage of any item (e.g. function, struct, module...).
> +
> +They are very convenient because they are just written
> +alongside the documentation. For instance:
> +
> +.. code-block:: rust
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
> +In userspace, the tests are collected and run via ``rustdoc``.
> +Using the tool as-is would be useful already, since it allows
> +verifying that examples compile (thus enforcing they are kept
> +in sync with the code they document) and as well as running
> +those that do not depend on in-kernel APIs.
> +
> +For the kernel, however, these tests get transformed into KUnit
> +test suites. This means that doctests get compiled as Rust
> +kernel objects, allowing them to run against a built kernel.
> +
> +A benefit of this KUnit integration is that Rust doctests get
> +to reuse existing testing facilities. For instance, the kernel
> +log would look like::
> +
> +       KTAP version 1
> +       1..1
> +           KTAP version 1
> +           # Subtest: rust_doctests_kernel
> +           1..59
> +           # rust_doctest_kernel_build_assert_rs_0.location: rust/kernel/build_assert.rs:13
> +           ok 1 rust_doctest_kernel_build_assert_rs_0
> +           # rust_doctest_kernel_build_assert_rs_1.location: rust/kernel/build_assert.rs:56
> +           ok 2 rust_doctest_kernel_build_assert_rs_1
> +           # rust_doctest_kernel_init_rs_0.location: rust/kernel/init.rs:122
> +           ok 3 rust_doctest_kernel_init_rs_0
> +           ...
> +           # rust_doctest_kernel_types_rs_2.location: rust/kernel/types.rs:150
> +           ok 59 rust_doctest_kernel_types_rs_2
> +       # rust_doctests_kernel: pass:59 fail:0 skip:0 total:59
> +       # Totals: pass:59 fail:0 skip:0 total:59
> +       ok 1 rust_doctests_kernel
> +
> +Tests using the `? <https://doc.rust-lang.org/reference/expressions/operator-expr.html#the-question-mark-operator>`_ operator are also supported as usual, e.g.:
> +
> +.. code-block:: rust
> +
> +       /// ```
> +       /// # use kernel::{spawn_work_item, workqueue};
> +       /// spawn_work_item!(workqueue::system(), || pr_info!("x"))?;
> +       /// # Ok::<(), Error>(())
> +       /// ```
> +
> +The tests are also compiled with Clippy under ``CLIPPY=1``, just
> +like normal code, thus also benefitting from extra linting.
> +
> +In order for developers to easily see which line of doctest code
> +caused a failure, a KTAP diagnostic line is printed to the log.
> +This contains the location (file and line) of the original test
> +(i.e. instead of the location in the generated Rust file)::
> +
> +       # rust_doctest_kernel_types_rs_2.location: rust/kernel/types.rs:150
> +
> +Rust tests appear to assert using the usual ``assert!`` and
> +``assert_eq!`` macros from the Rust standard library (``core``).
> +We provide a custom version that forwards the call to KUnit instead.
> +Importantly, these macros do not require passing context,
> +unlike those for KUnit testing (i.e. ``struct kunit *``). This makes
> +them easier to use, and readers of the documentation do not need
> +to care about which testing framework is used. In addition, it
> +may allow us to test third-party code more easily in the future.
> +
> +A current limitation is that KUnit does not support assertions
> +in other tasks. Thus, we presently simply print an error to the
> +kernel log if an assertion actually failed. Additionally,
> +doctests are not run for nonpublic functions.
> +
> +The ``#[test]`` tests
> +=====================
> +
>  Additionally, there are the ``#[test]`` tests. These can be run using
>  the ``rusttest`` Make target::
>
> --
> 2.28.0
>
>

--000000000000ba8443060fbfdc69
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPqgYJKoZIhvcNAQcCoIIPmzCCD5cCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
gg0EMIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
VQQLExdHbG9iYWxTaWduIFJvb3QgQ0EgLSBSMzETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UE
AxMKR2xvYmFsU2lnbjAeFw0yMDA3MjgwMDAwMDBaFw0yOTAzMTgwMDAwMDBaMFQxCzAJBgNVBAYT
AkJFMRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFz
IFIzIFNNSU1FIENBIDIwMjAwggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCvLe9xPU9W
dpiHLAvX7kFnaFZPuJLey7LYaMO8P/xSngB9IN73mVc7YiLov12Fekdtn5kL8PjmDBEvTYmWsuQS
6VBo3vdlqqXZ0M9eMkjcKqijrmDRleudEoPDzTumwQ18VB/3I+vbN039HIaRQ5x+NHGiPHVfk6Rx
c6KAbYceyeqqfuJEcq23vhTdium/Bf5hHqYUhuJwnBQ+dAUcFndUKMJrth6lHeoifkbw2bv81zxJ
I9cvIy516+oUekqiSFGfzAqByv41OrgLV4fLGCDH3yRh1tj7EtV3l2TngqtrDLUs5R+sWIItPa/4
AJXB1Q3nGNl2tNjVpcSn0uJ7aFPbAgMBAAGjggGKMIIBhjAOBgNVHQ8BAf8EBAMCAYYwHQYDVR0l
BBYwFAYIKwYBBQUHAwIGCCsGAQUFBwMEMBIGA1UdEwEB/wQIMAYBAf8CAQAwHQYDVR0OBBYEFHzM
CmjXouseLHIb0c1dlW+N+/JjMB8GA1UdIwQYMBaAFI/wS3+oLkUkrk1Q+mOai97i3Ru8MHsGCCsG
AQUFBwEBBG8wbTAuBggrBgEFBQcwAYYiaHR0cDovL29jc3AyLmdsb2JhbHNpZ24uY29tL3Jvb3Ry
MzA7BggrBgEFBQcwAoYvaHR0cDovL3NlY3VyZS5nbG9iYWxzaWduLmNvbS9jYWNlcnQvcm9vdC1y
My5jcnQwNgYDVR0fBC8wLTAroCmgJ4YlaHR0cDovL2NybC5nbG9iYWxzaWduLmNvbS9yb290LXIz
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
7xDrOPfX3COqq162RFg/MFcGA1UdIARQME4wCQYHZ4EMAQUBATBBBgkrBgEEAaAyASgwNDAyBggr
BgEFBQcCARYmaHR0cHM6Ly93d3cuZ2xvYmFsc2lnbi5jb20vcmVwb3NpdG9yeS8wDAYDVR0TAQH/
BAIwADCBmgYIKwYBBQUHAQEEgY0wgYowPgYIKwYBBQUHMAGGMmh0dHA6Ly9vY3NwLmdsb2JhbHNp
Z24uY29tL2NhL2dzYXRsYXNyM3NtaW1lY2EyMDIwMEgGCCsGAQUFBzAChjxodHRwOi8vc2VjdXJl
Lmdsb2JhbHNpZ24uY29tL2NhY2VydC9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcnQwHwYDVR0jBBgw
FoAUfMwKaNei6x4schvRzV2Vb4378mMwRgYDVR0fBD8wPTA7oDmgN4Y1aHR0cDovL2NybC5nbG9i
YWxzaWduLmNvbS9jYS9nc2F0bGFzcjNzbWltZWNhMjAyMC5jcmwwDQYJKoZIhvcNAQELBQADggEB
AK0lDd6/eSh3qHmXaw1YUfIFy07B25BEcTvWgOdla99gF1O7sOsdYaTz/DFkZI5ghjgaPJCovgla
mRMfNcxZCfoBtsB7mAS6iOYjuwFOZxi9cv6jhfiON6b89QWdMaPeDddg/F2Q0bxZ9Z2ZEBxyT34G
wlDp+1p6RAqlDpHifQJW16h5jWIIwYisvm5QyfxQEVc+XH1lt+taSzCfiBT0ZLgjB9Sg+zAo8ys6
5PHxFaT2a5Td/fj5yJ5hRSrqy/nj/hjT14w3/ZdX5uWg+cus6VjiiR/5qGSZRjHt8JoApD6t6/tg
ITv8ZEy6ByumbU23nkHTMOzzQSxczHkT+0q10/MxggJqMIICZgIBATBoMFQxCzAJBgNVBAYTAkJF
MRkwFwYDVQQKExBHbG9iYWxTaWduIG52LXNhMSowKAYDVQQDEyFHbG9iYWxTaWduIEF0bGFzIFIz
IFNNSU1FIENBIDIwMjACEAHS+TgZvH/tCq5FcDC0n9IwDQYJYIZIAWUDBAIBBQCggdQwLwYJKoZI
hvcNAQkEMSIEINNxqMwMc7uS8h2e+dahwnLpZ6QSXGSjU2zn6Y3WmJwFMBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MDEyNTA3MDkzNlowaQYJKoZIhvcNAQkPMVww
WjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkq
hkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQArVoZ1
h6HephttztVGedLpA0h2ixg4PPI4HV2Cu4IuDuRRpmmdYFKVPnSPgYa8xYZrniw7yP2Jvk3C0fjl
ftm8ssmQV0IOgmMB8VjKeNLq3jJsqnkQXvFnVljkbnNxIMikjsbh8+DMCKwI9jnaqqJTSiI3ZyjZ
zJsYtSUhgJ3mPhO5m5Im+HA4BuY8nWYcLcNtSFfEdRVVSaNWZQoUU36Hg8azk4z3ACTYmH+dg4iB
EFBC02KGz0j9cFEFxVah9V5May3UBYlmX047XcK4I6ZpVF8/UJhClX+uju0PJwIK9FjOINunlp9D
QC+vOZxzxMf2xbV9Woo7Z96HtZikp1iW
--000000000000ba8443060fbfdc69--
