Received: from mail-dy1-f181.google.com (mail-dy1-f181.google.com [74.125.82.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 136513AB276
	for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 20:44:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777581890; cv=pass; b=GqBaoqyh5LMBPA7FKaefhTZa+x+cPZKrSaAP9K/7HiLO2mOK4n580boFHJHtwDXBuEMvyL+081UeaaJVtlwl8fgQZEvGEKjImMkEdSlx/ofXFRaS22OFzWZIts52Nt/+h5HzRies99gMntvCZDPvrZkfFFKiyLmdqX7GkaMYhyw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777581890; c=relaxed/simple;
	bh=b4+MgMI+H1EJ/zFEqeAfvolr40MDmi9r9YFv3gLEylU=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=r9r/UeeyZjTLYSWXi1iuaLmDl/p6iWmZ2YmKeVw0GVm+M/M+AGIFw9hmrZxNjTq9YBHPIxzMvLloyq17Pp5Zo8NshhWZwlHpEPFFsr8kXOPnhD0x14foVwAMOf0KaLuzcTv2joXZ/DOpyh18FKXJLwM54o5vCOpcBa0F/CdW2l0=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b2HDrsYo; arc=pass smtp.client-ip=74.125.82.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b2HDrsYo"
Received: by mail-dy1-f181.google.com with SMTP id 5a478bee46e88-2d96243c8a1so79331eec.3
        for <rust-for-linux@vger.kernel.org>; Thu, 30 Apr 2026 13:44:47 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777581887; cv=none;
        d=google.com; s=arc-20240605;
        b=fpdRNallMLZPrNG6JG2r+calX7WEpGx7kVFj6KLsYodFUTcj4l1wFd0f4QbycCDTTU
         dbfUjUIuJYYVDwPQSweUqTsAybfIO3XfhTbp2KhBu6wjsQHMsLlleWFRMPbdHTiu5w/e
         9Dbyxzaxu56OURJMAJAWhJVHgPQgUTH/7om8v2rq/bpOCBGZ0skXjjm3Kc+RDqNWjQ1A
         epf24rIwqtNTkHxC+oNkgN6nRLpYphSvWSqhLCOiHMq3po1/B7BF5A35s5btrUCH/v68
         wS5QyXwJ/s3L29qRDj2vHnpDWng13fBZCteRk3y6WPY/k3TsnCfNqlx3aaAl8IpEaW58
         X7wQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=k9AZSfuCo9bDJFKcrKgk3T/HVLYY2ffU7PQ+wrb/z8g=;
        fh=xGqwVSRUrfH7eFieFQAYOmtq1NIT+KetziaV3mW12xo=;
        b=Zmmjy+xALSOrTc/AKib0kFeUZ+ii5Mo2j0Aa+tdqvp92cPCapOAiaRcnLOTJlBlRE8
         iiv4LS2Y+Xc739GR4vmGGoTyHsz+cTcXS2ZbP9QpGgSZB44kQLDbQtBSy3uqheGzmdkK
         iTYRMfMc0JKIgbx8Py0SeZYSkggZNCLujcwUHgaCDDtgVhKZzoqaT0lzGVtCeloG1HA1
         nqcICWIXBvNdmXHLwEvMGuAo3ygYe/wcJAUbjsMC8YrFiwYbL9xsgr8rQ1Yc/8VCPjaN
         r/RPJWUu4dq8LfZarjO4miJeJtLJ/ydUn8G7Qs7lE69sqyKHlLI5jznj2Ad098B8N47c
         +C4Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777581887; x=1778186687; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=k9AZSfuCo9bDJFKcrKgk3T/HVLYY2ffU7PQ+wrb/z8g=;
        b=b2HDrsYoC365WpZLDIwVt7Oqol8Atvfl2Wi3zDR7u+s0U72+tTIcTffJ3veLc7Mkk5
         09pOO+Ifvb9tf3kv6TdqnmcStbupnwA22CD46720WfPlsMoecV6k2kAdPJV45DT7wezB
         lphNim3MBPNaqbmWlKeYyp3pAtkcjnhs7Gsmk6TAOYF/WDPLBqq/3w5pDWVamR2+gbcs
         96bDGzRVMK4+QF0JpEBJLp9c0ems2GUQZ26C5Kp/bBhavQYFEm9uskh++VO5TmjGRz1K
         +iXT1WVtaGYjduG1nKmc+nHXs1aIP79WmO8HzWKwTx/nwz7+XAZyqwS3Ikzalr7fwwoX
         Opfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777581887; x=1778186687;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=k9AZSfuCo9bDJFKcrKgk3T/HVLYY2ffU7PQ+wrb/z8g=;
        b=UgU7L1fPGvfQFkVTFI09qID8sGOfGa5pBSPSvnhngi0cXwkLPsnzTP6ava0XM5CTEJ
         wUq1F7WX64Qv99D8U6zRi+WHWWCsQbXSQJ4XGA4SRP9Mv4H43lgRBphuRq7Z72qIMgP9
         YF0oHPpbekNWzKXo6DyZ+a+DPgyO0NnwjA0rbIUhp4NM+kUYQDnYqfoTiGbx5qIo3inV
         hyu5OX2jrYSjY3d3DySw6/VLJcXH1kC6r14OuM/5ZejlVFqDyv512TBuGk6hsl1OZ8K2
         31fbf9yX1jrhKyNJeSjL5YPey3bYEs5hwSaHHJdFXurbr+v/2oQ9pI67rWVaszeOjczH
         Y4kA==
X-Forwarded-Encrypted: i=1; AFNElJ87X0KyfU4PX4vtAGJPf6ebUeS7E5UuKedLNwvXox6Lm+AzHB5JbVwQsxHD6/vra+xDL+VMzcWxxAE0lIdR/A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwYVq2vHwEcwvaZfDVqxoOAp8jgAg1RKzw8wy5EHzq/GmrYSm4l
	mVYhzcIj02/R0nh+kbO3KMXHS4qFHu2hzUHQH/p7CjCxKdOKc/nbWo4KrDP0EsBewsL1FcTLTRK
	HSK9UTcJh3/wHKVFjh0tQL5ODm7eCZYk=
X-Gm-Gg: AeBDiesCnEBuzCcRmyvg1o/0Oq+ddjdK6oXF5rNIeaddlx24jonV3Z+067RfNEzJfjd
	EXUBVyfevoqSy26CiiTGMf+EkxyQjqIYdSx00iAih820LUIWj+9DZBiI5qVbsxKXpO+cP/gQEFZ
	5KAWsciEuFpiIb2Y7N/2+tnCJlvWUPYxFp6p08evCKvIId0DHOsoH0D5PIbyBoitaQ8QRz96qbj
	o04IAf4X1ESU73fMCizusB/ab4KbD1bwv1A8Of3VfHn2b2UNPXmDJCyVx6zJerSvdHG8+MdYXRJ
	FRBsPIHHGBI7fDNqFYXKByQCpz+i5Oq/DCvS1AINFCXRGSyhfTVRYbVXECaTwdOMra4AJ3j6+bW
	uVQ7i8sqYbBhYvVqnrq9aA2YWFgSEMBynmw==
X-Received: by 2002:a05:7300:640d:b0:2ea:ed2b:8085 with SMTP id
 5a478bee46e88-2ed3ea6e4abmr1015049eec.6.1777581887151; Thu, 30 Apr 2026
 13:44:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260427-pin-init-fix-v3-0-496a699674dd@garyguo.net>
In-Reply-To: <20260427-pin-init-fix-v3-0-496a699674dd@garyguo.net>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Thu, 30 Apr 2026 22:44:32 +0200
X-Gm-Features: AVHnY4KqdHGVaPSvIrabK80Zz0RmFuEVAjFGZEQ1JTgv4BJHAcJmYxi9-IGDZpc
Message-ID: <CANiq72kyqd93wd4cNxRZmWyO7HnGKo31i57ouh5gV5n9jEdu+g@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] rust: pin-init: fix incorrect accessor reference lifetime
To: Gary Guo <gary@garyguo.net>
Cc: Benno Lossin <lossin@kernel.org>, Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org, stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Mon, Apr 27, 2026 at 5:43=E2=80=AFPM Gary Guo <gary@garyguo.net> wrote:
>
> When a field has been initialized, `init!`/`pin_init!` create a reference
> or pinned reference to the field so it can be accessed later during the
> initialization of other fields. However, the reference it created is
> incorrectly `&'static` rather than just the scope of the initializer.
>
> This means that you can do
>
>     init!(Foo {
>         a: 1,
>         _: {
>             let b: &'static u32 =3D a;
>         }
>     })
>
> which is unsound.
>
> This series fix the issue. Details can be found in the second patch.

Applied to `rust-fixes` (originally, half a day ago) -- thanks!

There are a couple typos in the contents of #2, but I didn't change
them since I imagine you may want to do that upstream (relinguished,
transfer -> transfers). I only fixed a couple nits in the commit
messages since I assume that has no impact on your processes:

    [ Reworded for missing word. - Miguel ]

    [ Reworded for typo. - Miguel ]

Cheers,
Miguel
