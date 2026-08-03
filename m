Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 426D13AFD06
	for <rust-for-linux@vger.kernel.org>; Mon,  3 Aug 2026 07:54:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.214.181
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785743673; cv=pass; b=QqxsFNpHkorYTc1+iKHMP1vq6b2l6+AkMH4P3UTYTdHb90Rbyq+JGveWXIriwjSlaW/U/y7+4VdTOAUcYNlQ4ai10uiDlFc3iNSwunejjhvRUXF4tb/U2rvuX619UDpw1s0D9873oicsPd9OiZWdxCDI1ZfYYBJfN/bad/2OuqY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785743673; c=relaxed/simple;
	bh=9JYGyDoBME8hv7/ZMtzTVDTpnCRJZ1sDh38+kPrbGCM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=dRi8U2I7U9CtzYZX26AnDlnez6IaOiJ2yIFBY3JirIVlW9cUHrUkIRnbKtcl4XFoOEvd3VZXAlU8Kb2giCdH18h8hQpKa4U21VUE/wzF/3xsVc6sWlJXpZ6Ml+6fH1OUcWOEWLySstWFoiWghrDc4mZQcYMSd/Ij3BjWYPBCqRo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q9Q0ZMUq; arc=pass smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q9Q0ZMUq"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2cecdc24b1cso4944665ad.1
        for <rust-for-linux@vger.kernel.org>; Mon, 03 Aug 2026 00:54:32 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1785743671; cv=none;
        d=google.com; s=arc-20260327;
        b=qmjhxM9D7S/0IJP/i3TMJktpbaKLAjqwaDPrKsgKaYDwf/E8m74p+xbfbsW4YOkIJ9
         wQq/3ej56BGT5KEjqNfprI2f16mBaMAVpdhEP+i/FtfNW2v7GGrH8jSMba3HTNHwM9HJ
         li464wyBBw4NoezdOPRRtC6uCXTmq3xU1pXgCZptTp6QULRVvGrbKDTxM+T0UiGaTbKF
         nS6ppfn0OJ/qRsbu5+F74fmUsekstUdWiA2DtMF+xc6gFcYA6vXmmY717kXuL6ilUnC5
         B3kWd//SFyxvv5FLMhHhXIcuvobjjqtTYBrHqOHc9CGH3jx7ozCQ3nJ7CJa7+3bXh6PE
         FfnQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Ta6D7h8gDtEggKq3RCRI4numNHmun65ionw9l1DGiwo=;
        fh=pPLgyMxlrZKeO3swe/SE0Bljysy/dmiGfY3VeS338TE=;
        b=CRiI4Jub6SyGdtnbdPjZh4T1snh1kBqQoPbP7STVhi37+0il/ZwW03UPpyv5ohn3Nz
         69047uH4QO4JX/46WoS1R0bSKXId2dqPDQz4AxTSSR4dK1zrHcprFbP2uQkMVdRU86sC
         n+fcR+Ar8WIk9kjPovHas6tDHaK/UrfEB20Pgv3fAKeE9t4ET6RFSxHglUfEngCYgGR0
         0YvxLy5aQ7VgRKdclQNi5XECyIG5uH1/dbKSZvrtLFxsbnkG/v9gTVHSSlfJRPNeJO2G
         Eh66WUuhFY/aBsvckZnfLNam7WvBsE0Gju0G+ktLxBZT1OiSv+kc3xWlEmyGyJGyiQlf
         WFaQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785743671; x=1786348471; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Ta6D7h8gDtEggKq3RCRI4numNHmun65ionw9l1DGiwo=;
        b=q9Q0ZMUqKaKPEV+JnM9tw2mIcDd7qGU7YBwizK5/0qYiEUZZIucYn6chslZrs/xGtI
         YYvWzJr8UczPSbglS4xdEr8uGdNUhnw9W2YD8TSDP/AW7vdw3ShbVjhfBmmPJTsH4Ivn
         KWUv8xka4Oi4SLpkmEQ6iEeUz6R6LK+FWAGvEgo11gXttOSMTRwfHks2HbmIfLar0djG
         BGJRF0ClzL/6Z6Nxh1IzUPvoBsO8a0QLXxRpkRNleaWYeA+63livQ7dkrOxWkdJga4+k
         XsmjaY6CPHvtXqStTFseNFxpMlAvRju3qXc1MPYUT+8kACGDLDAeBFwkFPfvCPSkqL/K
         jksg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785743671; x=1786348471;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Ta6D7h8gDtEggKq3RCRI4numNHmun65ionw9l1DGiwo=;
        b=d3fn2c7KBQ53qz6gEMwdYy1SOqXbJbniRYes0SrVyi3VEBoR2yYkYUQN0Rz1SnaqXH
         gUdILVTyZ4PsFtqvc4oPld5P2kx7JhYwTitrYglVgpZn8WmDq/COXZKoOD/sHXhtkeCh
         biLQtIZKOEi5GrVGPH0B4/rYsETZvHaB0gDFRCHSmwsak2p3tMskVz99+XgtZN9YFrQV
         Ycy3iv8VBpxE7svnmAvfn6UC0RsV65NuegpzCSsshl6zoOOTQfMGwmkFgtaCUjukB6ZS
         /GuIJ+6idLFS3ha3t33r2X423eIddsXstkQ4t+9Sg7JvAxw76ViZjvh6xUNBntXwe2Ac
         yXpg==
X-Forwarded-Encrypted: i=1; AHgh+RpmGX4GK21GkvNIc1ASj4HXTr5Lyboft7gbGr4s4C7pkHWUJvuUELKJmZ9rPBCXRxZ+LiNQMRHgsTCZPIHbtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFcJFF5p1VneocheqEaR90xI4BUyDgqhUlDw7ySIbDnxRuTZit
	TRBm+DO9EeWjDqlSkQ8Pzx3CDX7jU8QvuvcjXOzgt4bl+1Cvb0js5E6T+brlP621FE/K+iJRdNh
	ajwRJpvAiusyxH3re6ZigdIGNdD902Vc=
X-Gm-Gg: AR+sD12NG2FH5VJEzN9qIkWm9QaODFdLc+GyRgW4RXb8UWHFtHV76gWyHp5JoBQkEcE
	LVEcAOXEsM4SVaWRmtTrJufNZ/SN6dSVi2Wv6K4ge0JzcY4sB8R2Yg6/0jY4Ebik4p61d0rgTbk
	HsEJTJFKrQt3jzmPNPOTWjjV1WSbqfHckVrkkoRzXalqS+6dn9Lu+whRCREmb9rgbXRmHsxUM2n
	ZqepnnJq2qNwa0rD3Y27rwWo6DhGFUkB2ctUHcq6k8x1l5Ch23ZL6qbd668xa4pTrBtLbHfCl8w
	9Wg39LAnLwgcStuVm6bPXfVuERtRCF3EHhWUJ8GjqTJ3K0PxVPC7yQv1BPCrbTjQQ9LKqDnt+K8
	wUwyRBjL6fMiVrCzIjaDhXZRZy9a8nrRgxV+I46Q5eGf9sV3j4p+1y/lMUn3F
X-Received: by 2002:a17:902:c952:b0:2c7:ef84:c58e with SMTP id
 d9443c01a7336-2d0521bca53mr134274935ad.1.1785743671484; Mon, 03 Aug 2026
 00:54:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260726115929.82150-1-cianmcguire167@gmail.com> <20260729175305.723486-1-cianmcguire167@gmail.com>
In-Reply-To: <20260729175305.723486-1-cianmcguire167@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Mon, 3 Aug 2026 09:54:18 +0200
X-Gm-Features: AUfX_mx3yySxwK-dExzHeFj26LMO3Ijdpuyq0tuLHvTgzY9204eUOvIeAsyApbI
Message-ID: <CANiq72me+5eqb2iTEzHE=FaLFK9jrQKStipuqfzK-BFmJ=BGrA@mail.gmail.com>
Subject: Re: [PATCH v4 2/4] rust: print: document safety of _printk FFI calls
To: cianM167 <cianmcguire167@gmail.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alice Ryhl <aliceryhl@google.com>, Lyude Paul <lyude@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, 
	FUJITA Tomonori <fujita.tomonori@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Jul 29, 2026 at 7:53=E2=80=AFPM cianM167 <cianmcguire167@gmail.com>=
 wrote:
>
> From: Cian McGuire <cianmcguire167@gmail.com>
>
> Two calls in this file had their SAFETY comments left as "TODO.": the
> cast back to `fmt::Arguments` in `rust_fmt_argument`, and the call to
> `bindings::_printk` in `call_printk`.
>
> `rust_fmt_argument` is only reachable through the `%pA` format
> specifier. Every in-tree Rust caller that uses `%pA` -- `call_printk`,
> `device::printk`, `kunit::printk`, and `seq_file::call_printf` -- invokes
> it synchronously with a pointer derived from its own live
> `fmt::Arguments`, as one call in a `switch` dispatch in
> `lib/vsprintf.c`'s pointer formatter that returns its result immediately;
> there is no deferred use or storage of the pointer on the C side. So the
> `fmt::Arguments` value stays alive on the caller's stack for the whole
> time `rust_fmt_argument` is running with `ptr` pointing at it.
>
> The `_printk` call itself is justified by this function's `# Safety`
> section, which this patch also tightens: `format_string` must be one of
> the non-continuation `format_strings` statics, not
> `format_strings::CONT`. `call_printk` always supplies two extra
> arguments -- `module_name` for `%s` and `args` for `%pA` -- which only
> matches the `"%s: %pA"` shape shared by every non-continuation string;
> `CONT`'s format string is `"%pA"` only, so passing it here would make
> `_printk` consume `module_name`'s pointer for `%pA` instead, and
> `rust_fmt_argument` would then reinterpret that `*const c_char` as a
> `*const fmt::Arguments` and dereference it. No caller does this today --
> `call_printk` is only reached from `print_macro!`'s non-continuation arm;
> the continuation arm calls the separate, safe `call_printk_cont`, which
> hardcodes `CONT` together with the single argument it expects -- but the
> previous, broader contract permitted it. With `format_string` guaranteed
> non-`CONT`, and `module_name` guaranteed null-terminated by both of its
> possible origins (`kernel::__LOG_PREFIX` and the one generated by the
> `module!` proc macro), the specifiers always match the supplied
> arguments.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/351
> Signed-off-by: Cian McGuire <cianmcguire167@gmail.com>

Thanks for the patch!

A few notes:

  - It seems the "From:" in the email (not the Git commit) changed in
v4. Not a big deal, but I am not sure if it is intended.

  - Is there a reason you are sending only 2/4 in the new versions?

    If the patches are independent (and especially if they also target
different subsystems), then it may be best to send them separately.
Otherwise, if you are sending a series, then please re-send the entire
series.

    (Some developers do send sometimes a single update to a long
series in the form of a patch or a diff, but even that is typically
done replying to the original series.)

    For this case, I would suggest resending them separately.

  - Just in case: was the commit, or its message and/or changelog
assisted by an LLM? Please see:

      https://docs.kernel.org/process/generated-content.html
      https://docs.kernel.org/process/coding-assistants.html

Cheers,
Miguel
