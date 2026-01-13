Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18157274B44
	for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 10:33:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.169
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768300439; cv=pass; b=XcagVdyialBY+6GotsXDTMiKxmhg/vEvuGw9QNrnDl7Pg0dwfAZEDkB0/ECAd56De/FQh48GIUEguRSTOTVdtGlFGDvZCimShFIqyYXIb4ScI7XR9Eq5WtN5VX0n4QE6Ted6qxPhXt54LFCkWWLlL2xsyvqzg6xBmaWcpwbMxl8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768300439; c=relaxed/simple;
	bh=6wVoyLrqywcOmQmN4+r6RZ36ne1t081jgSFidw+ue4M=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BHu1S0XMKdrOjfh0/BdvuDukjTfsnKfDjse1t9rQcQYApqBVnp2P3ThZdTNjh+jYVeyOeAh6dQuYFLzLxs+31wu9Fi2eZnx2UYhOrXJTx6eeKTm9ArulyYrzTY4Sx6vjuBy+8aBypyDBV0gihoV7O1ELYcNE/p+5wQVj9Xz909U=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmZlv3+m; arc=pass smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmZlv3+m"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ac370cf8c0so261166eec.0
        for <rust-for-linux@vger.kernel.org>; Tue, 13 Jan 2026 02:33:57 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768300437; cv=none;
        d=google.com; s=arc-20240605;
        b=MnrvWjcIvjCNTK+bNQTjkM4mvGKroDX3DUkGb31lY+tZbEeuDSZSOJxJ1NpQrEreGb
         zDU4CBQC3ndCeLRv+nwtWDwmpLEYxnJt6Cy15Ymxa9q/4CYk8UXQn+HaOErB4yIPA53v
         ob3wJXFdNW0MXjHyookxdVz0PpmS+iAKn3bhNtm3Rdns78BAkA3btjZAexRvGXxFpmbh
         jnnWyyNBa76lEMMdu5/eMD0fY0/93cxOGg7JBDt8NLELXANUMY7TRei8J9KLXmbTraIT
         G/MUY/8kwwvwFYJxhMVhIZevCgLAzZdEpMkc3sVYIT+c068Tmty+v8zfhPrHPEt5JyXl
         RxpQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=6wVoyLrqywcOmQmN4+r6RZ36ne1t081jgSFidw+ue4M=;
        fh=qsekoQ9ZdnBQUgYsU2yrAFOxXDNX6NEYna0KAUqbz1U=;
        b=TL7Jpt1/nKYES/tT0/L33vLG4u0c5yaCuNL0VTFJbWSfVaZZ74+Ve7lHLIpwYOCTCr
         6yAmWld862UzzCJy4d5qpMJwHBYdTR9s1SB1EeHDO+5IOdzeEQUIEA0gbQL2SY7wVvuv
         mWEQdERRT4DzAxbtxJgUdsHTALjLnLG4BxPRKAstkl4SwwEiCx7S9fZkrZug1HH1ovTo
         Ha0C1VREYCNrOitcfrnWlLTuoW6f3HRI8r6IZKDf2H86LyUikrULba+/iehN02sW3rkt
         jmvjqO4S7X/GVFZSKwxOgOpOGgiy8n61AhstcF2Kx0obvoSzrKvT8ej6i8WDvDlHAzzI
         BoDQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768300437; x=1768905237; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6wVoyLrqywcOmQmN4+r6RZ36ne1t081jgSFidw+ue4M=;
        b=NmZlv3+mXk5bSY8g3C4KVfhkw15lO9QbCi95ATgIw0NvDW3qF6mUyB6GDeuWNtiYsq
         Mw/sV00VtstCOaTJPnvjw0mgTnA3Amt+7f1IDzZOZw83GcNq0+UKVls6Jm+0mi7uesCu
         RYmAb3kqIEyOiTl+NEF9ZCi7To7CAgmnZGnn9wBcKNVlj5/3lvmXPmMfKGxaWYpBtf9n
         W0HyehpaPzMzJbsAWUVoMVptfHhEnhCHARRKh3LLRBucMbPdbHc1WTWCeT7VzFIUAZFu
         Z14wwBbus3J5a8H9ThnRGAJFryPNdHe2pyucnCNGrL1EA/f+FctxUZ9C9hPgZBtZC4jw
         Cqgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768300437; x=1768905237;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6wVoyLrqywcOmQmN4+r6RZ36ne1t081jgSFidw+ue4M=;
        b=k72w/5oWufSjwoOzCJDLq/QQ0pLFZZTu1fBwtvD7ZDWCMTiqK2WnfN2SedJYvEfLLd
         zh0aAHppVXLI5VAPav83EK6Mmf3oWCPd1cipGNXnqU+wDc7DNmY6ro5VCQc+ozVhQ15H
         XBGBn/3+zfjN4YD52HkXH/tC+VCfGVWYOT/9KmYsLqbGw4Mzyuc1HjMfvcLfwb/uwhA+
         mrLM3byy7FgaNxszpFpe0BpTIjaET04xGK3xFkAi9XR67S2swWv3E+9w2zjtguDvM7Zr
         ZOUyZOIY8OYaZ7PaX4EGPq9LJwldmxjPujbBfn/+toz1Rs7w7tHE/3vff9vAHHLbIKUM
         vKUA==
X-Forwarded-Encrypted: i=1; AJvYcCWYXzFR8JqWUW15MfX2uNvJUxK14oHzcpQjg6tQjW8gZdJaVLJGnSmVsM91QWgWJiyHeB7MNJJ2V/4HHbpAxg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz0CdEesgaZFOpm/qC98YcWJDIsZf4uGauK2hxP9jnClda7IFWU
	O4azGy0tWVAu0oGI5/qEn6+sU55u/YO8CWJJovakeiv21LjkCS9JoyNvISEq+/hdDtV3Krb6ysB
	wBaFRStqfvTb3a2EA0vRyf+X7GrrOC88=
X-Gm-Gg: AY/fxX4WFHgK360sGDQNrYEl6wzitUf0cZD84FVLqZPAfWowiQr7jv2UfH5BZlZnYZJ
	BRd39LR4jTEZRctbVaDshD/EhjmVW9tCj6vTUlXRE3fLV6DvJbyLraryN1CeHbfGbLSw+yImeEo
	0amPHNAPqUeTWMn6CLUqs0lMLW4Ilj5kOUQsr0kHzt3SPBoOI3AURE/Hg2WvJ1HnIspx42QbuXX
	ozh37RJKm2T80D58KNFbebd+Ak8BOtDMK/52guLgKKHxG5sRhEtiTlVnrwcwrlouAumJcAUMDjr
	FR+6jYzavSVDhM6CcvNJS3UlfFLDGWWqq55cbdv60FfLHbFRJv8MB0cmRCgKY6RHZ4Z6S/SldKa
	S3H54q+i2IJf0
X-Google-Smtp-Source: AGHT+IGcAUwwHKFz29uCFuaLCHQFUBpfMMrhPILzRNLEOICzlrBTUuR090yAT0GAHICjPqdgNCbFvEf62i8h4sT8PoY=
X-Received: by 2002:a05:7301:190b:b0:2ab:ca55:89bd with SMTP id
 5a478bee46e88-2b17d2e3950mr6767186eec.4.1768300437056; Tue, 13 Jan 2026
 02:33:57 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260110-this_module_fix-v3-0-97a3d9c14e8b@gmail.com> <c2d900fc-5f59-4da4-9600-eaf6546beba4@kernel.org>
In-Reply-To: <c2d900fc-5f59-4da4-9600-eaf6546beba4@kernel.org>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Tue, 13 Jan 2026 11:33:43 +0100
X-Gm-Features: AZwV_QiwMsxbaGb5HBUrEyx5hdr8D6vf9-O0HVOWNW3cjCw5cHgs53It9xW2U1I
Message-ID: <CANiq72k6fbighSnZVjWZRq_A07h+vg7Wp4KcH+2fKwn47shYDQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 00/15] rust: Reimplement ThisModule to fix
 ownership problems
To: "Christophe Leroy (CS GROUP)" <chleroy@kernel.org>
Cc: Kari Argillander <kari.argillander@gmail.com>, Miguel Ojeda <ojeda@kernel.org>, 
	Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>, 
	Danilo Krummrich <dakr@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-modules@vger.kernel.org, 
	Luis Chamberlain <mcgrof@kernel.org>, Petr Pavlu <petr.pavlu@suse.com>, 
	Daniel Gomez <da.gomez@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, 
	Aaron Tomlin <atomlin@atomlin.com>, Youseok Yang <ileixe@gmail.com>, Yuheng Su <gipsyh.icu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Jan 12, 2026 at 6:56=E2=80=AFPM Christophe Leroy (CS GROUP)
<chleroy@kernel.org> wrote:
>
> Shouldn't it be called this_module instead of ThisModule ?

The common Rust style, which we use in the kernel as well, uses
several kinds of casing to make it easy to distinguish between types
of entities at a glance.

Traits use CamelCase, like structs and enums. So if `ThisModule` is a
trait, that would be its case.

But, for instance, if it were a constant, then it would be `THIS_MODULE`.

Details at https://rust-lang.github.io/api-guidelines/naming.html --
sometimes we may diverge from that, but in general we follow the usual
style.

Cheers,
Miguel
