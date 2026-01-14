Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C9F91509AB
	for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 14:37:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768401459; cv=pass; b=TvZJe8b0ilzcebKAJpZRXRuSereTq4v3/OQ6I1HjOC/AVpubdY8aG3VVQrYcyTQ+WHc+m/SsPJ6Q35Peu9FJvv9xtrGWgilRn0W9W8zupzPKx37pmK2OmsJ1OJtGerDju8y4cXF6CmgWSZUzf5QVkuXfqcL5ZlWnnkH/CHBaGtQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768401459; c=relaxed/simple;
	bh=+gZtxbzNt43l59bSct2Wxe+p7Zbg0+RNqLubrnVLiPY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=gG4DEwyso5bpZxYK6rnpEJoq0ClYJtaLpBVFqQwld0BwfQ1afwB4M010bPY5KWPz3Auim7NKlmSTJC0Ux+lpc0ZKwcCXoS/Xq1hd4ZlGKaGbKe9DR2VAD2bDZlO+/ySa1EzFb1tBb2airtzH+5JTqNOvE0g+vGPuehWUUweuUR4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PSTCbmXI; arc=pass smtp.client-ip=74.125.82.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PSTCbmXI"
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-2b446aa37a2so215696eec.1
        for <rust-for-linux@vger.kernel.org>; Wed, 14 Jan 2026 06:37:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768401457; cv=none;
        d=google.com; s=arc-20240605;
        b=XothVzT+Uxjveg/++KrjnWqLdVYzS76yltYy2nCLMzKxGsSiPApQdNckQjMtyESSNl
         eB+/PCjRxzMb/yAoQj2Zwq3d8F9RhEM5v2iNTai8kdl9RFwqhAzh7V4+wc/EPEcJeDYG
         WgPt+b6Oc3E5E5OfUPnUoTqYGE/QjU0INs48Kdy+qd8CXeEdm44RHD9NJjt8CxhJ9KpA
         NPLr/0VeZV4NCL/rI7kNGUkkcmUZ0TOEjK+WdD17KFNUsU6P30cP5Q1ubajT3ZUhtvso
         JVNuUe3zN4YYkboTjtM+pXA5V5IiggKnaxZ8HA199IKKVxWDcQ9YOC3xZdsLyrMmxhRL
         8RzA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=7vz6gsheW2ZkxS8OzJeR0mXOpyBUWqb5nPTzr3eRxHA=;
        fh=yjSAThk/MVmFSXFp8kjza2yUDY1kBuJXEqGqcoS60+M=;
        b=CXSKSB+bwpMF6GO7u7cq4fTTWV3V6VDufifn25aSb9ypI0bMZKJF7UJzpt/Jpbn7OR
         svOuqveBVfz6X96nQYGWsWS6ywEkkYalqnARIAoRAqU4ZhTU0Hbxs/yQRnL8faus3Lge
         D+BEc1TZ8dRSbjxzV/W5xyDfOE32Xii36VvhICLucLteCfgVTnOiJ0cOLd9DvcY6GgT/
         o1WakAT4Vn9UTsElo7ZCCN31rxu82+qONrN2vF6gh/R19CncZD1sKoUYFu5jBFVsFuRd
         loYoVwNNZ1SyB07Q8myhhKKD2iLkrjvSX0WaZzRNZmMFhX6TygW/GzniDLDjkXNii4UU
         0kXA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768401457; x=1769006257; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7vz6gsheW2ZkxS8OzJeR0mXOpyBUWqb5nPTzr3eRxHA=;
        b=PSTCbmXIS9PDEip9hvDMjoJTiKDD5GXsYE6yA2I48WNjS3HL9OK7qcw+xbBlu2UY1c
         12OTISbTJlkKpi8fjOa2rj9P4myBU6pfTzCGmDq36+AAyHt5diagpOk5tudBLip/6E62
         AxCHG06frpN/v7DgDuzXtVodn8Qwzzrka9gCpyx/i4KlRfVoLIFkISLGknUnzc45GQWv
         dcf91a37Or7Mt5kXg8bz6Poaj3CrYQABlixOEMjT+oZV2iWiSNWsNnZTVt/MpAVbVIM0
         lzgLhEq6NfVMpIu5DljlX3jh2/oyH6JhGfRg3R9vaxhPaWRg0qeCGckAjqZLjbmO07vf
         ZdoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768401457; x=1769006257;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=7vz6gsheW2ZkxS8OzJeR0mXOpyBUWqb5nPTzr3eRxHA=;
        b=JvpGAMVX94Rv6EuKsswUMVMfFaUI4uGz5Rqf1zl1Rv+zJ6IMG/gLM5qtshw8NWIDNs
         RHG3cqOWYlB2pH1iIpweCTNHfdfzKbwlDfi83+L4HAcAyn9SBazlHTy/nwzUmVddMLZC
         kOEqqdc5TbHu0kxYroha6HtlNADfdUZGiEZSJjGkY+UiJrxlYdk7MJsDlF9G4qIAuaBO
         o/zObWNw284l72HngSm0J7rWkFo+75d2x3dxpWBiNp4/5Q0wMWKw7xo/bFzIPpQAhQ2j
         pi+ubPLg3TW6jfS3dBtu/qQxrgToP4dpTgpgLF5SuhkGiHCZNQtZERfyJosU2t+g1Nyo
         txOA==
X-Forwarded-Encrypted: i=1; AJvYcCVK0mqNXsaDsUEfNE4oo3k0Nsakzl/Kw+APkPuK7VcWiw5jt2ivCwP4fnXaGrNPbkFhErJuSIB9dXO5LLRIJg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvXKe0TQpnrYWEEYhzLBsCS4e93Vs5O2m539RNCK7fkOio7W0a
	IgjJ1CEXIiv/Q4YYApnaQtk1V+9jpnsKZ/XGFhqOsENfE7tBrtUntLKIfSMov5hPtSWlM3f3b1l
	2FJx0nANDpYwtMU1kCmzjrpvDMSCTk3A=
X-Gm-Gg: AY/fxX75JO4bFSvDEHfKUpH9nDvJZUTDUOkkyckoNiwjJn3NfAS481g+Kvd2VJKLISw
	+U018dcTueyNPxcmQ5X1dbtg4FWT5/aM/RS6D7Iw4WSfVC74zlmb8eoYDvS0YjODMINTrMSAFhD
	ZsX2BQ0AcVxADeW/+y0qnx/cB1GhQAibBIvTFbWWc0p5URNVj2uhhkK2vNmDq1e+snovUl4TJd1
	HPf+p3pX4ZaGW1xX3lDvlXNGoeyS7qXfAGkLaV6ZItROHlxUu4oU7D63lKqIfr/ZNCI1wVcF49B
	RaW3yxpnNE8gkev6J5pxjmcDkRj5aIrGEyXVfuRgXmIWrzTWt0WoN7Vo/AyjS1+JYu3FTwnlB3O
	TJ8l8LMc5tcXnOQzIEHjbYNM=
X-Received: by 2002:a05:7300:d505:b0:2ae:5b23:1601 with SMTP id
 5a478bee46e88-2b48662c38emr1719555eec.0.1768401457031; Wed, 14 Jan 2026
 06:37:37 -0800 (PST)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260110-this_module_fix-v3-0-97a3d9c14e8b@gmail.com>
In-Reply-To: <20260110-this_module_fix-v3-0-97a3d9c14e8b@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Wed, 14 Jan 2026 15:37:24 +0100
X-Gm-Features: AZwV_QhGm6AQT1y-6rFZieo-Sg-jU4esKv1Zq0TRBf1aujTPmnHrtNeDeXDpT-o
Message-ID: <CANiq72m7S5aK22yzeGykGH2zhvL_UrTE2jxf2-6Fx_8oWR=nPQ@mail.gmail.com>
Subject: Re: [PATCH RFC v3 00/15] rust: Reimplement ThisModule to fix
 ownership problems
To: Kari Argillander <kari.argillander@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
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

On Sat, Jan 10, 2026 at 4:09=E2=80=AFPM Kari Argillander
<kari.argillander@gmail.com> wrote:
>
> So currently we have problem that we are not always filling .owner field
> example for file_operations. I think we can enable const_refs_to_static
> already as that is in 1.78 and is stable in 1.83. So that fits perfecly
> for us.  This also seems to be quite request feature but I did not found
> that no one has ever suggested that we just enable this.

For context, we have been tracking that feature (as well as
`const_mut_refs`) precisely for `THIS_MODULE`:

    https://github.com/Rust-for-Linux/linux/issues/2

There is also a test that Ralf added upstream back then:

    https://github.com/rust-lang/rust/blob/main/tests/ui/consts/const-ref-t=
o-static-linux-vtable.rs

(Not sure what you mean by "quite request" though)

Cheers,
Miguel
