Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67FF929405
	for <rust-for-linux@vger.kernel.org>; Wed, 10 Dec 2025 01:46:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765331221; cv=none; b=pLQcHKjyHENEpck0rVvZyxEQTZc0RWyxwH0dh4THtDKhT8VDuTbluGHecJQWAAeOmMU0Yg2bca/w3o4gWwp6zsIop4GNDsMVpa/AppfFEgtgXJSf8xbKCLUMDgdCG+B8Kv2HyJscjM6N0bDs/LxOrrkVxn2psXrYm81MFBym9Hk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765331221; c=relaxed/simple;
	bh=40tPdCXG6pcnH0mnVpPSV6noe33O3vUvhSFtBTd5p1A=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pmZvg8E0O0p+2dyrLLSRlNXnmex5oL3VBXnlyLNM61qBWxesxF99I8l2Xx0xknvlgSFMKzxPZxb47O6ImEb9BLjRSMZAyk9kifV2h7ac5CxDoYW6Q4ROEgWVERNbc8DDEYW+rTaDTNyyxbLhnehmVDyieu1oqhbXEVi6rbAZAKw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=om0LktzB; arc=none smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="om0LktzB"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-42e29739ff1so152544f8f.1
        for <rust-for-linux@vger.kernel.org>; Tue, 09 Dec 2025 17:46:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1765331218; x=1765936018; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ZxyizG64vEwzuEDaFkLHAUGC22Ga95mcgMsgXFSb9tI=;
        b=om0LktzBN7maPcTtBo9apTpzJ00yEazuGpB1X+5Y4d4Na3hw4rxWfyabaMZKLweQ5B
         uhgqyYUvZKud0rZkf36Huee/V9VHAPRu9b8UpNj28VQK/f6W5F4Yi4UX3EeSAvJWr9us
         OD5Dzo8Wpxm417B39cKMwLcwzZoZEC5iCmaE5NSZqXukRjXWXSEjRJ4MOOsW3To7YMYX
         nI5r+bEkUu3kj327ff5WQ7As7a9GKlZUNZ/mMlIAGGqzI7oBxHaA0bUC2yTPSiRH+OvP
         jb4hDfKu9o5fYnvQUqSHde3B11VZSyr7wFet2AMh+18CTl639M/CVhu70I3PjkY3mtce
         Ap/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765331218; x=1765936018;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZxyizG64vEwzuEDaFkLHAUGC22Ga95mcgMsgXFSb9tI=;
        b=RqMrayhnm/yuInhhP/Pa/r5yRs2vg1JMa5zsAUULPDbwNsdIlvD0PIQf167HTXsUQO
         Iy3+1VT5lreX1WOq4OwRXp9bqCZLGt4Bu+KTAi564YfBHUiR2Hh+4jjRbJSGlwPbz/wR
         SLMqhWj+Ccpf2Lf6Xe3+EAZqWYr4zPp8Pns/PkDjz9LdZMBM9J1S2J1gtf0GCSXY1BuV
         DV0h5xy5+CvP+l1mk9XTKNXifIYUAYa7BTH1QGL12NEtaYoHXqo3R0H0lBLRNL4Cee+N
         umSvZHZ03pJandqkJe7EJvjU7xmUvD40IEgNNDMivylMbbaN/DiVShXvh2u6M2rAU2Ha
         ecyQ==
X-Forwarded-Encrypted: i=1; AJvYcCWrgAg2iRNqIXM0h6Cas6V7KAB/dEo/p/U/IQ0kHStcHJUa4WMmNUOVmqaxa4Ix7vK2ar3Qhbi+IP3x65nz2g==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8iCDLa514Q1HELZ+TTPLdr7BB2hcIBmssk0ESc6CZBuv8rRs9
	C6K5TeQEI0BQ7MzP1jn2OmQw5GpaoTXr5JKLrM2kMSVwSUPQoLEISQAXrzdqPSW74wn/lp6+zYb
	kw1qfiiw76ofNNWKjRclN342EHXk1W1Z0mQWodOtY
X-Gm-Gg: AY/fxX7fkZDuI4FbZAOX3oBB0cKc8sR7DzUUX0QIrdYAcu2CybP0oSvIuA4WGJefzND
	QI4WTXkQhSVYw1+7plO1Yw6F412a1W6bU5pnm3AHZNJ1XxvoRVXJ3ZQ2EUSIiMgYKfdqsn/8Nbt
	rx7RNe6G3b9Jt6BRABQQkc+x6DnPEAcRR/Y1oSMdvEzF8pQZ4Wo/XwqR4fEjO8/YIGZzMOtd9rl
	m2FTz0AnmLBsc7wxWoMDw0v8r6tzFZMdAbRhK2NDMiK425MsH6IjnvAkKBxEk6ABbOvaA==
X-Google-Smtp-Source: AGHT+IEWCFjNanrMXWTusGS2L4DHaaQKpeuRdLOnEjDuhC3HJqDGA1vbSagn8s93CW6yNxtmzTM3SkqvoRGWSUl+4cI=
X-Received: by 2002:a5d:5847:0:b0:429:bfbb:5dae with SMTP id
 ffacd0b85a97d-42fa0857491mr4371028f8f.17.1765331217585; Tue, 09 Dec 2025
 17:46:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251204160639.364936-1-fujita.tomonori@gmail.com>
In-Reply-To: <20251204160639.364936-1-fujita.tomonori@gmail.com>
From: David Gow <davidgow@google.com>
Date: Wed, 10 Dec 2025 09:46:45 +0800
X-Gm-Features: AQt7F2qpEEDf5UTzhtk0k548sAE29zzUqX2f-UMdhS7qtAdYunGFdUOGdJnG6-Y
Message-ID: <CABVgOS=qEKM_0nEiO6gNiHuo2nCY4ro4yVv3MtRF4GZao9Bb0Q@mail.gmail.com>
Subject: Re: [PATCH v1] rust: Add some DMA helpers for architectures without CONFIG_HAS_DMA
To: FUJITA Tomonori <fujita.tomonori@gmail.com>
Cc: dakr@kernel.org, ojeda@kernel.org, a.hindborg@kernel.org, 
	abdiel.janulgue@gmail.com, aliceryhl@google.com, bjorn3_gh@protonmail.com, 
	boqun.feng@gmail.com, daniel.almeida@collabora.com, gary@garyguo.net, 
	lossin@kernel.org, robin.murphy@arm.com, rust-for-linux@vger.kernel.org, 
	tmgross@umich.edu
Content-Type: multipart/signed; protocol="application/pkcs7-signature"; micalg=sha-256;
	boundary="0000000000002b56c506458f343f"

--0000000000002b56c506458f343f
Content-Type: text/plain; charset="UTF-8"

On Fri, 5 Dec 2025 at 00:10, FUJITA Tomonori <fujita.tomonori@gmail.com> wrote:
>
> Add dma_set_mask(), dma_set_coherent_mask(), dma_map_sgtable(), and
> dma_max_mapping_size() helpers to fix a build error when
> CONFIG_HAS_DMA is not enabled.
>
> Note that when CONFIG_HAS_DMA is enabled, they are included in both
> bindings_generated.rs and bindings_helpers_generated.rs. The former
> takes precedence so behavior remains unchanged in that case.
>
> This fixes the following build error on UML:
>
> error[E0425]: cannot find function `dma_set_mask` in crate `bindings`
>      --> /linux/rust/kernel/dma.rs:46:38
>       |
>    46 |         to_result(unsafe { bindings::dma_set_mask(self.as_ref().as_raw(), mask.value()) })
>       |                                      ^^^^^^^^^^^^ help: a function with a similar name exists: `xa_set_mark`
>       |
>      ::: /build/um/rust/bindings/bindings_generated.rs:24690:5
>       |
> 24690 |     pub fn xa_set_mark(arg1: *mut xarray, index: ffi::c_ulong, arg2: xa_mark_t);
>       |     ---------------------------------------------------------------------------- similarly named function `xa_set_mark` defined here
>
> error[E0425]: cannot find function `dma_set_coherent_mask` in crate `bindings`
>      --> /linux/rust/kernel/dma.rs:63:38
>       |
>    63 |         to_result(unsafe { bindings::dma_set_coherent_mask(self.as_ref().as_raw(), mask.value()) })
>       |                                      ^^^^^^^^^^^^^^^^^^^^^ help: a function with a similar name exists: `dma_coherent_ok`
>       |
>      ::: /build/um/rust/bindings/bindings_generated.rs:52745:5
>       |
> 52745 |     pub fn dma_coherent_ok(dev: *mut device, phys: phys_addr_t, size: usize) -> bool_;
>       |     ---------------------------------------------------------------------------------- similarly named function `dma_coherent_ok` defined here
>
> error[E0425]: cannot find function `dma_map_sgtable` in crate `bindings`
>     --> /linux/rust/kernel/scatterlist.rs:212:23
>      |
>  212 |               bindings::dma_map_sgtable(dev.as_raw(), sgt.as_ptr(), dir.into(), 0)
>      |                         ^^^^^^^^^^^^^^^ help: a function with a similar name exists: `dma_unmap_sgtable`
>      |
>     ::: /build/um/rust/bindings/bindings_helpers_generated.rs:1351:5
>      |
> 1351 | /     pub fn dma_unmap_sgtable(
> 1352 | |         dev: *mut device,
> 1353 | |         sgt: *mut sg_table,
> 1354 | |         dir: dma_data_direction,
> 1355 | |         attrs: ffi::c_ulong,
> 1356 | |     );
>      | |______- similarly named function `dma_unmap_sgtable` defined here
>
> error[E0425]: cannot find function `dma_max_mapping_size` in crate `bindings`
>    --> /linux/rust/kernel/scatterlist.rs:356:52
>     |
> 356 |         let max_segment = match unsafe { bindings::dma_max_mapping_size(dev.as_raw()) } {
>     |                                                    ^^^^^^^^^^^^^^^^^^^^ not found in `bindings`
>
> error: aborting due to 4 previous errors
>
> Fixes: 101d66828a4ee ("rust: dma: add DMA addressing capabilities")
> Signed-off-by: FUJITA Tomonori <fujita.tomonori@gmail.com>
> ---

Thanks -- this works for me.

Reviewed-by: David Gow <davidgow@google.com>

Cheers,
-- David

--0000000000002b56c506458f343f
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
PzANBglghkgBZQMEAgEFAKCBxzAvBgkqhkiG9w0BCQQxIgQgeNEp0WoRawP9EFexxraUaGVdGrG+
2PVAYs3CbUcmwhEwGAYJKoZIhvcNAQkDMQsGCSqGSIb3DQEHATAcBgkqhkiG9w0BCQUxDxcNMjUx
MjEwMDE0NjU4WjBcBgkqhkiG9w0BCQ8xTzBNMAsGCWCGSAFlAwQBKjALBglghkgBZQMEARYwCwYJ
YIZIAWUDBAECMAoGCCqGSIb3DQMHMAsGCSqGSIb3DQEBBzALBglghkgBZQMEAgEwDQYJKoZIhvcN
AQEBBQAEggEACrem7thsb6VuZJAIj1Zzbxpuq4F+B11HLN64xyBw8vKJeVy0pAVCFZAx4BWQBJhi
BDNBZV+wAmfdHKlK2b84MA7OEy+mTBQKDy2OhL+qiVJ3Walq1BwRphRS9Z3rPxxZ/rlIk+Gr/Oze
gOdQFOMKjW4Wi6S6PbbKUkIqgwxj4fAAr1XJluPiS+IlcrXk702MiffY/wVzO/piqeutGAMjZsBr
wS6diDTIoX43NEHBpjGEYOc3q5uS2kCCoAWWlfyTXeOXOZMdE1iv5XD0IVVogO//8HK0fz6QvVnS
UnvEMzOdCw36D+NC6OiTXAocI++p+oUE54YxUq9XxG4m+QLwrg==
--0000000000002b56c506458f343f--
