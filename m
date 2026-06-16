Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91FC0364021
	for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 12:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781614476; cv=pass; b=AdQT+tE7zRqUlyHC3K5eS5qftWRXBdsUp7Vcc57+VD85CNbOmPj6G68L6Ld0HjrnxDIVwnOSMGX1uumdHmRuowM/b7H4mXA52s7G1cCeprglpb6JR+7CmDywPweCxFi3M7GZFY78Zuh0JYvfIUkWKGxLhYR23uWucg9bMQFYheo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781614476; c=relaxed/simple;
	bh=InmziWOUA6RgIhKs34TIvIzr4LKXlUkLbezJpZN7G08=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tOyuoLE9xHjcFLKmREno08+AMtcvSKafAVvfWXs53DHPXyNVSOrp1Vc01vUFcz7da7HvHvkNSQRtFbkGGR2Mwww746LuUOcW1IV5TLfw/Oo3gjmKXnfvRdrv+zCaJgTeOwkhB+n0j3fViGGk9lPRdtbo5c90np7EWwJq0mmaXzk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WdgBpkMb; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WdgBpkMb"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-304e86ecebfso347795eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 16 Jun 2026 05:54:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781614475; cv=none;
        d=google.com; s=arc-20240605;
        b=KwjAcPpCW2pkS2BvoKzN8SMzg85UMSPTXw7msf+7KJpw050TE319gnJV4B7IV8O5dK
         5kA0YieSQw353yWV0wnlvQas3F0xo5msrx/QWlQuPAeJT2q0C0drIHoPCJXQJzFHClR0
         5QTFzZ9/5alGqwv9xiBsZkYGZ47z/XVtOuoP74xf8kWEYSGck7yHNX+jLyLT1uo8Cy87
         lCy9OMq87X1G3vptEpojuk3Xnx1vZElOUGbMrFcg/aQOZjLdIOK6iQxMohNVo6yAdT/T
         YVCz5klTOQeTCVWi4TzpK1v88qX8JF7GIamC3pUEcT444bx8yXpFO2zgV7iwl58ajV0K
         n5ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=iBUWtL/iQ283W2M2w5jq5WrqgoMyf5cjP4re7CLhzjY=;
        fh=3BBvaoiIfpbODKPTNoiEo4N6roL2a4Ylc5Ueb/PWVdI=;
        b=T762eTnkO49aZS0wb99iF3ChNAHPOej3PeBYkuwgIljJp0U2Oz3SMcsgLHO0hVsl8z
         oi4RneV0xu8fSgB5X/ZGgtunWP+d6J6Ku74KRHeTwZCjtyWU8M8LKc5V89UkBuL+LiZA
         vQg9s/qeaCtuTjXdKC1DNXyDjhFsVrTMO3ctR5U9hUUD9C8tG0kJBnX8/nKTSDazFMou
         BgHNHTw84nyJOa5/M7hz72ErkSrkt+gd9o4mq9FtEIccDXJZktzF+6IY4V/kuHQOyAZi
         /77UW3sLKwHjDgDch3yrKLJQQXDbOkMqP+Oyg4NzLI3J2APUQCvkLCLnOD1CIjEtM+qs
         0vAw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781614475; x=1782219275; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iBUWtL/iQ283W2M2w5jq5WrqgoMyf5cjP4re7CLhzjY=;
        b=WdgBpkMbxZ19IY0TDu6GO8l30958Zke5B2+joleZsKRJyT8HLb11yVtwJc52+lEKCQ
         eoAhVCSGFirVXGxZIiGIoyo7m9NXXg0dZBL3AW8wea8EUZZVLdLK7ercN0GiIEx1Hbhz
         Kafy0e8C+gL5taGYcE1Th9mAcXP7nSoB4q3M2SAnHvCG72axhjwhtdSqLUbbyzLcUodn
         Vw1piaYXjLdOCcWHfU5PG3P7ARyP5glz36lza4RUv4nC7JtSKm8W+WX4uAEtQ+JnyTvH
         RUgBKQ6KPUbRsvm65bKHABe2rpmSe72CkJNvAYbXg/GpMuCtF65XGaDQNkD7oLFc05FE
         toiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781614475; x=1782219275;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=iBUWtL/iQ283W2M2w5jq5WrqgoMyf5cjP4re7CLhzjY=;
        b=s5jQTrSKmpOKD7tooqRK2uQ30+D0HuLNc0cMSrDfmo8Ge1+IdZoIwdis0Y7d/3V5hi
         Pujsy2JFqgLvQwToDYsK7ISatjAYQFv2A16SrQaxK0f7DOTcbY+5G+n8RzP2lzWuQO7s
         SGvz0/hdffPeJxB1ZSwgfLBLgNKMP2k/Cx6GrqlRkq24ie8D0jX3JsTCYEHbzA/mnG/q
         0x1PX8zRy3Mha6B8qQaJJ3Hs81wbR6pk+WbfMyum3VREGQwjc9us2VURi2Eu7m/bJ4V3
         wXKuCmRMrFFDDYUDXi9V5OvGkU9R0fJhMw998zqNbAIbFZ863HR881Zsl5eHMJcbHfo1
         uhtg==
X-Forwarded-Encrypted: i=1; AFNElJ/JUUHHFNWeaCawyPQoDnxC2rBPP6W//WCFBxs5A7JluXifKcpAB2YiRH3RcKgXPO9Gp5jFI7yYyEH8cgB8Pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwlBo84CybJiU6c+3qWlzU3Vg7FC0WckVs6/bhtsV+wT3jhqfB2
	HSddMzweIY1ns1JnUyp1oVwL+ps5sP2ZOs1q8B4jtH899XqcJ0g1NmZ6lx4i6EdfhswrrqZ+Xug
	B2fnqcS+VACvUBr1l3TlAqPs5bAkRHA8=
X-Gm-Gg: Acq92OHcrqfoeUYjLYBRSryzosVj/5IidYqoxJ4U+kBlXqQERkRPJZ1ptddyqZsbjGu
	wnl15Ot/nipup4wkMDS17Zzic+6o9ybPNqyBCMgtl+M3SLNoOIZCkqYvKemT8BRsUxoW+HOPdmo
	wdwhEEfWL9Vjrl+3BI1KPXufmslSP4nkcVFhBYZNN+BK0DaNu/h+ZisOgSyksOpzOjOYu0I/Qhp
	cX8dTrAmGY3npPBNZi2sd9//Ux0kTW8pEoVh4ATD2JECrnCGV3biNIbdvVsDXSUItn7WOKvrszJ
	aQzcCbz94jqD5kIe5YsbXqUeK7C7q7M/TI1BxWhC2zr0uKw/2YbIqN00BadS1B+gqjWLkWoUgfp
	q0LpICgyUUCg2hVmGX/klLWLjXez2ekSBZA==
X-Received: by 2002:a05:693c:63c2:b0:30b:ab02:9e5d with SMTP id
 5a478bee46e88-30bab02bea3mr459608eec.6.1781614474738; Tue, 16 Jun 2026
 05:54:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260614-b4-rust-pci-edu-driver-v1-0-e3f2471b595c@mailbox.org>
 <20260614-b4-rust-pci-edu-driver-v1-4-e3f2471b595c@mailbox.org> <af210580-4c41-404d-ab27-f8af634bec19@mail.infomaniak.com>
In-Reply-To: <af210580-4c41-404d-ab27-f8af634bec19@mail.infomaniak.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 16 Jun 2026 14:54:21 +0200
X-Gm-Features: AVVi8CdDt7BroqN7LKaJMAbLNGNuWkXQvWEn4edY7w4TprAGX75TyBjazcadRjM
Message-ID: <CANiq72kMu_0fGtk9VKK1ViOGeqoYvNJ9wTPt5WL4D3jWSEo4ng@mail.gmail.com>
Subject: Re: [PATCH 4/4] rust: samples: add EDU PCI driver sample
To: Ewan Chorynski <ewan.chorynski@ik.me>
Cc: Maurice Hieronymus <mhi@mailbox.org>, Danilo Krummrich <dakr@kernel.org>, 
	Bjorn Helgaas <bhelgaas@google.com>, =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Tamir Duberstein <tamird@kernel.org>, 
	Alexandre Courbot <acourbot@nvidia.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	linux-pci@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 15, 2026 at 12:12=E2=80=AFPM Ewan Chorynski <ewan.chorynski@ik.=
me> wrote:
>
> You can replace the if block with read_poll_timeout(...).inspect_err(|_| =
dev_err!(pdev, ...))?;

Hmm... I am not sure why the code explicitly mentions `ETIMEDOUT`
instead of forwarding it.

An explicit early return with `if let` would look fine, and I tend to
expect `inspect` for longer chains, but it is true that elsewhere I
see `read_poll_timeout` being used with `inspect_err`, so it looks
like people is fond of the approach.

On the other hand, I am also seeing:

    let _ =3D hal.write_sysmem_flush_page(bar, 0).inspect_err(|e| {
        dev_warn!(
            &self.device,
            "failed to unregister sysmem flush page: {:?}\n",
            e
        )
    });

So we may be overdoing it too.

Thanks for reviewing!

(By the way, if you can, please remember to trim your replies, so that
it is easier to read in e.g. lore.kernel.org etc. :)

Cheers,
Miguel
