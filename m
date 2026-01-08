Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B2332D0C68
	for <rust-for-linux@vger.kernel.org>; Thu,  8 Jan 2026 18:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.179
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767898022; cv=pass; b=pARE5Qcefc8fE8xwxzZmP2tZ4jvOwapoy9pGZ3f+CqVOS439uO2DyIPgwyMhY136fjwVJ9xle/13c0yzkcJwY7DFRmS/j4JfWjXzfaKU1+8/ahKqB2s24m6eGH6dty3GY/OIkoklIyeojUEz4xxTXfKik2TPe8mOHP35VJzuSzI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767898022; c=relaxed/simple;
	bh=9dsp03vsh+jcxxLZ27Fffy/Yxt8RGmG/mTJwiKpUiiM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=AhQ/nN0eM3uaYvfQPMsznB0Vco1fVmSQvel1012PPrDqWUlPWYviBlRmaAqkmEmeWmYDJEL3cL0WjjT+TvuO2ANKEwSlQcdQV+7bloah2n7C1P9iAwkzbQW9+qZ0gef8esJ+an1G/cGvpDmXzXysg/CECIkvAxshHqDOIn8Xk+g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=P4IuGTHh; arc=pass smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="P4IuGTHh"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2ac37f8898eso57363eec.0
        for <rust-for-linux@vger.kernel.org>; Thu, 08 Jan 2026 10:46:59 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1767898018; cv=none;
        d=google.com; s=arc-20240605;
        b=ii/X2gf4D6ms2LGDQt5hIXvxjntgtRgTK8q46tKlAVI546dyAG4n1hCj0ieXp8pdKz
         qDuBLx7KdK5hKoDTaaTb2MP00ThlaJJYa+UNwIcRWpoeoLFmQLqZybynTr2QyBuq8SS5
         0ogd2QlMFlyQS8uQi4vO/gtkpChvuzWMuLSgW3FK7nLYtwtYQqzi9oRq1cDyK9y+f+rd
         KUx7CxvIyGNhz8KCJ1fFkp9jza5O6hIPgpgZj3Uu7LS/OyQlQsMaEk6SAou2zX/AglGX
         iPKGOTejW6kE4zgCw1g7D1G9KHER5uUsnhI5G29OH0z3LeVi9UTG5yqUabl8cIzhSdXx
         HdKA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=CovL4D9IWtlZK4zyQedETxH8Q9w0iNTyULXmwn7D6wQ=;
        fh=Y8TQzGxBHeDcQ6aq9y1TkRtAhJr5iFg47zQ/h74QdNA=;
        b=hZMa7PwfFDApvPM9fSqyUjufFHS5gNlSIu7cD3ykWbffPEhTJUV8tcSm3iJVF26jkV
         FCki9MmAseYBKJ8na7uJEYkTwgSnNKTkXZhWRQhts/Wo+Dd5VnrFpIV/w9wGijPwKPIg
         uSvMUajFd+8BZ8QIb86qoehMuH9Vc4X7B69G/ltwCtGJsmRVRSEDU8OnixC4uo2UT/WT
         8IqeMPZ9Usqa5hpUoO5wxzi4IhN94GApQflKdECQZoD37AescPb69roAJSFOnoz/twkN
         EAmphM/CIuSCH8woJAV+GgJIxUKK/IcElR02mkfX+ZkrLk4lhcIDi7+9l8BD5f8SUQeD
         bV+Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767898018; x=1768502818; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CovL4D9IWtlZK4zyQedETxH8Q9w0iNTyULXmwn7D6wQ=;
        b=P4IuGTHhbFZGxKiShnqfG1k4RbNk2Ncq3UTHJEXdI5H3mg2fFuwp0JNXkLdOVVg/k/
         Axx89kspInQzcJIinfqji2bWPWJ5HPboZ/BOH84e1MrjmkJPyKnl4IZXjfFkKK8vIUXK
         xB7wPFCQRNFLQVmX7sczzRY8+BM1RIVN57YWMG1DQuR0FDKq+bCwLCcUvYBernz3lOOQ
         mPgCz7NROIK8lu9znGHIFLJN0uxN001n4vqYA+Tc0dpw6A39OihQQuqaTu2znqFDNCvP
         iajpnhotOMXjEQxXnN/8OajuKY1zUzWo4FIWaHSPF3BkfxVBzbOCzvtdYm8hnGkEqkjK
         /GgQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767898018; x=1768502818;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CovL4D9IWtlZK4zyQedETxH8Q9w0iNTyULXmwn7D6wQ=;
        b=gcMJQkzYDAycwro9m8i4IyrhpmfFOSAwfn7OBryQXI0roxvND8JPG03q2sUjvwdPOb
         NIOMO0IDWuROhuJO6jxw9/aCvxy6Y/3GAhjNKuvCJFpqT+wK+kPfDzFUwDcFgsthlci1
         zbZOhLZ3NiEm90ykAWIVejIql66AX7KZCW7Ud2RrYjJS4Ttl5RlVorkIAGiojsBTdil2
         aWN453pIrxZWQsSvAMHVXKPUA2/0Mra3gmdpasw8iQYQRgReXlAttWP/qcgRxL4xjqI2
         XtstYYGFEW2ihZa5I39guP8MyieB9zu5f3XxReZLB5NVhvlEBV7NudWL8S+h/qyuChaK
         j+mA==
X-Forwarded-Encrypted: i=1; AJvYcCVfIavaSR9SkdO+pwv5bHwtMR0otvZzkFLXmX5/8d7OqUZJaTEW9VXCB7G4rTzQgk5j6pm4undyReSQD/deIg==@vger.kernel.org
X-Gm-Message-State: AOJu0YySh8OtZ89VSgbdPHCNA/kOGzwAo4lo74U4uaDO5A7HGmZJSXUy
	NuPY0TeP7x5FTReFIVXIkEdOjMnVToNdf2/5722f3VQNkTWjLa1fxo+hfVbxF+eK46uLtUMuMqG
	AtBGqqNKzARuaem13czEjpmTwayeVF+c=
X-Gm-Gg: AY/fxX7y/yA8/KNaw7wyPHCeEaExdh+M6MJSk4Kj0ajCrVn4AYjcGorxv6DDUJGPiXM
	p5hd5d4ab0dImJJzRZH0cZHyySK+HVaFWmE3rcmuUN1wFKXbJkDwImXn1GFKV04Tt6+JZjkfGvd
	6e+wptKNhcmqNXpDv7HQmFvaw3tiYNqACt4cCXzbF2ap85FfxCaoMGoOUZj1+Jg7ishqJV7isQF
	v0+DL5JEPTq0OqXr0YG1LmPIBZ+wLU0ToTTENdfEtOjop5JU/1jR2zVfm/2MvBvI6c3558U06cu
	81qedyMQeBVRpoA3/2hdaFjfl78fM/c7RN6yyKZUz7uS1uU71QoKMxTAdjbLwKMlOhG4XQOB9xI
	JqUaqmfBqEw==
X-Google-Smtp-Source: AGHT+IGu9T2XibzVKy8btuxcDZZhMyLH36+M8tNqwT0uSTo7qZFAQAMpI7ByxDxoDczkqic0/esmI4Vvqc2uRrIB7lA=
X-Received: by 2002:a05:7300:1483:b0:2ae:5245:d50e with SMTP id
 5a478bee46e88-2b17d2fd32bmr3273953eec.8.1767898018039; Thu, 08 Jan 2026
 10:46:58 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <cover.1767818037.git.foxido@foxido.dev> <05261e88ac8503e2af59d703389d94cc15f4450d.1767818037.git.foxido@foxido.dev>
 <20260108132141.6cce4827.gary@garyguo.net> <7b8130de-8096-4fcb-be84-c13209638b25@foxido.dev>
In-Reply-To: <7b8130de-8096-4fcb-be84-c13209638b25@foxido.dev>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 8 Jan 2026 19:46:45 +0100
X-Gm-Features: AQt7F2o5ZZFBECo7tHTbw4EaUh07Wub13m9AN2oeE3UmPHevRhqMf_DCW1K3HAo
Message-ID: <CANiq72=TAXwjjxFiKiiwh9m_rRK_yUVS4b+2st=QJWErz5qTpQ@mail.gmail.com>
Subject: Re: [PATCH 2/3] rust: implement wrapper for acpi_object
To: Gladyshev Ilya <foxido@foxido.dev>
Cc: Gary Guo <gary@garyguo.net>, 
	"foxido @ foxido . dev-cc= Rafael J. Wysocki" <rafael@kernel.org>, Len Brown <lenb@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Benno Lossin <lossin@kernel.org>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, Tamir Duberstein <tamird@gmail.com>, 
	Armin Wolf <W_Armin@gmx.de>, platform-driver-x86@vger.kernel.org, 
	linux-kernel@vger.kernel.org, rust-for-linux@vger.kernel.org, 
	linux-acpi@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 6:11=E2=80=AFPM Gladyshev Ilya <foxido@foxido.dev> w=
rote:
>
> Hm, I looked through ACPI_FREE() call sites and acpi_evaluate_object()
> implementation, and it seems to me that the acpi_object's lifetime is
> the same as its internal buffer. Overall, it is indeed managed
> externally, but acpi_object and acpi_object::buffer->pointer live
> together. I=E2=80=99m not an ACPI expert, though, so maybe I=E2=80=99m mi=
ssing something.
>
> Anyway, the current Rust setup seems fine for now:
> 0. AcpiObject validity is guaranteed by whoever constructed/passed it (C
> side for WMI abstractions, for example)
> 1. You can only convert &AcpiObject to &AcpiSubType (reference to
> reference), so AcpiSubType can't outlive AcpiObject
> 2. You can't steal the data pointer from &AcpiSubType either, because
> the Deref impl is "logically safe" and only gives you a reference to the
> inner data, which can't outlive AcpiSubType's reference -> can't outlive
> AcpiObject.
>
> So for now until AcpiObject lives _less_ than it's inner data,
> everything is OK.

Assuming this is correct, this sort of analysis is typically nice to
keep documented as as an implementation comment (`//`) somewhere
(instead of just in the mailing list or the commit message) -- would
that make sense?

> Using an enum would require keeping Rust's enum synced with the C side,
> as well as implementing some simple but non-trivial checks that the
> `type_` field is a valid enum value (and the valid range isn't
> continuous). I think that keeping it as an integer is simpler and better
> matches C side.

If this refers to the `ACPI_TYPE_*` constants, there seems to be a
comment in the C docs that requires it to be kept in sync already with
elsewhere, so perhaps it could be reasonable to add one more place to
sync? (Though I don't see the mentioned arrays from a quick grep?)

     * NOTE: Types must be kept in sync with the global acpi_ns_properties
     * and acpi_ns_type_names arrays.

Ideally, these would be actual `enum`s on the C side and then
eventually we should be able to have `bindgen` generate the new kind
of `enum` that keeps this in sync and generates those checks for us,
see my suggestion at:

    Support a new "enum variant" kind, similar to `rustified_enum`, that
    provides a safe method to transform a C `enum` to Rust.
    https://github.com/Rust-for-Linux/linux/issues/353

(But we can't do it just know, and even if it lands in `bindgen` we
will probably need to wait to bump the minimum etc.)

Cheers,
Miguel
