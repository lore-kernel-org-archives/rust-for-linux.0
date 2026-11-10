Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794319294;
	b=kyrzjdutF62J0zp0dCPh49WFOO73EnoV7L/NL13Ri0nBk2Cna/pADjgWNkz+AElFNhmI
	 Oqdfgd1W2LZZoiWSHnUC+3Z4feJDrP006Vti7igk0ayE584PreGJ13XH2tiD7E6svIPen
	 iZdf6lUUYnUKaxT9Iw5vqCBGJt+ETJlkwHClN0m/eKzRxiq9GPmBMXxC7fx9NLVTL5xJq
	 +eN2AOHSkzq/0xwNnvjP830rCOErOc+f46AAEVw/NGQAbeKDp3oj+UD5wXpDci+9uDEVA
	 tp9FiGB6KJmifGVO6YQQgYAaD0I93roxnf0gqz8rDYUR8qXmeFeBtyDVB+K/8rt6xFA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794319294;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=dzL2O9u9lvgeBqAv6vGz/+0QxE9ZrTfibOxIf9XsrD4=;
	b=mzaJ04Q4wB6f7Vmwj2iMrBIiJq0zVzyqt6KyKUd36xEBTZ9kRwLLTkim4jh/H/PK7YkV
	 XWP6OcmOxzMBRJ3N+8DO+6bYCMrnI+9gLo6NOjFTqXn1sMppo2gIxQfyK+z403lzLcGrj
	 uuoTDgRzVuTIwAmWk/rSbiJ0gM/LzJLXhFIg2+XFCDgATJpXzOov3lpfj6vwvPlsuKHe5
	 v6ThoI5axPB/voJq9wNYZLNIQOyi058v9xZrmYsPqlMWXnLHLweVjHqb0dVesB/OK1Jgt
	 H37UkQCLGXHIEcvBW8tk8O8ePZx/eRnTrCzddb3xv6XiqKOFvQvuclG4880PElyobEQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHQJdOmE;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.182
Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7AB3606A326
	for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 14:01:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7AB3606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=vHQJdOmE
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-3ab1bb9666aso1709971fa.3
        for <rust-for-linux@vger.kernel.org>; Tue, 10 Nov 2026 06:01:33 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794319292; cv=none;
        d=google.com; s=arc-20260327;
        b=LfslRkd7byDl297W/A239eYi9YbJyi4dCdn46yuO59pFxc5N5rwG2MsSgMpzSCl9sO
         vjbR40uoNxmOameV9lJlhT+2C0tGW7hxDLymOQq0tTl9drcN1/IbU5TVTUrGwCJUjEdt
         UltzgX8mNJ8uCGbWGRlgKPM+elQg0FmRJPZi0jRP/gWj9YG6qE+pR19yZIxDnX8YAfkm
         sMf9+aHhplfcJ3mmHK9o2By3Crm8nIUx+vHSULKJB1HZFZN21a8VK4d7QnnwlPya5a/J
         hH+IAukvCPKaf/dlNMMrrTmcsyiB9DE6JoGv374JriB7aBw//vw4PpQvn3VvM2dMxr3I
         WsyA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=dzL2O9u9lvgeBqAv6vGz/+0QxE9ZrTfibOxIf9XsrD4=;
        fh=TYnoBIGOIJwFIC5GPi/2qzXHcRbXt7AsUSWYu4niuhA=;
        b=g9as6s+Gmu58SxOzZYEoSLhnGPmBvpoTPU9N32TvpbfQfoegUx1Y+2imkjzJksCqyy
         wpGARubEfOYL+DTUtAboElrSoMAbDE3kCk9ITyTk9xN1GmrD4ev0Ts8xlLTd45AlgE+7
         YCFUWgytXkY5tFc5SmGXqXQUWpJOES87MDDM7A7y6TDcWraEKIyHdAxWGuQC5NVtKbna
         lnSOH+QjM41oSRWpW4dKKQZbv7+Yw1AKqYtpgiD0aQu77r3P5IDko02/XhsRAG1yt+z7
         iUNq9pgdePUGsKn/7OTCwS25bms/sUCk7ss/+mPYfbtNT6S65tnHnqNZ1G4Lcj7a1Mvb
         1yww==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794319292; x=1794924092; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=dzL2O9u9lvgeBqAv6vGz/+0QxE9ZrTfibOxIf9XsrD4=;
        b=vHQJdOmE7N99ngc9GoHAnY4XLWpwuSZ3cwrSpmt3XwmdlNzQ8CClhnSQh9zqWG3jcL
         xgJHBB5aq2uFX76Xwmk96UBQ4Y+NplELrVa4n5Bg7U0AdHFWC5CHBoLvv30ucyjs5X+F
         FhF/WYR5H/qiu97lauKnvnWkN8YYGTpEHdR4y0Ur+5RC9dRUG4yT6SUdOjj1u92/8M9L
         aDpD3LHIap323RzSXqWy3uJ+56pURPRZAx6NkY2Rem0bPOqhgpW1d7cTHbmpT1GluNvy
         7k9bwHjSyZpAUWyQ6sZRsNmV4b6iqlXR7+N3LOk2OJWXrXYViUWXzT4Phdj//LTK1iws
         1CkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794319292; x=1794924092;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=dzL2O9u9lvgeBqAv6vGz/+0QxE9ZrTfibOxIf9XsrD4=;
        b=mqHRAglJAoLYSE4pEHI/rhVQ+fNAWAw73nm0q62Q/J87Kt7gl8UDAvvPWz+wp/EhXs
         6H8SLzEbilim4Tt1aLlKS/vr3ISm1131czU6oiU5OzbT8mQuQm+EIuM+7uzADRv7USP4
         hRrYxWaKqNntuslQaht4thRmsXAUAiTsAuyWM31YaFYkbqpZQ1EJlnSveBImKgLYJ1qP
         aJQJ1Uo+SFWLUAT9TtGyA4wPxh7VCzGY8fnaBfwTBaCHSRwSKlo8r/XQIhigSOOovXmd
         hLp59Tiu0a5La7jxzOcWECoT42Vkl0QLhLxpQcoW8c0kDjUO4CbJ1y/KhADm1UGFCVnN
         Ht4A==
X-Forwarded-Encrypted: i=1; AL+hErGK1NF+6My0hcuv7p3ax4nuGhOVsi5aBssY55dgZNAEz0eFFz+ogtTh1RuLwJg/M4c9vhw+AcDDKoDuvT0q5w==@vger.kernel.org
X-Gm-Message-State: APuU4Z8BmwYcTMLQkxWlgCDo/LmjvNWou3Jn6uZrRpuYzKa8EDnV3BcQ
	yvq84+QvkLRDkWtetK0syrzdP7Hj4s5WL5xfG4Xs/L4/Dw5aevrh4NHY9DAwqkQ0K8aML8SNOy6
	X98urfsEHkQIQhwjV+DbdXoQISpCu10A=
X-Gm-Gg: AYBFou2567Q8rK01Oax9b6bHhSFEQ6WMPLH6irg/HUTo+6a70Lvv0rSMoHjf09IRWhF
	yCCY5EIZTgCqJchwnGe1xsr7tx0S5RoYZSUEdbO96bCmOJyn0TepR6xRmk6X3YSLvDCMDrmP+N3
	TrdyKWs2dtlor2RCVmPrOpWg2hN2uz+W/Yd3i531etQS/xxR4B8HTfsrv/bGWzwhOKFUS/dKED2
	BK34rHNI9hfwXcq4YZdvOXFtLmurzJ5sDwW/4L9xMFsGRwp02GdJclQL4gMIbO1b+8PnORNEQNg
	XHIFMs5Z2Baz1+/Ptl+Om6jTUhYjvHf/Wt/SY6D5EJU3wvIzll+RfDaZyvXQixByvzgKWGVN9uY
	Dah4wCQxGbiytrEsg12MV6wifWfBL86qmt3fjA67B0Weu3ndGOqeSU52jKbyjUjSmlx/GWJxSJb
	t+NT5jCPRPP9DZyEoOQcjlJn+9Vnw19S3f2XGRXUYD87+s0POw/JOU4UFDOlkJsACTQlozed6eY
	ErEi37TZtUNtRPZZUBbB/7VgzlZ6U9/u0Y=
X-Received: by 2002:a05:6512:8348:b0:5c1:5703:46ed with SMTP id
 2adb3069b0e04-5c1570347a1mr743203e87.6.1794319291749; Tue, 10 Nov 2026
 06:01:31 -0800 (PST)
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Post: <mailto:rust-for-linux@vger.kernel.org>
List-Help: <mailto:rust-for-linux+help@vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
List-Owner: <mailto:rust-for-linux+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261029-rust_kunit_v6_send-v2-0-5ce551efc48e@gmail.com>
 <20261029-rust_kunit_v6_send-v2-3-5ce551efc48e@gmail.com> <CANiq72ma7GrbeMjktpWzNwWYj5y+AsQk8NROKY6TMdk3fwXEgA@mail.gmail.com>
 <DMRKVJYRSG2B.2LT5AVK5FQ52G@gmail.com>
In-Reply-To: <DMRKVJYRSG2B.2LT5AVK5FQ52G@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 10 Nov 2026 15:01:16 +0100
X-Gm-Features: AclHuK-FOwKiNXD6KSO1bPkfXxfGEuimosgCwy8tkCUl0DXr5tJYqmZdtl8uISc
Message-ID: <CANiq72ntU+K7JX126f3fhvW2ofK6yNDEn0RkE=r25To3cDaRMg@mail.gmail.com>
Subject: Re: [PATCH v2 3/3] rust: bitmap: kunit: uncomment owned_bitmap_out_of_bounds
 panic case
To: =?UTF-8?Q?Nicol=C3=A1s_Antinori?= <nico.antinori.7@gmail.com>
Cc: Alice Ryhl <aliceryhl@google.com>, Benno Lossin <lossin@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Brendan Higgins <brendan.higgins@linux.dev>, 
	Daniel Almeida <daniel.almeida@collabora.com>, Danilo Krummrich <dakr@kernel.org>, 
	David Gow <david@davidgow.net>, Gary Guo <gary@garyguo.net>, Miguel Ojeda <ojeda@kernel.org>, 
	=?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	Alexandre Courbot <acourbot@nvidia.com>, Andreas Hindborg <a.hindborg@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Burak Emir <burak.emir@gmail.com>, Rae Moar <raemoar63@gmail.com>, 
	Tamir Duberstein <tamird@kernel.org>, Trevor Gross <tmgross@umich.edu>, Yury Norov <yury.norov@gmail.com>, 
	kunit-dev@googlegroups.com, linux-kernel@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, rust-for-linux@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 10, 2026 at 2:50=E2=80=AFPM Nicol=C3=A1s Antinori
<nico.antinori.7@gmail.com> wrote:
>
> Yes! it was to match the other one. Since there are more tests the other
> way (#[test] on top) I can change the one I am uncommenting! (kunit.rs
> have also the #[test] attributes on top where a #[cfg(..)] is present).

Yeah, then let's use the existing convention -- that other change can
be done in a separate patch if someone wants to do it.

> It was on purpose, I thought it looked tidier separating it (but it is
> just personal taste :P, gonna revert this in the v3)

So we generally try to avoid those unrelated changes, though sometimes
it is just easier to do in the same patch.

However, I was asking because that removed the line (and you say here
"separating") while later you instead keep it in
`owned_bitmap_out_of_bounds`, so I assumed it was an unexpected
change.

Either way, yeah, it is best to not include unrelated changes to avoid
confusion.

Thanks!

Cheers,
Miguel
