Received: from mail-qv1-f50.google.com (mail-qv1-f50.google.com [209.85.219.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1B22D846F
	for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 09:18:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764062282; cv=none; b=uGH9kNt5DBkacK2qLzCZgqp4llrlwnE+LCN0KCWovf2zHm3qEVoakV15WIs9HLUAsJvil3cMZl/WGF7ScwTKEoIyns0px0VWUsHpL5/IfsXOFlb/Ge0b9ApzbnNHHcW60L0kDWjoFSPqwifvB9pl4Sa6X5usZa5yPw4KLl5pIac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764062282; c=relaxed/simple;
	bh=5JxLFT42IqwskAk75w0HtRYvnY4slePn6slfuA0cd88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fQ/f1uUaSWOUsO58opMA0xw6t3kWVbhbrzfnypyzhRgoEyFNTK73IKS64LUszoI3W3J+iq10ySB0SgtmK7rgNCYDmBSNi1kkqrpHzoloyPO6va87+DsCa3xCtXSY+P+qZ+bH+WTLZHlFfcLKOWskWKaDhY3DMyugM6HeQQdF+3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ySFrcLhZ; arc=none smtp.client-ip=209.85.219.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ySFrcLhZ"
Received: by mail-qv1-f50.google.com with SMTP id 6a1803df08f44-880570bdef8so62541766d6.3
        for <rust-for-linux@vger.kernel.org>; Tue, 25 Nov 2025 01:18:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1764062280; x=1764667080; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=5JxLFT42IqwskAk75w0HtRYvnY4slePn6slfuA0cd88=;
        b=ySFrcLhZXfWUsBDI0nf8abY+yHIZAOs7c70Tuw4fFXeutCxrpRJ1mpYb2Sp8lTGb7t
         vQyFXJj7Pgn7lhZORZ60pshg6jjmLt0Evf5VTcrC0MV99PC/NtskPdjPdQiCofmhODtJ
         oC3NVVoC9DlLY3dWJxbtUWlYQxQ/+zhjqyAvL6qES3EKRL8bwvsPnZpHHOKS3GC5OF0a
         qBp0mqVQOgMBmTA1kR/DbCWEtLP0lsSPKjsEYmgKjcN6N8jNKiiWby72+O0dKftpjCYC
         VImPGbl+BohXJ+cVjHVy8x4PXlDbisGvSVDR3lWq9MTAVgaUbFLKnWKbeYirqZb1/YXC
         M6tw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764062280; x=1764667080;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5JxLFT42IqwskAk75w0HtRYvnY4slePn6slfuA0cd88=;
        b=Bm3n4yhqVJrSmka0KJsKnaJKCrrrqW4VWAG2CV0Sk1rwz/nuNci1uqZoZqrT5Ds4DF
         eDOehofH6kdZfXsessxXBtonslfk3l+8Li+aHb+88jMhKhshLbN49CwMOXDBJ69ZBxSX
         wBYZuaKMw5QfBKculqncUo8xmAZvx8vGnHpvx3SOzYmvvzRnq247mAanlTFwv4mP6Jua
         fOUG3iCO2rcXCi+9N39vxsYOl/cUikZQLSJYyMFjPa7tkJoPPgl1DsFXIGALPeDOlv7d
         IyM22+hyrpCiXDw3ciAjmQ4DEGBTb3s5dAgNUrryodjZCJAvhgS11cmzQmGSik/pozoe
         NTuA==
X-Forwarded-Encrypted: i=1; AJvYcCXJM/mdZZSN/TbbU6ky1SD/kmBEE5EZNY1uNnEpYJmLAmDNKeFuexP8rwfO9EfhD9phFZD5kPJqrUk/CkhOwA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzLrXI5lNzwTrf79FU0JwolTyCwmBWK+HLA8lZtOJU7Hr/AQffr
	zt/fBGD7QEDeWMthYbDHTPMZTBplyt5xpyor9o12xhIAvtWzTLDByX8rVwA8I2dkjHQTKK3yKNf
	zp3PkPEOaofEedq848VV2VYdLwdES1++dtS/K6DBa
X-Gm-Gg: ASbGnctYHOlVrNz5G3Ae4AYHDJb9ftG9w0ou8a4N8DtDSSc5PjliJ1ExmgPfBrPu6zh
	WquqQOa+XhB1r0McYiEcC2XRaKq5umHycUNm2M0NF0F4SeYSdCtSaWb4URaQYT5IhM6NSI774ax
	WAIAZaFSNoCXKESiWELFWhypvbaXZ4fbwC69gJ/X+FBWBGEjxgrAcFnGfNFGuu6iGnV5qC80mUe
	Wk8N+VJukY06ZQmg1a6axB+1yGU/Vlt2xa16lyu7vk4ImtKnhmMGeowJlETMsvcpjPC5g==
X-Google-Smtp-Source: AGHT+IGvPVBFmvjIVtuV6XC5aQ5oALYPi44Y9+VPnO8qxOMF9llMm1O82mfE98A/gxwSo6qSUsq9JsEYuAs8kv4nXto=
X-Received: by 2002:a05:6214:ace:b0:882:5341:94ad with SMTP id
 6a1803df08f44-8863afb10b7mr29229746d6.54.1764062279805; Tue, 25 Nov 2025
 01:17:59 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251122083213.3996586-1-davidgow@google.com> <CANiq72=MXHZ2XswxkfzLqUEPwriNy=_sxAQpOYoYW8iNgyuJ8Q@mail.gmail.com>
 <bfb512e24f365695534313b375fc0c38d0a843b2.camel@sipsolutions.net>
 <CABVgOSmAGahEaa71_fOT4Oo9Wg91X6rN+1_KgVVvVzmd4vuMCg@mail.gmail.com> <dedea008d546a2a29d3b604e9f4b0c0dec3ebac1.camel@sipsolutions.net>
In-Reply-To: <dedea008d546a2a29d3b604e9f4b0c0dec3ebac1.camel@sipsolutions.net>
From: David Gow <davidgow@google.com>
Date: Tue, 25 Nov 2025 17:17:48 +0800
X-Gm-Features: AWmQ_bmEQiMvTSP2V8hBLm-LO1cv6ZaGT7ljMUs52K9IUekH5Imjyy5jgaEWWZ8
Message-ID: <CABVgOSkk=C7f3X-Si8e+bA3XTDy_D+yE2fvxMYLfGp3VpUbyJg@mail.gmail.com>
Subject: Re: [PATCH] arch: um: Don't rename vmap to kernel_vmap
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>, Richard Weinberger <richard@nod.at>, 
	Anton Ivanov <anton.ivanov@cambridgegreys.com>, Miguel Ojeda <ojeda@kernel.org>, 
	"Paolo 'Blaisorblade' Giarrusso" <blaisorblade@yahoo.it>, Alice Ryhl <aliceryhl@google.com>, 
	linux-um@lists.infradead.org, linux-kernel@vger.kernel.org, 
	rust-for-linux@vger.kernel.org
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="00000000000095070e064467c1ac"

--00000000000095070e064467c1ac
Content-Type: text/plain; charset="UTF-8"

On Tue, 25 Nov 2025 at 15:40, Johannes Berg <johannes@sipsolutions.net> wrote:
>
> On Tue, 2025-11-25 at 15:36 +0800, David Gow wrote:
> > >
> > > Or it's not that urgent because all this came up in -next now? I didn't
> > > really see (or fully understand) all the build bug reports.
> > >
> >
> > I'm happy for this to go in via any tree. (Worst-case, we could
> > possibly take it via KUnit, though I'd rather not, as it's not really
> > KUnit-related at all.)
> >
> > The issue has actually been around since probably 6.16 (c284d3e42338
> > ("rust: drm: gem: Add GEM object abstraction")), but since it only
> > applies to people building Rust graphics drivers against UML, which is
> > not super common, it seems like it's only come up in randconfig builds
> > so far.
>
> Oh, interesting, OK. I guess then given that it's not super important
> and how late we're in the game, I'll just throw it into the (relatively
> small) pile we have for UML for -next. Given that we removed the pcap
> driver in 6.11 (12b8e7e69aa7a) I guess we could even ask stable to take
> it, but it's not even that important until someone wants to test the
> rust DRM stuff in kunit or something :)
>

Sounds good to me. Throwing the Fixes: tag in wouldn't hurt at least
(and I do think some of the Rust DRM stuff is growing some KUnit
tests, so it'll be nice to have going forward, even if they can be
tested under other architectures).

Cheers,
-- David

--00000000000095070e064467c1ac
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
NjETMBEGA1UEChMKR2xvYmFsU2lnbjETMBEGA1UEAxMKR2xvYmFsU2lnbjAeFw0xNDEyMTAwMDAw
MDBaFw0zNDEyMTAwMDAwMDBaMEwxIDAeBgNVBAsTF0dsb2JhbFNpZ24gUm9vdCBDQSAtIFI2MRMw
EQYDVQQKEwpHbG9iYWxTaWduMRMwEQYDVQQDEwpHbG9iYWxTaWduMIICIjANBgkqhkiG9w0BAQEF
AAOCAg8AMIICCgKCAgEAlQfoc8pm+ewUyns89w0I8bRFCyyCtEjG61s8roO4QZIzFKRvf+kqzMaw
iGvFtonRxrL/FM5RFCHsSt0bWsbWh+5NOhUG7WRmC5KAykTec5RO86eJf094YwjIElBtQmYvTbl5
KE1SGooagLcZgQ5+xIq8ZEwhHENo1z08isWyZtWQmrcxBsW+4m0yBqYe+bnrqqO4v76CY1DQ8BiJ
3+QPefXqoh8q0nAue+e8k7ttU+JIfIwQBzj/ZrJ3YX7g6ow8qrSk9vOVShIHbf2MsonP0KBhd8hY
dLDUIzr3XTrKotudCd5dRC2Q8YHNV5L6frxQBGM032uTGL5rNrI55KwkNrfw77YcE1eTtt6y+OKF
t3OiuDWqRfLgnTahb1SK8XJWbi6IxVFCRBWU7qPFOJabTk5aC0fzBjZJdzC8cTflpuwhCHX85mEW
P3fV2ZGXhAps1AJNdMAU7f05+4PyXhShBLAL6f7uj+FuC7IIs2FmCWqxBjplllnA8DX9ydoojRoR
h3CBCqiadR2eOoYFAJ7bgNYl+dwFnidZTHY5W+r5paHYgw/R/98wEfmFzzNI9cptZBQselhP00sI
ScWVZBpjDnk99bOMylitnEJFeW4OhxlcVLFltr+Mm9wT6Q1vuC7cZ27JixG1hBSKABlwg3mRl5HU
Gie/Nx4yB9gUYzwoTK8CAwEAAaNjMGEwDgYDVR0PAQH/BAQDAgEGMA8GA1UdEwEB/wQFMAMBAf8w
HQYDVR0OBBYEFK5sBaOTE+Ki5+LXHNbH8H/IZ1OgMB8GA1UdIwQYMBaAFK5sBaOTE+Ki5+LXHNbH
8H/IZ1OgMA0GCSqGSIb3DQEBDAUAA4ICAQCDJe3o0f2VUs2ewASgkWnmXNCE3tytok/oR3jWZZip
W6g8h3wCitFutxZz5l/AVJjVdL7BzeIRka0jGD3d4XJElrSVXsB7jpl4FkMTVlezorM7tXfcQHKs
o+ubNT6xCCGh58RDN3kyvrXnnCxMvEMpmY4w06wh4OMd+tgHM3ZUACIquU0gLnBo2uVT/INc053y
/0QMRGby0uO9RgAabQK6JV2NoTFR3VRGHE3bmZbvGhwEXKYV73jgef5d2z6qTFX9mhWpb+Gm+99w
MOnD7kJG7cKTBYn6fWN7P9BxgXwA6JiuDng0wyX7rwqfIGvdOxOPEoziQRpIenOgd2nHtlx/gsge
/lgbKCuobK1ebcAF0nu364D+JTf+AptorEJdw+71zNzwUHXSNmmc5nsE324GabbeCglIWYfrexRg
emSqaUPvkcdM7BjdbO9TLYyZ4V7ycj7PVMi9Z+ykD0xF/9O5MCMHTI8Qv4aW2ZlatJlXHKTMuxWJ
U7osBQ/kxJ4ZsRg01Uyduu33H68klQR4qAO77oHl2l98i0qhkHQlp7M+S8gsVr3HyO844lyS8Hn3
nIS6dC1hASB+ftHyTwdZX4stQ1LrRgyU4fVmR3l31VRbH60kN8tFWk6gREjI2LCZxRWECfbWSUnA
ZbjmGnFuoKjxguhFPmzWAtcKZ4MFWsmkEDCCBeQwggPMoAMCAQICEAGEC3/wSMy6MPZFqg/DMj8w
DQYJKoZIhvcNAQELBQAwVDELMAkGA1UEBhMCQkUxGTAXBgNVBAoTEEdsb2JhbFNpZ24gbnYtc2Ex
KjAoBgNVBAMTIUdsb2JhbFNpZ24gQXRsYXMgUjYgU01JTUUgQ0EgMjAyMzAeFw0yNTEwMTMyMzQ3
NDlaFw0yNjA0MTEyMzQ3NDlaMCQxIjAgBgkqhkiG9w0BCQEWE2RhdmlkZ293QGdvb2dsZS5jb20w
ggEiMA0GCSqGSIb3DQEBAQUAA4IBDwAwggEKAoIBAQC7T8v6fZyfEDlp38NMe4GOXuodILGOFXh6
iVuecsKchx1gCg5Qebyxm+ndfb6ePkd2zzsBOkBJmYrx4G009e+oyTnynr5KXvucs+wLlgm53QU7
6pYikvqTM2hezoWz48Ve/6Jq/6I/eAzKGhn4E/3zG15ETIeMpPFy/E7/lGqq+HFRCb6s0tl/QWhC
BiR+n2UvmXbVWPSR51aRAifsKqiuraeU5g9bGCcbuvdbiYQf1AzNDilkvA6FfUaOPTzVj3rgMyZb
mnZpzWOV1bfib3tYXd2x4IvUS3xlvrap0g9EiDxJKUhCskOf7dPTjaS/kku768Y6U/sDVH5ptgvP
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
PzANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQg2WmvAsLRwv+IX9jskIG4Q3cv+mqH
SPN3snPnNSKGww0wGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUx
MTI1MDkxODAwWjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEAZnY9qTJNAQlsKNOcU5uxnrI9eQgSA/sJUvmdd/LIrfyBmUcUeoEcVw9zzr1nlEYk
/DXzCxiRQ6pZH+++iW0/NfliQF/t5L4jDCA/JcdGB3HPYke79NF6FD9/yHMYFWCBFRlh+S5LZN7m
eiaVUn2MIJYC0nbXNJNQUbD5SKwfYhXigZvZ7W0B3Mv4zCkvWFFm7h7FiDEHJ6GWE/E/GBVhWWo4
Phy3Eo7l5UB2eHGBAkKOSHMnGRFXz1X4acW8O2YnJXmmQBJzu0BtKN0+iVvM7Ygdgm18P4IoeIbL
yWOhjfkcbqX4SWCylSFbWxQwJ1clqVrCCLplQaOoIBY7hvpa2w==
--00000000000095070e064467c1ac--
