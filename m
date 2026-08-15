Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7FD99463
	for <rust-for-linux@vger.kernel.org>; Sat, 15 Aug 2026 15:12:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.167.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786806735; cv=pass; b=hHPQ4D34F4ioTnYVpPLs5d/DXo9lWRl/+C3KlXy72ZhmQ1Lqq/DGJSro/5Ae0AeyUkIjWxMYbKJA9ebaeXlaey/JRzT5otpOe+Fq0RtESEciQM302L2g42DtTKF297QeUC72nhosZBf2x49IIwv/wCf0YHeyhdaJN23XzaoWFzs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786806735; c=relaxed/simple;
	bh=UobjTR0EOc0tYK6B/nbRw02t7C9dLUyZ3wP6m18saQc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YV69c6aUt4mtZIxRUM6AHzL885WqVNLkZwgB/qkNe9Lu2fKGl08aU1puzctGV5AyNz+xdoFzFmJNhV+MhBX4g0U/TiXMYvs0fHWUiRUP1udDX13Z75YvYGFSGqjMcITBdkt2KthL+U7RZ5zW9MmW8H5/c1DVX5WWmo9AcQp0QeQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XPfWQR9N; arc=pass smtp.client-ip=209.85.167.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XPfWQR9N"
Received: by mail-lf1-f49.google.com with SMTP id 2adb3069b0e04-5aebf96bc89so431847e87.0
        for <rust-for-linux@vger.kernel.org>; Sat, 15 Aug 2026 08:12:13 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786806732; cv=none;
        d=google.com; s=arc-20260327;
        b=AUIVc5ZQ24XXfRSBI+28yczqN7QoSTP9iC3EZ4VvVwcwJBylf9aXTSEofDsod6IEM+
         YiAUPAsyb/irEkGUozPfaQ2bvxxNDEm2Kk6rccOf0BeeOWXicAW6krL5RKt9j+3E77ei
         0CUrHDSlb5WMKWG6U/93+J72c1dXZcuMgDm+UXp7yz9qJf/WOLbdV7BKXz8IjH/URiBd
         JYqZZ4UfJBNQBz/2SAo5A+Dix8lzBsikH5Z2RcN1a5DoftC2J9v1EOY7b/2dnM02Vb1a
         oeuWEG7pLroTEYTkQYgxHgk6wMyKwv4K6I18RrRiU9lw+KtkADATIefYqQj3HZCeEBwt
         LtpA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=vRmmPAAvKpHDKw8SlU+muTo3calTOPKG2StKSSBN4Sw=;
        fh=7tt+W+qEGtW2qfBfJFNwAT/Dzj/qjwIw09/CbF0pDaE=;
        b=RheYQsSzqGfzHKpSePf2PT6zvpMxfsLWDlI2THJSjfk1n3g5ntD2sEmWlbpUWdbGTb
         s2Cr4OzyEGMwN/v+2lFssIjFeYckdTL6LJdeyJ3FYd34tzIuAmcsCKZjfutfWlvLd3nJ
         EUop7NPpGCV86DcqT6OO/SaBb3706P6VhYzzJpSJZuTV96v/ztTGuxWwIzFaoHQBJMKP
         yNW4ggdFuI5NNjriJ3I3+04TFbnRgeQWEtDVjP7fQS+t/KLXU7vZyceXTm74usBNG9Zz
         jRG77HTmQqfKhdUO4CQwinnF9z7iWnd0a0u7MNyqfb88aBO+u85QarJTW61rFejZNWRu
         O0Sw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786806732; x=1787411532; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=vRmmPAAvKpHDKw8SlU+muTo3calTOPKG2StKSSBN4Sw=;
        b=XPfWQR9NdrB09VZcIIz66jOoF+XRVCPKsK7Ij6+0bGhbBZ6JQNZ19Sav3RDiTROswy
         IqOjWK1W305WpqMV15RzrxkL2uhKprYin/2AuinUGmB6YtG2Epak1GQdiZXZgRO0kd8z
         9UzDfEFeUiED75Zv9ZFBh9OsdsL2mu8CksQ9K7TMMY/2wueBg2vT5V9P+eFIqSbXmnx8
         3vZy2fO+t1KPq7OfNPJO9VsVE8nYLvZEJXz+pj/1JP9FabDOZZzNQjVxMLqxgVKUiZA5
         7ulPKJnpcwNT/TM/Kyp9oe5RmfkpqKyxl/7UzjH91YiNeKzDYw7cTDsvlhKz+ovQ6ShY
         /c9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786806732; x=1787411532;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vRmmPAAvKpHDKw8SlU+muTo3calTOPKG2StKSSBN4Sw=;
        b=g1LxTV1YWKmNqFFvsMQVMuC8GRsSHa3fn7QhbAn1k21Hc0qY7TSrgveQze+yFXKqMX
         4N0hj0+q49ciBRlBDJahdUSGqh6g8dvxuMD2tZDLGxib3J7Ab4kcB6dGQR+JN8FA7mnq
         vJ3gGbw6+g5ZORRzL14eQEocUQYcJv8rIIAGdd5o0JhtRR0/d7Tn0zm/xnFM933ypKUR
         bchltH/70EbPhIrch08l1ZkQiUl3nl8kUn6nKrHTkXxni6/vVnhP6n/B9RVX3O+2TPrm
         rOwD6eXReDf+/0ztchJT0QiGWxE6C4LNnkTzH9Ea3BfmODcGwhZvq6exikDLsER8RVn8
         VBXQ==
X-Forwarded-Encrypted: i=1; AHgh+RrX94yzybc0HfMTi78y2sqX0+rS4RKAkCmvYKXgLDTdF1A8BpeTgb/I3fZQWqyodQjl6l98bUJ0kmhWc/MivQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx5+z2d8lK/wY9ZYr1W651ajBeIayF6r8d+SOtAjpwPtUWEGaVR
	/uv8YNJev97P+TUIp/8Kw7zqu5tQaNdHSbpxSzGsNrmS5HMRbmcSSwnpuB4HvmjP080xYtBzqqY
	6VywvCF4nx/3hxE5rP3OsjnJobRYd2d8=
X-Gm-Gg: AR+sD13uQ5m6jsf25+twpDsejU5WQLNGTBSUukCKbCKKh60N5LMJmmCcWoPurrB/975
	1PCVIAXo6PGTEkjl3PiR4FFGaMvBkhudgFFj2Dbgytv8LLDl0IpmOAj8l7yq6TuHSk0vOHYk/pX
	s0SPy5FVG5ZKMe19IOdvODg/kcBdYqcXL/7zw3AwToU78Zl9v0YulN2VvBWQqDT9s4ql+LM/Gx3
	hk/uffpks49ggTl40N7wr3peb0j7HjyqH9L31+Ge/7Guao5Kvj457D1VI12ICZnF645CvlYpo57
	QJ7jewi68dfTfxPYHIEJV2rdyBRDBhLwTC54O1VliYl9JoU73FAE38NDH7thA3izWnErx2w+NWI
	2lvXwyVlBvRmw2c1ts9q9E9DFTee39ha1XPDLI6w8CwyEsp3T08WQvxy0J7nT
X-Received: by 2002:a05:6512:2243:b0:5b1:5b9e:8de7 with SMTP id
 2adb3069b0e04-5b4591460ebmr2026667e87.2.1786806731626; Sat, 15 Aug 2026
 08:12:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: rust-for-linux@vger.kernel.org
List-Id: <rust-for-linux.vger.kernel.org>
List-Subscribe: <mailto:rust-for-linux+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:rust-for-linux+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260703112108.3139558-1-vasilisalmpanis@gmail.com>
In-Reply-To: <20260703112108.3139558-1-vasilisalmpanis@gmail.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Sat, 15 Aug 2026 17:11:57 +0200
X-Gm-Features: AcwNN1U_LcGBqdbLoN4CG6Hl5WaDk3irWOkgEz1PPcoaElrfkIxTs5ZAOKCuF1U
Message-ID: <CANiq72mWPXALRLxcNsME3FjMRZXhw=qJZCr0VtKqMbJfUz0JAA@mail.gmail.com>
Subject: Re: [PATCH] rust: sync: arc: use intra-doc links for `Arc` in doc comments
To: Vasileios Almpanis <vasilisalmpanis@gmail.com>
Cc: Boqun Feng <boqun@kernel.org>, Gary Guo <gary@garyguo.net>, 
	Alice Ryhl <aliceryhl@google.com>, Miguel Ojeda <ojeda@kernel.org>, Lyude Paul <lyude@redhat.com>, 
	Daniel Almeida <daniel.almeida@collabora.com>, =?UTF-8?Q?Onur_=C3=96zkan?= <work@onurozkan.dev>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Benno Lossin <lossin@kernel.org>, Andreas Hindborg <a.hindborg@kernel.org>, 
	Trevor Gross <tmgross@umich.edu>, Danilo Krummrich <dakr@kernel.org>, 
	Tamir Duberstein <tamird@kernel.org>, Alexandre Courbot <acourbot@nvidia.com>, rust-for-linux@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 3, 2026 at 1:21=E2=80=AFPM Vasileios Almpanis
<vasilisalmpanis@gmail.com> wrote:
>
> Two doc comments on `Arc`'s raw-pointer methods referred to the type as
> plain text rather than as an intra-doc link like the rest of the file:
>
>   - `as_ptr` said "this arc", lowercase and unlinked;
>   - `into_raw` said "this Arc object", capitalized but still not linked.
>
> Rewrite both to use the `[`Arc`]` intra-doc link, matching the style used
> everywhere else in the file and making the references clickable in the
> generated documentation. No functional change.
>
> Suggested-by: Miguel Ojeda <ojeda@kernel.org>
> Link: https://github.com/Rust-for-Linux/linux/issues/1240
> Signed-off-by: Vasileios Almpanis <vasilisalmpanis@gmail.com>

Thanks for the patch & welcome! We ended up applying:

  https://lore.kernel.org/rust-for-linux/20260711144721.39185-1-harish.cs.s=
s24@gmail.com/

since it improved more cases, but otherwise the patch itself looked
good, i.e. procedurally it was fine, so please do more! :)

(I considered picking this one and then modifying the other one on
top, but it seemed a bit verbose to have two commits in the log for
this kind of cleanup)

Cheers,
Miguel
