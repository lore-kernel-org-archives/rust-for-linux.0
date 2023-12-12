Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="W3ICMDf1"
Received: from mail-wm1-x32f.google.com (mail-wm1-x32f.google.com [IPv6:2a00:1450:4864:20::32f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2719CBF
	for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 20:36:36 -0800 (PST)
Received: by mail-wm1-x32f.google.com with SMTP id 5b1f17b1804b1-40c38e520e2so37205e9.0
        for <rust-for-linux@vger.kernel.org>; Mon, 11 Dec 2023 20:36:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1702355794; x=1702960594; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=OHBeYnZGz2cfrZnYhnFF+aAG+rqMR1TRx/9ItuN13Fc=;
        b=W3ICMDf1gqPx4d5H41SuSiHJAjTZBbh+yScGfzwG62/xoKP8cx6/igqtrqifmZM18h
         c/l3os0qmqgRlYExSOEEMF5/yrETMPrnj4OBJbABvf+K8o0nuNWnCbbQbQog+FijmOR9
         hwxyZb5e92bn9uQEYQwO+K2WYoEv0YYGA3aK6SWECH0VOYmb1Daw5+M6Fhgd/ooqrXTJ
         agPuWPkCLxC+k4yal9xi0CQeTsrhkR5N3B41A38HSK+9SGUMfXxCk4R8cxbupGEMDaJ/
         FTjA/wytnuB9J9NAj5WOkZDKD/i+JtDvgl/fxGTrsKU0hXCKW0xzdFVgoMxA0f4JUuyb
         8JOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702355794; x=1702960594;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=OHBeYnZGz2cfrZnYhnFF+aAG+rqMR1TRx/9ItuN13Fc=;
        b=ZjZQYZhQ5AxIuEmvsw++MrwD8xcs4YMxHddNP7yuVK/oIXUkMV9erf1ajr2789BNzL
         krwFHo4nlNHAK4gvZFqyDFBwQX4l/x+DoeGyhuX/A9U6vv8zIfpoLyKvXpj3sOKe2usI
         pgbFmGbU0lcqva6ACh1JO1Gzln6NuxCmgDIaQCgCffyL3DJU0zQdU6367q8Ozdg6Uq6d
         xmQnSOeFElxDhtTjBh5LwgrpzL6Q7GIcpSJz/EEo18CDo/Hma37CwbIUpzTOWZjie/Y5
         mhf2HP0kIlcIjaZULWpY4WwteflROfUtfLu/bW60ElTLFXPxWepk6HzfnLFw5uYUqAYe
         Z/lQ==
X-Gm-Message-State: AOJu0YyNHNIhlEKIwpBR1BWTpgYT0aAYsImvXaRCnaW8xWv7cspO7+Xj
	2b0Nm4uCMyNPJjBTpg35Oa0zwnQ08Q0xMj+Dy2swg95q0YXM5V0IOQR1Qw==
X-Google-Smtp-Source: AGHT+IGhV/Jg4KUhT9ynbUMjLS8drd1nAR9PCPhOMu7bqJD+p+uGxuYYTMMAxYRRwNf7/sQQAE77OrMEUTGj3nNXEeo=
X-Received: by 2002:a05:600c:4f4b:b0:40c:4ed3:8d1f with SMTP id
 m11-20020a05600c4f4b00b0040c4ed38d1fmr47725wmq.7.1702355794454; Mon, 11 Dec
 2023 20:36:34 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231211121613.3489513-1-dirk.behme@de.bosch.com>
In-Reply-To: <20231211121613.3489513-1-dirk.behme@de.bosch.com>
From: David Gow <davidgow@google.com>
Date: Tue, 12 Dec 2023 12:36:20 +0800
Message-ID: <CABVgOS=6Psq+BYET6o7KdQhKRP3A2wbTf+smAb54s-a4X--8kw@mail.gmail.com>
Subject: Re: [PATCH v3] docs: rust: Add rusttest info
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: rust-for-linux@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000006ff826060c489870"

--0000000000006ff826060c489870
Content-Type: text/plain; charset="UTF-8"

On Mon, 11 Dec 2023 at 20:16, Dirk Behme <dirk.behme@de.bosch.com> wrote:
>
> Searching the Rust kernel documentation all existing Rust Make
> targets (rustavailable, rustfmt, rustfmtcheck, rustdoc and
> rust-analyzer) are explicitly documented with their Make syntax.
> While the Make target rusttest is mentioned two times in the
> existing documentation, it's Make syntax is not explicitly
> documented, yet. Add a test section to document this.
>
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
> ---

The KUnit parts of this look fine to me, though it's not actually
necessary to use --arch x86_64; the default UML should work (if your
host is x86).

There was a previous PR to add some documentation here:
https://github.com/Rust-for-Linux/linux/pull/935

Maybe it'd make sense to borrow some ideas from that and create a
rust/.kunitconfig file so we can move the --kconfig_add CONFIG_RUST=y
(and any other options we may want to enable rust-specific tests)
somewhere.

(Though there's a distinction there between 'I want to test that Rust
support is functional' and 'I want to test something else, but want
Rust support enabled'. I think adding a .kunitconfig would be fine for
both for the time being, though.)

None of those are show-stoppers for me, though, so this is nevertheless

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

>
> v3: Add the comments from Benno and Miguel. Thanks!
>
>  Documentation/rust/general-information.rst | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>
> diff --git a/Documentation/rust/general-information.rst b/Documentation/rust/general-information.rst
> index 081397827a7ea..016c7feb433ce 100644
> --- a/Documentation/rust/general-information.rst
> +++ b/Documentation/rust/general-information.rst
> @@ -77,3 +77,22 @@ configuration:
>         #[cfg(CONFIG_X="y")]   // Enabled as a built-in (`y`)
>         #[cfg(CONFIG_X="m")]   // Enabled as a module   (`m`)
>         #[cfg(not(CONFIG_X))]  // Disabled
> +
> +Testing
> +-------
> +
> +To run the Rust tests, you can use the following make target::
> +
> +       make LLVM=1 rusttest
> +
> +This requires the kernel .config and downloads external repos. It
> +runs the ``#[test]`` tests on the host (currently) and thus is fairly
> +limited in what these tests can test.
> +
> +Additonally, there are the tests that come from the examples in the
> +Rust documentation and get transformed into KUnit tests. These can be
> +run via KUnit. For example::
> +
> +       ./tools/testing/kunit/kunit.py run --make_options LLVM=1 --arch x86_64 --kconfig_add CONFIG_RUST=y
> +
> +See the :doc:`KUnit documentation</dev-tools/kunit/index>` for the details how to use it.
> --
> 2.28.0
>
>

--0000000000006ff826060c489870
Content-Type: application/pkcs7-signature; name="smime.p7s"
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="smime.p7s"
Content-Description: S/MIME Cryptographic Signature

MIIPnwYJKoZIhvcNAQcCoIIPkDCCD4wCAQExDzANBglghkgBZQMEAgEFADALBgkqhkiG9w0BBwGg
ggz5MIIEtjCCA56gAwIBAgIQeAMYYHb81ngUVR0WyMTzqzANBgkqhkiG9w0BAQsFADBMMSAwHgYD
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
ddIn9n5Jt6Z1o79zxraLMEwGA1UdIARFMEMwQQYJKwYBBAGgMgEoMDQwMgYIKwYBBQUHAgEWJmh0
dHBzOi8vd3d3Lmdsb2JhbHNpZ24uY29tL3JlcG9zaXRvcnkvMAwGA1UdEwEB/wQCMAAwgZoGCCsG
AQUFBwEBBIGNMIGKMD4GCCsGAQUFBzABhjJodHRwOi8vb2NzcC5nbG9iYWxzaWduLmNvbS9jYS9n
c2F0bGFzcjNzbWltZWNhMjAyMDBIBggrBgEFBQcwAoY8aHR0cDovL3NlY3VyZS5nbG9iYWxzaWdu
LmNvbS9jYWNlcnQvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3J0MB8GA1UdIwQYMBaAFHzMCmjXouse
LHIb0c1dlW+N+/JjMEYGA1UdHwQ/MD0wO6A5oDeGNWh0dHA6Ly9jcmwuZ2xvYmFsc2lnbi5jb20v
Y2EvZ3NhdGxhc3Izc21pbWVjYTIwMjAuY3JsMA0GCSqGSIb3DQEBCwUAA4IBAQBtHFwIgQZjer5K
H+4Q+wns10k7qN+4wN2Uf+JsyOYjukaMEgdLErfA1wwtQ9uHkoYQZcWBuVVkQFa5hI+sqI2m1Weq
riMCFSiU38s1tADdMX12IMfJRN60Nznhrw+nPyDRZqRhUTW24TwnHorkDnFPW8PHo7fAw4FrpI0n
impZAng7ccvvK09K3ZuhwTIxJMsPXCZYsrXWORTw5sczRAP6XvKbPBJnsJoSTe5dFBPBHOQJOGhU
qWfEfWnWMJPF3LxSGLpLFQXO3RwQqmxv08avwXfVPouh1xuB3FX7rpDabT8YDhu9JgIZkLEKko7L
yQt6zWwng7k8YF/jGbiAta6VMYICajCCAmYCAQEwaDBUMQswCQYDVQQGEwJCRTEZMBcGA1UEChMQ
R2xvYmFsU2lnbiBudi1zYTEqMCgGA1UEAxMhR2xvYmFsU2lnbiBBdGxhcyBSMyBTTUlNRSBDQSAy
MDIwAhABzgV+4+mJnUzG7XDy6d2uMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCCQ
ic93DRISnviAou9gq8+9/CHc0F9AVM2GZzdDKNmq2TAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMzEyMTIwNDM2MzRaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAQ5zbonauy2gHN7EraF5D
dzb/4eLflGvH+wPoBACn8/F0dLICI1+zvrd3MY1mJG+FAordXZCkfm0BZqJCMZVpQzzgctWu6btY
Jd/XhDntlOniwMECpypy1jurTAjnrbHRivL309HT/UtAiWcMpVaS+bvV9ddKoKmkWtbjnoeLm1OS
Dwr8KgWQQPxbv6WojxLRNcN3mzB9FkZeTMQsLAiGu64XSlL2jm+/DBwQ7IwDwuSunk1fDPuFp5W8
3tlnaFum/AtRJp1H4cfC8kH8m29/gyEjjlKdrrIrXLukd+uRN1HtaXalB5CFMsIlafUr6n57hQE/
TAMLQyu5s58Xr5wn9Q==
--0000000000006ff826060c489870--
