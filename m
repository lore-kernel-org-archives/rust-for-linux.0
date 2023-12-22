Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A07AED512
	for <rust-for-linux@vger.kernel.org>; Fri, 22 Dec 2023 09:17:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="vpKRxAaI"
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-5534180f0e9so7157a12.1
        for <rust-for-linux@vger.kernel.org>; Fri, 22 Dec 2023 01:17:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1703236641; x=1703841441; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=4lgyGkAgoCwz9YD7OvkDYJZ0MD+ZZLVJB6Ks//7NPzE=;
        b=vpKRxAaIOj16jnCWPp3gerlPYNViBHv6iUstCj44t9XhH7MY1oeaBEBNroNowWcCqo
         by2B82SteYDgcJ5juCRfV4zCL/eguwjr3fNuE5ZdpW6EbzGnKJkq6pNM2Aj5DHzdFeP4
         Jqb8FtIPHPquZ2t5M1ON3kUjWYnLWlXRdlHcF5+Cy6ETaqaXzb7ScKaJoBpVDzJjwJs6
         NCSmifTlPB/UJ64Dgidwep7Btf+V52F1iursZWp3kxCw5SkyKcRa0k1/g7VFb6ylOgFZ
         IcqTBDsqI1Dmky4HkjHlzPqiXKZFnBaupSRl/srrGa9MkSL7XE34/y7xSFgtcKgIfv14
         Fehw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1703236641; x=1703841441;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=4lgyGkAgoCwz9YD7OvkDYJZ0MD+ZZLVJB6Ks//7NPzE=;
        b=U9fcdi8uQceGgEN8KD++j9+dTRDVxmVYMvw/vHn74Y64Pp42QaazKR3wnKFa2/4ga3
         g7nUZ+t7e23J5XEHKQ+tqLBy6A7uh27fd6owRVD2n7W9GeBUYS7Km3POxbsDgp8Lxo/q
         wYr9uQVY2UU547jOVZxYlO3GLfeJOgt3m59jHRSRSQfVxEwnsxB/YD5dnF9dq8xvT8iA
         TvhV89HPFuuN8levex9tgQXI4DPHkpCnYnqXqLVFOIaOvr81fL/8QPkSfMXjhqCyl05+
         IE+XdoCIDN81fJ7EJvUgPXE9fn4WbmSFCE6zBZ62rDIJWTv+kFfxF7ug6dTqK3DN/uJ9
         J9DA==
X-Gm-Message-State: AOJu0Yx6u0F0JFgaO2S767vcdKE4c0jaVzdckVfPfAvqlMR0P6UsXIf3
	OYI3u1LkIQkBcdixEVXzAE7+v26brCMM7NwQX9CoaKa1pL95
X-Google-Smtp-Source: AGHT+IFuyqh1MsiZSTP7X7WvZpbl+UVF9MHUW9bxhgqvond6+xoVuzaImQ2mg5LSf9UDZGXLxx8p76TcfUvZrK6m/dA=
X-Received: by 2002:a50:8d03:0:b0:554:2501:cc8e with SMTP id
 s3-20020a508d03000000b005542501cc8emr71004eds.6.1703236640740; Fri, 22 Dec
 2023 01:17:20 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20231212081313.226120-1-dirk.behme@de.bosch.com> <CANiq72kEUyQ+Evjfv-c-t4UHi+SpAJ6dgrRAY_zdsBO=vHNm6w@mail.gmail.com>
In-Reply-To: <CANiq72kEUyQ+Evjfv-c-t4UHi+SpAJ6dgrRAY_zdsBO=vHNm6w@mail.gmail.com>
From: David Gow <davidgow@google.com>
Date: Fri, 22 Dec 2023 17:17:06 +0800
Message-ID: <CABVgOS=SsrM6qyJg7Kr7quGPLvgP62O5vKn+TWV6pnNrLXcumQ@mail.gmail.com>
Subject: Re: [PATCH v4] docs: rust: Add rusttest info
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Dirk Behme <dirk.behme@de.bosch.com>, rust-for-linux@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="000000000000f66174060d15ae2e"

--000000000000f66174060d15ae2e
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 22 Dec 2023 at 05:41, Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Tue, Dec 12, 2023 at 9:14=E2=80=AFAM Dirk Behme <dirk.behme@de.bosch.c=
om> wrote:
> >
> > Searching the Rust kernel documentation all existing Rust Make
> > targets (rustavailable, rustfmt, rustfmtcheck, rustdoc and
> > rust-analyzer) are explicitly documented with their Make commands.
> > While the Make target rusttest is mentioned two times in the
> > existing documentation, it's Make command is not explicitly
> > documented, yet. Add a test section to document this.
> >
> > While at it, add some info about the more important KUnit testing
> > too.
> >
> > Reviewed-by: David Gow <davidgow@google.com>
> > Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>
>
> Applied to `rust-next` with a few nits tweaked (added "the", newline
> and quotes for `.config`; expanded "repos") -- thanks everyone!
>
> David: your `Reviewed-by` was here but the change substantially
> changed from v3 to v4 -- I have kept it, but if you want it out,
> please shout :) For instance, perhaps we could simplify the paragraph
> about KUnit to just:
>
>     Alternatively, KUnit can run built-in KUnit tests on boot. Please see
>     Documentation/dev-tools/kunit/index.rst for details.
>
> since the KUnit docs explain in several places the boot option vs.
> `kunit_tool`, and it is one less thing to maintain, but I have left it
> as-is.


Yeah, this still seems fine to me. I think it'll need updating later
when we support additional types of KUnit tests, but this works for
now.

Thanks,
-- David

--000000000000f66174060d15ae2e
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
LmNybDBMBgNVHSAERTBDMEEGCSsGAQQBoDIBKDA0MDIGCCsGAQUFBwIBFiZodHRwczovL3d3dy5n
bG9iYWxzaWduLmNvbS9yZXBvc2l0b3J5LzANBgkqhkiG9w0BAQsFAAOCAQEANyYcO+9JZYyqQt41
TMwvFWAw3vLoLOQIfIn48/yea/ekOcParTb0mbhsvVSZ6sGn+txYAZb33wIb1f4wK4xQ7+RUYBfI
TuTPL7olF9hDpojC2F6Eu8nuEf1XD9qNI8zFd4kfjg4rb+AME0L81WaCL/WhP2kDCnRU4jm6TryB
CHhZqtxkIvXGPGHjwJJazJBnX5NayIce4fGuUEJ7HkuCthVZ3Rws0UyHSAXesT/0tXATND4mNr1X
El6adiSQy619ybVERnRi5aDe1PTwE+qNiotEEaeujz1a/+yYaaTY+k+qJcVxi7tbyQ0hi0UB3myM
A/z2HmGEwO8hx7hDjKmKbDCCA18wggJHoAMCAQICCwQAAAAAASFYUwiiMA0GCSqGSIb3DQEBCwUA
MEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9vdCBDQSAtIFIzMRMwEQYDVQQKEwpHbG9iYWxTaWdu
MRMwEQYDVQQDEwpHbG9iYWxTaWduMB4XDTA5MDMxODEwMDAwMFoXDTI5MDMxODEwMDAwMFowTDEg
MB4GA1UECxMXR2xvYmFsU2lnbiBSb290IENBIC0gUjMxEzARBgNVBAoTCkdsb2JhbFNpZ24xEzAR
BgNVBAMTCkdsb2JhbFNpZ24wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQDMJXaQeQZ4
Ihb1wIO2hMoonv0FdhHFrYhy/EYCQ8eyip0EXyTLLkvhYIJG4VKrDIFHcGzdZNHr9SyjD4I9DCuu
l9e2FIYQebs7E4B3jAjhSdJqYi8fXvqWaN+JJ5U4nwbXPsnLJlkNc96wyOkmDoMVxu9bi9IEYMpJ
pij2aTv2y8gokeWdimFXN6x0FNx04Druci8unPvQu7/1PQDhBjPogiuuU6Y6FnOM3UEOIDrAtKeh
6bJPkC4yYOlXy7kEkmho5TgmYHWyn3f/kRTvriBJ/K1AFUjRAjFhGV64l++td7dkmnq/X8ET75ti
+w1s4FRpFqkD2m7pg5NxdsZphYIXAgMBAAGjQjBAMA4GA1UdDwEB/wQEAwIBBjAPBgNVHRMBAf8E
BTADAQH/MB0GA1UdDgQWBBSP8Et/qC5FJK5NUPpjmove4t0bvDANBgkqhkiG9w0BAQsFAAOCAQEA
S0DbwFCq/sgM7/eWVEVJu5YACUGssxOGhigHM8pr5nS5ugAtrqQK0/Xx8Q+Kv3NnSoPHRHt44K9u
bG8DKY4zOUXDjuS5V2yq/BKW7FPGLeQkbLmUY/vcU2hnVj6DuM81IcPJaP7O2sJTqsyQiunwXUaM
ld16WCgaLx3ezQA3QY/tRG3XUyiXfvNnBB4V14qWtNPeTCekTBtzc3b0F5nCH3oO4y0IrQocLP88
q1UOD5F+NuvDV0m+4S4tfGCLw0FREyOdzvcya5QBqJnnLDMfOjsl0oZAzjsshnjJYS8Uuu7bVW/f
hO4FCU29KNhyztNiUGUe65KXgzHZs7XKR1g/XzCCBNgwggPAoAMCAQICEAHOBX7j6YmdTMbtcPLp
3a4wDQYJKoZIhvcNAQELBQAwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYt
c2ExKjAoBgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjMgU01JTUUgQ0EgMjAyMDAeFw0yMzA4MTUw
MjQyNDNaFw0yNDAyMTEwMjQyNDNaMCQxIjAgBgkqhkiG9w0BCQEWE2RhdmlkZ293QGdvb2dsZS5j
b20wggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQCnYKS3ueVXUlVatkXVQgk8pbgZH4/s
KBKSGW9Z8e4hylAI35vqFf5f5D4U5KhUYUyG0+AYhurwEiUyZUhGcLqRNmSroohx9nbZjXDXjkVV
LXBAr7xaCU3DDQcA1SaxmALxBC7u4zlcVHfUKope2JNJ2xn5kU0Z/kr01tZuJD5/jn+2hp68jdym
tbFd3zzOJmtG6hb4ULJNXSi1qkjtZp6SyDLEsliQGRuI5AIha7GQPeSNsFmIpi+V5UxhrznuAv0y
Uxd27MtO+/mgSMpLmUb4vuSjy2zuftatzVYvFG00pfHldrnJ1od+kW8lAl6gyahVgMp+j3GAlO2M
oGCkihK9AgMBAAGjggHUMIIB0DAeBgNVHREEFzAVgRNkYXZpZGdvd0Bnb29nbGUuY29tMA4GA1Ud
DwEB/wQEAwIFoDAdBgNVHSUEFjAUBggrBgEFBQcDBAYIKwYBBQUHAwIwHQYDVR0OBBYEFJO3Y8Jq
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
MDIwAhABzgV+4+mJnUzG7XDy6d2uMA0GCWCGSAFlAwQCAQUAoIHUMC8GCSqGSIb3DQEJBDEiBCA4
Kwr4lXmKIhUvAgtBpooxHwbFW+rrrSDEdk3ycCuWsDAYBgkqhkiG9w0BCQMxCwYJKoZIhvcNAQcB
MBwGCSqGSIb3DQEJBTEPFw0yMzEyMjIwOTE3MjFaMGkGCSqGSIb3DQEJDzFcMFowCwYJYIZIAWUD
BAEqMAsGCWCGSAFlAwQBFjALBglghkgBZQMEAQIwCgYIKoZIhvcNAwcwCwYJKoZIhvcNAQEKMAsG
CSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcNAQEBBQAEggEAQeCBToG8bNL0dMMtnZ0i
EduQbdgvEGa36KtyMQ/vs6z8BIRZ7an4Bi2CKgEslYQrnRJA50v6yArvxfy4rpY6A742h8tVO83Q
lYdX3hg2+kblUxD6iVPgeC+4eWn4Zg8Ooxai6xL+45rxuNT3PmvhJ42jhnJnj8sLzTlpXyS6wiy1
y0aYVUnhPGqe8m52jPF9BtC3mIFTnnFn4C4I8WiUFzPd0LNipUFNMvxV4HHGejDor0ZUsTkdQTeb
aGspPgURrzzTUkqYrhKmapu8XxTgCN9YNPY7fh9E3It+Mnmrgu3TBXoxF9CCbndmQ1XT20TSCpI1
EnuzpAHvvKn4hwZnqg==
--000000000000f66174060d15ae2e--
