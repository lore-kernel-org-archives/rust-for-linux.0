Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1311408623
	for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 13:28:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781702939; cv=none; b=uO9T2sqMcvd1xpJ1eFg9VMWS1pTDVPgrivzkftWnkIVXvKzo9F5KQleoPvuUqcYKVPdq7QLtIHET5syc/rJi8gUk+xqRBGSN0ZQTjMLB6cxW967mpstKA0kTBWwlmVJiChs0FPb0TV7TK5JEjAdDcDut3aZ3pKUTaaKfcbSziSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781702939; c=relaxed/simple;
	bh=DT/SfVu1raNTf+QcCPueydGtPFXgb4ImBDNRId1NFQg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=uk+lEWmXVIJCwOFZAXOvGWiQBiuVfHkQwiytEdAnDjCqYcuODh42VLKh2GPWtwquiZhn1lokJZrrQQoKz/+rq9B1r4gDwiBc6zPFSzkOmG6/mYH4YPEGN5gM7yYhIPugpaaYy31nJTETlrehYlhzNVElPzy3hWNBD5e4zJBZnbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Jcx+M93A; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Jcx+M93A"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so39592875e9.0
        for <rust-for-linux@vger.kernel.org>; Wed, 17 Jun 2026 06:28:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781702934; x=1782307734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=po8WtOITJfbEGYTYX/+2jWNreDSLIEwOM2fWXbXrA1w=;
        b=Jcx+M93A82+c+nWCyoqoahdZiPOi1S0QQ/Y8E53xE9dIHhlugGuU6yyIzvS7tTNCsk
         7VKNdc4hw7wzVaxHgnm/AFr65Zcyl8QWrkxv5OaO778U6lPdgHsIS371hK9B4mdz6NxV
         iA9+L7dok+y5cWsjoncftGBPqZXPnPmSFA2MXDAu9u2NFO2TQ2Ngr6rohu36yMgvrH4P
         gx/+vA6pvwWi9+hAzF0z9y+fkrfY6HKuEVHDX02rw5VxdhTSSDeq6HVqaeZP/UIH+tq4
         oSOy9QvnGdqipsavb26KodoAkGVa+uUM0Pa9Cdzp+I5z304Efa18A9oikx9Oudltkt+q
         mjbA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781702934; x=1782307734;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=po8WtOITJfbEGYTYX/+2jWNreDSLIEwOM2fWXbXrA1w=;
        b=cr9Ozq96sZ8R1m4JjoCZlzuvGBjroWI6WYwrQlBWGv9SwDCenJf6GoFa46d+77778I
         Ez01Cf8voQDVaqCax3fRxO/fjcbQF7NENQEc1mhlCCVce7y2QTsW4LZnqjNaxCaY/aQP
         WNAT8dwNgB4f+V3Gz7EY3uwetHktgo7hOEqMZT+FlqgIsvlTKg7F7B32X4xdgXgy6/dP
         xu24F8NqJevDX7AgulpUSAiCLQZ1G1UlUDaPPgYGHikQB45BKTlzqbTInk5+TU2VP6nA
         /BSZZV8EAYj7ivggWN2HGxJgp21WV8qsHrQBL3WAIZs0fy0NpB1BAhOoz50bUdess8jZ
         tdRQ==
X-Forwarded-Encrypted: i=1; AFNElJ/kQyuzOhQaImnd9LEbiHw08VvAqqtaIZFxGpei2FMwqePhMhdr43pvN8A92x4OY5UHgFRJuSwdZUlhG9tKIQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywf7ZIDhHCvCUcR9FCN45UPaQadfHEMpt5iH2jP2bj4Aq96yv7s
	TjjTYlZE8eYS1x2e1u15VIO261cV4rSfOwSwE9WMzdUkUt6QlXHL3Rm2
X-Gm-Gg: Acq92OH6qelxC3PyIdj+BI4lI+Cp3ZCAa8z2+9wyrH5vEYPY8sxBPcee6zP1UleQO5U
	ZvYK2AxWCghENPelCVM9VqMvoVo2Y9bz3nKWDKF4duQ23/C2VRSaK3RkDMq84mO7EST6LmFK+nc
	w+jC/iaaRP1ItqUKj+DR9MkCko26h6i5JZ8POlDoJ9DakDOqNucRMrFbZaQ0CZb2UDmKAAPXoo3
	chqWlYA5/nepyTlrZPzWufL7Fbi67IzfW6mS/alV5z+j7fAqqpBIbUWawttWqICJ16fbA5KUp/a
	9qGlMSWFbJnhssbjuxj4G0C1t0ZjXsqsLEMflhWz400K7hg3zEV284phdktiCNY7yi/VOH68eXc
	d5xDBVYiy+9hDlHH6+21lDSq8m2yi0oUS46eqIYmdv5kBXvBNH3XGFUAVxPk1Vcp8V54xkNvWGh
	bNIx9i2+FPu2RxV3Xoe2jipuhC8Ovc2e4NE5/xxAOsDUD7sxzFqapG
X-Received: by 2002:a05:600c:4e54:b0:490:d32b:39d6 with SMTP id 5b1f17b1804b1-4923412f17amr53648445e9.19.1781702933455;
        Wed, 17 Jun 2026 06:28:53 -0700 (PDT)
Received: from [172.16.16.38] ([195.100.225.50])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49230a4ff67sm159911185e9.6.2026.06.17.06.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 17 Jun 2026 06:28:52 -0700 (PDT)
Message-ID: <6d77253b-d628-4aba-a820-13d1757698a5@gmail.com>
Date: Wed, 17 Jun 2026 15:28:51 +0200
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] rust: add procedural macro for declaring configfs
 attributes
To: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc: Andreas Hindborg <a.hindborg@kernel.org>, Breno Leitao
 <leitao@debian.org>, Miguel Ojeda <ojeda@kernel.org>,
 Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>,
 =?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>,
 Benno Lossin <lossin@kernel.org>, Alice Ryhl <aliceryhl@google.com>,
 Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>,
 Jens Axboe <axboe@kernel.dk>, Luis Chamberlain <mcgrof@kernel.org>,
 Petr Pavlu <petr.pavlu@suse.com>, Daniel Gomez <da.gomez@kernel.org>,
 Sami Tolvanen <samitolvanen@google.com>, Aaron Tomlin <atomlin@atomlin.com>,
 linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org,
 linux-block@vger.kernel.org, linux-modules@vger.kernel.org
References: <20260612-configfs-syn-v3-1-3292fbc5cc32@gmail.com>
 <CANiq72=RX5V6W+1tj0GHxZusrk5OqYbZ5-xV=wvSssrx_CWXAA@mail.gmail.com>
 <75552e2d-0bc8-40a0-b783-fba64482aea9@gmail.com>
 <CANiq72=fUuX7fF1=AQ12ahYHwW7k2i28Hkpo0TtUhwV7qeojQQ@mail.gmail.com>
Content-Language: en-US, en-AU
From: Malte Wechter <maltewechter@gmail.com>
In-Reply-To: <CANiq72=fUuX7fF1=AQ12ahYHwW7k2i28Hkpo0TtUhwV7qeojQQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit


On 6/17/26 11:32 AM, Miguel Ojeda wrote:
> On Wed, Jun 17, 2026 at 11:13 AM Malte Wechter <maltewechter@gmail.com> wrote:
>> As of now doc strings are not generated for private items in the macros
>> crate. I am moving the `parse_ordered_fields!` macro into
>> macros/helpers.rs but this means the doc strings are not generated for
>> the macro anymore. The `parse_ordered_fields!` macro is a larger helper
>> function, and the doc strings are relevant and helpful for macro
>> developers that wants to use it.
> If it is private, then it is what it is, don't worry about it --
> developers can still read the source code.
>
> But, yes, having a render of the private items is something I have
> wanted for a long time, but as a runtime toggle, so that it is easy to
> go from one to the other (and without having to have 2 entire copies
> of the docs).
>
> Please the entry "Private documentation (perhaps as an extension of
> the private items/fields toggle)" I have at:
>
>    https://github.com/Rust-for-Linux/linux/issues/350
>
> Upstream `rustdoc` implemented an MVP of the idea via CSS/JS in this draft PR:
>
>    https://github.com/rust-lang/rust/pull/141299
>
> If you want to help on that, then you could try it and leave some
> feedback there! :)
>
> Thanks!
>
> Cheers,
> Miguel
I will leave it as it is then.
I will try and look at it if time permits :)

Best regards,

Malte

