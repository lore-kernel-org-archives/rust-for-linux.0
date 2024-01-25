Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B740111B6
	for <rust-for-linux@vger.kernel.org>; Thu, 25 Jan 2024 07:09:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706166573; cv=none; b=D7nU+3Q43OwK/16uui6A1WlyUWBmTVQRy2pkdpUIx60lfvYvmQeaxB5F6S9O7N08SeqeFps5AmJAXu3Cz1Pn4auE+CbH5wcxYDnAKPW5Qi8YIV+OrToNYd2SBhEFciQZimISv5bl3J9XJVEAA1z7h+eujZpJjbpW1zQ9V0tNcMg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706166573; c=relaxed/simple;
	bh=xfNBwWChwjqYtj33C3S85wesVGx8CMw7l9lgylGL2uc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ui5prXnPWmnadTIPL59toXrtrcxg9yU0VqbESLGlA3pSW7GQAAFKomW5kxuiDVV+DDZa1PzzpKGdA1bLn7WIyhiWtKzgzlayQKNLgPohsMEDWFGGPiQyKQEUJmTNyhPdTvX4h9/RxzGc36rjxCato5TbpaYB569yf52ajUDN89Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lxCUYPU9; arc=none smtp.client-ip=209.85.208.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lxCUYPU9"
Received: by mail-ed1-f54.google.com with SMTP id 4fb4d7f45d1cf-55818b7053eso10428a12.0
        for <rust-for-linux@vger.kernel.org>; Wed, 24 Jan 2024 23:09:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1706166570; x=1706771370; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=1ubCYxVI6mkMDHc5v4Y2dqqZ534RHBXymgEe6V2ktwE=;
        b=lxCUYPU90if4Y0BZ0RYVowVkVFG2CMJRqQXcThmqA/G5R7wf4FHnrWJk4odkSZlMpa
         kArZLMDikrnNU2ePhBk5kv13ZZoMZIDxmjtfj/f8lWkE+pqBZYrLGYDO7UbbC8Bj5bUR
         8NASJrcxMQ35elVBbXEa5oOV65XkAsbTOpnFWDHL2y20iESpBgnMnYbwNG0Iyej5yqPz
         UdRplBFGF0+KufsikhZy7DWzCWkbN8482eCr5Fw03RYoNFChK7DGqKfFyf0uEiIlJPs4
         OjPzJ0cwIp/aRBVTkc4Hy+7y4frYvzt14/SqkWU/haju5InBionDzqZL8fGLsO9TFqJk
         yodA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706166570; x=1706771370;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1ubCYxVI6mkMDHc5v4Y2dqqZ534RHBXymgEe6V2ktwE=;
        b=cR7SAUUQ92RxYVYipilcgy3rkrce3X3bn6ueD7b22dyKgaalQafJKaYfbtXzU5x2Pq
         niXzH5WP1YivPsLlskJ1/Mz1LIkWtz+yWxfN1zJfQKMo/67lBUt+PDbLuVUntfLEoNJx
         qts9GmHG0iqanogCewtDybDpYHwEcqnoJBhGvTHl6APrZEwFvwC/NmM+xvb7q4x+/Bi1
         YelBza2RsMrFB+/nh42RpQ2/IcW6jhEtgQ8gp9KKIjG6D8LUMUyyu8jxwrlkVEdq0Oka
         7EbTxIVr6Pk2Px/NPfGuH2yLPZrn1FG0Ri96wG57Vh6FbtRWUQAtmPBENH3WcVoyYfRo
         PM9w==
X-Gm-Message-State: AOJu0YwqTasm26o8RtLbqNUN1PNcBWfkYN8ZCEKuY9gogOnDPR08gdEI
	c/LaA/QOcZuL8dAvBo9nI2uZEc1BY+CC7oyE75O6sgQGPwERaBEyhLhGZQeNsoFhVdJxlefMrBP
	mfA0HVGzj6lariAiBV5VpxXs/sVQocRUw32C0
X-Google-Smtp-Source: AGHT+IFwQdgmuUUSwURlg/zsYio73V7RyLrS9y3oKMTrXLw9qRhfxmiUvmF3Mg8bBECTqJgX1g9sIp+zWqTsr4/BjYw=
X-Received: by 2002:a05:6402:160f:b0:55c:fe86:50f with SMTP id
 f15-20020a056402160f00b0055cfe86050fmr64240edv.5.1706166569536; Wed, 24 Jan
 2024 23:09:29 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20240125065551.2436403-1-dirk.behme@de.bosch.com>
In-Reply-To: <20240125065551.2436403-1-dirk.behme@de.bosch.com>
From: David Gow <davidgow@google.com>
Date: Thu, 25 Jan 2024 15:09:17 +0800
Message-ID: <CABVgOSmNWPAqNO1-kWufrDAajZB2Ou7KcDQJWnamrsCB-ePCBw@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] docs: rust: Move testing to a separate page
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org, Trevor Gross <tmgross@umich.edu>, 
	Miguel Ojeda <ojeda@kernel.org>
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000554db0060fbfdc2f"

--000000000000554db0060fbfdc2f
Content-Type: text/plain; charset="UTF-8"

On Thu, 25 Jan 2024 at 14:56, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>
> To be able to add more testing documentation move the testing
> section to it's own page.
>
> No change on the documentation itself.
>
> Suggested-by: Trevor Gross <tmgross@umich.edu>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Reviewed-by: Trevor Gross <tmgross@umich.edu>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---
> Changes in v3:
>  * Add Trevor's Reviewed-by
>  * Rebased against v6.8-rc1
>

Makes sense to me. Thanks for rebasing it, too: made reviewing it much easier.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David



>  Documentation/rust/general-information.rst | 24 ----------------------
>  Documentation/rust/index.rst               |  1 +
>  Documentation/rust/testing.rst             | 24 ++++++++++++++++++++++
>  3 files changed, 25 insertions(+), 24 deletions(-)
>  create mode 100644 Documentation/rust/testing.rst
>
> diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
> index 236c6dd3c647f..081397827a7ea 100644
> --- a/Documentation/rust/general-information.rst
> +++ b/Documentation/rust/general-information.rst
> @@ -77,27 +77,3 @@ configuration:
>         #[cfg(CONFIG_X="y")]   // Enabled as a built-in (`y`)
>         #[cfg(CONFIG_X="m")]   // Enabled as a module   (`m`)
>         #[cfg(not(CONFIG_X))]  // Disabled
> -
> -
> -Testing
> --------
> -
> -There are the tests that come from the examples in the Rust documentation
> -and get transformed into KUnit tests. These can be run via KUnit. For example
> -via ``kunit_tool`` (``kunit.py``) on the command line::
> -
> -       ./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch x86_64 --kconfig_add CONFIG_RUST=y
> -
> -Alternatively, KUnit can run them as kernel built-in at boot. Refer to
> -Documentation/dev-tools/kunit/index.rst for the general KUnit documentation
> -and Documentation/dev-tools/kunit/architecture.rst for the details of kernel
> -built-in vs. command line testing.
> -
> -Additionally, there are the ``#[test]`` tests. These can be run using
> -the ``rusttest`` Make target::
> -
> -       make LLVM=1 rusttest
> -
> -This requires the kernel ``.config`` and downloads external repositories.
> -It runs the ``#[test]`` tests on the host (currently) and thus is fairly
> -limited in what these tests can test.
> diff --git a/Documentation/rust/index.rst b/Documentation/rust/index.rst
> index 965f2db529e0f..46d35bd395cf5 100644
> --- a/Documentation/rust/index.rst
> +++ b/Documentation/rust/index.rst
> @@ -40,6 +40,7 @@ configurations.
>      general-information
>      coding-guidelines
>      arch-support
> +    testing
>
>  .. only::  subproject and html
>
> diff --git a/Documentation/rust/testing.rst b/Documentation/rust/testing.rst
> new file mode 100644
> index 0000000000000..ba8a01015abad
> --- /dev/null
> +++ b/Documentation/rust/testing.rst
> @@ -0,0 +1,24 @@
> +.. SPDX-License-Identifier: GPL-2.0
> +
> +Testing
> +=======
> +
> +There are the tests that come from the examples in the Rust documentation
> +and get transformed into KUnit tests. These can be run via KUnit. For example
> +via ``kunit_tool`` (``kunit.py``) on the command line::
> +
> +       ./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch x86_64 --kconfig_add CONFIG_RUST=y
> +
> +Alternatively, KUnit can run them as kernel built-in at boot. Refer to
> +Documentation/dev-tools/kunit/index.rst for the general KUnit documentation
> +and Documentation/dev-tools/kunit/architecture.rst for the details of kernel
> +built-in vs. command line testing.
> +
> +Additionally, there are the ``#[test]`` tests. These can be run using
> +the ``rusttest`` Make target::
> +
> +       make LLVM=1 rusttest
> +
> +This requires the kernel ``.config`` and downloads external repositories.
> +It runs the ``#[test]`` tests on the host (currently) and thus is fairly
> +limited in what these tests can test.
> --
> 2.28.0
>
>

--000000000000554db0060fbfdc2f
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
hvcNAQkEMSIEIMlJCVXm3joHgYoZXLjeegvwaK6DxIL2Tm6iWEjdg2/+MBgGCSqGSIb3DQEJAzEL
BgkqhkiG9w0BBwEwHAYJKoZIhvcNAQkFMQ8XDTI0MDEyNTA3MDkzMFowaQYJKoZIhvcNAQkPMVww
WjALBglghkgBZQMEASowCwYJYIZIAWUDBAEWMAsGCWCGSAFlAwQBAjAKBggqhkiG9w0DBzALBgkq
hkiG9w0BAQowCwYJKoZIhvcNAQEHMAsGCWCGSAFlAwQCATANBgkqhkiG9w0BAQEFAASCAQAbizmQ
CbtQiiGn6RwfVDf1fWOVoO+RfCPl5V5REYnIlelFUyGjUsdAeUGWfmYrZmjQQXExRl8zqeCfw5Xx
RTMLq7wx3uzq24ZUiBfpjekhdRkd0F950KvyrOtYG9rp3N19c8Pq3nAM0dTZkb3klbZMulYLOZb6
yMI5nvOGJzDRGhACS5StMfMlSCJAr5bEq4huCoDSt8Hu3WkJ//DHvS6DLdSJkGi4oYWy8RERnznI
6HGvrFLdt09T3pQa/J0DnCAHGuA0lnH+WVLhn9pbl6J6zYUD3dARSsUVwb7Cb5ViypJGxN0Vo4pZ
ibmQqNn+gsDaGBFokuTdUAb5ijzsBso3
--000000000000554db0060fbfdc2f--
