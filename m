Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795200360;
	b=WfvEHGhlCwkyS4lKtIw3CZhR6E8pYDOtlCrvR+xd8/JFD8dhaCERpWdqIn2nMi6BwW6/
	 WcLtkXYAUYv+pphYkeu8zGQaSyze7qjo1CxO8NtRPL32G3SoQ3bpbVcgcjzsAwCt0Xmcs
	 7L/IKP2kg/a93sht+tG3tClDEjmWSUpBi9Jqjj5CF1JojzhPk267i0B8mzEIY/usYv4D3
	 11PW3YR2wnIZEjY80zrvp4i6dCn90RLpU/TblMeEagCRldw4hv/8cBGDywadUb14zlJcE
	 ljLMv0r53PR4A5yMUDdzdIWuvD0TSaCCiLhK1KrlQqb69Qd6+riolEbLiaSMqrgip1Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795200360;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=ab2WKF3CNXfTZyz9NKW9q3y1iw74bqSwUakeNqE+vmY=;
	b=m4YWGxee/YOtyJFWifDi43f2YgwkK8ZrrL3NPWK2SOpu/iI1z4JqtgF+lk2tq7YyXzdg
	 LaiufeCdu6NBLyeq1LI0VBnWJh8vFILi2qyEcyI9pNQogT8aaIqrhg+Tqi9O4Q2v75c0r
	 GmnRdtPLsU/CnhgeAGm0WWoBRHHqbCC7Z0nO8Cb3f9B2/aLYDNmoyIhNfCtczXAn1UQxX
	 FVR71Gy60A/W9Ik4Ad2KQoTfSQybPW00RFWi8fJIiJVjPkIFjYK0OuxG8Trqh7/pgR4vE
	 /w6S4PnzIcHRb2V0N9j5qAvufCCb8FtNzPldz/fcMCG69TjxhrKk3ab7E81oqNYnqLA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdteQVP1;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.167.41
Received: from mail-lf1-f41.google.com (mail-lf1-f41.google.com [209.85.167.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8450A60A2625
	for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 18:45:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8450A60A2625
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=SdteQVP1
Received: by mail-lf1-f41.google.com with SMTP id 2adb3069b0e04-5c09e2ed679so88232e87.3
        for <rust-for-linux@vger.kernel.org>; Fri, 20 Nov 2026 10:45:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795200358; cv=none;
        d=google.com; s=arc-20260327;
        b=KjY98Cwhl2tstlEqeokeg25kvaOyfCw8V0Vtv91w6rDsmnYwxigjJEJYBtMhr5Vmpu
         B4cVY/sNmj+ywSjTX8CjDs1qMt19xHf4vTOCUI7gsbSib1DRmkbpWj/ZKB9C8Mys5AL6
         tsHf9cNb15ESFrinFZe1+QVrrUXD0DMn2aCky1n3tEHSkezCk69CV6xmkrE0t0OoqKbW
         E4LHAevTCBiRphthViU64vkPi8ruailG7LlKnflRnQvzwviaQEA2aiwYG90UZJ2pk2nW
         22cvppSWAXyM89k41xn8KtnESf8aIzxhZoqosY8GAGH4pZLZ4wQp5KmWXiXfHxRKEsiz
         Pkxw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ab2WKF3CNXfTZyz9NKW9q3y1iw74bqSwUakeNqE+vmY=;
        fh=+8aWI/eTYCFta8UQrP/0FdC36n5pjdRtWAjxp08XmNc=;
        b=VJMPeZxKPUtGl4yQNV104q9e+SXr6X4tzR3WkSwcwdXYYKz0MJ/ftF4nLpbEL6ugCD
         5Nu1xp2Re0dNRJjRD75ryq/3DZW67q1amR28YAU5L2C7UHPofNULbQhB7qToEA1Gx+Yj
         GdP4X0UlhpwA3B4Y2FwYSCzT5UTgHgz5tTl7+P1dzM7FwVn8K0DITqU9MVKhoVMlvmcz
         YVyMjL9prsi9TRYB6O0fFJ5Sl2RP0eB1gochIxyLTBLEiPEFXaqeuzRzh+5tEMfIKbkh
         Ryi0L1zPEVWFcouEMD13Tt5Wx3RZ1yw17GGvXbJ6MdgV5uud1c+ZBRDeZpEf4/oiyC//
         Ua4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795200358; x=1795805158; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ab2WKF3CNXfTZyz9NKW9q3y1iw74bqSwUakeNqE+vmY=;
        b=SdteQVP1wc2aLcSPJpfhAs2JNsXpmBQ9M/W0fC6nfx4jAi3L/wN5a1DQoAgTrBmUWO
         YjwLD50NzGAjhzpLi49S1SRUPhWLsyFFzC7H7dNTa+hcrx11MLyHD+pBvcjQNu4vnD6o
         xuf4VmcE6Dokv4P1ilTOYNLqY7EnNSeYiiFtYWeYJWiDoZ7Uq+kWdDQZDczzkSqd1JoK
         knz+e5UbF0T4zMegfyUXCb8LdiIVYViGseG3afbyJntiun5eGJKtCjLs8J4QPUznZDFt
         5MTP6WzTyOdgaH59YcicLtjwBWhkCxAy/AcdbzL+Ks4kMxSsb08uzA2F59pr3B6Qm9MX
         LkiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795200358; x=1795805158;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ab2WKF3CNXfTZyz9NKW9q3y1iw74bqSwUakeNqE+vmY=;
        b=jLX5pSWTlJ0lqquXaRZWjpv/RRM2Isy1YMD/mIEpaWfrMU9AIAMUL8D6fam53Wt7ry
         urEjsXG4edBE9eWhTFavv2h90kG7Tz7NVb5Bj607yFH0ptpj61MS+fs/2YokaFHOVttZ
         So9/6+eVwkics1uRvz7XGtoFdSZ8PIuqz7e5AO9GdoLIztQfJMINbTAeWaAcgxH3xd8j
         8f7+VQVrnaTkk18efgELUFyrdd5KfXRGUaMkSbJT86uzN1ufXsUUyaXHgBjGzFIXsDZM
         BUT8WOjjd2hPa0HqMXZdjAqPuH6iRJiYt+G+Aoph+7APQJFydGbelMvql0la70KyJIBd
         kcMw==
X-Forwarded-Encrypted: i=1; AL+hErFevlodPGAwI1Yec4DKcldibnlQlJiDbmSKwpln9C0nYF/1rFq5Zkf10xRmQ1qO8mWSeLEuEfWatm5UiPSx+A==@vger.kernel.org
X-Gm-Message-State: APuU4Z9yjHjzXyG86GvfFUWPTz1m1AUo5WY+pIVxAmurg9grDN+OsOt9
	92jleFWz8OcMHef5fGVLQvecDVHfD1Vg1GY1XMXIKFoZZTeYdpvtmPn6zVSPZQRh59UB4qeOrfQ
	HHmshQrHIJ7q+sO2Xmxiu+l3yZjtOPq8=
X-Gm-Gg: AZFdTZe0Db3r2tJUtFZ1P1I2zagF+YHf2uC0KLXEPPFApJUFJgnJFRQzw++vKGF3uPL
	TYX3qCggCaXfYeGGpqCU5HfDolBM0N+tlDfxdvhqp6FLobbvvYaWzv9km8lDi/ypvw3BQ523acJ
	+PKiXaaKnUtIboa+P1lzacO4PfUxujpLMQ3ozD9P8dEAu3Uj5t6v9dUwIQKnRK7bTLBdcaWPDX4
	YJFfCiMNwymlosHxHMtNyncosg0kdK2jNfoUNJaZ+obF12ys9iS96rYww+AbJNDpPf1aKFXuu7Q
	WIVe9U0Dc+fvUZ2ecljFKv9FFVU8TLHnLYb6h1BNP04c62jkn/cJ5sLWd8WtAIcUsaM5n8DQncZ
	GnpF/99W8bCwzzU1zORgR65q9CKckJ6Q46q8IguVh9hO0/4ahkJxioHDK0tVhUjiXw5kg5dZgwe
	uGJWgRwU7G5MdtfFigTEdZ4oTV+2CMSWqvFMwB6eMRAzsKDkkcqoVrlNH2ScbwKhc7rMvUimibD
	3snUhSzIIWqZuNx3WVlEkx0IAbTWFgDCjAiWXrQGyCSNdgeBF6WjQb/+l0z9MXwYWzLMlJ+
X-Received: by 2002:a05:6512:1394:b0:5c0:da9:407b with SMTP id
 2adb3069b0e04-5c1bc8722ffmr1605187e87.5.1795200357287; Fri, 20 Nov 2026
 10:45:57 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261118-dev-project-vis-v1-0-2a5f433bb516@garyguo.net>
 <20261118-dev-project-vis-v1-1-2a5f433bb516@garyguo.net> <CANiq72nNX41q_ZLOUUbyPmPownON1uxCLh=RXsVGBjFmoWhSBg@mail.gmail.com>
 <DN05W9TA9SKZ.172IM0Q6N4DDW@garyguo.net>
In-Reply-To: <DN05W9TA9SKZ.172IM0Q6N4DDW@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 20 Nov 2026 19:45:45 +0100
X-Gm-Features: Aa3M54pg1aTmmRQX6L9Zt-MrnOUgIeFO2A5VFJcAoQAyNOHHDn1bRTNs_uU1yMQ
Message-ID: <CANiq72nAyQjoEuGiqHdtrOBLHvZTN8S1Ae8O-EAUQ9qghFaPeA@mail.gmail.com>
Subject: Re: [PATCH 1/3] rust: pin-init: internal: allow `clippy::large_unopt_stack_frames`
To: Gary Guo <gary@garyguo.net>
Cc: Gary Guo <gary@kernel.org>, Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Nov 20, 2026 at 7:34=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> Do you think this is worth taking through rust-fixes, or are you okay wit=
h this
> landing via pin-init-next?

It is nightly-only unless I am missing something, so pin-init-next is
good (and given Linus doesn't want less important fixes nowadays
during -rcs, probably it would be best to avoid it there anyway).

Thanks!

Cheers,
Miguel
